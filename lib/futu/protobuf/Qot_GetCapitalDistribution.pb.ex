defmodule Qot_GetCapitalDistribution.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil
        }

  defstruct [:security]

  field :security, 1, required: true, type: Qot_Common.Security
end

defmodule Qot_GetCapitalDistribution.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          capitalInBig: float | :infinity | :negative_infinity | :nan,
          capitalInMid: float | :infinity | :negative_infinity | :nan,
          capitalInSmall: float | :infinity | :negative_infinity | :nan,
          capitalOutBig: float | :infinity | :negative_infinity | :nan,
          capitalOutMid: float | :infinity | :negative_infinity | :nan,
          capitalOutSmall: float | :infinity | :negative_infinity | :nan,
          updateTime: String.t(),
          updateTimestamp: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :capitalInBig,
    :capitalInMid,
    :capitalInSmall,
    :capitalOutBig,
    :capitalOutMid,
    :capitalOutSmall,
    :updateTime,
    :updateTimestamp
  ]

  field :capitalInBig, 1, required: true, type: :double
  field :capitalInMid, 2, required: true, type: :double
  field :capitalInSmall, 3, required: true, type: :double
  field :capitalOutBig, 4, required: true, type: :double
  field :capitalOutMid, 5, required: true, type: :double
  field :capitalOutSmall, 6, required: true, type: :double
  field :updateTime, 7, optional: true, type: :string
  field :updateTimestamp, 8, optional: true, type: :double
end

defmodule Qot_GetCapitalDistribution.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetCapitalDistribution.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetCapitalDistribution.C2S
end

defmodule Qot_GetCapitalDistribution.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetCapitalDistribution.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetCapitalDistribution.S2C
end
