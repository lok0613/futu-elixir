defmodule Mix.Tasks.PullHistorical do
  @moduledoc """
  Pull historical data to disk
  """

  use Mix.Task
  require Logger

  alias Futu.Quote.Historical

  def run([code_in_string, period_in_string]) do
    Mix.Task.run("app.config")
    {:ok, _started} = Application.ensure_all_started(:futu)

    code =
      case Integer.parse(code_in_string) do
        {code, ""} -> code
        _ -> code_in_string
      end

    opts = [
      market: Futu.Quote.Historical.market(:hk_security),
      code: code_in_string,
      period: Historical.period(String.to_atom(period_in_string))
    ]

    {:ok, stocks} = Futu.historical(opts)

    {:ok, json} =
      stocks
      |> Enum.map(fn stock ->
        %{
          code: code,
          datetime: stock.time,
          date: datetime_to_date(stock.time),
          open: stock.openPrice,
          close: stock.closePrice,
          high: stock.highPrice,
          low: stock.lowPrice,
          volume: stock.volume,
          turnover: stock.turnover
        }
      end)
      |> Jason.encode()

    store_to_disk(code, json)
  end

  defp datetime_to_date(datetime_str) do
    {:ok, datetime} = NaiveDateTime.from_iso8601(datetime_str)
    NaiveDateTime.to_date(datetime)
  end

  defp store_to_disk(code, content) do
    File.write("#{code}.json", content)
  end
end
