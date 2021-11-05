defmodule Trd_PlaceOrder.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          packetID: Common.PacketID.t() | nil,
          header: Trd_Common.TrdHeader.t() | nil,
          trdSide: integer,
          orderType: integer,
          code: String.t(),
          qty: float | :infinity | :negative_infinity | :nan,
          price: float | :infinity | :negative_infinity | :nan,
          adjustPrice: boolean,
          adjustSideAndLimit: float | :infinity | :negative_infinity | :nan,
          secMarket: integer,
          remark: String.t(),
          timeInForce: integer,
          fillOutsideRTH: boolean,
          auxPrice: float | :infinity | :negative_infinity | :nan,
          trailType: integer,
          trailValue: float | :infinity | :negative_infinity | :nan,
          trailSpread: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :packetID,
    :header,
    :trdSide,
    :orderType,
    :code,
    :qty,
    :price,
    :adjustPrice,
    :adjustSideAndLimit,
    :secMarket,
    :remark,
    :timeInForce,
    :fillOutsideRTH,
    :auxPrice,
    :trailType,
    :trailValue,
    :trailSpread
  ]

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
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          orderID: non_neg_integer
        }

  defstruct [:header, :orderID]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :orderID, 2, optional: true, type: :uint64
end

defmodule Trd_PlaceOrder.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Trd_PlaceOrder.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Trd_PlaceOrder.C2S
end

defmodule Trd_PlaceOrder.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Trd_PlaceOrder.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_PlaceOrder.S2C
end
