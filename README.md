## futu-elixir
> Futu API in Elixir

[![hex](https://img.shields.io/hexpm/v/futu.svg)](https://hex.pm/packages/futu)
[![CI](https://github.com/lok0613/futu-elixir/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/lok0613/futu-elixir/actions/workflows/ci.yml)

## Document
Official documentation: [Futu API 文檔 v5.9](https://openapi.futunn.com/futu-api-doc/)

## Before anything
Make sure you have FutuOpenD executable downloaded on your machine.
Checkout the official document if you have no idea about this thing.

If you want to use it in docker container or deployment on cloud instances, [futu-opend-docker](https://github.com/lok0613/futu-opend-docker).

## Installation
```elixir
def deps do
  [
    {:futu, "~> 2.0.1"}
  ]
end
```

## Usage

Start GenServer
```elixir
{:ok, _pid} = Futu.start(%{host: "localhost", port: 11_111, name: :futu_client})
```

Retrieve historical stocks data
```elixir
opts = [
  market: Futu.Quote.Historical.market(:hk_security),
  code: 1,
  period: Futu.Quote.Historical.period(:daily),
  from: ~N[2021-08-08 00:00:00],
  max_rows: 5
]
{:ok, stocks} = Futu.historical(:futu_client, opts) # Protocol ID 3103
```

## About InitConnect and KeepAlive
Both are automatically intiated and supervised in GenServers when the application start, no extra care required for this part.
