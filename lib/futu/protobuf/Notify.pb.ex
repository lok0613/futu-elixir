defmodule Notify.NotifyType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :NotifyType_None, 0
  field :NotifyType_GtwEvent, 1
  field :NotifyType_ProgramStatus, 2
  field :NotifyType_ConnStatus, 3
  field :NotifyType_QotRight, 4
  field :NotifyType_APILevel, 5
  field :NotifyType_APIQuota, 6
  field :NotifyType_UsedQuota, 7
end

defmodule Notify.GtwEventType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

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

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :eventType, 1, required: true, type: :int32
  field :desc, 2, required: true, type: :string
end

defmodule Notify.ProgramStatus do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :programStatus, 1, required: true, type: Common.ProgramStatus
end

defmodule Notify.ConnectStatus do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :qotLogined, 1, required: true, type: :bool
  field :trdLogined, 2, required: true, type: :bool
end

defmodule Notify.QotRight do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :hkQotRight, 4, required: true, type: :int32
  field :usQotRight, 5, required: true, type: :int32
  field :cnQotRight, 6, required: true, type: :int32
  field :hkOptionQotRight, 7, optional: true, type: :int32
  field :hasUSOptionQotRight, 8, optional: true, type: :bool
  field :hkFutureQotRight, 9, optional: true, type: :int32
  field :usFutureQotRight, 10, optional: true, type: :int32
  field :usOptionQotRight, 11, optional: true, type: :int32
  field :usIndexQotRight, 12, optional: true, type: :int32
  field :usOtcQotRight, 13, optional: true, type: :int32
  field :sgFutureQotRight, 14, optional: true, type: :int32
  field :jpFutureQotRight, 15, optional: true, type: :int32
  field :usCMEFutureQotRight, 16, optional: true, type: :int32
  field :usCBOTFutureQotRight, 17, optional: true, type: :int32
  field :usNYMEXFutureQotRight, 18, optional: true, type: :int32
  field :usCOMEXFutureQotRight, 19, optional: true, type: :int32
  field :usCBOEFutureQotRight, 20, optional: true, type: :int32
  field :shQotRight, 21, optional: true, type: :int32
  field :szQotRight, 22, optional: true, type: :int32
end

defmodule Notify.APILevel do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :apiLevel, 3, required: true, type: :string
end

defmodule Notify.APIQuota do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :subQuota, 1, required: true, type: :int32
  field :historyKLQuota, 2, required: true, type: :int32
end

defmodule Notify.UsedQuota do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :usedSubQuota, 1, optional: true, type: :int32
  field :usedKLineQuota, 2, optional: true, type: :int32
end

defmodule Notify.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :type, 1, required: true, type: :int32
  field :event, 2, optional: true, type: Notify.GtwEvent
  field :programStatus, 3, optional: true, type: Notify.ProgramStatus
  field :connectStatus, 4, optional: true, type: Notify.ConnectStatus
  field :qotRight, 5, optional: true, type: Notify.QotRight
  field :apiLevel, 6, optional: true, type: Notify.APILevel
  field :apiQuota, 7, optional: true, type: Notify.APIQuota
  field :usedQuota, 8, optional: true, type: Notify.UsedQuota
end

defmodule Notify.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Notify.S2C
end