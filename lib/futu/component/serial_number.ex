defmodule Futu.Component.SerialNumber do
  @moduledoc "
  I really don't know how unique it should be, so i just put the system timestamp and thats it.
  "

  @doc """
  Generate serial no by system timestamp
  """
  @spec generate() :: integer()
  def generate() do
    :os.system_time(:millisecond)
  end
end
