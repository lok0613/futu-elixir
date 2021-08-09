defmodule Trd_GetPositionList.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          filterConditions: Trd_Common.TrdFilterConditions.t() | nil,
          filterPLRatioMin: float | :infinity | :negative_infinity | :nan,
          filterPLRatioMax: float | :infinity | :negative_infinity | :nan,
          refreshCache: boolean
        }

  defstruct [:header, :filterConditions, :filterPLRatioMin, :filterPLRatioMax, :refreshCache]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :filterConditions, 2, optional: true, type: Trd_Common.TrdFilterConditions
  field :filterPLRatioMin, 3, optional: true, type: :double
  field :filterPLRatioMax, 4, optional: true, type: :double
  field :refreshCache, 5, optional: true, type: :bool
end

defmodule Trd_GetPositionList.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          positionList: [Trd_Common.Position.t()]
        }

  defstruct [:header, :positionList]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :positionList, 2, repeated: true, type: Trd_Common.Position
end

defmodule Trd_GetPositionList.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Trd_GetPositionList.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Trd_GetPositionList.C2S
end

defmodule Trd_GetPositionList.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Trd_GetPositionList.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_GetPositionList.S2C
end
