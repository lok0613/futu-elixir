defmodule Futu.GenServer.TCP do
  @moduledoc """
  Handle TCP connction to FutuOpenD

  Stream async data via TCP connection
  """
  use GenServer
  require Logger
  alias Futu.Component.Response

  @spec start_link(host: charlist(), port: integer()) :: {:ok, pid()}
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @spec init(host: charlist(), port: integer()) :: {:ok, map()}
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
    :ok = :gen_tcp.send(state.socket, msg)
    {:noreply, state}
  end

  def handle_info({:tcp, _socket, msg}, state) do
    new_state = %{state | msg: state.msg <> msg}
    body_size = Response.get_body_size(new_state.msg)
    total_msg_size = body_size + Response.header_length()
    msg_size = byte_size(new_state.msg)

    if total_msg_size == msg_size do
      GenServer.reply(new_state.from, new_state.msg)
    end

    {:noreply, new_state}
  end

  def handle_info({:tcp_closed, _socket}, state) do
    Logger.warn("TCP closed.")

    {:noreply, state}
  end
end
