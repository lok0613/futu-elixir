defmodule FutuTest do
  @moduledoc false
  use ExUnit.Case
  @moduletag :opend

  setup_all do
    {:ok, _pid} = Futu.start(%{name: :for_unit_test})
    :timer.sleep(2000)
    :ok
  end

  test "historical/2" do
    opts = [
      market: Futu.Quote.Historical.market(:hk_security),
      code: 1,
      period: Futu.Quote.Historical.period(:daily),
      max_rows: 3
    ]

    assert {:ok, stocks} = Futu.historical(:for_unit_test, opts)
    assert length(stocks) == 3

    stock = Enum.at(stocks, 0)

    assert stock.closePrice > 0
  end
end
