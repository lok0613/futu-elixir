defmodule Mix.Tasks.UnlockTrade do
  @moduledoc """
  Unlock trade
  """

  use Mix.Task
  require Logger

  def run([md5]) do
    Mix.Task.run("app.config")
    {:ok, _pid} = Futu.start(%{name: :mix_task})

    opts = [
      unlock: true,
      pwdMD5: md5,
      securityFirm: 1
    ]

    {:ok, res} = Futu.unlock_trade(:mix_task, opts)
    IO.inspect(res)
  end
end
