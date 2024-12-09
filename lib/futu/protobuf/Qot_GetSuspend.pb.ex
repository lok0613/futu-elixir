defmodule Qot_GetSuspend.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :securityList, 1, repeated: true, type: Qot_Common.Security
  field :beginTime, 2, required: true, type: :string
  field :endTime, 3, required: true, type: :string
end

defmodule Qot_GetSuspend.Suspend do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :time, 1, required: true, type: :string
  field :timestamp, 2, optional: true, type: :double
end

defmodule Qot_GetSuspend.SecuritySuspend do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :suspendList, 2, repeated: true, type: Qot_GetSuspend.Suspend
end

defmodule Qot_GetSuspend.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :SecuritySuspendList, 1, repeated: true, type: Qot_GetSuspend.SecuritySuspend
end

defmodule Qot_GetSuspend.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetSuspend.C2S
end

defmodule Qot_GetSuspend.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetSuspend.S2C
end