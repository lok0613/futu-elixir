defmodule GetDelayStatistics.DelayStatisticsType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :DelayStatisticsType_Unkonw, 0
  field :DelayStatisticsType_QotPush, 1
  field :DelayStatisticsType_ReqReply, 2
  field :DelayStatisticsType_PlaceOrder, 3
end

defmodule GetDelayStatistics.QotPushStage do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :QotPushStage_Unkonw, 0
  field :QotPushStage_SR2SS, 1
  field :QotPushStage_SS2CR, 2
  field :QotPushStage_CR2CS, 3
  field :QotPushStage_SS2CS, 4
  field :QotPushStage_SR2CS, 5
end

defmodule GetDelayStatistics.QotPushType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :QotPushType_Unkonw, 0
  field :QotPushType_Price, 1
  field :QotPushType_Ticker, 2
  field :QotPushType_OrderBook, 3
  field :QotPushType_Broker, 4
end

defmodule GetDelayStatistics.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :typeList, 1, repeated: true, type: :int32
  field :qotPushStage, 2, optional: true, type: :int32
  field :segmentList, 3, repeated: true, type: :int32
end

defmodule GetDelayStatistics.DelayStatisticsItem do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :begin, 1, required: true, type: :int32
  field :end, 2, required: true, type: :int32
  field :count, 3, required: true, type: :int32
  field :proportion, 4, required: true, type: :float
  field :cumulativeRatio, 5, required: true, type: :float
end

defmodule GetDelayStatistics.DelayStatistics do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :qotPushType, 1, required: true, type: :int32
  field :itemList, 2, repeated: true, type: GetDelayStatistics.DelayStatisticsItem
  field :delayAvg, 3, required: true, type: :float
  field :count, 4, required: true, type: :int32
end

defmodule GetDelayStatistics.ReqReplyStatisticsItem do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :protoID, 1, required: true, type: :int32
  field :count, 2, required: true, type: :int32
  field :totalCostAvg, 3, required: true, type: :float
  field :openDCostAvg, 4, required: true, type: :float
  field :netDelayAvg, 5, required: true, type: :float
  field :isLocalReply, 6, required: true, type: :bool
end

defmodule GetDelayStatistics.PlaceOrderStatisticsItem do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :orderID, 1, required: true, type: :string
  field :totalCost, 2, required: true, type: :float
  field :openDCost, 3, required: true, type: :float
  field :netDelay, 4, required: true, type: :float
  field :updateCost, 5, required: true, type: :float
end

defmodule GetDelayStatistics.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

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

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: GetDelayStatistics.C2S
end

defmodule GetDelayStatistics.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: GetDelayStatistics.S2C
end