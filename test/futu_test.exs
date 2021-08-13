defmodule FutuTest do
  @moduledoc false
  use ExUnit.Case
  @moduletag :opend

  alias Futu.GenServer.TCP

  setup_all do
    TCP.start_link(Futu.Application.futu_opts())
    :ok
  end

  test "init_connect/0" do
    assert {:ok, %{keepAliveInterval: 10}} = Futu.init_connect()
  end

  test "historical/1" do
    opts = [
      market: Futu.Quote.Historical.market(:hk_security),
      code: 1,
      period: Futu.Quote.Historical.period(:daily),
      max_rows: 3
    ]

    assert {:ok, stocks} = Futu.historical(opts)
    assert length(stocks) == 3

    stock = Enum.at(stocks, 0)

    assert stock.closePrice > 0
  end
end
