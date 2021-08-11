defmodule Futu.GenServer do
  use GenServer
  alias Futu.GenServer.TCP
  require Logger

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_opts) do
    {:ok, %{keepAliveInterval: interval}} = Futu.init_connect()
    schedule_heartbeat(interval)
    {:ok, nil}
  end

  def handle_info({:heartbeat, interval}, state) do
    msg = Futu.heartbeat()
    Logger.info("create heartbeat")
    GenServer.cast(TCP, {:send_heartbeat, msg})
    schedule_heartbeat(interval)
    {:noreply, state}
  end

  defp schedule_heartbeat(interval) do
    Process.send_after(__MODULE__, {:heartbeat, interval}, interval * 1000)
  end
end
