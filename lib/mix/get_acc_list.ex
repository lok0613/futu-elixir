defmodule Mix.Tasks.GetAccList do
  @moduledoc """
  Get account list
  """

  use Mix.Task
  require Logger

  def run(_args) do
    Mix.Task.run("app.config")
    {:ok, _pid} = Futu.start(%{name: :mix_task})

    opts = [
      userID: 0
    ]

    {:ok, res} = Futu.account_list(:mix_task, opts)
    IO.inspect(res)
  end
end
