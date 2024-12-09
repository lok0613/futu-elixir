defmodule Trd_ModifyOrder.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :packetID, 1, required: true, type: Common.PacketID
  field :header, 2, required: true, type: Trd_Common.TrdHeader
  field :orderID, 3, required: true, type: :uint64
  field :modifyOrderOp, 4, required: true, type: :int32
  field :forAll, 5, optional: true, type: :bool
  field :trdMarket, 6, optional: true, type: :int32
  field :qty, 8, optional: true, type: :double
  field :price, 9, optional: true, type: :double
  field :adjustPrice, 10, optional: true, type: :bool
  field :adjustSideAndLimit, 11, optional: true, type: :double
  field :auxPrice, 12, optional: true, type: :double
  field :trailType, 13, optional: true, type: :int32
  field :trailValue, 14, optional: true, type: :double
  field :trailSpread, 15, optional: true, type: :double
  field :orderIDEx, 16, optional: true, type: :string
end

defmodule Trd_ModifyOrder.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :orderID, 2, required: true, type: :uint64
  field :orderIDEx, 3, optional: true, type: :string
end

defmodule Trd_ModifyOrder.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Trd_ModifyOrder.C2S
end

defmodule Trd_ModifyOrder.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_ModifyOrder.S2C
end