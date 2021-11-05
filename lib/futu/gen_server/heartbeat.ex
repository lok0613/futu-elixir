defmodule Futu.GenServer.HeartBeat do
  @moduledoc """
  Manage and send heartbeat to Futu.GenServer.TCP
  """
  use GenServer

  @type server :: GenServer.server()

  @spec start_link(server()) :: {:ok, pid()}
  def start_link(tcp_pid) do
    GenServer.start_link(__MODULE__, tcp_pid)
  end

  @spec init(server()) :: {:ok, nil}
  def init(tcp_pid) do
    {:ok, %{keepAliveInterval: interval}} = Futu._init_connect(tcp_pid)
    schedule_heartbeat(tcp_pid, interval)
    {:ok, nil}
  end

  def handle_info({:heartbeat, tcp_pid, interval}, state) do
    msg = Futu._heartbeat()
    GenServer.cast(tcp_pid, {:send_heartbeat, msg})
    schedule_heartbeat(tcp_pid, interval)
    {:noreply, state}
  end

  defp schedule_heartbeat(tcp_pid, interval) do
    Process.send_after(self(), {:heartbeat, tcp_pid, interval}, interval * 1000)
  end
end
