defmodule Qot_RegQotPush.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          securityList: [Qot_Common.Security.t()],
          subTypeList: [integer],
          rehabTypeList: [integer],
          isRegOrUnReg: boolean,
          isFirstPush: boolean
        }

  defstruct [:securityList, :subTypeList, :rehabTypeList, :isRegOrUnReg, :isFirstPush]

  field :securityList, 1, repeated: true, type: Qot_Common.Security
  field :subTypeList, 2, repeated: true, type: :int32
  field :rehabTypeList, 3, repeated: true, type: :int32
  field :isRegOrUnReg, 4, required: true, type: :bool
  field :isFirstPush, 5, optional: true, type: :bool
end

defmodule Qot_RegQotPush.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2
  @type t :: %__MODULE__{}

  defstruct []
end

defmodule Qot_RegQotPush.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_RegQotPush.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_RegQotPush.C2S
end

defmodule Qot_RegQotPush.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_RegQotPush.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_RegQotPush.S2C
end
