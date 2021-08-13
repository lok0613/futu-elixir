## futu-elixir
> Futu API in Elixir

[![CD](https://github.com/lok0613/futu-elixir/actions/workflows/cd.yml/badge.svg)](https://github.com/lok0613/futu-elixir/actions/workflows/cd.yml)
[![CI](https://github.com/lok0613/futu-elixir/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/lok0613/futu-elixir/actions/workflows/ci.yml)

## Document
Official documentation: [Futu API 文檔 v5.6](https://openapi.futunn.com/futu-api-doc/)

## Before anything
Make sure you have FutuOpenD executable downloaded on your machine.
Checkout the official document if you have no idea about this thing.

If you want to use it in docker container or deployment on cloud instances, [futu-opend-docker](https://github.com/lok0613/futu-opend-docker).

## Installation
```elixir
def deps do
  [
    {:futu, "~> 1.1.1"}
  ]
end
```

## Configuration
Default FutuOpenD host and port were setup already.
`config/runtime.exs`
```elixir
import Config

config :futu,
  opend_host: System.get_env("FUTU_HOST") || "localhost",
  opend_port: System.get_env("FUFU_PORT") || 11_111
```

## Usage

Retrieve historical stocks data
```elixir
opts = [
  market: Futu.Quote.Historical.market(:hk_security),
  code: 1,
  period: Futu.Quote.Historical.period(:daily),
  from: ~N[2021-08-08 00:00:00],
  max_rows: 5
]
{:ok, stocks} = Futu.historical(opts) # Protocol ID 3103
```

## About InitConnect and KeepAlive
Both are automatically intiated and supervised in GenServers when the application start, no extra care required for this part.
