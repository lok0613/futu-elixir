defmodule Mix.Tasks.GetSecuritySnapshot do
  @moduledoc """
  Get security snapshot
  """

  use Mix.Task
  require Logger

  def run([code]) do
    Mix.Task.run("app.config")
    {:ok, _pid} = Futu.start(%{name: :mix_task})

    opts = [
      securityList: [
        [
          market: 1,
          code: code
        ]
      ]
    ]

    {:ok, res} = Futu.security_snapshot(:mix_task, opts)
    IO.inspect(res)
  end
end
