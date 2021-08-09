defmodule Trd_GetMarginRatio.MarginRatioInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          isLongPermit: boolean,
          isShortPermit: boolean,
          shortPoolRemain: float | :infinity | :negative_infinity | :nan,
          shortFeeRate: float | :infinity | :negative_infinity | :nan,
          alertLongRatio: float | :infinity | :negative_infinity | :nan,
          alertShortRatio: float | :infinity | :negative_infinity | :nan,
          imLongRatio: float | :infinity | :negative_infinity | :nan,
          imShortRatio: float | :infinity | :negative_infinity | :nan,
          mcmLongRatio: float | :infinity | :negative_infinity | :nan,
          mcmShortRatio: float | :infinity | :negative_infinity | :nan,
          mmLongRatio: float | :infinity | :negative_infinity | :nan,
          mmShortRatio: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :security,
    :isLongPermit,
    :isShortPermit,
    :shortPoolRemain,
    :shortFeeRate,
    :alertLongRatio,
    :alertShortRatio,
    :imLongRatio,
    :imShortRatio,
    :mcmLongRatio,
    :mcmShortRatio,
    :mmLongRatio,
    :mmShortRatio
  ]

  field :security, 1, required: true, type: Qot_Common.Security
  field :isLongPermit, 2, optional: true, type: :bool
  field :isShortPermit, 3, optional: true, type: :bool
  field :shortPoolRemain, 4, optional: true, type: :double
  field :shortFeeRate, 5, optional: true, type: :double
  field :alertLongRatio, 6, optional: true, type: :double
  field :alertShortRatio, 7, optional: true, type: :double
  field :imLongRatio, 8, optional: true, type: :double
  field :imShortRatio, 9, optional: true, type: :double
  field :mcmLongRatio, 10, optional: true, type: :double
  field :mcmShortRatio, 11, optional: true, type: :double
  field :mmLongRatio, 12, optional: true, type: :double
  field :mmShortRatio, 13, optional: true, type: :double
end

defmodule Trd_GetMarginRatio.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          securityList: [Qot_Common.Security.t()]
        }

  defstruct [:header, :securityList]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :securityList, 2, repeated: true, type: Qot_Common.Security
end

defmodule Trd_GetMarginRatio.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          marginRatioInfoList: [Trd_GetMarginRatio.MarginRatioInfo.t()]
        }

  defstruct [:header, :marginRatioInfoList]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :marginRatioInfoList, 2, repeated: true, type: Trd_GetMarginRatio.MarginRatioInfo
end

defmodule Trd_GetMarginRatio.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Trd_GetMarginRatio.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Trd_GetMarginRatio.C2S
end

defmodule Trd_GetMarginRatio.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Trd_GetMarginRatio.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_GetMarginRatio.S2C
end
