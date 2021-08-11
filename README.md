## futu-elixir
> Futu API in Elixir

## Document
Offical documentation: [Futu API 文檔 v5.6](https://openapi.futunn.com/futu-api-doc/)

## Before anything
Make sure you have FutuOpenD executable downloaded on your machine.
Checkout the official document if you have no idea about it.

## Configuration
Default FutuOpenD host and port were setup already.
`config/runtime.exs`
```elixir
import Config

config :futu,
  opend_host: System.get_env("FUTU_HOST") || "localhost",
  opend_port: System.get_env("FUFU_PORT") || 11111
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
