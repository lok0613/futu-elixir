defmodule Futu.GenServer.TCP do
  @moduledoc """
  Handle TCP connction to FutuOpenD

  Stream async data via TCP connection
  """
  use GenServer
  require Logger
  alias Futu.Component.Response

  @order_update_callback Application.compile_env(:futu, :order_update_callback)

  @default_opts %{host: "localhost", port: 11_111, name: __MODULE__}
  @tcp_debug Application.compile_env(:futu, :tcp_debug)

  @spec start_link(map()) :: {:ok, pid()}
  def start_link(opts \\ %{})

  def start_link(opts) do
    full_opts = Map.merge(@default_opts, opts)
    {name, init_opts} = Map.pop(full_opts, :name)
    GenServer.start_link(__MODULE__, init_opts, name: name)
  end

  @spec init(map()) :: {:ok, map()}
  def init(%{host: host, port: port}) do
    host_charlist = String.to_charlist(host)

    {:ok, socket} =
      :gen_tcp.connect(host_charlist, port, [:binary, active: true, keepalive: true])

    {:ok, %{socket: socket, from: nil, is_occupied: false, msg: "", proto_id: nil}}
  end

  def handle_call({:send, msg, proto_id}, from, state) do
    :ok = :gen_tcp.send(state.socket, msg)
    new_state = %{state | from: from, msg: "", proto_id: proto_id, is_occupied: true}

    {:noreply, new_state}
  end

  def handle_call(:get_conn_id, _from, state) do
    {:reply, state.conn_id, state}
  end

  def handle_call(:is_occupied, _from, state) do
    {:reply, state.is_occupied, state}
  end

  def handle_cast({:send_heartbeat, msg}, state) do
    :ok = :gen_tcp.send(state.socket, msg)
    {:noreply, state}
  end

  def handle_cast({:set_conn_id, conn_id}, state) do
    {:noreply, Map.put(state, :conn_id, conn_id)}
  end

  def handle_info({:tcp, _socket, msg}, state) do
    case Response.get_proto_id(msg) do
      {:ok, 1004} ->
        {:noreply, reset_state(state)}

      {:ok, 2218} ->
        {:noreply, state}

      {:ok, 2208} ->
        {:ok, response} = Response.parse(msg, 2208)
        {:ok, order} = Futu.Trade.UpdateOrder.decode(response)

        [mod, func] = @order_update_callback
        apply(mod, func, [order])

        {:noreply, state}

      proto_res ->
        new_state = %{state | msg: state.msg <> msg}
        body_size = Response.get_body_size(new_state.msg)
        total_msg_size = body_size + Response.header_length()
        msg_size = byte_size(new_state.msg)

        if @tcp_debug do
          percentage = msg_size / total_msg_size * 100
          Logger.info("#{percentage}%")
        end

        proto_id =
          case proto_res do
            {:ok, proto_id} -> proto_id
            _ -> nil
          end

        cond do
          !is_nil(proto_id) and !is_nil(state.proto_id) and proto_id != state.proto_id ->
            {:stop, "Unmatched proto_id: #{proto_id}, it supposed to be #{state.proto_id}",
             reset_state(new_state)}

          total_msg_size == msg_size ->
            GenServer.reply(new_state.from, {:ok, new_state.msg})
            {:noreply, reset_state(new_state)}

          msg_size > total_msg_size ->
            GenServer.reply(new_state.from, {:error, "Message size exceed"})
            {:noreply, reset_state(new_state)}

          true ->
            {:noreply, new_state}
        end
    end
  end

  def handle_info({:tcp_closed, _socket}, state) do
    Logger.warn("TCP closed.")

    {:stop, :normal, state}
  end

  defp reset_state(state) do
    %{state | msg: "", proto_id: nil, is_occupied: false}
  end
end
