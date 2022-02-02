import Config

config :futu,
  mapper_module: Futu.Component.Mapper.Nothing,
  tcp_timeout: 20_000

config :mix_version,
  commit_msg: "Bump version to v%s"
