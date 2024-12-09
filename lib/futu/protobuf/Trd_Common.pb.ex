defmodule Trd_Common.TrdEnv do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :TrdEnv_Simulate, 0
  field :TrdEnv_Real, 1
end

defmodule Trd_Common.TrdCategory do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :TrdCategory_Unknown, 0
  field :TrdCategory_Security, 1
  field :TrdCategory_Future, 2
end

defmodule Trd_Common.TrdMarket do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :TrdMarket_Unknown, 0
  field :TrdMarket_HK, 1
  field :TrdMarket_US, 2
  field :TrdMarket_CN, 3
  field :TrdMarket_HKCC, 4
  field :TrdMarket_Futures, 5
  field :TrdMarket_SG, 6
  field :TrdMarket_Futures_Simulate_HK, 10
  field :TrdMarket_Futures_Simulate_US, 11
  field :TrdMarket_Futures_Simulate_SG, 12
  field :TrdMarket_Futures_Simulate_JP, 13
  field :TrdMarket_HK_Fund, 113
  field :TrdMarket_US_Fund, 123
end

defmodule Trd_Common.TrdSecMarket do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :TrdSecMarket_Unknown, 0
  field :TrdSecMarket_HK, 1
  field :TrdSecMarket_US, 2
  field :TrdSecMarket_CN_SH, 31
  field :TrdSecMarket_CN_SZ, 32
  field :TrdSecMarket_SG, 41
  field :TrdSecMarket_JP, 51
end

defmodule Trd_Common.TrdSide do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :TrdSide_Unknown, 0
  field :TrdSide_Buy, 1
  field :TrdSide_Sell, 2
  field :TrdSide_SellShort, 3
  field :TrdSide_BuyBack, 4
end

defmodule Trd_Common.OrderType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :OrderType_Unknown, 0
  field :OrderType_Normal, 1
  field :OrderType_Market, 2
  field :OrderType_AbsoluteLimit, 5
  field :OrderType_Auction, 6
  field :OrderType_AuctionLimit, 7
  field :OrderType_SpecialLimit, 8
  field :OrderType_SpecialLimit_All, 9
  field :OrderType_Stop, 10
  field :OrderType_StopLimit, 11
  field :OrderType_MarketifTouched, 12
  field :OrderType_LimitifTouched, 13
  field :OrderType_TrailingStop, 14
  field :OrderType_TrailingStopLimit, 15
  field :OrderType_TWAP_MARKET, 16
  field :OrderType_TWAP_LIMIT, 17
  field :OrderType_VWAP_MARKET, 18
  field :OrderType_VWAP_LIMIT, 19
end

defmodule Trd_Common.TrailType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :TrailType_Unknown, 0
  field :TrailType_Ratio, 1
  field :TrailType_Amount, 2
end

defmodule Trd_Common.OrderStatus do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :OrderStatus_Unsubmitted, 0
  field :OrderStatus_Unknown, -1
  field :OrderStatus_WaitingSubmit, 1
  field :OrderStatus_Submitting, 2
  field :OrderStatus_SubmitFailed, 3
  field :OrderStatus_TimeOut, 4
  field :OrderStatus_Submitted, 5
  field :OrderStatus_Filled_Part, 10
  field :OrderStatus_Filled_All, 11
  field :OrderStatus_Cancelling_Part, 12
  field :OrderStatus_Cancelling_All, 13
  field :OrderStatus_Cancelled_Part, 14
  field :OrderStatus_Cancelled_All, 15
  field :OrderStatus_Failed, 21
  field :OrderStatus_Disabled, 22
  field :OrderStatus_Deleted, 23
  field :OrderStatus_FillCancelled, 24
end

defmodule Trd_Common.OrderFillStatus do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :OrderFillStatus_OK, 0
  field :OrderFillStatus_Cancelled, 1
  field :OrderFillStatus_Changed, 2
end

defmodule Trd_Common.PositionSide do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :PositionSide_Long, 0
  field :PositionSide_Unknown, -1
  field :PositionSide_Short, 1
end

defmodule Trd_Common.ModifyOrderOp do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :ModifyOrderOp_Unknown, 0
  field :ModifyOrderOp_Normal, 1
  field :ModifyOrderOp_Cancel, 2
  field :ModifyOrderOp_Disable, 3
  field :ModifyOrderOp_Enable, 4
  field :ModifyOrderOp_Delete, 5
end

defmodule Trd_Common.TrdAccType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :TrdAccType_Unknown, 0
  field :TrdAccType_Cash, 1
  field :TrdAccType_Margin, 2
end

defmodule Trd_Common.TrdAccStatus do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :TrdAccStatus_Active, 0
  field :TrdAccStatus_Disabled, 1
end

defmodule Trd_Common.Currency do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :Currency_Unknown, 0
  field :Currency_HKD, 1
  field :Currency_USD, 2
  field :Currency_CNH, 3
  field :Currency_JPY, 4
  field :Currency_SGD, 5
  field :Currency_AUD, 6
end

defmodule Trd_Common.CltRiskLevel do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :CltRiskLevel_Unknown, -1
  field :CltRiskLevel_Safe, 0
  field :CltRiskLevel_Warning, 1
  field :CltRiskLevel_Danger, 2
  field :CltRiskLevel_AbsoluteSafe, 3
  field :CltRiskLevel_OptDanger, 4
end

defmodule Trd_Common.TimeInForce do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :TimeInForce_DAY, 0
  field :TimeInForce_GTC, 1
end

defmodule Trd_Common.SecurityFirm do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :SecurityFirm_Unknown, 0
  field :SecurityFirm_FutuSecurities, 1
  field :SecurityFirm_FutuInc, 2
  field :SecurityFirm_FutuSG, 3
  field :SecurityFirm_FutuAU, 4
end

defmodule Trd_Common.SimAccType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :SimAccType_Unknown, 0
  field :SimAccType_Stock, 1
  field :SimAccType_Option, 2
  field :SimAccType_Futures, 3
end

defmodule Trd_Common.CltRiskStatus do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :CltRiskStatus_Unknown, 0
  field :CltRiskStatus_Level1, 1
  field :CltRiskStatus_Level2, 2
  field :CltRiskStatus_Level3, 3
  field :CltRiskStatus_Level4, 4
  field :CltRiskStatus_Level5, 5
  field :CltRiskStatus_Level6, 6
  field :CltRiskStatus_Level7, 7
  field :CltRiskStatus_Level8, 8
  field :CltRiskStatus_Level9, 9
end

defmodule Trd_Common.DTStatus do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :DTStatus_Unknown, 0
  field :DTStatus_Unlimited, 1
  field :DTStatus_EMCall, 2
  field :DTStatus_DTCall, 3
end

defmodule Trd_Common.AccCashInfo do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :currency, 1, optional: true, type: :int32
  field :cash, 2, optional: true, type: :double
  field :availableBalance, 3, optional: true, type: :double
  field :netCashPower, 4, optional: true, type: :double
end

defmodule Trd_Common.TrdHeader do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :trdEnv, 1, required: true, type: :int32
  field :accID, 2, required: true, type: :uint64
  field :trdMarket, 3, required: true, type: :int32
end

defmodule Trd_Common.TrdAcc do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :trdEnv, 1, required: true, type: :int32
  field :accID, 2, required: true, type: :uint64
  field :trdMarketAuthList, 3, repeated: true, type: :int32
  field :accType, 4, optional: true, type: :int32
  field :cardNum, 5, optional: true, type: :string
  field :securityFirm, 6, optional: true, type: :int32
  field :simAccType, 7, optional: true, type: :int32
  field :uniCardNum, 8, optional: true, type: :string
  field :accStatus, 9, optional: true, type: :int32
end

defmodule Trd_Common.Funds do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :power, 1, required: true, type: :double
  field :totalAssets, 2, required: true, type: :double
  field :cash, 3, required: true, type: :double
  field :marketVal, 4, required: true, type: :double
  field :frozenCash, 5, required: true, type: :double
  field :debtCash, 6, required: true, type: :double
  field :avlWithdrawalCash, 7, required: true, type: :double
  field :currency, 8, optional: true, type: :int32
  field :availableFunds, 9, optional: true, type: :double
  field :unrealizedPL, 10, optional: true, type: :double
  field :realizedPL, 11, optional: true, type: :double
  field :riskLevel, 12, optional: true, type: :int32
  field :initialMargin, 13, optional: true, type: :double
  field :maintenanceMargin, 14, optional: true, type: :double
  field :cashInfoList, 15, repeated: true, type: Trd_Common.AccCashInfo
  field :maxPowerShort, 16, optional: true, type: :double
  field :netCashPower, 17, optional: true, type: :double
  field :longMv, 18, optional: true, type: :double
  field :shortMv, 19, optional: true, type: :double
  field :pendingAsset, 20, optional: true, type: :double
  field :maxWithdrawal, 21, optional: true, type: :double
  field :riskStatus, 22, optional: true, type: :int32
  field :marginCallMargin, 23, optional: true, type: :double
  field :isPdt, 24, optional: true, type: :bool
  field :pdtSeq, 25, optional: true, type: :string
  field :beginningDTBP, 26, optional: true, type: :double
  field :remainingDTBP, 27, optional: true, type: :double
  field :dtCallAmount, 28, optional: true, type: :double
  field :dtStatus, 29, optional: true, type: :int32
  field :securitiesAssets, 30, optional: true, type: :double
  field :fundAssets, 31, optional: true, type: :double
  field :bondAssets, 32, optional: true, type: :double
end

defmodule Trd_Common.Position do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :positionID, 1, required: true, type: :uint64
  field :positionSide, 2, required: true, type: :int32
  field :code, 3, required: true, type: :string
  field :name, 4, required: true, type: :string
  field :qty, 5, required: true, type: :double
  field :canSellQty, 6, required: true, type: :double
  field :price, 7, required: true, type: :double
  field :costPrice, 8, optional: true, type: :double
  field :val, 9, required: true, type: :double
  field :plVal, 10, required: true, type: :double
  field :plRatio, 11, optional: true, type: :double
  field :secMarket, 12, optional: true, type: :int32
  field :td_plVal, 21, optional: true, type: :double
  field :td_trdVal, 22, optional: true, type: :double
  field :td_buyVal, 23, optional: true, type: :double
  field :td_buyQty, 24, optional: true, type: :double
  field :td_sellVal, 25, optional: true, type: :double
  field :td_sellQty, 26, optional: true, type: :double
  field :unrealizedPL, 28, optional: true, type: :double
  field :realizedPL, 29, optional: true, type: :double
  field :currency, 30, optional: true, type: :int32
  field :trdMarket, 31, optional: true, type: :int32
end

defmodule Trd_Common.Order do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :trdSide, 1, required: true, type: :int32
  field :orderType, 2, required: true, type: :int32
  field :orderStatus, 3, required: true, type: :int32
  field :orderID, 4, required: true, type: :uint64
  field :orderIDEx, 5, required: true, type: :string
  field :code, 6, required: true, type: :string
  field :name, 7, required: true, type: :string
  field :qty, 8, required: true, type: :double
  field :price, 9, optional: true, type: :double
  field :createTime, 10, required: true, type: :string
  field :updateTime, 11, required: true, type: :string
  field :fillQty, 12, optional: true, type: :double
  field :fillAvgPrice, 13, optional: true, type: :double
  field :lastErrMsg, 14, optional: true, type: :string
  field :secMarket, 15, optional: true, type: :int32
  field :createTimestamp, 16, optional: true, type: :double
  field :updateTimestamp, 17, optional: true, type: :double
  field :remark, 18, optional: true, type: :string
  field :timeInForce, 19, optional: true, type: :int32
  field :fillOutsideRTH, 20, optional: true, type: :bool
  field :auxPrice, 21, optional: true, type: :double
  field :trailType, 22, optional: true, type: :int32
  field :trailValue, 23, optional: true, type: :double
  field :trailSpread, 24, optional: true, type: :double
  field :currency, 25, optional: true, type: :int32
  field :trdMarket, 26, optional: true, type: :int32
end

defmodule Trd_Common.OrderFeeItem do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :title, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :double
end

defmodule Trd_Common.OrderFee do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :orderIDEx, 1, required: true, type: :string
  field :feeAmount, 2, optional: true, type: :double
  field :feeList, 3, repeated: true, type: Trd_Common.OrderFeeItem
end

defmodule Trd_Common.OrderFill do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :trdSide, 1, required: true, type: :int32
  field :fillID, 2, required: true, type: :uint64
  field :fillIDEx, 3, required: true, type: :string
  field :orderID, 4, optional: true, type: :uint64
  field :orderIDEx, 5, optional: true, type: :string
  field :code, 6, required: true, type: :string
  field :name, 7, required: true, type: :string
  field :qty, 8, required: true, type: :double
  field :price, 9, required: true, type: :double
  field :createTime, 10, required: true, type: :string
  field :counterBrokerID, 11, optional: true, type: :int32
  field :counterBrokerName, 12, optional: true, type: :string
  field :secMarket, 13, optional: true, type: :int32
  field :createTimestamp, 14, optional: true, type: :double
  field :updateTimestamp, 15, optional: true, type: :double
  field :status, 16, optional: true, type: :int32
end

defmodule Trd_Common.MaxTrdQtys do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :maxCashBuy, 1, required: true, type: :double
  field :maxCashAndMarginBuy, 2, optional: true, type: :double
  field :maxPositionSell, 3, required: true, type: :double
  field :maxSellShort, 4, optional: true, type: :double
  field :maxBuyBack, 5, optional: true, type: :double
  field :longRequiredIM, 6, optional: true, type: :double
  field :shortRequiredIM, 7, optional: true, type: :double
end

defmodule Trd_Common.TrdFilterConditions do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :codeList, 1, repeated: true, type: :string
  field :idList, 2, repeated: true, type: :uint64
  field :beginTime, 3, optional: true, type: :string
  field :endTime, 4, optional: true, type: :string
  field :orderIDExList, 5, repeated: true, type: :string
end