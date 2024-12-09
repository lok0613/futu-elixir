defmodule Trd_PlaceOrder.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :packetID, 1, required: true, type: Common.PacketID
  field :header, 2, required: true, type: Trd_Common.TrdHeader
  field :trdSide, 3, required: true, type: :int32
  field :orderType, 4, required: true, type: :int32
  field :code, 5, required: true, type: :string
  field :qty, 6, required: true, type: :double
  field :price, 7, optional: true, type: :double
  field :adjustPrice, 8, optional: true, type: :bool
  field :adjustSideAndLimit, 9, optional: true, type: :double
  field :secMarket, 10, optional: true, type: :int32
  field :remark, 11, optional: true, type: :string
  field :timeInForce, 12, optional: true, type: :int32
  field :fillOutsideRTH, 13, optional: true, type: :bool
  field :auxPrice, 14, optional: true, type: :double
  field :trailType, 15, optional: true, type: :int32
  field :trailValue, 16, optional: true, type: :double
  field :trailSpread, 17, optional: true, type: :double
end

defmodule Trd_PlaceOrder.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :orderID, 2, optional: true, type: :uint64
  field :orderIDEx, 3, optional: true, type: :string
end

defmodule Trd_PlaceOrder.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Trd_PlaceOrder.C2S
end

defmodule Trd_PlaceOrder.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_PlaceOrder.S2C
end