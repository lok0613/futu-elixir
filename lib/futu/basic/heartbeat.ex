defmodule Futu.Basic.Heartbeat do
  @moduledoc false
  use Futu.Component.Api

  proto_id 1004
  proto_module KeepAlive

  def map_c2s(_opts) do
    [
      time: current_timestamp()
    ]
  end

  defp current_timestamp(), do: :os.system_time(:millisecond)
end
