defmodule Mix.Tasks.GetPositionList do
  @moduledoc """
  Get position list
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
      ],
      filterConditions: [
        beginTime: "2021-10-15 00:00:00",
        endTime: "2021-11-06 00:00:00"
      ],
      refreshCache: true
    ]

    {:ok, res} = Futu.position_list(:mix_task, opts)
    IO.inspect(res)
  end
end
