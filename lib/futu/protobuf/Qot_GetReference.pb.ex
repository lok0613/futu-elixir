defmodule Qot_GetReference.ReferenceType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :ReferenceType_Unknow | :ReferenceType_Warrant | :ReferenceType_Future

  field :ReferenceType_Unknow, 0

  field :ReferenceType_Warrant, 1

  field :ReferenceType_Future, 2
end

defmodule Qot_GetReference.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          referenceType: integer
        }

  defstruct [:security, :referenceType]

  field :security, 1, required: true, type: Qot_Common.Security
  field :referenceType, 2, required: true, type: :int32
end

defmodule Qot_GetReference.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          staticInfoList: [Qot_Common.SecurityStaticInfo.t()]
        }

  defstruct [:staticInfoList]

  field :staticInfoList, 2, repeated: true, type: Qot_Common.SecurityStaticInfo
end

defmodule Qot_GetReference.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetReference.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetReference.C2S
end

defmodule Qot_GetReference.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetReference.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetReference.S2C
end
