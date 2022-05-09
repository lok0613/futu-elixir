## futu-elixir
> Futu API in Elixir

[![hex](https://img.shields.io/hexpm/v/futu.svg)](https://hex.pm/packages/futu)
[![CI](https://github.com/lok0613/futu-elixir/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/lok0613/futu-elixir/actions/workflows/ci.yml)

## Document
Official documentation: [Futu API 文檔 v5.12](https://openapi.futunn.com/futu-api-doc/)

## Before anything
Make sure you have FutuOpenD executable downloaded on your machine.
Checkout the official document if you have no idea about this thing.

If you want to use it in docker container or deployment on cloud instances, [futu-opend-docker](https://github.com/lok0613/futu-opend-docker).

## Installation
```elixir
def deps do
  [
    {:futu, "~> 2.9.1"}
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

Connect multiple Futu clients
```elixir
{:ok, _pid} = Futu.start(%{host: "localhost", port: 11_111, name: :client_1})
{:ok, _pid} = Futu.start(%{host: "localhost", port: 55_555, name: :client_2})

{:ok, _res} = Futu.account_list(:client_2, [userID: 0])
```

Get account funds
```elixir
opts = [
  header: [
    trdEnv: 1,
    accID: acc_id,
    trdMarket: 1
  ],
  currency: 1
]
{:ok, _res} = Futu.account_funds(:mix_task, opts)
```

Trade
```elixir
trade_env = 0 # simulate
trade_market = 1 # HK
account_id =
md5_password =
trade_header = header: [
  trdEnv: trade_env,
  accID: account_id,
  trdMarket: trade_market
]

unlock_opts = [
  unlock: true,
  pwdMD5: md5_password,
  securityFirm: 1 # HK
]
Futu.unlock_trade(:futu_client, unlock_opts)

place_order_opts = [
  packetID: [
    connID: Futu.get_conn_id(:futu_client),
    serialNo: 111
  ],
  header: trade_header,
  trdSide: 2, # buy
  orderType: 1, # 限价单
  code: code,
  qty: 1,
  price: price,
  secMarket: 1, # HK
  remark: "test"
]
{:ok, place_order_respond} = Futu.place_order(:futu_client, place_order_opts)

order_list_opts = [
  header: trade_header
]
{:ok, order_list_opts_respond} = Futu.order_list(:futu_client, order_list_opts)

position_list_opts = [
  header: trade_header,
  refreshCache: true
]
{:ok, position_list_respond} = Futu.position_list(:futu_client, position_list_opts)
```

Subscription
```elixir
# Subscribe event
acc_id_list = []
Futu.subscription(:mix_task, %{accIDList: acc_id_list})

# Config
config :futu,
  order_update_callback: [Futu.UpdateNotifier, :handle_info]
```

More examples, please checkout [Mix Tasks](https://github.com/lok0613/futu-elixir/tree/master/lib/mix)

## About InitConnect and KeepAlive
Both are automatically intiated and supervised in GenServers when the application start, no extra care required for this part.
