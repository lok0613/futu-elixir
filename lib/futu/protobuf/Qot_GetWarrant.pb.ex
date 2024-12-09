defmodule Qot_GetWarrant.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

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

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

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

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :lastPage, 1, required: true, type: :bool
  field :allCount, 2, required: true, type: :int32
  field :warrantDataList, 3, repeated: true, type: Qot_GetWarrant.WarrantData
end

defmodule Qot_GetWarrant.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetWarrant.C2S
end

defmodule Qot_GetWarrant.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetWarrant.S2C
end