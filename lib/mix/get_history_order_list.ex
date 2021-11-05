defmodule Mix.Tasks.GetHistoryOrderList do
  @moduledoc """
  Get history order list
  """

  use Mix.Task
  require Logger

  def run([acc_id, begin_time, end_time]) do
    Mix.Task.run("app.config")
    {:ok, _pid} = Futu.start(%{name: :mix_task})

    opts = [
      header: [
        trdEnv: 0,
        accID: String.to_integer(acc_id),
        trdMarket: 1
      ],
      filterConditions: [
        beginTime: begin_time,
        endTime: end_time
      ]
    ]

    {:ok, res} = Futu.history_order_list(:mix_task, opts)
    IO.inspect(res)
  end
end
