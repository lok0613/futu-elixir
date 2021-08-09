defmodule Qot_GetTicker.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          maxRetNum: integer
        }

  defstruct [:security, :maxRetNum]

  field :security, 1, required: true, type: Qot_Common.Security
  field :maxRetNum, 2, required: true, type: :int32
end

defmodule Qot_GetTicker.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          tickerList: [Qot_Common.Ticker.t()]
        }

  defstruct [:security, :tickerList]

  field :security, 1, required: true, type: Qot_Common.Security
  field :tickerList, 2, repeated: true, type: Qot_Common.Ticker
end

defmodule Qot_GetTicker.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetTicker.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetTicker.C2S
end

defmodule Qot_GetTicker.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetTicker.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetTicker.S2C
end
