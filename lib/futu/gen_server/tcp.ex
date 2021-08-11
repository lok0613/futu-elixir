defmodule Futu.GenServer.TCP do
  use GenServer
  require Logger
  alias Futu.Component.Response

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(host: host, port: port) do
    {:ok, socket} = :gen_tcp.connect(host, port, [:binary, active: true, keepalive: true])
    {:ok, %{socket: socket, from: nil, msg: ""}}
  end

  def handle_call({:send, msg}, from, state) do
    :ok = :gen_tcp.send(state.socket, msg)
    new_state = %{state | from: from, msg: ""}

    {:noreply, new_state}
  end

  def handle_cast({:send_heartbeat, msg}, state) do
    Logger.info("send heartbeat")
    :ok = :gen_tcp.send(state.socket, msg)
    {:noreply, state}
  end

  def handle_info({:tcp, _socket, msg}, state) do
    new_state = %{state | msg: state.msg <> msg}
    body_size = Response.get_body_size(new_state.msg)
    msg_size = byte_size(new_state.msg)

    if body_size + Response.header_length() == msg_size do
      GenServer.reply(new_state.from, new_state.msg)
    end

    {:noreply, new_state}
  end

  def handle_info({:tcp_closed, _socket}, state) do
    Logger.info("TCP closed.")

    {:noreply, state}
  end
end
