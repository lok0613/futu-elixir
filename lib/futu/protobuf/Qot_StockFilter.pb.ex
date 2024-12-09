defmodule Qot_StockFilter.StockField do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :StockField_Unknown, 0
  field :StockField_StockCode, 1
  field :StockField_StockName, 2
  field :StockField_CurPrice, 3
  field :StockField_CurPriceToHighest52WeeksRatio, 4
  field :StockField_CurPriceToLowest52WeeksRatio, 5
  field :StockField_HighPriceToHighest52WeeksRatio, 6
  field :StockField_LowPriceToLowest52WeeksRatio, 7
  field :StockField_VolumeRatio, 8
  field :StockField_BidAskRatio, 9
  field :StockField_LotPrice, 10
  field :StockField_MarketVal, 11
  field :StockField_PeAnnual, 12
  field :StockField_PeTTM, 13
  field :StockField_PbRate, 14
  field :StockField_ChangeRate5min, 15
  field :StockField_ChangeRateBeginYear, 16
  field :StockField_PSTTM, 17
  field :StockField_PCFTTM, 18
  field :StockField_TotalShare, 19
  field :StockField_FloatShare, 20
  field :StockField_FloatMarketVal, 21
end

defmodule Qot_StockFilter.AccumulateField do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :AccumulateField_Unknown, 0
  field :AccumulateField_ChangeRate, 1
  field :AccumulateField_Amplitude, 2
  field :AccumulateField_Volume, 3
  field :AccumulateField_Turnover, 4
  field :AccumulateField_TurnoverRate, 5
end

defmodule Qot_StockFilter.FinancialField do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :FinancialField_Unknown, 0
  field :FinancialField_NetProfit, 1
  field :FinancialField_NetProfitGrowth, 2
  field :FinancialField_SumOfBusiness, 3
  field :FinancialField_SumOfBusinessGrowth, 4
  field :FinancialField_NetProfitRate, 5
  field :FinancialField_GrossProfitRate, 6
  field :FinancialField_DebtAssetsRate, 7
  field :FinancialField_ReturnOnEquityRate, 8
  field :FinancialField_ROIC, 9
  field :FinancialField_ROATTM, 10
  field :FinancialField_EBITTTM, 11
  field :FinancialField_EBITDA, 12
  field :FinancialField_OperatingMarginTTM, 13
  field :FinancialField_EBITMargin, 14
  field :FinancialField_EBITDAMargin, 15
  field :FinancialField_FinancialCostRate, 16
  field :FinancialField_OperatingProfitTTM, 17
  field :FinancialField_ShareholderNetProfitTTM, 18
  field :FinancialField_NetProfitCashCoverTTM, 19
  field :FinancialField_CurrentRatio, 20
  field :FinancialField_QuickRatio, 21
  field :FinancialField_CurrentAssetRatio, 22
  field :FinancialField_CurrentDebtRatio, 23
  field :FinancialField_EquityMultiplier, 24
  field :FinancialField_PropertyRatio, 25
  field :FinancialField_CashAndCashEquivalents, 26
  field :FinancialField_TotalAssetTurnover, 27
  field :FinancialField_FixedAssetTurnover, 28
  field :FinancialField_InventoryTurnover, 29
  field :FinancialField_OperatingCashFlowTTM, 30
  field :FinancialField_AccountsReceivable, 31
  field :FinancialField_EBITGrowthRate, 32
  field :FinancialField_OperatingProfitGrowthRate, 33
  field :FinancialField_TotalAssetsGrowthRate, 34
  field :FinancialField_ProfitToShareholdersGrowthRate, 35
  field :FinancialField_ProfitBeforeTaxGrowthRate, 36
  field :FinancialField_EPSGrowthRate, 37
  field :FinancialField_ROEGrowthRate, 38
  field :FinancialField_ROICGrowthRate, 39
  field :FinancialField_NOCFGrowthRate, 40
  field :FinancialField_NOCFPerShareGrowthRate, 41
  field :FinancialField_OperatingRevenueCashCover, 42
  field :FinancialField_OperatingProfitToTotalProfit, 43
  field :FinancialField_BasicEPS, 44
  field :FinancialField_DilutedEPS, 45
  field :FinancialField_NOCFPerShare, 46
end

defmodule Qot_StockFilter.CustomIndicatorField do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :CustomIndicatorField_Unknown, 0
  field :CustomIndicatorField_Price, 1
  field :CustomIndicatorField_MA5, 2
  field :CustomIndicatorField_MA10, 3
  field :CustomIndicatorField_MA20, 4
  field :CustomIndicatorField_MA30, 5
  field :CustomIndicatorField_MA60, 6
  field :CustomIndicatorField_MA120, 7
  field :CustomIndicatorField_MA250, 8
  field :CustomIndicatorField_RSI, 9
  field :CustomIndicatorField_EMA5, 10
  field :CustomIndicatorField_EMA10, 11
  field :CustomIndicatorField_EMA20, 12
  field :CustomIndicatorField_EMA30, 13
  field :CustomIndicatorField_EMA60, 14
  field :CustomIndicatorField_EMA120, 15
  field :CustomIndicatorField_EMA250, 16
  field :CustomIndicatorField_Value, 17
  field :CustomIndicatorField_MA, 30
  field :CustomIndicatorField_EMA, 40
  field :CustomIndicatorField_KDJ_K, 50
  field :CustomIndicatorField_KDJ_D, 51
  field :CustomIndicatorField_KDJ_J, 52
  field :CustomIndicatorField_MACD_DIFF, 60
  field :CustomIndicatorField_MACD_DEA, 61
  field :CustomIndicatorField_MACD, 62
  field :CustomIndicatorField_BOLL_UPPER, 70
  field :CustomIndicatorField_BOLL_MIDDLER, 71
  field :CustomIndicatorField_BOLL_LOWER, 72
end

defmodule Qot_StockFilter.PatternField do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :PatternField_Unknown, 0
  field :PatternField_MAAlignmentLong, 1
  field :PatternField_MAAlignmentShort, 2
  field :PatternField_EMAAlignmentLong, 3
  field :PatternField_EMAAlignmentShort, 4
  field :PatternField_RSIGoldCrossLow, 5
  field :PatternField_RSIDeathCrossHigh, 6
  field :PatternField_RSITopDivergence, 7
  field :PatternField_RSIBottomDivergence, 8
  field :PatternField_KDJGoldCrossLow, 9
  field :PatternField_KDJDeathCrossHigh, 10
  field :PatternField_KDJTopDivergence, 11
  field :PatternField_KDJBottomDivergence, 12
  field :PatternField_MACDGoldCrossLow, 13
  field :PatternField_MACDDeathCrossHigh, 14
  field :PatternField_MACDTopDivergence, 15
  field :PatternField_MACDBottomDivergence, 16
  field :PatternField_BOLLBreakUpper, 17
  field :PatternField_BOLLLower, 18
  field :PatternField_BOLLCrossMiddleUp, 19
  field :PatternField_BOLLCrossMiddleDown, 20
end

defmodule Qot_StockFilter.FinancialQuarter do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :FinancialQuarter_Unknown, 0
  field :FinancialQuarter_Annual, 1
  field :FinancialQuarter_FirstQuarter, 2
  field :FinancialQuarter_Interim, 3
  field :FinancialQuarter_ThirdQuarter, 4
  field :FinancialQuarter_MostRecentQuarter, 5
end

defmodule Qot_StockFilter.RelativePosition do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :RelativePosition_Unknown, 0
  field :RelativePosition_More, 1
  field :RelativePosition_Less, 2
  field :RelativePosition_CrossUp, 3
  field :RelativePosition_CrossDown, 4
end

defmodule Qot_StockFilter.SortDir do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :SortDir_No, 0
  field :SortDir_Ascend, 1
  field :SortDir_Descend, 2
end

defmodule Qot_StockFilter.BaseFilter do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :fieldName, 1, required: true, type: :int32
  field :filterMin, 2, optional: true, type: :double
  field :filterMax, 3, optional: true, type: :double
  field :isNoFilter, 4, optional: true, type: :bool
  field :sortDir, 5, optional: true, type: :int32
end

defmodule Qot_StockFilter.AccumulateFilter do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :fieldName, 1, required: true, type: :int32
  field :filterMin, 2, optional: true, type: :double
  field :filterMax, 3, optional: true, type: :double
  field :isNoFilter, 4, optional: true, type: :bool
  field :sortDir, 5, optional: true, type: :int32
  field :days, 6, required: true, type: :int32
end

defmodule Qot_StockFilter.FinancialFilter do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :fieldName, 1, required: true, type: :int32
  field :filterMin, 2, optional: true, type: :double
  field :filterMax, 3, optional: true, type: :double
  field :isNoFilter, 4, optional: true, type: :bool
  field :sortDir, 5, optional: true, type: :int32
  field :quarter, 6, required: true, type: :int32
end

defmodule Qot_StockFilter.PatternFilter do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :fieldName, 1, required: true, type: :int32
  field :klType, 2, required: true, type: :int32
  field :isNoFilter, 3, optional: true, type: :bool
  field :consecutivePeriod, 4, optional: true, type: :int32
end

defmodule Qot_StockFilter.CustomIndicatorFilter do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :firstFieldName, 1, required: true, type: :int32
  field :secondFieldName, 2, required: true, type: :int32
  field :relativePosition, 3, required: true, type: :int32
  field :fieldValue, 4, optional: true, type: :double
  field :klType, 5, required: true, type: :int32
  field :isNoFilter, 6, optional: true, type: :bool
  field :firstFieldParaList, 7, repeated: true, type: :int32
  field :secondFieldParaList, 8, repeated: true, type: :int32
  field :consecutivePeriod, 9, optional: true, type: :int32
end

defmodule Qot_StockFilter.BaseData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :fieldName, 1, required: true, type: :int32
  field :value, 2, required: true, type: :double
end

defmodule Qot_StockFilter.AccumulateData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :fieldName, 1, required: true, type: :int32
  field :value, 2, required: true, type: :double
  field :days, 3, required: true, type: :int32
end

defmodule Qot_StockFilter.FinancialData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :fieldName, 1, required: true, type: :int32
  field :value, 2, required: true, type: :double
  field :quarter, 3, required: true, type: :int32
end

defmodule Qot_StockFilter.CustomIndicatorData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :fieldName, 1, required: true, type: :int32
  field :value, 2, required: true, type: :double
  field :klType, 3, required: true, type: :int32
  field :fieldParaList, 4, repeated: true, type: :int32
end

defmodule Qot_StockFilter.StockData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :name, 2, required: true, type: :string
  field :baseDataList, 3, repeated: true, type: Qot_StockFilter.BaseData
  field :accumulateDataList, 4, repeated: true, type: Qot_StockFilter.AccumulateData
  field :financialDataList, 5, repeated: true, type: Qot_StockFilter.FinancialData
  field :customIndicatorDataList, 6, repeated: true, type: Qot_StockFilter.CustomIndicatorData
end

defmodule Qot_StockFilter.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :begin, 1, required: true, type: :int32
  field :num, 2, required: true, type: :int32
  field :market, 3, required: true, type: :int32
  field :plate, 4, optional: true, type: Qot_Common.Security
  field :baseFilterList, 5, repeated: true, type: Qot_StockFilter.BaseFilter
  field :accumulateFilterList, 6, repeated: true, type: Qot_StockFilter.AccumulateFilter
  field :financialFilterList, 7, repeated: true, type: Qot_StockFilter.FinancialFilter
  field :patternFilterList, 8, repeated: true, type: Qot_StockFilter.PatternFilter
  field :customIndicatorFilterList, 9, repeated: true, type: Qot_StockFilter.CustomIndicatorFilter
end

defmodule Qot_StockFilter.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :lastPage, 1, required: true, type: :bool
  field :allCount, 2, required: true, type: :int32
  field :dataList, 3, repeated: true, type: Qot_StockFilter.StockData
end

defmodule Qot_StockFilter.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_StockFilter.C2S
end

defmodule Qot_StockFilter.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_StockFilter.S2C
end