defmodule Mix.Tasks.PlaceOrder do
  @moduledoc """
  Place an order
  """

  use Mix.Task
  require Logger

  def run([acc_id, code, price]) do
    Mix.Task.run("app.config")
    {:ok, _pid} = Futu.start(%{name: :mix_task})

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
      price: Float.parse(price) |> elem(0),
      secMarket: 1,
      remark: "test"
    ]

    {:ok, res} = Futu.account_funds(:mix_task, opts)
    IO.inspect(res)
  end
end
