defmodule Qot_ModifyUserSecurity.ModifyUserSecurityOp do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :ModifyUserSecurityOp_Unknown
          | :ModifyUserSecurityOp_Add
          | :ModifyUserSecurityOp_Del
          | :ModifyUserSecurityOp_MoveOut

  field :ModifyUserSecurityOp_Unknown, 0

  field :ModifyUserSecurityOp_Add, 1

  field :ModifyUserSecurityOp_Del, 2

  field :ModifyUserSecurityOp_MoveOut, 3
end

defmodule Qot_ModifyUserSecurity.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          groupName: String.t(),
          op: integer,
          securityList: [Qot_Common.Security.t()]
        }

  defstruct [:groupName, :op, :securityList]

  field :groupName, 1, required: true, type: :string
  field :op, 2, required: true, type: :int32
  field :securityList, 3, repeated: true, type: Qot_Common.Security
end

defmodule Qot_ModifyUserSecurity.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2
  @type t :: %__MODULE__{}

  defstruct []
end

defmodule Qot_ModifyUserSecurity.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_ModifyUserSecurity.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_ModifyUserSecurity.C2S
end

defmodule Qot_ModifyUserSecurity.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_ModifyUserSecurity.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_ModifyUserSecurity.S2C
end
