defmodule Qot_GetOrderBook.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :num, 2, required: true, type: :int32
end

defmodule Qot_GetOrderBook.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :name, 8, optional: true, type: :string
  field :orderBookAskList, 2, repeated: true, type: Qot_Common.OrderBook
  field :orderBookBidList, 3, repeated: true, type: Qot_Common.OrderBook
  field :svrRecvTimeBid, 4, optional: true, type: :string
  field :svrRecvTimeBidTimestamp, 5, optional: true, type: :double
  field :svrRecvTimeAsk, 6, optional: true, type: :string
  field :svrRecvTimeAskTimestamp, 7, optional: true, type: :double
end

defmodule Qot_GetOrderBook.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetOrderBook.C2S
end

defmodule Qot_GetOrderBook.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetOrderBook.S2C
end