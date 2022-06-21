defmodule Futu.GenServer.Subscription do
  @moduledoc false

  use GenServer
  require Logger

  alias Futu.Component.Response

  @default_opts %{host: "localhost", port: 11_111, name: __MODULE__}

  @spec start_link(map()) :: {:ok, pid()}
  def start_link(opts) do
    full_opts = Map.merge(@default_opts, opts)
    GenServer.start_link(__MODULE__, full_opts, name: opts.name)
  end

  @spec init(map()) :: {:ok, map()}
  def init(%{host: host, port: port}) do
    host_charlist = String.to_charlist(host)

    {:ok, socket} =
      :gen_tcp.connect(host_charlist, port, [
        :binary,
        active: true,
        keepalive: true,
        buffer: 1024 * 1024
      ])

    {:ok, %{socket: socket, from: nil, handler: nil}}
  end

  def handle_call({:send, msg, _proto_id}, from, state) do
    :ok = :gen_tcp.send(state.socket, msg)

    {:noreply, %{state | from: from}}
  end

  def handle_call(:is_occupied, _from, state), do: {:reply, false, state}

  def handle_cast({:set_conn_id, conn_id}, state) do
    {:noreply, Map.put(state, :conn_id, conn_id)}
  end

  def handle_cast({:send_heartbeat, msg}, state) do
    :ok = :gen_tcp.send(state.socket, msg)
    {:noreply, state}
  end

  def handle_cast({:set_handler, handler}, state) do
    {:noreply, %{state | handler: handler}}
  end

  def handle_info({:tcp, socket, msg}, state) do
    case Response.get_proto_id(msg) do
      {:ok, 1001} ->
        GenServer.reply(state.from, {:ok, msg})
        {:noreply, %{state | from: nil}}

      {:ok, 1004} ->
        msg_size = byte_size(msg)

        cond do
          msg_size == 58 ->
            {:noreply, state}

          msg_size < 58 ->
            Logger.error("1004 size is #{msg_size}")
            {:noreply, state}

          msg_size > 58 ->
            <<_::binary-size(58)>> <> rest = msg
            handle_info({:tcp, socket, rest}, state)
        end

      {:ok, 2008} ->
        {:ok, response} = Response.parse(msg, 2008)
        {:ok, nil} = Futu.Trade.Subscription.decode(response)
        GenServer.reply(state.from, {:ok, msg})
        {:noreply, %{state | from: nil}}

      {:ok, 2208} ->
        {:ok, response} = Response.parse(msg, 2208)
        {:ok, order} = Futu.Trade.UpdateOrder.decode(response)
        %{handler: {mod, func}} = state
        apply(mod, func, [2008, order])
        {:noreply, state}
    end
  end
end
