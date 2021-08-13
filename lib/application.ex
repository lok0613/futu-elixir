defmodule Futu.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Futu.GenServer.TCP, futu_opts()},
      {Futu.GenServer, []}
    ]

    Supervisor.start_link(children, strategy: :one_for_all)
  end

  def futu_opts() do
    host =
      :futu
      |> Application.get_env(:opend_host)
      |> String.to_charlist()

    port = Application.get_env(:futu, :opend_port)
    [host: host, port: port]
  end
end
