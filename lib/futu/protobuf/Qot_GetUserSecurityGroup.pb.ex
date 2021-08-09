defmodule Qot_GetUserSecurityGroup.GroupType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :GroupType_Unknown | :GroupType_Custom | :GroupType_System | :GroupType_All

  field :GroupType_Unknown, 0

  field :GroupType_Custom, 1

  field :GroupType_System, 2

  field :GroupType_All, 3
end

defmodule Qot_GetUserSecurityGroup.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          groupType: integer
        }

  defstruct [:groupType]

  field :groupType, 1, required: true, type: :int32
end

defmodule Qot_GetUserSecurityGroup.GroupData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          groupName: String.t(),
          groupType: integer
        }

  defstruct [:groupName, :groupType]

  field :groupName, 1, required: true, type: :string
  field :groupType, 2, required: true, type: :int32
end

defmodule Qot_GetUserSecurityGroup.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          groupList: [Qot_GetUserSecurityGroup.GroupData.t()]
        }

  defstruct [:groupList]

  field :groupList, 1, repeated: true, type: Qot_GetUserSecurityGroup.GroupData
end

defmodule Qot_GetUserSecurityGroup.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetUserSecurityGroup.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetUserSecurityGroup.C2S
end

defmodule Qot_GetUserSecurityGroup.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetUserSecurityGroup.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetUserSecurityGroup.S2C
end
