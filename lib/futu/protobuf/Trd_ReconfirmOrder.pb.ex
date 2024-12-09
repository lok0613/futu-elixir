defmodule Trd_ReconfirmOrder.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :packetID, 1, required: true, type: Common.PacketID
  field :header, 2, required: true, type: Trd_Common.TrdHeader
  field :orderID, 3, required: true, type: :uint64
  field :reconfirmReason, 4, required: true, type: :int32
end

defmodule Trd_ReconfirmOrder.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :orderID, 2, required: true, type: :uint64
end

defmodule Trd_ReconfirmOrder.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Trd_ReconfirmOrder.C2S
end

defmodule Trd_ReconfirmOrder.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_ReconfirmOrder.S2C
end