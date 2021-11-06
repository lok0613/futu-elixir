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
        serialNo: :os.system_time(:millisecond)
      ],
      header: [
        trdEnv: 0,
        accID: String.to_integer(acc_id),
        trdMarket: 1
      ],
      # buy
      tradeSide: 2,
      code: code,
      qty: 1,
      price: price,
      secMarket: 1,
      remark: "test"
    ]

    {:ok, res} = Futu.account_funds(:mix_task, opts)
    IO.inspect(res)
  end
end