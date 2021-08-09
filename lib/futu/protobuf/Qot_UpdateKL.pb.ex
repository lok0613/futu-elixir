defmodule Qot_UpdateKL.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          rehabType: integer,
          klType: integer,
          security: Qot_Common.Security.t() | nil,
          klList: [Qot_Common.KLine.t()]
        }

  defstruct [:rehabType, :klType, :security, :klList]

  field :rehabType, 1, required: true, type: :int32
  field :klType, 2, required: true, type: :int32
  field :security, 3, required: true, type: Qot_Common.Security
  field :klList, 4, repeated: true, type: Qot_Common.KLine
end

defmodule Qot_UpdateKL.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_UpdateKL.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_UpdateKL.S2C
end
