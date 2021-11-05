defmodule Mix.Tasks.GetFunds do
  @moduledoc """
  Get funds of an account
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
      currency: 1
    ]

    {:ok, res} = Futu.account_funds(:mix_task, opts)
    IO.inspect(res)
  end
end
