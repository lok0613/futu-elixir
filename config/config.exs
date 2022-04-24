import Config

config :futu,
  tcp_debug: false,
  mapper_module: Futu.Component.Mapper.Nothing,
  tcp_timeout: 20_000

config :mix_version,
  commit_msg: "Bump version to v%s"
