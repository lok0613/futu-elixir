defmodule Futu do
  @moduledoc """
  Futu Elixir API Client
  """

  use Futu.Api.{
    Trade,
    Basic,
    Quote
  }

  require Logger

  @tcp_timeout Application.compile_env(:futu, :tcp_timeout, 5_000)

  alias Futu.Component.{
    Request,
    Response,
    SerialNumber
  }

  @type server :: GenServer.server()

  @doc """
  Futu client gen server
  """
  @spec start(%{host: bitstring(), port: integer(), name: server()} | map()) :: {:ok, pid()}
  def start(opts \\ %{name: :futu})

  def start(opts) do
    sub_name = String.to_atom("sub_#{opts.name}")

    sub_opts =
      opts
      |> Map.put(:name, sub_name)
      |> Map.put(:tcp_name, opts.name)

    children = [
      %{
        id: Futu.GenServer.TCP,
        start: {Futu.GenServer.TCP, :start_link, [opts]}
      },
      %{
        id: Futu.GenServer.TcpHeartBeat,
        start: {Futu.GenServer.TcpHeartBeat, :start_link, [opts]}
      },
      %{
        id: Futu.GenServer.Subscription,
        start: {Futu.GenServer.Subscription, :start_link, [sub_opts]}
      },
      %{
        id: Futu.GenServer.SubHeartBeat,
        start: {Futu.GenServer.TcpHeartBeat, :start_link, [sub_opts]}
      }
    ]

    Supervisor.start_link(children, strategy: :one_for_all)
  end

  @spec subscribe(pid(), integer(), {module(), :atom}) :: {:ok, Trd_SubAccPush.S2C.t()}
  def subscribe(tcp_name, acc_id, {_mod, _func} = handler) do
    sub_name = String.to_atom("sub_#{tcp_name}")
    GenServer.cast(sub_name, {:set_handler, handler})

    Futu.subscription(sub_name,
      accIDList: [acc_id]
    )
  end

  @spec get_conn_id(server()) :: integer()
  def get_conn_id(pid) do
    GenServer.call(pid, :get_conn_id)
  end

  @doc """
  This is the main function of intereacting Futu TCP client.
  Three steps here:
  1. build request: opts -> module.encode/1 -> Request.build/3
  2. send tcp message by GenServer
  3. parse response:
    tcp_reply
      -> Response.parse/2
        success -> module.decode/1
                  success
                  request failure
        header failure

  """
  @spec request(server(), module(), list()) :: {:ok, any()} | {:error, bitstring()}
  def request(pid, module, opts) do
    proto_msg = module.encode(opts)
    serial_no = SerialNumber.generate()
    tcp_msg = Request.build(module.proto_id, serial_no, proto_msg)

    wait_until_free(pid)

    try do
      {:ok, tcp_reply} = GenServer.call(pid, {:send, tcp_msg, module.proto_id}, @tcp_timeout)

      case Response.parse(tcp_reply, module.proto_id) do
        {:ok, str_body} ->
          module.decode(str_body, opts)

        {:error, "The request header SerialNo has not been incremented"} ->
          request(pid, module, opts)

        {:error, "This packet is judged as a replay attack packet"} ->
          request(pid, module, opts)

        {:error, msg} ->
          {:error, msg}
      end
    rescue
      e in MatchError ->
        case e do
          %{message: "TCP timeout"} ->
            request(pid, module, opts)

          %{term: {:error, "Message size exceed"}} ->
            GenServer.stop(pid)
            {:error, "Message size exceed, proto_id: #{module.proto_id}"}

          %{term: {:error, message}} ->
            {:error, "#{inspect(message)}, proto_id: #{module.proto_id}"}

          _ ->
            {:error, "#{inspect(e.message)}, proto_id: #{module.proto_id}"}
        end
    catch
      :exit, {:timeout, {GenServer, _method, _args}} ->
        GenServer.stop(pid)
        {:error, "TCP timeout, proto_id: #{module.proto_id}"}
    end
  end

  def wait_until_free(pid) do
    case GenServer.call(pid, :is_occupied) do
      true ->
        :timer.sleep(100)
        wait_until_free(pid)

      false ->
        :ok
    end
  end
end
