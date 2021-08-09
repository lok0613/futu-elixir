defmodule Qot_GetHoldingChangeList.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          holderCategory: integer,
          beginTime: String.t(),
          endTime: String.t()
        }

  defstruct [:security, :holderCategory, :beginTime, :endTime]

  field :security, 1, required: true, type: Qot_Common.Security
  field :holderCategory, 2, required: true, type: :int32
  field :beginTime, 3, optional: true, type: :string
  field :endTime, 4, optional: true, type: :string
end

defmodule Qot_GetHoldingChangeList.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          holdingChangeList: [Qot_Common.ShareHoldingChange.t()]
        }

  defstruct [:security, :holdingChangeList]

  field :security, 1, required: true, type: Qot_Common.Security
  field :holdingChangeList, 2, repeated: true, type: Qot_Common.ShareHoldingChange
end

defmodule Qot_GetHoldingChangeList.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetHoldingChangeList.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetHoldingChangeList.C2S
end

defmodule Qot_GetHoldingChangeList.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetHoldingChangeList.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetHoldingChangeList.S2C
end
