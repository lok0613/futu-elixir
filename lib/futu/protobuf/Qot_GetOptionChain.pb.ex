defmodule Qot_GetOptionChain.OptionCondType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :OptionCondType_Unknow | :OptionCondType_WithIn | :OptionCondType_Outside

  field :OptionCondType_Unknow, 0

  field :OptionCondType_WithIn, 1

  field :OptionCondType_Outside, 2
end

defmodule Qot_GetOptionChain.DataFilter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          impliedVolatilityMin: float | :infinity | :negative_infinity | :nan,
          impliedVolatilityMax: float | :infinity | :negative_infinity | :nan,
          deltaMin: float | :infinity | :negative_infinity | :nan,
          deltaMax: float | :infinity | :negative_infinity | :nan,
          gammaMin: float | :infinity | :negative_infinity | :nan,
          gammaMax: float | :infinity | :negative_infinity | :nan,
          vegaMin: float | :infinity | :negative_infinity | :nan,
          vegaMax: float | :infinity | :negative_infinity | :nan,
          thetaMin: float | :infinity | :negative_infinity | :nan,
          thetaMax: float | :infinity | :negative_infinity | :nan,
          rhoMin: float | :infinity | :negative_infinity | :nan,
          rhoMax: float | :infinity | :negative_infinity | :nan,
          netOpenInterestMin: float | :infinity | :negative_infinity | :nan,
          netOpenInterestMax: float | :infinity | :negative_infinity | :nan,
          openInterestMin: float | :infinity | :negative_infinity | :nan,
          openInterestMax: float | :infinity | :negative_infinity | :nan,
          volMin: float | :infinity | :negative_infinity | :nan,
          volMax: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :impliedVolatilityMin,
    :impliedVolatilityMax,
    :deltaMin,
    :deltaMax,
    :gammaMin,
    :gammaMax,
    :vegaMin,
    :vegaMax,
    :thetaMin,
    :thetaMax,
    :rhoMin,
    :rhoMax,
    :netOpenInterestMin,
    :netOpenInterestMax,
    :openInterestMin,
    :openInterestMax,
    :volMin,
    :volMax
  ]

  field :impliedVolatilityMin, 1, optional: true, type: :double
  field :impliedVolatilityMax, 2, optional: true, type: :double
  field :deltaMin, 3, optional: true, type: :double
  field :deltaMax, 4, optional: true, type: :double
  field :gammaMin, 5, optional: true, type: :double
  field :gammaMax, 6, optional: true, type: :double
  field :vegaMin, 7, optional: true, type: :double
  field :vegaMax, 8, optional: true, type: :double
  field :thetaMin, 9, optional: true, type: :double
  field :thetaMax, 10, optional: true, type: :double
  field :rhoMin, 11, optional: true, type: :double
  field :rhoMax, 12, optional: true, type: :double
  field :netOpenInterestMin, 13, optional: true, type: :double
  field :netOpenInterestMax, 14, optional: true, type: :double
  field :openInterestMin, 15, optional: true, type: :double
  field :openInterestMax, 16, optional: true, type: :double
  field :volMin, 17, optional: true, type: :double
  field :volMax, 18, optional: true, type: :double
end

defmodule Qot_GetOptionChain.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          owner: Qot_Common.Security.t() | nil,
          indexOptionType: integer,
          type: integer,
          condition: integer,
          beginTime: String.t(),
          endTime: String.t(),
          dataFilter: Qot_GetOptionChain.DataFilter.t() | nil
        }

  defstruct [:owner, :indexOptionType, :type, :condition, :beginTime, :endTime, :dataFilter]

  field :owner, 1, required: true, type: Qot_Common.Security
  field :indexOptionType, 6, optional: true, type: :int32
  field :type, 2, optional: true, type: :int32
  field :condition, 3, optional: true, type: :int32
  field :beginTime, 4, required: true, type: :string
  field :endTime, 5, required: true, type: :string
  field :dataFilter, 7, optional: true, type: Qot_GetOptionChain.DataFilter
end

defmodule Qot_GetOptionChain.OptionItem do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          call: Qot_Common.SecurityStaticInfo.t() | nil,
          put: Qot_Common.SecurityStaticInfo.t() | nil
        }

  defstruct [:call, :put]

  field :call, 1, optional: true, type: Qot_Common.SecurityStaticInfo
  field :put, 2, optional: true, type: Qot_Common.SecurityStaticInfo
end

defmodule Qot_GetOptionChain.OptionChain do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          strikeTime: String.t(),
          option: [Qot_GetOptionChain.OptionItem.t()],
          strikeTimestamp: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:strikeTime, :option, :strikeTimestamp]

  field :strikeTime, 1, required: true, type: :string
  field :option, 2, repeated: true, type: Qot_GetOptionChain.OptionItem
  field :strikeTimestamp, 3, optional: true, type: :double
end

defmodule Qot_GetOptionChain.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          optionChain: [Qot_GetOptionChain.OptionChain.t()]
        }

  defstruct [:optionChain]

  field :optionChain, 1, repeated: true, type: Qot_GetOptionChain.OptionChain
end

defmodule Qot_GetOptionChain.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetOptionChain.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetOptionChain.C2S
end

defmodule Qot_GetOptionChain.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetOptionChain.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetOptionChain.S2C
end
