defmodule Qot_GetSecuritySnapshot.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :securityList, 1, repeated: true, type: Qot_Common.Security
end

defmodule Qot_GetSecuritySnapshot.EquitySnapshotExData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

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

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

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

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

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

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :raiseCount, 1, required: true, type: :int32
  field :fallCount, 2, required: true, type: :int32
  field :equalCount, 3, required: true, type: :int32
end

defmodule Qot_GetSecuritySnapshot.PlateSnapshotExData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :raiseCount, 1, required: true, type: :int32
  field :fallCount, 2, required: true, type: :int32
  field :equalCount, 3, required: true, type: :int32
end

defmodule Qot_GetSecuritySnapshot.FutureSnapshotExData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :lastSettlePrice, 1, required: true, type: :double
  field :position, 2, required: true, type: :int32
  field :positionChange, 3, required: true, type: :int32
  field :lastTradeTime, 4, required: true, type: :string
  field :lastTradeTimestamp, 5, optional: true, type: :double
  field :isMainContract, 6, required: true, type: :bool
end

defmodule Qot_GetSecuritySnapshot.TrustSnapshotExData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :dividendYield, 1, required: true, type: :double
  field :aum, 2, required: true, type: :double
  field :outstandingUnits, 3, required: true, type: :int64
  field :netAssetValue, 4, required: true, type: :double
  field :premium, 5, required: true, type: :double
  field :assetClass, 6, required: true, type: :int32
end

defmodule Qot_GetSecuritySnapshot.SnapshotBasicData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :name, 41, optional: true, type: :string
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

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

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

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :snapshotList, 1, repeated: true, type: Qot_GetSecuritySnapshot.Snapshot
end

defmodule Qot_GetSecuritySnapshot.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetSecuritySnapshot.C2S
end

defmodule Qot_GetSecuritySnapshot.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetSecuritySnapshot.S2C
end