defmodule Notify.NotifyType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :NotifyType_None
          | :NotifyType_GtwEvent
          | :NotifyType_ProgramStatus
          | :NotifyType_ConnStatus
          | :NotifyType_QotRight
          | :NotifyType_APILevel
          | :NotifyType_APIQuota

  field :NotifyType_None, 0

  field :NotifyType_GtwEvent, 1

  field :NotifyType_ProgramStatus, 2

  field :NotifyType_ConnStatus, 3

  field :NotifyType_QotRight, 4

  field :NotifyType_APILevel, 5

  field :NotifyType_APIQuota, 6
end

defmodule Notify.GtwEventType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :GtwEventType_None
          | :GtwEventType_LocalCfgLoadFailed
          | :GtwEventType_APISvrRunFailed
          | :GtwEventType_ForceUpdate
          | :GtwEventType_LoginFailed
          | :GtwEventType_UnAgreeDisclaimer
          | :GtwEventType_NetCfgMissing
          | :GtwEventType_KickedOut
          | :GtwEventType_LoginPwdChanged
          | :GtwEventType_BanLogin
          | :GtwEventType_NeedPicVerifyCode
          | :GtwEventType_NeedPhoneVerifyCode
          | :GtwEventType_AppDataNotExist
          | :GtwEventType_NessaryDataMissing
          | :GtwEventType_TradePwdChanged
          | :GtwEventType_EnableDeviceLock

  field :GtwEventType_None, 0

  field :GtwEventType_LocalCfgLoadFailed, 1

  field :GtwEventType_APISvrRunFailed, 2

  field :GtwEventType_ForceUpdate, 3

  field :GtwEventType_LoginFailed, 4

  field :GtwEventType_UnAgreeDisclaimer, 5

  field :GtwEventType_NetCfgMissing, 6

  field :GtwEventType_KickedOut, 7

  field :GtwEventType_LoginPwdChanged, 8

  field :GtwEventType_BanLogin, 9

  field :GtwEventType_NeedPicVerifyCode, 10

  field :GtwEventType_NeedPhoneVerifyCode, 11

  field :GtwEventType_AppDataNotExist, 12

  field :GtwEventType_NessaryDataMissing, 13

  field :GtwEventType_TradePwdChanged, 14

  field :GtwEventType_EnableDeviceLock, 15
end

defmodule Notify.GtwEvent do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          eventType: integer,
          desc: String.t()
        }

  defstruct [:eventType, :desc]

  field :eventType, 1, required: true, type: :int32
  field :desc, 2, required: true, type: :string
end

defmodule Notify.ProgramStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          programStatus: Common.ProgramStatus.t() | nil
        }

  defstruct [:programStatus]

  field :programStatus, 1, required: true, type: Common.ProgramStatus
end

defmodule Notify.ConnectStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          qotLogined: boolean,
          trdLogined: boolean
        }

  defstruct [:qotLogined, :trdLogined]

  field :qotLogined, 1, required: true, type: :bool
  field :trdLogined, 2, required: true, type: :bool
end

defmodule Notify.QotRight do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          hkQotRight: integer,
          usQotRight: integer,
          cnQotRight: integer,
          hkOptionQotRight: integer,
          hasUSOptionQotRight: boolean,
          hkFutureQotRight: integer,
          usFutureQotRight: integer,
          usOptionQotRight: integer
        }

  defstruct [
    :hkQotRight,
    :usQotRight,
    :cnQotRight,
    :hkOptionQotRight,
    :hasUSOptionQotRight,
    :hkFutureQotRight,
    :usFutureQotRight,
    :usOptionQotRight
  ]

  field :hkQotRight, 4, required: true, type: :int32
  field :usQotRight, 5, required: true, type: :int32
  field :cnQotRight, 6, required: true, type: :int32
  field :hkOptionQotRight, 7, optional: true, type: :int32
  field :hasUSOptionQotRight, 8, optional: true, type: :bool
  field :hkFutureQotRight, 9, optional: true, type: :int32
  field :usFutureQotRight, 10, optional: true, type: :int32
  field :usOptionQotRight, 11, optional: true, type: :int32
end

defmodule Notify.APILevel do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          apiLevel: String.t()
        }

  defstruct [:apiLevel]

  field :apiLevel, 3, required: true, type: :string
end

defmodule Notify.APIQuota do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          subQuota: integer,
          historyKLQuota: integer
        }

  defstruct [:subQuota, :historyKLQuota]

  field :subQuota, 1, required: true, type: :int32
  field :historyKLQuota, 2, required: true, type: :int32
end

defmodule Notify.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: integer,
          event: Notify.GtwEvent.t() | nil,
          programStatus: Notify.ProgramStatus.t() | nil,
          connectStatus: Notify.ConnectStatus.t() | nil,
          qotRight: Notify.QotRight.t() | nil,
          apiLevel: Notify.APILevel.t() | nil,
          apiQuota: Notify.APIQuota.t() | nil
        }

  defstruct [:type, :event, :programStatus, :connectStatus, :qotRight, :apiLevel, :apiQuota]

  field :type, 1, required: true, type: :int32
  field :event, 2, optional: true, type: Notify.GtwEvent
  field :programStatus, 3, optional: true, type: Notify.ProgramStatus
  field :connectStatus, 4, optional: true, type: Notify.ConnectStatus
  field :qotRight, 5, optional: true, type: Notify.QotRight
  field :apiLevel, 6, optional: true, type: Notify.APILevel
  field :apiQuota, 7, optional: true, type: Notify.APIQuota
end

defmodule Notify.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Notify.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Notify.S2C
end
