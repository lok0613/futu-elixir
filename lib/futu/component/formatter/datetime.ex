defmodule Futu.Component.Formatter.DateTime do
  @moduledoc false
  alias Futu.Component.Formatter.DateTime.Calendar

  @spec now() :: bitstring()
  def now() do
    format_datetime(Calendar.local_time())
  end

  @spec once_a_point_a_time() :: bitstring()
  def once_a_point_a_time(), do: "1999-01-01 00:00:00"

  @spec encode_datetime(any()) :: bitstring() | nil
  def encode_datetime(datetime) do
    cond do
      is_bitstring(datetime) -> datetime
      # pass to default value
      is_nil(datetime) -> nil
      true -> NaiveDateTime.to_string(datetime)
    end
  end

  defp lead_zero(x) when is_integer(x) do
    x
    |> Integer.to_string()
    |> String.pad_leading(2, "0")
  end

  defp format_datetime(calendar) do
    {{year, month, day}, {hour, minute, second}} = calendar

    date = "#{year}-#{lead_zero(month)}-#{lead_zero(day)}"
    time = "#{lead_zero(hour)}:#{lead_zero(minute)}:#{lead_zero(second)}"
    "#{date} #{time}"
  end

  defmodule Calendar do
    @moduledoc """
    Specific for mocking in unit test
    """

    @spec local_time() :: tuple()
    def local_time(), do: :calendar.local_time()
  end
end
