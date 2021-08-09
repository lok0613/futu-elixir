defmodule Futu.GenServer do
  use GenServer
  require Logger

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: Futu)
  end

  def init(host: host, port: port) do
    {:ok, socket} = :gen_tcp.connect(host, port, [:binary, active: :once])
    {:ok, %{socket: socket, queue: :queue.new()}}
  end

  def handle_call({:send, msg}, from, state) do
    %{queue: queue, socket: socket} = state
    IO.inspect(msg, limit: :infinity)
    :ok = :gen_tcp.send(socket, msg)
    new_state = %{state | queue: :queue.in(from, queue)}

    {:noreply, new_state}
  end

  def handle_info({:tcp, socket, msg}, %{socket: socket, queue: queue} = state) do
    {{:value, client}, new_queue} = :queue.out(queue)
    IO.inspect(msg, limit: :infinity)
    GenServer.reply(client, msg)
    new_state = %{state | queue: new_queue}

    {:noreply, new_state}
  end
end
