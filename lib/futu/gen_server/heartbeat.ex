defmodule Futu.HeartBeat do
  @moduledoc """
  Manage and send heartbeat to Futu.GenServer.TCP
  """
  use GenServer
  alias Futu.GenServer.TCP

  @spec start_link(any()) :: {:ok, pid()}
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @spec init(any()) :: {:ok, nil}
  def init(_opts) do
    {:ok, %{keepAliveInterval: interval}} = Futu.init_connect()
    schedule_heartbeat(interval)
    {:ok, nil}
  end

  def handle_info({:heartbeat, interval}, state) do
    msg = Futu.heartbeat()
    GenServer.cast(TCP, {:send_heartbeat, msg})
    schedule_heartbeat(interval)
    {:noreply, state}
  end

  defp schedule_heartbeat(interval) do
    Process.send_after(__MODULE__, {:heartbeat, interval}, interval * 1000)
  end
end
