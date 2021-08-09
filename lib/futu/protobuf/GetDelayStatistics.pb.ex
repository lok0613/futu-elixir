defmodule GetDelayStatistics.DelayStatisticsType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :DelayStatisticsType_Unkonw
          | :DelayStatisticsType_QotPush
          | :DelayStatisticsType_ReqReply
          | :DelayStatisticsType_PlaceOrder

  field :DelayStatisticsType_Unkonw, 0

  field :DelayStatisticsType_QotPush, 1

  field :DelayStatisticsType_ReqReply, 2

  field :DelayStatisticsType_PlaceOrder, 3
end

defmodule GetDelayStatistics.QotPushStage do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :QotPushStage_Unkonw
          | :QotPushStage_SR2SS
          | :QotPushStage_SS2CR
          | :QotPushStage_CR2CS
          | :QotPushStage_SS2CS
          | :QotPushStage_SR2CS

  field :QotPushStage_Unkonw, 0

  field :QotPushStage_SR2SS, 1

  field :QotPushStage_SS2CR, 2

  field :QotPushStage_CR2CS, 3

  field :QotPushStage_SS2CS, 4

  field :QotPushStage_SR2CS, 5
end

defmodule GetDelayStatistics.QotPushType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :QotPushType_Unkonw
          | :QotPushType_Price
          | :QotPushType_Ticker
          | :QotPushType_OrderBook
          | :QotPushType_Broker

  field :QotPushType_Unkonw, 0

  field :QotPushType_Price, 1

  field :QotPushType_Ticker, 2

  field :QotPushType_OrderBook, 3

  field :QotPushType_Broker, 4
end

defmodule GetDelayStatistics.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          typeList: [integer],
          qotPushStage: integer,
          segmentList: [integer]
        }

  defstruct [:typeList, :qotPushStage, :segmentList]

  field :typeList, 1, repeated: true, type: :int32
  field :qotPushStage, 2, optional: true, type: :int32
  field :segmentList, 3, repeated: true, type: :int32
end

defmodule GetDelayStatistics.DelayStatisticsItem do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          begin: integer,
          end: integer,
          count: integer,
          proportion: float | :infinity | :negative_infinity | :nan,
          cumulativeRatio: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:begin, :end, :count, :proportion, :cumulativeRatio]

  field :begin, 1, required: true, type: :int32
  field :end, 2, required: true, type: :int32
  field :count, 3, required: true, type: :int32
  field :proportion, 4, required: true, type: :float
  field :cumulativeRatio, 5, required: true, type: :float
end

defmodule GetDelayStatistics.DelayStatistics do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          qotPushType: integer,
          itemList: [GetDelayStatistics.DelayStatisticsItem.t()],
          delayAvg: float | :infinity | :negative_infinity | :nan,
          count: integer
        }

  defstruct [:qotPushType, :itemList, :delayAvg, :count]

  field :qotPushType, 1, required: true, type: :int32
  field :itemList, 2, repeated: true, type: GetDelayStatistics.DelayStatisticsItem
  field :delayAvg, 3, required: true, type: :float
  field :count, 4, required: true, type: :int32
end

defmodule GetDelayStatistics.ReqReplyStatisticsItem do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          protoID: integer,
          count: integer,
          totalCostAvg: float | :infinity | :negative_infinity | :nan,
          openDCostAvg: float | :infinity | :negative_infinity | :nan,
          netDelayAvg: float | :infinity | :negative_infinity | :nan,
          isLocalReply: boolean
        }

  defstruct [:protoID, :count, :totalCostAvg, :openDCostAvg, :netDelayAvg, :isLocalReply]

  field :protoID, 1, required: true, type: :int32
  field :count, 2, required: true, type: :int32
  field :totalCostAvg, 3, required: true, type: :float
  field :openDCostAvg, 4, required: true, type: :float
  field :netDelayAvg, 5, required: true, type: :float
  field :isLocalReply, 6, required: true, type: :bool
end

defmodule GetDelayStatistics.PlaceOrderStatisticsItem do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          orderID: String.t(),
          totalCost: float | :infinity | :negative_infinity | :nan,
          openDCost: float | :infinity | :negative_infinity | :nan,
          netDelay: float | :infinity | :negative_infinity | :nan,
          updateCost: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:orderID, :totalCost, :openDCost, :netDelay, :updateCost]

  field :orderID, 1, required: true, type: :string
  field :totalCost, 2, required: true, type: :float
  field :openDCost, 3, required: true, type: :float
  field :netDelay, 4, required: true, type: :float
  field :updateCost, 5, required: true, type: :float
end

defmodule GetDelayStatistics.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          qotPushStatisticsList: [GetDelayStatistics.DelayStatistics.t()],
          reqReplyStatisticsList: [GetDelayStatistics.ReqReplyStatisticsItem.t()],
          placeOrderStatisticsList: [GetDelayStatistics.PlaceOrderStatisticsItem.t()]
        }

  defstruct [:qotPushStatisticsList, :reqReplyStatisticsList, :placeOrderStatisticsList]

  field :qotPushStatisticsList, 1, repeated: true, type: GetDelayStatistics.DelayStatistics

  field :reqReplyStatisticsList, 2,
    repeated: true,
    type: GetDelayStatistics.ReqReplyStatisticsItem

  field :placeOrderStatisticsList, 3,
    repeated: true,
    type: GetDelayStatistics.PlaceOrderStatisticsItem
end

defmodule GetDelayStatistics.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: GetDelayStatistics.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: GetDelayStatistics.C2S
end

defmodule GetDelayStatistics.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: GetDelayStatistics.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: GetDelayStatistics.S2C
end
