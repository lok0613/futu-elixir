defmodule Qot_RegQotPush.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :securityList, 1, repeated: true, type: Qot_Common.Security
  field :subTypeList, 2, repeated: true, type: :int32
  field :rehabTypeList, 3, repeated: true, type: :int32
  field :isRegOrUnReg, 4, required: true, type: :bool
  field :isFirstPush, 5, optional: true, type: :bool
end

defmodule Qot_RegQotPush.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"
end

defmodule Qot_RegQotPush.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_RegQotPush.C2S
end

defmodule Qot_RegQotPush.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_RegQotPush.S2C
end