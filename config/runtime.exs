import Config

config :futu,
  opend_host: System.get_env("FUTU_HOST") || "localhost",
  opend_port: System.get_env("FUFU_PORT") || 11111
