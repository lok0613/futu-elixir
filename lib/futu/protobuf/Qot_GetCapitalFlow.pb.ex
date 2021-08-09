defmodule Qot_GetCapitalFlow.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil
        }

  defstruct [:security]

  field :security, 1, required: true, type: Qot_Common.Security
end

defmodule Qot_GetCapitalFlow.CapitalFlowItem do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          inFlow: float | :infinity | :negative_infinity | :nan,
          time: String.t(),
          timestamp: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:inFlow, :time, :timestamp]

  field :inFlow, 1, required: true, type: :double
  field :time, 2, optional: true, type: :string
  field :timestamp, 3, optional: true, type: :double
end

defmodule Qot_GetCapitalFlow.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          flowItemList: [Qot_GetCapitalFlow.CapitalFlowItem.t()],
          lastValidTime: String.t(),
          lastValidTimestamp: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:flowItemList, :lastValidTime, :lastValidTimestamp]

  field :flowItemList, 1, repeated: true, type: Qot_GetCapitalFlow.CapitalFlowItem
  field :lastValidTime, 2, optional: true, type: :string
  field :lastValidTimestamp, 3, optional: true, type: :double
end

defmodule Qot_GetCapitalFlow.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetCapitalFlow.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetCapitalFlow.C2S
end

defmodule Qot_GetCapitalFlow.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetCapitalFlow.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetCapitalFlow.S2C
end
