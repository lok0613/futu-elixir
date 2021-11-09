defmodule Mix.Tasks.PlaceOrder do
  @moduledoc """
  Place an order
  """

  use Mix.Task
  require Logger

  def run([acc_id, code, price_str]) do
    Mix.Task.run("app.config")
    {:ok, _pid} = Futu.start(%{name: :mix_task})
    {price, ""} = Float.parse(price_str)

    opts = [
      packetID: [
        connID: Futu.get_conn_id(:mix_task),
        serialNo: 213
      ],
      header: [
        trdEnv: 0,
        accID: String.to_integer(acc_id),
        trdMarket: 1
      ],
      # buy
      trdSide: 2,
      orderType: 1,
      code: code,
      qty: 1,
      price: price,
      secMarket: 1,
      remark: "test"
    ]

    {:ok, res} = Futu.place_order(:mix_task, opts)
    IO.inspect(res)
  end
end
