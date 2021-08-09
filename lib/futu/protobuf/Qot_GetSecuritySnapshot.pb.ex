defmodule Qot_GetSecuritySnapshot.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          securityList: [Qot_Common.Security.t()]
        }

  defstruct [:securityList]

  field :securityList, 1, repeated: true, type: Qot_Common.Security
end

defmodule Qot_GetSecuritySnapshot.EquitySnapshotExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          issuedShares: integer,
          issuedMarketVal: float | :infinity | :negative_infinity | :nan,
          netAsset: float | :infinity | :negative_infinity | :nan,
          netProfit: float | :infinity | :negative_infinity | :nan,
          earningsPershare: float | :infinity | :negative_infinity | :nan,
          outstandingShares: integer,
          outstandingMarketVal: float | :infinity | :negative_infinity | :nan,
          netAssetPershare: float | :infinity | :negative_infinity | :nan,
          eyRate: float | :infinity | :negative_infinity | :nan,
          peRate: float | :infinity | :negative_infinity | :nan,
          pbRate: float | :infinity | :negative_infinity | :nan,
          peTTMRate: float | :infinity | :negative_infinity | :nan,
          dividendTTM: float | :infinity | :negative_infinity | :nan,
          dividendRatioTTM: float | :infinity | :negative_infinity | :nan,
          dividendLFY: float | :infinity | :negative_infinity | :nan,
          dividendLFYRatio: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :issuedShares,
    :issuedMarketVal,
    :netAsset,
    :netProfit,
    :earningsPershare,
    :outstandingShares,
    :outstandingMarketVal,
    :netAssetPershare,
    :eyRate,
    :peRate,
    :pbRate,
    :peTTMRate,
    :dividendTTM,
    :dividendRatioTTM,
    :dividendLFY,
    :dividendLFYRatio
  ]

  field :issuedShares, 1, required: true, type: :int64
  field :issuedMarketVal, 2, required: true, type: :double
  field :netAsset, 3, required: true, type: :double
  field :netProfit, 4, required: true, type: :double
  field :earningsPershare, 5, required: true, type: :double
  field :outstandingShares, 6, required: true, type: :int64
  field :outstandingMarketVal, 7, required: true, type: :double
  field :netAssetPershare, 8, required: true, type: :double
  field :eyRate, 9, required: true, type: :double
  field :peRate, 10, required: true, type: :double
  field :pbRate, 11, required: true, type: :double
  field :peTTMRate, 12, required: true, type: :double
  field :dividendTTM, 13, optional: true, type: :double
  field :dividendRatioTTM, 14, optional: true, type: :double
  field :dividendLFY, 15, optional: true, type: :double
  field :dividendLFYRatio, 16, optional: true, type: :double
end

defmodule Qot_GetSecuritySnapshot.WarrantSnapshotExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          conversionRate: float | :infinity | :negative_infinity | :nan,
          warrantType: integer,
          strikePrice: float | :infinity | :negative_infinity | :nan,
          maturityTime: String.t(),
          endTradeTime: String.t(),
          owner: Qot_Common.Security.t() | nil,
          recoveryPrice: float | :infinity | :negative_infinity | :nan,
          streetVolumn: integer,
          issueVolumn: integer,
          streetRate: float | :infinity | :negative_infinity | :nan,
          delta: float | :infinity | :negative_infinity | :nan,
          impliedVolatility: float | :infinity | :negative_infinity | :nan,
          premium: float | :infinity | :negative_infinity | :nan,
          maturityTimestamp: float | :infinity | :negative_infinity | :nan,
          endTradeTimestamp: float | :infinity | :negative_infinity | :nan,
          leverage: float | :infinity | :negative_infinity | :nan,
          ipop: float | :infinity | :negative_infinity | :nan,
          breakEvenPoint: float | :infinity | :negative_infinity | :nan,
          conversionPrice: float | :infinity | :negative_infinity | :nan,
          priceRecoveryRatio: float | :infinity | :negative_infinity | :nan,
          score: float | :infinity | :negative_infinity | :nan,
          upperStrikePrice: float | :infinity | :negative_infinity | :nan,
          lowerStrikePrice: float | :infinity | :negative_infinity | :nan,
          inLinePriceStatus: integer,
          issuerCode: String.t()
        }

  defstruct [
    :conversionRate,
    :warrantType,
    :strikePrice,
    :maturityTime,
    :endTradeTime,
    :owner,
    :recoveryPrice,
    :streetVolumn,
    :issueVolumn,
    :streetRate,
    :delta,
    :impliedVolatility,
    :premium,
    :maturityTimestamp,
    :endTradeTimestamp,
    :leverage,
    :ipop,
    :breakEvenPoint,
    :conversionPrice,
    :priceRecoveryRatio,
    :score,
    :upperStrikePrice,
    :lowerStrikePrice,
    :inLinePriceStatus,
    :issuerCode
  ]

  field :conversionRate, 1, required: true, type: :double
  field :warrantType, 2, required: true, type: :int32
  field :strikePrice, 3, required: true, type: :double
  field :maturityTime, 4, required: true, type: :string
  field :endTradeTime, 5, required: true, type: :string
  field :owner, 6, required: true, type: Qot_Common.Security
  field :recoveryPrice, 7, required: true, type: :double
  field :streetVolumn, 8, required: true, type: :int64
  field :issueVolumn, 9, required: true, type: :int64
  field :streetRate, 10, required: true, type: :double
  field :delta, 11, required: true, type: :double
  field :impliedVolatility, 12, required: true, type: :double
  field :premium, 13, required: true, type: :double
  field :maturityTimestamp, 14, optional: true, type: :double
  field :endTradeTimestamp, 15, optional: true, type: :double
  field :leverage, 16, optional: true, type: :double
  field :ipop, 17, optional: true, type: :double
  field :breakEvenPoint, 18, optional: true, type: :double
  field :conversionPrice, 19, optional: true, type: :double
  field :priceRecoveryRatio, 20, optional: true, type: :double
  field :score, 21, optional: true, type: :double
  field :upperStrikePrice, 22, optional: true, type: :double
  field :lowerStrikePrice, 23, optional: true, type: :double
  field :inLinePriceStatus, 24, optional: true, type: :int32
  field :issuerCode, 25, optional: true, type: :string
end

defmodule Qot_GetSecuritySnapshot.OptionSnapshotExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: integer,
          owner: Qot_Common.Security.t() | nil,
          strikeTime: String.t(),
          strikePrice: float | :infinity | :negative_infinity | :nan,
          contractSize: integer,
          contractSizeFloat: float | :infinity | :negative_infinity | :nan,
          openInterest: integer,
          impliedVolatility: float | :infinity | :negative_infinity | :nan,
          premium: float | :infinity | :negative_infinity | :nan,
          delta: float | :infinity | :negative_infinity | :nan,
          gamma: float | :infinity | :negative_infinity | :nan,
          vega: float | :infinity | :negative_infinity | :nan,
          theta: float | :infinity | :negative_infinity | :nan,
          rho: float | :infinity | :negative_infinity | :nan,
          strikeTimestamp: float | :infinity | :negative_infinity | :nan,
          indexOptionType: integer,
          netOpenInterest: integer,
          expiryDateDistance: integer,
          contractNominalValue: float | :infinity | :negative_infinity | :nan,
          ownerLotMultiplier: float | :infinity | :negative_infinity | :nan,
          optionAreaType: integer,
          contractMultiplier: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :type,
    :owner,
    :strikeTime,
    :strikePrice,
    :contractSize,
    :contractSizeFloat,
    :openInterest,
    :impliedVolatility,
    :premium,
    :delta,
    :gamma,
    :vega,
    :theta,
    :rho,
    :strikeTimestamp,
    :indexOptionType,
    :netOpenInterest,
    :expiryDateDistance,
    :contractNominalValue,
    :ownerLotMultiplier,
    :optionAreaType,
    :contractMultiplier
  ]

  field :type, 1, required: true, type: :int32
  field :owner, 2, required: true, type: Qot_Common.Security
  field :strikeTime, 3, required: true, type: :string
  field :strikePrice, 4, required: true, type: :double
  field :contractSize, 5, required: true, type: :int32
  field :contractSizeFloat, 22, optional: true, type: :double
  field :openInterest, 6, required: true, type: :int32
  field :impliedVolatility, 7, required: true, type: :double
  field :premium, 8, required: true, type: :double
  field :delta, 9, required: true, type: :double
  field :gamma, 10, required: true, type: :double
  field :vega, 11, required: true, type: :double
  field :theta, 12, required: true, type: :double
  field :rho, 13, required: true, type: :double
  field :strikeTimestamp, 14, optional: true, type: :double
  field :indexOptionType, 15, optional: true, type: :int32
  field :netOpenInterest, 16, optional: true, type: :int32
  field :expiryDateDistance, 17, optional: true, type: :int32
  field :contractNominalValue, 18, optional: true, type: :double
  field :ownerLotMultiplier, 19, optional: true, type: :double
  field :optionAreaType, 20, optional: true, type: :int32
  field :contractMultiplier, 21, optional: true, type: :double
end

defmodule Qot_GetSecuritySnapshot.IndexSnapshotExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          raiseCount: integer,
          fallCount: integer,
          equalCount: integer
        }

  defstruct [:raiseCount, :fallCount, :equalCount]

  field :raiseCount, 1, required: true, type: :int32
  field :fallCount, 2, required: true, type: :int32
  field :equalCount, 3, required: true, type: :int32
end

defmodule Qot_GetSecuritySnapshot.PlateSnapshotExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          raiseCount: integer,
          fallCount: integer,
          equalCount: integer
        }

  defstruct [:raiseCount, :fallCount, :equalCount]

  field :raiseCount, 1, required: true, type: :int32
  field :fallCount, 2, required: true, type: :int32
  field :equalCount, 3, required: true, type: :int32
end

defmodule Qot_GetSecuritySnapshot.FutureSnapshotExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          lastSettlePrice: float | :infinity | :negative_infinity | :nan,
          position: integer,
          positionChange: integer,
          lastTradeTime: String.t(),
          lastTradeTimestamp: float | :infinity | :negative_infinity | :nan,
          isMainContract: boolean
        }

  defstruct [
    :lastSettlePrice,
    :position,
    :positionChange,
    :lastTradeTime,
    :lastTradeTimestamp,
    :isMainContract
  ]

  field :lastSettlePrice, 1, required: true, type: :double
  field :position, 2, required: true, type: :int32
  field :positionChange, 3, required: true, type: :int32
  field :lastTradeTime, 4, required: true, type: :string
  field :lastTradeTimestamp, 5, optional: true, type: :double
  field :isMainContract, 6, required: true, type: :bool
end

defmodule Qot_GetSecuritySnapshot.TrustSnapshotExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          dividendYield: float | :infinity | :negative_infinity | :nan,
          aum: float | :infinity | :negative_infinity | :nan,
          outstandingUnits: integer,
          netAssetValue: float | :infinity | :negative_infinity | :nan,
          premium: float | :infinity | :negative_infinity | :nan,
          assetClass: integer
        }

  defstruct [:dividendYield, :aum, :outstandingUnits, :netAssetValue, :premium, :assetClass]

  field :dividendYield, 1, required: true, type: :double
  field :aum, 2, required: true, type: :double
  field :outstandingUnits, 3, required: true, type: :int64
  field :netAssetValue, 4, required: true, type: :double
  field :premium, 5, required: true, type: :double
  field :assetClass, 6, required: true, type: :int32
end

defmodule Qot_GetSecuritySnapshot.SnapshotBasicData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          type: integer,
          isSuspend: boolean,
          listTime: String.t(),
          lotSize: integer,
          priceSpread: float | :infinity | :negative_infinity | :nan,
          updateTime: String.t(),
          highPrice: float | :infinity | :negative_infinity | :nan,
          openPrice: float | :infinity | :negative_infinity | :nan,
          lowPrice: float | :infinity | :negative_infinity | :nan,
          lastClosePrice: float | :infinity | :negative_infinity | :nan,
          curPrice: float | :infinity | :negative_infinity | :nan,
          volume: integer,
          turnover: float | :infinity | :negative_infinity | :nan,
          turnoverRate: float | :infinity | :negative_infinity | :nan,
          listTimestamp: float | :infinity | :negative_infinity | :nan,
          updateTimestamp: float | :infinity | :negative_infinity | :nan,
          askPrice: float | :infinity | :negative_infinity | :nan,
          bidPrice: float | :infinity | :negative_infinity | :nan,
          askVol: integer,
          bidVol: integer,
          enableMargin: boolean,
          mortgageRatio: float | :infinity | :negative_infinity | :nan,
          longMarginInitialRatio: float | :infinity | :negative_infinity | :nan,
          enableShortSell: boolean,
          shortSellRate: float | :infinity | :negative_infinity | :nan,
          shortAvailableVolume: integer,
          shortMarginInitialRatio: float | :infinity | :negative_infinity | :nan,
          amplitude: float | :infinity | :negative_infinity | :nan,
          avgPrice: float | :infinity | :negative_infinity | :nan,
          bidAskRatio: float | :infinity | :negative_infinity | :nan,
          volumeRatio: float | :infinity | :negative_infinity | :nan,
          highest52WeeksPrice: float | :infinity | :negative_infinity | :nan,
          lowest52WeeksPrice: float | :infinity | :negative_infinity | :nan,
          highestHistoryPrice: float | :infinity | :negative_infinity | :nan,
          lowestHistoryPrice: float | :infinity | :negative_infinity | :nan,
          preMarket: Qot_Common.PreAfterMarketData.t() | nil,
          afterMarket: Qot_Common.PreAfterMarketData.t() | nil,
          secStatus: integer,
          closePrice5Minute: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :security,
    :type,
    :isSuspend,
    :listTime,
    :lotSize,
    :priceSpread,
    :updateTime,
    :highPrice,
    :openPrice,
    :lowPrice,
    :lastClosePrice,
    :curPrice,
    :volume,
    :turnover,
    :turnoverRate,
    :listTimestamp,
    :updateTimestamp,
    :askPrice,
    :bidPrice,
    :askVol,
    :bidVol,
    :enableMargin,
    :mortgageRatio,
    :longMarginInitialRatio,
    :enableShortSell,
    :shortSellRate,
    :shortAvailableVolume,
    :shortMarginInitialRatio,
    :amplitude,
    :avgPrice,
    :bidAskRatio,
    :volumeRatio,
    :highest52WeeksPrice,
    :lowest52WeeksPrice,
    :highestHistoryPrice,
    :lowestHistoryPrice,
    :preMarket,
    :afterMarket,
    :secStatus,
    :closePrice5Minute
  ]

  field :security, 1, required: true, type: Qot_Common.Security
  field :type, 2, required: true, type: :int32
  field :isSuspend, 3, required: true, type: :bool
  field :listTime, 4, required: true, type: :string
  field :lotSize, 5, required: true, type: :int32
  field :priceSpread, 6, required: true, type: :double
  field :updateTime, 7, required: true, type: :string
  field :highPrice, 8, required: true, type: :double
  field :openPrice, 9, required: true, type: :double
  field :lowPrice, 10, required: true, type: :double
  field :lastClosePrice, 11, required: true, type: :double
  field :curPrice, 12, required: true, type: :double
  field :volume, 13, required: true, type: :int64
  field :turnover, 14, required: true, type: :double
  field :turnoverRate, 15, required: true, type: :double
  field :listTimestamp, 16, optional: true, type: :double
  field :updateTimestamp, 17, optional: true, type: :double
  field :askPrice, 18, optional: true, type: :double
  field :bidPrice, 19, optional: true, type: :double
  field :askVol, 20, optional: true, type: :int64
  field :bidVol, 21, optional: true, type: :int64
  field :enableMargin, 22, optional: true, type: :bool
  field :mortgageRatio, 23, optional: true, type: :double
  field :longMarginInitialRatio, 24, optional: true, type: :double
  field :enableShortSell, 25, optional: true, type: :bool
  field :shortSellRate, 26, optional: true, type: :double
  field :shortAvailableVolume, 27, optional: true, type: :int64
  field :shortMarginInitialRatio, 28, optional: true, type: :double
  field :amplitude, 29, optional: true, type: :double
  field :avgPrice, 30, optional: true, type: :double
  field :bidAskRatio, 31, optional: true, type: :double
  field :volumeRatio, 32, optional: true, type: :double
  field :highest52WeeksPrice, 33, optional: true, type: :double
  field :lowest52WeeksPrice, 34, optional: true, type: :double
  field :highestHistoryPrice, 35, optional: true, type: :double
  field :lowestHistoryPrice, 36, optional: true, type: :double
  field :preMarket, 37, optional: true, type: Qot_Common.PreAfterMarketData
  field :afterMarket, 38, optional: true, type: Qot_Common.PreAfterMarketData
  field :secStatus, 39, optional: true, type: :int32
  field :closePrice5Minute, 40, optional: true, type: :double
end

defmodule Qot_GetSecuritySnapshot.Snapshot do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          basic: Qot_GetSecuritySnapshot.SnapshotBasicData.t() | nil,
          equityExData: Qot_GetSecuritySnapshot.EquitySnapshotExData.t() | nil,
          warrantExData: Qot_GetSecuritySnapshot.WarrantSnapshotExData.t() | nil,
          optionExData: Qot_GetSecuritySnapshot.OptionSnapshotExData.t() | nil,
          indexExData: Qot_GetSecuritySnapshot.IndexSnapshotExData.t() | nil,
          plateExData: Qot_GetSecuritySnapshot.PlateSnapshotExData.t() | nil,
          futureExData: Qot_GetSecuritySnapshot.FutureSnapshotExData.t() | nil,
          trustExData: Qot_GetSecuritySnapshot.TrustSnapshotExData.t() | nil
        }

  defstruct [
    :basic,
    :equityExData,
    :warrantExData,
    :optionExData,
    :indexExData,
    :plateExData,
    :futureExData,
    :trustExData
  ]

  field :basic, 1, required: true, type: Qot_GetSecuritySnapshot.SnapshotBasicData
  field :equityExData, 2, optional: true, type: Qot_GetSecuritySnapshot.EquitySnapshotExData
  field :warrantExData, 3, optional: true, type: Qot_GetSecuritySnapshot.WarrantSnapshotExData
  field :optionExData, 4, optional: true, type: Qot_GetSecuritySnapshot.OptionSnapshotExData
  field :indexExData, 5, optional: true, type: Qot_GetSecuritySnapshot.IndexSnapshotExData
  field :plateExData, 6, optional: true, type: Qot_GetSecuritySnapshot.PlateSnapshotExData
  field :futureExData, 7, optional: true, type: Qot_GetSecuritySnapshot.FutureSnapshotExData
  field :trustExData, 8, optional: true, type: Qot_GetSecuritySnapshot.TrustSnapshotExData
end

defmodule Qot_GetSecuritySnapshot.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          snapshotList: [Qot_GetSecuritySnapshot.Snapshot.t()]
        }

  defstruct [:snapshotList]

  field :snapshotList, 1, repeated: true, type: Qot_GetSecuritySnapshot.Snapshot
end

defmodule Qot_GetSecuritySnapshot.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetSecuritySnapshot.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetSecuritySnapshot.C2S
end

defmodule Qot_GetSecuritySnapshot.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetSecuritySnapshot.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetSecuritySnapshot.S2C
end
