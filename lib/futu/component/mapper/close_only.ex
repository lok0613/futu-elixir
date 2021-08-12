defmodule Futu.Component.Mapper.CloseOnly do
  @moduledoc false
  @behaviour Futu.Component.Mapper

  def map(data, opts) when is_list(data) do
    Enum.map(data, fn item ->
      map(item, opts)
    end)
  end

  def map(data = %Qot_Common.KLine{}, opts) do
    %{
      code: opts[:code],
      close: data.highPrice
    }
  end

  def map(data, _opts), do: data
end
