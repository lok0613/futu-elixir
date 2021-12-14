defmodule Qot_GetFutureInfo.TradeTime do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          begin: float | :infinity | :negative_infinity | :nan,
          end: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:begin, :end]

  field :begin, 1, optional: true, type: :double
  field :end, 2, optional: true, type: :double
end

defmodule Qot_GetFutureInfo.FutureInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          security: Qot_Common.Security.t() | nil,
          lastTradeTime: String.t(),
          lastTradeTimestamp: float | :infinity | :negative_infinity | :nan,
          owner: Qot_Common.Security.t() | nil,
          ownerOther: String.t(),
          exchange: String.t(),
          contractType: String.t(),
          contractSize: float | :infinity | :negative_infinity | :nan,
          contractSizeUnit: String.t(),
          quoteCurrency: String.t(),
          minVar: float | :infinity | :negative_infinity | :nan,
          minVarUnit: String.t(),
          quoteUnit: String.t(),
          tradeTime: [Qot_GetFutureInfo.TradeTime.t()],
          timeZone: String.t(),
          exchangeFormatUrl: String.t(),
          origin: Qot_Common.Security.t() | nil
        }

  defstruct [
    :name,
    :security,
    :lastTradeTime,
    :lastTradeTimestamp,
    :owner,
    :ownerOther,
    :exchange,
    :contractType,
    :contractSize,
    :contractSizeUnit,
    :quoteCurrency,
    :minVar,
    :minVarUnit,
    :quoteUnit,
    :tradeTime,
    :timeZone,
    :exchangeFormatUrl,
    :origin
  ]

  field :name, 1, required: true, type: :string
  field :security, 2, required: true, type: Qot_Common.Security
  field :lastTradeTime, 3, required: true, type: :string
  field :lastTradeTimestamp, 4, optional: true, type: :double
  field :owner, 5, optional: true, type: Qot_Common.Security
  field :ownerOther, 6, required: true, type: :string
  field :exchange, 7, required: true, type: :string
  field :contractType, 8, required: true, type: :string
  field :contractSize, 9, required: true, type: :double
  field :contractSizeUnit, 10, required: true, type: :string
  field :quoteCurrency, 11, required: true, type: :string
  field :minVar, 12, required: true, type: :double
  field :minVarUnit, 13, required: true, type: :string
  field :quoteUnit, 14, optional: true, type: :string
  field :tradeTime, 15, repeated: true, type: Qot_GetFutureInfo.TradeTime
  field :timeZone, 16, required: true, type: :string
  field :exchangeFormatUrl, 17, required: true, type: :string
  field :origin, 18, optional: true, type: Qot_Common.Security
end

defmodule Qot_GetFutureInfo.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          securityList: [Qot_Common.Security.t()]
        }

  defstruct [:securityList]

  field :securityList, 1, repeated: true, type: Qot_Common.Security
end

defmodule Qot_GetFutureInfo.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          futureInfoList: [Qot_GetFutureInfo.FutureInfo.t()]
        }

  defstruct [:futureInfoList]

  field :futureInfoList, 1, repeated: true, type: Qot_GetFutureInfo.FutureInfo
end

defmodule Qot_GetFutureInfo.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetFutureInfo.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetFutureInfo.C2S
end

defmodule Qot_GetFutureInfo.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetFutureInfo.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetFutureInfo.S2C
end
