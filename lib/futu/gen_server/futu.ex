defmodule Futu.GenServer.Futu do
  def start(opts) do
    children = [
      {Futu.GenServer.TCP, opts},
      {Futu.GenServer.HeartBeat, opts}
    ]

    Supervisor.start_link(children, strategy: :one_for_all)
  end
end
