defmodule Futu.GenServer.TCP do
  @moduledoc """
  Handle TCP connction to FutuOpenD

  Stream async data via TCP connection
  """
  use GenServer
  require Logger
  alias Futu.Component.Response

  @default_opts %{host: "localhost", port: 11_111, name: __MODULE__}

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

    {:ok, %{socket: socket, from: nil, msg: ""}}
  end

  def handle_call({:send, msg}, from, state) do
    :ok = :gen_tcp.send(state.socket, msg)
    new_state = %{state | from: from, msg: ""}

    {:noreply, new_state}
  end

  def handle_call(:get_conn_id, _from, state) do
    {:reply, state.conn_id, state}
  end

  def handle_cast(:clear, state) do
    new_state = %{state | msg: ""}
    {:noreply, new_state}
  end

  def handle_cast({:send_heartbeat, msg}, state) do
    :ok = :gen_tcp.send(state.socket, msg)
    {:noreply, state}
  end

  def handle_cast({:set_conn_id, conn_id}, state) do
    {:noreply, Map.put(state, :conn_id, conn_id)}
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

    {:stop, :normal, state}
  end
end
