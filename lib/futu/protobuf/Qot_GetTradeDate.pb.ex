defmodule Qot_GetTradeDate.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          market: integer,
          beginTime: String.t(),
          endTime: String.t()
        }

  defstruct [:market, :beginTime, :endTime]

  field :market, 1, required: true, type: :int32
  field :beginTime, 2, required: true, type: :string
  field :endTime, 3, required: true, type: :string
end

defmodule Qot_GetTradeDate.TradeDate do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          time: String.t(),
          timestamp: float | :infinity | :negative_infinity | :nan,
          tradeDateType: integer
        }

  defstruct [:time, :timestamp, :tradeDateType]

  field :time, 1, required: true, type: :string
  field :timestamp, 2, optional: true, type: :double
  field :tradeDateType, 3, optional: true, type: :int32
end

defmodule Qot_GetTradeDate.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tradeDateList: [Qot_GetTradeDate.TradeDate.t()]
        }

  defstruct [:tradeDateList]

  field :tradeDateList, 1, repeated: true, type: Qot_GetTradeDate.TradeDate
end

defmodule Qot_GetTradeDate.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetTradeDate.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetTradeDate.C2S
end

defmodule Qot_GetTradeDate.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetTradeDate.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetTradeDate.S2C
end
