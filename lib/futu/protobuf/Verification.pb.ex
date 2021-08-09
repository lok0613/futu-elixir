defmodule Verification.VerificationType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer | :VerificationType_Unknow | :VerificationType_Picture | :VerificationType_Phone

  field :VerificationType_Unknow, 0

  field :VerificationType_Picture, 1

  field :VerificationType_Phone, 2
end

defmodule Verification.VerificationOp do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :VerificationOp_Unknow
          | :VerificationOp_Request
          | :VerificationOp_InputAndLogin

  field :VerificationOp_Unknow, 0

  field :VerificationOp_Request, 1

  field :VerificationOp_InputAndLogin, 2
end

defmodule Verification.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: integer,
          op: integer,
          code: String.t()
        }

  defstruct [:type, :op, :code]

  field :type, 1, required: true, type: :int32
  field :op, 2, required: true, type: :int32
  field :code, 3, optional: true, type: :string
end

defmodule Verification.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2
  @type t :: %__MODULE__{}

  defstruct []
end

defmodule Verification.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Verification.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Verification.C2S
end

defmodule Verification.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Verification.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Verification.S2C
end
