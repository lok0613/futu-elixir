defmodule Futu.MixProject do
  use Mix.Project

  def project do
    [
      app: :futu,
      version: "2.10.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      description: description(),
      package: package()
    ]
  end

  defp elixirc_paths(:test), do: ["test/support", "lib"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :crypto]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:binary, "~> 0.0.5"},
      {:jason, "~> 1.2"},
      {:protobuf, "~> 0.13.0"},
      {:mock, "~> 0.3.0", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end

  defp description() do
    "Futu API"
  end

  defp package() do
    [
      name: "futu",
      files: ~w(lib .formatter.exs mix.exs README*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/lok0613/futu-elixir"}
    ]
  end
end
