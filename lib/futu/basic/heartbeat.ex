defmodule Futu.Basic.Heartbeat do
  @moduledoc false
  use Futu.Component.Api

  proto_id 1004
  proto_module KeepAlive

  @spec c2s_map(List.t()) :: List.t()
  def c2s_map(_opts \\ []) do
    [
      time: current_timestamp()
    ]
  end

  defp current_timestamp(), do: :os.system_time(:millisecond)

end
