defmodule Futu.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Futu.GenServer, futu_opts()}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end

  defp futu_opts() do
    host =
      :futu
      |> Application.get_env(:opend_host)
      |> String.to_charlist()

    port = Application.get_env(:futu, :opend_port)
    [host: host, port: port]
  end
end
