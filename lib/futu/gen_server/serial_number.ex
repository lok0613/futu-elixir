defmodule Futu.GenServer.SerialNumber do
  @moduledoc """
  Generate incremental numbers
  """
  use GenServer

  @spec start_link(list()) :: {:ok, pid()}
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, nil)
  end

  @spec init(nil) :: {:ok, map()}
  def init(nil) do
    {:ok, %{sn: os_time()}}
  end

  def handle_call(:generate, _from, %{sn: sn} = state) do
    {:reply, sn + 1, %{state | sn: sn + 1}}
  end

  def handle_call(:get_current_state, _from, %{sn: sn} = state) do
    {:reply, sn, state}
  end

  defp os_time(), do: :os.system_time(:millisecond)
end
