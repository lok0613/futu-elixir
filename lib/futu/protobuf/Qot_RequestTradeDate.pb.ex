defmodule Qot_RequestTradeDate.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          market: integer,
          beginTime: String.t(),
          endTime: String.t(),
          security: Qot_Common.Security.t() | nil
        }

  defstruct [:market, :beginTime, :endTime, :security]

  field :market, 1, required: true, type: :int32
  field :beginTime, 2, required: true, type: :string
  field :endTime, 3, required: true, type: :string
  field :security, 4, optional: true, type: Qot_Common.Security
end

defmodule Qot_RequestTradeDate.TradeDate do
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

defmodule Qot_RequestTradeDate.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tradeDateList: [Qot_RequestTradeDate.TradeDate.t()]
        }

  defstruct [:tradeDateList]

  field :tradeDateList, 1, repeated: true, type: Qot_RequestTradeDate.TradeDate
end

defmodule Qot_RequestTradeDate.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_RequestTradeDate.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_RequestTradeDate.C2S
end

defmodule Qot_RequestTradeDate.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_RequestTradeDate.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_RequestTradeDate.S2C
end
