defmodule Trd_Common.TrdEnv do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :TrdEnv_Simulate | :TrdEnv_Real

  field :TrdEnv_Simulate, 0

  field :TrdEnv_Real, 1
end

defmodule Trd_Common.TrdMarket do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :TrdMarket_Unknown
          | :TrdMarket_HK
          | :TrdMarket_US
          | :TrdMarket_CN
          | :TrdMarket_HKCC
          | :TrdMarket_Futures

  field :TrdMarket_Unknown, 0

  field :TrdMarket_HK, 1

  field :TrdMarket_US, 2

  field :TrdMarket_CN, 3

  field :TrdMarket_HKCC, 4

  field :TrdMarket_Futures, 5
end

defmodule Trd_Common.TrdSecMarket do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :TrdSecMarket_Unknown
          | :TrdSecMarket_HK
          | :TrdSecMarket_US
          | :TrdSecMarket_CN_SH
          | :TrdSecMarket_CN_SZ
          | :TrdSecMarket_SG
          | :TrdSecMarket_JP

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
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :TrdSide_Unknown
          | :TrdSide_Buy
          | :TrdSide_Sell
          | :TrdSide_SellShort
          | :TrdSide_BuyBack

  field :TrdSide_Unknown, 0

  field :TrdSide_Buy, 1

  field :TrdSide_Sell, 2

  field :TrdSide_SellShort, 3

  field :TrdSide_BuyBack, 4
end

defmodule Trd_Common.OrderType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :OrderType_Unknown
          | :OrderType_Normal
          | :OrderType_Market
          | :OrderType_AbsoluteLimit
          | :OrderType_Auction
          | :OrderType_AuctionLimit
          | :OrderType_SpecialLimit
          | :OrderType_SpecialLimit_All

  field :OrderType_Unknown, 0

  field :OrderType_Normal, 1

  field :OrderType_Market, 2

  field :OrderType_AbsoluteLimit, 5

  field :OrderType_Auction, 6

  field :OrderType_AuctionLimit, 7

  field :OrderType_SpecialLimit, 8

  field :OrderType_SpecialLimit_All, 9
end

defmodule Trd_Common.OrderStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :OrderStatus_Unsubmitted
          | :OrderStatus_Unknown
          | :OrderStatus_WaitingSubmit
          | :OrderStatus_Submitting
          | :OrderStatus_SubmitFailed
          | :OrderStatus_TimeOut
          | :OrderStatus_Submitted
          | :OrderStatus_Filled_Part
          | :OrderStatus_Filled_All
          | :OrderStatus_Cancelling_Part
          | :OrderStatus_Cancelling_All
          | :OrderStatus_Cancelled_Part
          | :OrderStatus_Cancelled_All
          | :OrderStatus_Failed
          | :OrderStatus_Disabled
          | :OrderStatus_Deleted
          | :OrderStatus_FillCancelled

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
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :OrderFillStatus_OK | :OrderFillStatus_Cancelled | :OrderFillStatus_Changed

  field :OrderFillStatus_OK, 0

  field :OrderFillStatus_Cancelled, 1

  field :OrderFillStatus_Changed, 2
end

defmodule Trd_Common.PositionSide do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :PositionSide_Long | :PositionSide_Unknown | :PositionSide_Short

  field :PositionSide_Long, 0

  field :PositionSide_Unknown, -1

  field :PositionSide_Short, 1
end

defmodule Trd_Common.ModifyOrderOp do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :ModifyOrderOp_Unknown
          | :ModifyOrderOp_Normal
          | :ModifyOrderOp_Cancel
          | :ModifyOrderOp_Disable
          | :ModifyOrderOp_Enable
          | :ModifyOrderOp_Delete

  field :ModifyOrderOp_Unknown, 0

  field :ModifyOrderOp_Normal, 1

  field :ModifyOrderOp_Cancel, 2

  field :ModifyOrderOp_Disable, 3

  field :ModifyOrderOp_Enable, 4

  field :ModifyOrderOp_Delete, 5
end

defmodule Trd_Common.TrdAccType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :TrdAccType_Unknown | :TrdAccType_Cash | :TrdAccType_Margin

  field :TrdAccType_Unknown, 0

  field :TrdAccType_Cash, 1

  field :TrdAccType_Margin, 2
end

defmodule Trd_Common.Currency do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :Currency_Unknown
          | :Currency_HKD
          | :Currency_USD
          | :Currency_CNH
          | :Currency_JPY

  field :Currency_Unknown, 0

  field :Currency_HKD, 1

  field :Currency_USD, 2

  field :Currency_CNH, 3

  field :Currency_JPY, 4
end

defmodule Trd_Common.CltRiskLevel do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :CltRiskLevel_Unknown
          | :CltRiskLevel_Safe
          | :CltRiskLevel_Warning
          | :CltRiskLevel_Danger
          | :CltRiskLevel_AbsoluteSafe
          | :CltRiskLevel_OptDanger

  field :CltRiskLevel_Unknown, -1

  field :CltRiskLevel_Safe, 0

  field :CltRiskLevel_Warning, 1

  field :CltRiskLevel_Danger, 2

  field :CltRiskLevel_AbsoluteSafe, 3

  field :CltRiskLevel_OptDanger, 4
end

defmodule Trd_Common.TimeInForce do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :TimeInForce_DAY | :TimeInForce_GTC

  field :TimeInForce_DAY, 0

  field :TimeInForce_GTC, 1
end

defmodule Trd_Common.SecurityFirm do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :SecurityFirm_Unknown
          | :SecurityFirm_FutuSecurities
          | :SecurityFirm_FutuInc
          | :SecurityFirm_FutuSG

  field :SecurityFirm_Unknown, 0

  field :SecurityFirm_FutuSecurities, 1

  field :SecurityFirm_FutuInc, 2

  field :SecurityFirm_FutuSG, 3
end

defmodule Trd_Common.SimAccType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :SimAccType_Unknown | :SimAccType_Stock | :SimAccType_Option

  field :SimAccType_Unknown, 0

  field :SimAccType_Stock, 1

  field :SimAccType_Option, 2
end

defmodule Trd_Common.CltRiskStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :CltRiskStatus_Unknown
          | :CltRiskStatus_Level1
          | :CltRiskStatus_Level2
          | :CltRiskStatus_Level3
          | :CltRiskStatus_Level4
          | :CltRiskStatus_Level5
          | :CltRiskStatus_Level6
          | :CltRiskStatus_Level7
          | :CltRiskStatus_Level8
          | :CltRiskStatus_Level9

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

defmodule Trd_Common.AccCashInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          currency: integer,
          cash: float | :infinity | :negative_infinity | :nan,
          availableBalance: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:currency, :cash, :availableBalance]

  field :currency, 1, optional: true, type: :int32
  field :cash, 2, optional: true, type: :double
  field :availableBalance, 3, optional: true, type: :double
end

defmodule Trd_Common.TrdHeader do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          trdEnv: integer,
          accID: non_neg_integer,
          trdMarket: integer
        }

  defstruct [:trdEnv, :accID, :trdMarket]

  field :trdEnv, 1, required: true, type: :int32
  field :accID, 2, required: true, type: :uint64
  field :trdMarket, 3, required: true, type: :int32
end

defmodule Trd_Common.TrdAcc do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          trdEnv: integer,
          accID: non_neg_integer,
          trdMarketAuthList: [integer],
          accType: integer,
          cardNum: String.t(),
          securityFirm: integer,
          simAccType: integer
        }

  defstruct [:trdEnv, :accID, :trdMarketAuthList, :accType, :cardNum, :securityFirm, :simAccType]

  field :trdEnv, 1, required: true, type: :int32
  field :accID, 2, required: true, type: :uint64
  field :trdMarketAuthList, 3, repeated: true, type: :int32
  field :accType, 4, optional: true, type: :int32
  field :cardNum, 5, optional: true, type: :string
  field :securityFirm, 6, optional: true, type: :int32
  field :simAccType, 7, optional: true, type: :int32
end

defmodule Trd_Common.Funds do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          power: float | :infinity | :negative_infinity | :nan,
          totalAssets: float | :infinity | :negative_infinity | :nan,
          cash: float | :infinity | :negative_infinity | :nan,
          marketVal: float | :infinity | :negative_infinity | :nan,
          frozenCash: float | :infinity | :negative_infinity | :nan,
          debtCash: float | :infinity | :negative_infinity | :nan,
          avlWithdrawalCash: float | :infinity | :negative_infinity | :nan,
          currency: integer,
          availableFunds: float | :infinity | :negative_infinity | :nan,
          unrealizedPL: float | :infinity | :negative_infinity | :nan,
          realizedPL: float | :infinity | :negative_infinity | :nan,
          riskLevel: integer,
          initialMargin: float | :infinity | :negative_infinity | :nan,
          maintenanceMargin: float | :infinity | :negative_infinity | :nan,
          cashInfoList: [Trd_Common.AccCashInfo.t()],
          maxPowerShort: float | :infinity | :negative_infinity | :nan,
          netCashPower: float | :infinity | :negative_infinity | :nan,
          longMv: float | :infinity | :negative_infinity | :nan,
          shortMv: float | :infinity | :negative_infinity | :nan,
          pendingAsset: float | :infinity | :negative_infinity | :nan,
          maxWithdrawal: float | :infinity | :negative_infinity | :nan,
          riskStatus: integer,
          marginCallMargin: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :power,
    :totalAssets,
    :cash,
    :marketVal,
    :frozenCash,
    :debtCash,
    :avlWithdrawalCash,
    :currency,
    :availableFunds,
    :unrealizedPL,
    :realizedPL,
    :riskLevel,
    :initialMargin,
    :maintenanceMargin,
    :cashInfoList,
    :maxPowerShort,
    :netCashPower,
    :longMv,
    :shortMv,
    :pendingAsset,
    :maxWithdrawal,
    :riskStatus,
    :marginCallMargin
  ]

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
end

defmodule Trd_Common.Position do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          positionID: non_neg_integer,
          positionSide: integer,
          code: String.t(),
          name: String.t(),
          qty: float | :infinity | :negative_infinity | :nan,
          canSellQty: float | :infinity | :negative_infinity | :nan,
          price: float | :infinity | :negative_infinity | :nan,
          costPrice: float | :infinity | :negative_infinity | :nan,
          val: float | :infinity | :negative_infinity | :nan,
          plVal: float | :infinity | :negative_infinity | :nan,
          plRatio: float | :infinity | :negative_infinity | :nan,
          secMarket: integer,
          td_plVal: float | :infinity | :negative_infinity | :nan,
          td_trdVal: float | :infinity | :negative_infinity | :nan,
          td_buyVal: float | :infinity | :negative_infinity | :nan,
          td_buyQty: float | :infinity | :negative_infinity | :nan,
          td_sellVal: float | :infinity | :negative_infinity | :nan,
          td_sellQty: float | :infinity | :negative_infinity | :nan,
          unrealizedPL: float | :infinity | :negative_infinity | :nan,
          realizedPL: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :positionID,
    :positionSide,
    :code,
    :name,
    :qty,
    :canSellQty,
    :price,
    :costPrice,
    :val,
    :plVal,
    :plRatio,
    :secMarket,
    :td_plVal,
    :td_trdVal,
    :td_buyVal,
    :td_buyQty,
    :td_sellVal,
    :td_sellQty,
    :unrealizedPL,
    :realizedPL
  ]

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
end

defmodule Trd_Common.Order do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          trdSide: integer,
          orderType: integer,
          orderStatus: integer,
          orderID: non_neg_integer,
          orderIDEx: String.t(),
          code: String.t(),
          name: String.t(),
          qty: float | :infinity | :negative_infinity | :nan,
          price: float | :infinity | :negative_infinity | :nan,
          createTime: String.t(),
          updateTime: String.t(),
          fillQty: float | :infinity | :negative_infinity | :nan,
          fillAvgPrice: float | :infinity | :negative_infinity | :nan,
          lastErrMsg: String.t(),
          secMarket: integer,
          createTimestamp: float | :infinity | :negative_infinity | :nan,
          updateTimestamp: float | :infinity | :negative_infinity | :nan,
          remark: String.t(),
          timeInForce: integer,
          fillOutsideRTH: boolean
        }

  defstruct [
    :trdSide,
    :orderType,
    :orderStatus,
    :orderID,
    :orderIDEx,
    :code,
    :name,
    :qty,
    :price,
    :createTime,
    :updateTime,
    :fillQty,
    :fillAvgPrice,
    :lastErrMsg,
    :secMarket,
    :createTimestamp,
    :updateTimestamp,
    :remark,
    :timeInForce,
    :fillOutsideRTH
  ]

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
end

defmodule Trd_Common.OrderFill do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          trdSide: integer,
          fillID: non_neg_integer,
          fillIDEx: String.t(),
          orderID: non_neg_integer,
          orderIDEx: String.t(),
          code: String.t(),
          name: String.t(),
          qty: float | :infinity | :negative_infinity | :nan,
          price: float | :infinity | :negative_infinity | :nan,
          createTime: String.t(),
          counterBrokerID: integer,
          counterBrokerName: String.t(),
          secMarket: integer,
          createTimestamp: float | :infinity | :negative_infinity | :nan,
          updateTimestamp: float | :infinity | :negative_infinity | :nan,
          status: integer
        }

  defstruct [
    :trdSide,
    :fillID,
    :fillIDEx,
    :orderID,
    :orderIDEx,
    :code,
    :name,
    :qty,
    :price,
    :createTime,
    :counterBrokerID,
    :counterBrokerName,
    :secMarket,
    :createTimestamp,
    :updateTimestamp,
    :status
  ]

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
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          maxCashBuy: float | :infinity | :negative_infinity | :nan,
          maxCashAndMarginBuy: float | :infinity | :negative_infinity | :nan,
          maxPositionSell: float | :infinity | :negative_infinity | :nan,
          maxSellShort: float | :infinity | :negative_infinity | :nan,
          maxBuyBack: float | :infinity | :negative_infinity | :nan,
          longRequiredIM: float | :infinity | :negative_infinity | :nan,
          shortRequiredIM: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :maxCashBuy,
    :maxCashAndMarginBuy,
    :maxPositionSell,
    :maxSellShort,
    :maxBuyBack,
    :longRequiredIM,
    :shortRequiredIM
  ]

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
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          codeList: [String.t()],
          idList: [non_neg_integer],
          beginTime: String.t(),
          endTime: String.t()
        }

  defstruct [:codeList, :idList, :beginTime, :endTime]

  field :codeList, 1, repeated: true, type: :string
  field :idList, 2, repeated: true, type: :uint64
  field :beginTime, 3, optional: true, type: :string
  field :endTime, 4, optional: true, type: :string
end
