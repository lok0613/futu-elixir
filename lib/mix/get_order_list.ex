defmodule Mix.Tasks.GetOrderList do
  @moduledoc """
  Get order list
  """

  use Mix.Task
  require Logger

  def run([acc_id]) do
    Mix.Task.run("app.config")
    {:ok, _pid} = Futu.start(%{name: :mix_task})

    opts = [
      header: [
        trdEnv: 0,
        accID: String.to_integer(acc_id),
        trdMarket: 1
      ]
    ]

    {:ok, res} = Futu.order_list(:mix_task, opts)
    IO.inspect(res)
  end
end
