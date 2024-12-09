defmodule Trd_GetMaxTrdQtys.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :orderType, 2, required: true, type: :int32
  field :code, 3, required: true, type: :string
  field :price, 4, required: true, type: :double
  field :orderID, 5, optional: true, type: :uint64
  field :adjustPrice, 6, optional: true, type: :bool
  field :adjustSideAndLimit, 7, optional: true, type: :double
  field :secMarket, 8, optional: true, type: :int32
  field :orderIDEx, 9, optional: true, type: :string
end

defmodule Trd_GetMaxTrdQtys.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :maxTrdQtys, 2, optional: true, type: Trd_Common.MaxTrdQtys
end

defmodule Trd_GetMaxTrdQtys.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Trd_GetMaxTrdQtys.C2S
end

defmodule Trd_GetMaxTrdQtys.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_GetMaxTrdQtys.S2C
end