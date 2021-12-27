defmodule Futu do
  @moduledoc """
  Futu Elixir API Client
  """

  use Futu.Api.Trade

  @tcp_timeout Application.compile_env(:futu, :tcp_timeout, 7_000)

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
  def start(opts \\ %{})

  def start(opts) do
    children = [
      {Futu.GenServer.TCP, opts},
      {Futu.GenServer.HeartBeat, opts}
    ]

    Supervisor.start_link(children, strategy: :one_for_all)
  end

  @spec get_conn_id(server()) :: integer()
  def get_conn_id(pid) do
    GenServer.call(pid, :get_conn_id)
  end

  @doc """
  1001 InitConnect
  This function will execute in Futu.GenServer automatically
  """
  @spec _init_connect(server()) :: {:ok, any()} | {:error, bitstring()}
  def _init_connect(pid) do
    request(pid, Futu.Basic.InitConnect, [])
  end

  @doc """
  1004 KeepAlive
  Cast for the heartbeat, no reply
  This function will execute in Futu.GenServer automatically
  """
  @spec _heartbeat() :: binary()
  def _heartbeat() do
    proto_msg = Futu.Basic.Heartbeat.encode()
    serial_no = SerialNumber.generate()
    Request.build(Futu.Basic.Heartbeat.proto_id(), serial_no, proto_msg)
  end

  @doc """
  3103 Qot_RequestHistoryKL

  ### Paramters

  required:
  * period, checkout Futu.Quote.Historical.period/1
  * market, checkout Futu.Quote.Historical.market/1
  * code, e.g. 1

  optional:
  * rehab, checkout Futu.Quote.Historical.rehab/1
  * from, default ~N[1999-01-01 00:00:00]
  * to, default now
  * max_rows, integer
  * next_page_key, if it's included from the last response
  * extended_time, boolean, to get the pre-market and after-hours data of US stocks, only supports timeframe of 1-minute
  """

  @spec historical(server(), list()) :: {:ok, any()} | {:error, bitstring()}
  def historical(pid, list) do
    request(pid, Futu.Quote.Historical, list)
  end

  @doc """
  Refer to historical/1, I don't like the function name
  """
  @spec request_history_kl(server(), list()) :: {:ok, any()} | {:error, bitstring()}
  defdelegate request_history_kl(pid, list), to: Futu, as: :historical

  @spec security_snapshot(server(), list()) ::
          {:ok, Qot_GetSecuritySnapshot.S2C} | {:error, bitstring()}
  def security_snapshot(pid, list) do
    request(pid, Futu.Quote.SecuritySnapshot, list)
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

    tcp_reply = GenServer.call(pid, {:send, tcp_msg}, @tcp_timeout)

    case Response.parse(tcp_reply, module.proto_id) do
      {:ok, str_body} -> module.decode(str_body, opts)
      {:error, msg} -> {:error, msg}
    end
  end
end
