defmodule Futu.Component.Date do
  @moduledoc false

  @spec today() :: bitstring()
  def today() do
    {{year, month, day}, _time} = :calendar.local_time()

    "#{year}-#{to_lead_zero_string(month)}-#{to_lead_zero_string(day)} 23:59:59"
  end

  @spec to_lead_zero_string(integer()) :: bitstring()
  def to_lead_zero_string(x) when is_integer(x) do
    x
    |> Integer.to_string()
    |> String.pad_leading(2, "0")
  end
end
