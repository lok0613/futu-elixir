defmodule Futu.GenServer.HeartBeat do
  @moduledoc """
  Manage and send heartbeat to Futu.GenServer.TCP
  """
  use GenServer

  @type server :: GenServer.server()

  @spec start_link(%{name: server()}) :: {:ok, pid()}
  def start_link(%{name: tcp_pid}) do
    GenServer.start_link(__MODULE__, tcp_pid)
  end

  @spec init(server()) :: {:ok, nil}
  def init(tcp_pid) do
    {:ok, %{keepAliveInterval: interval, connID: conn_id}} = Futu._init_connect(tcp_pid)
    GenServer.cast(tcp_pid, {:set_conn_id, conn_id})
    schedule_heartbeat(tcp_pid, interval)
    {:ok, nil}
  end

  def handle_info({:heartbeat, tcp_pid, interval}, state) do
    msg = Futu._heartbeat()
    Futu.wait_until_free(tcp_pid)
    GenServer.cast(tcp_pid, {:send_heartbeat, msg})
    schedule_heartbeat(tcp_pid, interval)
    {:noreply, state}
  end

  defp schedule_heartbeat(tcp_pid, interval) do
    Process.send_after(self(), {:heartbeat, tcp_pid, interval}, interval * 1000)
  end
end
