defmodule Qot_GetPlateSet.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          market: integer,
          plateSetType: integer
        }

  defstruct [:market, :plateSetType]

  field :market, 1, required: true, type: :int32
  field :plateSetType, 2, required: true, type: :int32
end

defmodule Qot_GetPlateSet.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          plateInfoList: [Qot_Common.PlateInfo.t()]
        }

  defstruct [:plateInfoList]

  field :plateInfoList, 1, repeated: true, type: Qot_Common.PlateInfo
end

defmodule Qot_GetPlateSet.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetPlateSet.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetPlateSet.C2S
end

defmodule Qot_GetPlateSet.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetPlateSet.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetPlateSet.S2C
end
