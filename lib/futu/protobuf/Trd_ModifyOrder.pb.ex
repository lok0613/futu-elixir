defmodule Trd_ModifyOrder.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          packetID: Common.PacketID.t() | nil,
          header: Trd_Common.TrdHeader.t() | nil,
          orderID: non_neg_integer,
          modifyOrderOp: integer,
          forAll: boolean,
          qty: float | :infinity | :negative_infinity | :nan,
          price: float | :infinity | :negative_infinity | :nan,
          adjustPrice: boolean,
          adjustSideAndLimit: float | :infinity | :negative_infinity | :nan,
          auxPrice: float | :infinity | :negative_infinity | :nan,
          trailType: integer,
          trailValue: float | :infinity | :negative_infinity | :nan,
          trailSpread: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :packetID,
    :header,
    :orderID,
    :modifyOrderOp,
    :forAll,
    :qty,
    :price,
    :adjustPrice,
    :adjustSideAndLimit,
    :auxPrice,
    :trailType,
    :trailValue,
    :trailSpread
  ]

  field :packetID, 1, required: true, type: Common.PacketID
  field :header, 2, required: true, type: Trd_Common.TrdHeader
  field :orderID, 3, required: true, type: :uint64
  field :modifyOrderOp, 4, required: true, type: :int32
  field :forAll, 5, optional: true, type: :bool
  field :qty, 8, optional: true, type: :double
  field :price, 9, optional: true, type: :double
  field :adjustPrice, 10, optional: true, type: :bool
  field :adjustSideAndLimit, 11, optional: true, type: :double
  field :auxPrice, 12, optional: true, type: :double
  field :trailType, 13, optional: true, type: :int32
  field :trailValue, 14, optional: true, type: :double
  field :trailSpread, 15, optional: true, type: :double
end

defmodule Trd_ModifyOrder.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          orderID: non_neg_integer
        }

  defstruct [:header, :orderID]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :orderID, 2, required: true, type: :uint64
end

defmodule Trd_ModifyOrder.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Trd_ModifyOrder.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Trd_ModifyOrder.C2S
end

defmodule Trd_ModifyOrder.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Trd_ModifyOrder.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_ModifyOrder.S2C
end
