defmodule Qot_GetKL.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          rehabType: integer,
          klType: integer,
          security: Qot_Common.Security.t() | nil,
          reqNum: integer
        }

  defstruct [:rehabType, :klType, :security, :reqNum]

  field :rehabType, 1, required: true, type: :int32
  field :klType, 2, required: true, type: :int32
  field :security, 3, required: true, type: Qot_Common.Security
  field :reqNum, 4, required: true, type: :int32
end

defmodule Qot_GetKL.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          klList: [Qot_Common.KLine.t()]
        }

  defstruct [:security, :klList]

  field :security, 1, required: true, type: Qot_Common.Security
  field :klList, 2, repeated: true, type: Qot_Common.KLine
end

defmodule Qot_GetKL.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetKL.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetKL.C2S
end

defmodule Qot_GetKL.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetKL.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetKL.S2C
end
