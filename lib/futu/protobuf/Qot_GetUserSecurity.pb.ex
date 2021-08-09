defmodule Qot_GetUserSecurity.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          groupName: String.t()
        }

  defstruct [:groupName]

  field :groupName, 1, required: true, type: :string
end

defmodule Qot_GetUserSecurity.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          staticInfoList: [Qot_Common.SecurityStaticInfo.t()]
        }

  defstruct [:staticInfoList]

  field :staticInfoList, 1, repeated: true, type: Qot_Common.SecurityStaticInfo
end

defmodule Qot_GetUserSecurity.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetUserSecurity.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetUserSecurity.C2S
end

defmodule Qot_GetUserSecurity.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetUserSecurity.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetUserSecurity.S2C
end
