defmodule Qot_GetOwnerPlate.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          securityList: [Qot_Common.Security.t()]
        }

  defstruct [:securityList]

  field :securityList, 1, repeated: true, type: Qot_Common.Security
end

defmodule Qot_GetOwnerPlate.SecurityOwnerPlate do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          plateInfoList: [Qot_Common.PlateInfo.t()]
        }

  defstruct [:security, :plateInfoList]

  field :security, 1, required: true, type: Qot_Common.Security
  field :plateInfoList, 2, repeated: true, type: Qot_Common.PlateInfo
end

defmodule Qot_GetOwnerPlate.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ownerPlateList: [Qot_GetOwnerPlate.SecurityOwnerPlate.t()]
        }

  defstruct [:ownerPlateList]

  field :ownerPlateList, 1, repeated: true, type: Qot_GetOwnerPlate.SecurityOwnerPlate
end

defmodule Qot_GetOwnerPlate.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetOwnerPlate.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetOwnerPlate.C2S
end

defmodule Qot_GetOwnerPlate.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetOwnerPlate.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetOwnerPlate.S2C
end
