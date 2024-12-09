defmodule Qot_GetPlateSecurity.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :plate, 1, required: true, type: Qot_Common.Security
  field :sortField, 2, optional: true, type: :int32
  field :ascend, 3, optional: true, type: :bool
end

defmodule Qot_GetPlateSecurity.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :staticInfoList, 1, repeated: true, type: Qot_Common.SecurityStaticInfo
end

defmodule Qot_GetPlateSecurity.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetPlateSecurity.C2S
end

defmodule Qot_GetPlateSecurity.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetPlateSecurity.S2C
end