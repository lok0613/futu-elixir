defmodule Mix.Tasks.GetMaxTradeQuantities do
  @moduledoc """
  Get max trade quantities
  """

  use Mix.Task
  require Logger

  def run([acc_id, code, price_str]) do
    Mix.Task.run("app.config")
    {:ok, _pid} = Futu.start(%{name: :mix_task})
    {price, ""} = Float.parse(price_str)

    opts = [
      header: [
        trdEnv: 0,
        accID: String.to_integer(acc_id),
        trdMarket: 5
      ],
      orderType: 2,
      code: code,
      price: price,
      secMarket: 1
    ]

    {:ok, res} = Futu.max_trade_quantities(:mix_task, opts)
    IO.inspect(res)
  end
end
