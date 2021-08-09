defmodule Qot_GetOrderBook.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          num: integer
        }

  defstruct [:security, :num]

  field :security, 1, required: true, type: Qot_Common.Security
  field :num, 2, required: true, type: :int32
end

defmodule Qot_GetOrderBook.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          orderBookAskList: [Qot_Common.OrderBook.t()],
          orderBookBidList: [Qot_Common.OrderBook.t()],
          svrRecvTimeBid: String.t(),
          svrRecvTimeBidTimestamp: float | :infinity | :negative_infinity | :nan,
          svrRecvTimeAsk: String.t(),
          svrRecvTimeAskTimestamp: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :security,
    :orderBookAskList,
    :orderBookBidList,
    :svrRecvTimeBid,
    :svrRecvTimeBidTimestamp,
    :svrRecvTimeAsk,
    :svrRecvTimeAskTimestamp
  ]

  field :security, 1, required: true, type: Qot_Common.Security
  field :orderBookAskList, 2, repeated: true, type: Qot_Common.OrderBook
  field :orderBookBidList, 3, repeated: true, type: Qot_Common.OrderBook
  field :svrRecvTimeBid, 4, optional: true, type: :string
  field :svrRecvTimeBidTimestamp, 5, optional: true, type: :double
  field :svrRecvTimeAsk, 6, optional: true, type: :string
  field :svrRecvTimeAskTimestamp, 7, optional: true, type: :double
end

defmodule Qot_GetOrderBook.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetOrderBook.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetOrderBook.C2S
end

defmodule Qot_GetOrderBook.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetOrderBook.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetOrderBook.S2C
end
