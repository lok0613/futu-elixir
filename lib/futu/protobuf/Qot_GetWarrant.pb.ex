defmodule Qot_GetWarrant.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          begin: integer,
          num: integer,
          sortField: integer,
          ascend: boolean,
          owner: Qot_Common.Security.t() | nil,
          typeList: [integer],
          issuerList: [integer],
          maturityTimeMin: String.t(),
          maturityTimeMax: String.t(),
          ipoPeriod: integer,
          priceType: integer,
          status: integer,
          curPriceMin: float | :infinity | :negative_infinity | :nan,
          curPriceMax: float | :infinity | :negative_infinity | :nan,
          strikePriceMin: float | :infinity | :negative_infinity | :nan,
          strikePriceMax: float | :infinity | :negative_infinity | :nan,
          streetMin: float | :infinity | :negative_infinity | :nan,
          streetMax: float | :infinity | :negative_infinity | :nan,
          conversionMin: float | :infinity | :negative_infinity | :nan,
          conversionMax: float | :infinity | :negative_infinity | :nan,
          volMin: non_neg_integer,
          volMax: non_neg_integer,
          premiumMin: float | :infinity | :negative_infinity | :nan,
          premiumMax: float | :infinity | :negative_infinity | :nan,
          leverageRatioMin: float | :infinity | :negative_infinity | :nan,
          leverageRatioMax: float | :infinity | :negative_infinity | :nan,
          deltaMin: float | :infinity | :negative_infinity | :nan,
          deltaMax: float | :infinity | :negative_infinity | :nan,
          impliedMin: float | :infinity | :negative_infinity | :nan,
          impliedMax: float | :infinity | :negative_infinity | :nan,
          recoveryPriceMin: float | :infinity | :negative_infinity | :nan,
          recoveryPriceMax: float | :infinity | :negative_infinity | :nan,
          priceRecoveryRatioMin: float | :infinity | :negative_infinity | :nan,
          priceRecoveryRatioMax: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :begin,
    :num,
    :sortField,
    :ascend,
    :owner,
    :typeList,
    :issuerList,
    :maturityTimeMin,
    :maturityTimeMax,
    :ipoPeriod,
    :priceType,
    :status,
    :curPriceMin,
    :curPriceMax,
    :strikePriceMin,
    :strikePriceMax,
    :streetMin,
    :streetMax,
    :conversionMin,
    :conversionMax,
    :volMin,
    :volMax,
    :premiumMin,
    :premiumMax,
    :leverageRatioMin,
    :leverageRatioMax,
    :deltaMin,
    :deltaMax,
    :impliedMin,
    :impliedMax,
    :recoveryPriceMin,
    :recoveryPriceMax,
    :priceRecoveryRatioMin,
    :priceRecoveryRatioMax
  ]

  field :begin, 1, required: true, type: :int32
  field :num, 2, required: true, type: :int32
  field :sortField, 3, required: true, type: :int32
  field :ascend, 4, required: true, type: :bool
  field :owner, 5, optional: true, type: Qot_Common.Security
  field :typeList, 6, repeated: true, type: :int32
  field :issuerList, 7, repeated: true, type: :int32
  field :maturityTimeMin, 8, optional: true, type: :string
  field :maturityTimeMax, 9, optional: true, type: :string
  field :ipoPeriod, 10, optional: true, type: :int32
  field :priceType, 11, optional: true, type: :int32
  field :status, 12, optional: true, type: :int32
  field :curPriceMin, 13, optional: true, type: :double
  field :curPriceMax, 14, optional: true, type: :double
  field :strikePriceMin, 15, optional: true, type: :double
  field :strikePriceMax, 16, optional: true, type: :double
  field :streetMin, 17, optional: true, type: :double
  field :streetMax, 18, optional: true, type: :double
  field :conversionMin, 19, optional: true, type: :double
  field :conversionMax, 20, optional: true, type: :double
  field :volMin, 21, optional: true, type: :uint64
  field :volMax, 22, optional: true, type: :uint64
  field :premiumMin, 23, optional: true, type: :double
  field :premiumMax, 24, optional: true, type: :double
  field :leverageRatioMin, 25, optional: true, type: :double
  field :leverageRatioMax, 26, optional: true, type: :double
  field :deltaMin, 27, optional: true, type: :double
  field :deltaMax, 28, optional: true, type: :double
  field :impliedMin, 29, optional: true, type: :double
  field :impliedMax, 30, optional: true, type: :double
  field :recoveryPriceMin, 31, optional: true, type: :double
  field :recoveryPriceMax, 32, optional: true, type: :double
  field :priceRecoveryRatioMin, 33, optional: true, type: :double
  field :priceRecoveryRatioMax, 34, optional: true, type: :double
end

defmodule Qot_GetWarrant.WarrantData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          stock: Qot_Common.Security.t() | nil,
          owner: Qot_Common.Security.t() | nil,
          type: integer,
          issuer: integer,
          maturityTime: String.t(),
          maturityTimestamp: float | :infinity | :negative_infinity | :nan,
          listTime: String.t(),
          listTimestamp: float | :infinity | :negative_infinity | :nan,
          lastTradeTime: String.t(),
          lastTradeTimestamp: float | :infinity | :negative_infinity | :nan,
          recoveryPrice: float | :infinity | :negative_infinity | :nan,
          conversionRatio: float | :infinity | :negative_infinity | :nan,
          lotSize: integer,
          strikePrice: float | :infinity | :negative_infinity | :nan,
          lastClosePrice: float | :infinity | :negative_infinity | :nan,
          name: String.t(),
          curPrice: float | :infinity | :negative_infinity | :nan,
          priceChangeVal: float | :infinity | :negative_infinity | :nan,
          changeRate: float | :infinity | :negative_infinity | :nan,
          status: integer,
          bidPrice: float | :infinity | :negative_infinity | :nan,
          askPrice: float | :infinity | :negative_infinity | :nan,
          bidVol: integer,
          askVol: integer,
          volume: integer,
          turnover: float | :infinity | :negative_infinity | :nan,
          score: float | :infinity | :negative_infinity | :nan,
          premium: float | :infinity | :negative_infinity | :nan,
          breakEvenPoint: float | :infinity | :negative_infinity | :nan,
          leverage: float | :infinity | :negative_infinity | :nan,
          ipop: float | :infinity | :negative_infinity | :nan,
          priceRecoveryRatio: float | :infinity | :negative_infinity | :nan,
          conversionPrice: float | :infinity | :negative_infinity | :nan,
          streetRate: float | :infinity | :negative_infinity | :nan,
          streetVol: integer,
          amplitude: float | :infinity | :negative_infinity | :nan,
          issueSize: integer,
          highPrice: float | :infinity | :negative_infinity | :nan,
          lowPrice: float | :infinity | :negative_infinity | :nan,
          impliedVolatility: float | :infinity | :negative_infinity | :nan,
          delta: float | :infinity | :negative_infinity | :nan,
          effectiveLeverage: float | :infinity | :negative_infinity | :nan,
          upperStrikePrice: float | :infinity | :negative_infinity | :nan,
          lowerStrikePrice: float | :infinity | :negative_infinity | :nan,
          inLinePriceStatus: integer
        }

  defstruct [
    :stock,
    :owner,
    :type,
    :issuer,
    :maturityTime,
    :maturityTimestamp,
    :listTime,
    :listTimestamp,
    :lastTradeTime,
    :lastTradeTimestamp,
    :recoveryPrice,
    :conversionRatio,
    :lotSize,
    :strikePrice,
    :lastClosePrice,
    :name,
    :curPrice,
    :priceChangeVal,
    :changeRate,
    :status,
    :bidPrice,
    :askPrice,
    :bidVol,
    :askVol,
    :volume,
    :turnover,
    :score,
    :premium,
    :breakEvenPoint,
    :leverage,
    :ipop,
    :priceRecoveryRatio,
    :conversionPrice,
    :streetRate,
    :streetVol,
    :amplitude,
    :issueSize,
    :highPrice,
    :lowPrice,
    :impliedVolatility,
    :delta,
    :effectiveLeverage,
    :upperStrikePrice,
    :lowerStrikePrice,
    :inLinePriceStatus
  ]

  field :stock, 1, required: true, type: Qot_Common.Security
  field :owner, 2, required: true, type: Qot_Common.Security
  field :type, 3, required: true, type: :int32
  field :issuer, 4, required: true, type: :int32
  field :maturityTime, 5, required: true, type: :string
  field :maturityTimestamp, 6, optional: true, type: :double
  field :listTime, 7, required: true, type: :string
  field :listTimestamp, 8, optional: true, type: :double
  field :lastTradeTime, 9, required: true, type: :string
  field :lastTradeTimestamp, 10, optional: true, type: :double
  field :recoveryPrice, 11, optional: true, type: :double
  field :conversionRatio, 12, required: true, type: :double
  field :lotSize, 13, required: true, type: :int32
  field :strikePrice, 14, required: true, type: :double
  field :lastClosePrice, 15, required: true, type: :double
  field :name, 16, required: true, type: :string
  field :curPrice, 17, required: true, type: :double
  field :priceChangeVal, 18, required: true, type: :double
  field :changeRate, 19, required: true, type: :double
  field :status, 20, required: true, type: :int32
  field :bidPrice, 21, required: true, type: :double
  field :askPrice, 22, required: true, type: :double
  field :bidVol, 23, required: true, type: :int64
  field :askVol, 24, required: true, type: :int64
  field :volume, 25, required: true, type: :int64
  field :turnover, 26, required: true, type: :double
  field :score, 27, required: true, type: :double
  field :premium, 28, required: true, type: :double
  field :breakEvenPoint, 29, required: true, type: :double
  field :leverage, 30, required: true, type: :double
  field :ipop, 31, required: true, type: :double
  field :priceRecoveryRatio, 32, optional: true, type: :double
  field :conversionPrice, 33, required: true, type: :double
  field :streetRate, 34, required: true, type: :double
  field :streetVol, 35, required: true, type: :int64
  field :amplitude, 36, required: true, type: :double
  field :issueSize, 37, required: true, type: :int64
  field :highPrice, 39, required: true, type: :double
  field :lowPrice, 40, required: true, type: :double
  field :impliedVolatility, 41, optional: true, type: :double
  field :delta, 42, optional: true, type: :double
  field :effectiveLeverage, 43, required: true, type: :double
  field :upperStrikePrice, 44, optional: true, type: :double
  field :lowerStrikePrice, 45, optional: true, type: :double
  field :inLinePriceStatus, 46, optional: true, type: :int32
end

defmodule Qot_GetWarrant.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          lastPage: boolean,
          allCount: integer,
          warrantDataList: [Qot_GetWarrant.WarrantData.t()]
        }

  defstruct [:lastPage, :allCount, :warrantDataList]

  field :lastPage, 1, required: true, type: :bool
  field :allCount, 2, required: true, type: :int32
  field :warrantDataList, 3, repeated: true, type: Qot_GetWarrant.WarrantData
end

defmodule Qot_GetWarrant.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetWarrant.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetWarrant.C2S
end

defmodule Qot_GetWarrant.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetWarrant.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetWarrant.S2C
end
