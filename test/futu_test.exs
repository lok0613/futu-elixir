defmodule FutuTest do
  use ExUnit.Case
  # doctest Futu
  import Futu.OpenD.Mock

  import Mock

  test "init_connect/0" do
    with_mocks([
      # {GenServer, [],
      #  [
      #    call: fn _pid, _val ->
      #      init_connect_response()
      #    end
      #  ]}
      {GenServer, [], call: fn _pid, _val -> "" end},
      {Futu.Component.Response, [],
       fn _reply, _protoid ->
         {:ok, InitConnect.Response}
       end}
    ]) do
      assert {:ok, %{keepAliveInterval: 10}} = Futu.init_connect()
    end
  end

  @tag :historical
  test "historical/1" do
    opts = [
      market: Futu.Quote.Historical.market(:hk_security),
      code: "00001",
      period: Futu.Quote.Historical.period(:every_5_min),
      from: "2021-08-08 00:00:00",
      to: "2021-08-09 23:59:59",
      max_rows: 5
    ]

    Futu.historical(opts)
  end
end
