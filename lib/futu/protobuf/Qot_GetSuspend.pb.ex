defmodule Qot_GetSuspend.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          securityList: [Qot_Common.Security.t()],
          beginTime: String.t(),
          endTime: String.t()
        }

  defstruct [:securityList, :beginTime, :endTime]

  field :securityList, 1, repeated: true, type: Qot_Common.Security
  field :beginTime, 2, required: true, type: :string
  field :endTime, 3, required: true, type: :string
end

defmodule Qot_GetSuspend.Suspend do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          time: String.t(),
          timestamp: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:time, :timestamp]

  field :time, 1, required: true, type: :string
  field :timestamp, 2, optional: true, type: :double
end

defmodule Qot_GetSuspend.SecuritySuspend do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          suspendList: [Qot_GetSuspend.Suspend.t()]
        }

  defstruct [:security, :suspendList]

  field :security, 1, required: true, type: Qot_Common.Security
  field :suspendList, 2, repeated: true, type: Qot_GetSuspend.Suspend
end

defmodule Qot_GetSuspend.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          SecuritySuspendList: [Qot_GetSuspend.SecuritySuspend.t()]
        }

  defstruct [:SecuritySuspendList]

  field :SecuritySuspendList, 1, repeated: true, type: Qot_GetSuspend.SecuritySuspend
end

defmodule Qot_GetSuspend.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetSuspend.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetSuspend.C2S
end

defmodule Qot_GetSuspend.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetSuspend.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetSuspend.S2C
end
