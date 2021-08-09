defmodule Qot_UpdatePriceReminder.MarketStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :MarketStatus_Unknow
          | :MarketStatus_Open
          | :MarketStatus_USPre
          | :MarketStatus_USAfter

  field :MarketStatus_Unknow, 0

  field :MarketStatus_Open, 1

  field :MarketStatus_USPre, 2

  field :MarketStatus_USAfter, 3
end

defmodule Qot_UpdatePriceReminder.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          price: float | :infinity | :negative_infinity | :nan,
          changeRate: float | :infinity | :negative_infinity | :nan,
          marketStatus: integer,
          content: String.t(),
          note: String.t(),
          key: integer,
          type: integer,
          setValue: float | :infinity | :negative_infinity | :nan,
          curValue: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :security,
    :price,
    :changeRate,
    :marketStatus,
    :content,
    :note,
    :key,
    :type,
    :setValue,
    :curValue
  ]

  field :security, 1, required: true, type: Qot_Common.Security
  field :price, 2, required: true, type: :double
  field :changeRate, 3, required: true, type: :double
  field :marketStatus, 4, required: true, type: :int32
  field :content, 5, required: true, type: :string
  field :note, 6, required: true, type: :string
  field :key, 7, optional: true, type: :int64
  field :type, 8, optional: true, type: :int32
  field :setValue, 9, optional: true, type: :double
  field :curValue, 10, optional: true, type: :double
end

defmodule Qot_UpdatePriceReminder.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_UpdatePriceReminder.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_UpdatePriceReminder.S2C
end
