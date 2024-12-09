defmodule Trd_GetOrderList.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :filterConditions, 2, optional: true, type: Trd_Common.TrdFilterConditions
  field :filterStatusList, 3, repeated: true, type: :int32
  field :refreshCache, 4, optional: true, type: :bool
end

defmodule Trd_GetOrderList.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :orderList, 2, repeated: true, type: Trd_Common.Order
end

defmodule Trd_GetOrderList.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Trd_GetOrderList.C2S
end

defmodule Trd_GetOrderList.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_GetOrderList.S2C
end