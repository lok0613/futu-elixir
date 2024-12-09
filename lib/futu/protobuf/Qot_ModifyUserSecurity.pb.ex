defmodule Qot_ModifyUserSecurity.ModifyUserSecurityOp do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :ModifyUserSecurityOp_Unknown, 0
  field :ModifyUserSecurityOp_Add, 1
  field :ModifyUserSecurityOp_Del, 2
  field :ModifyUserSecurityOp_MoveOut, 3
end

defmodule Qot_ModifyUserSecurity.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :groupName, 1, required: true, type: :string
  field :op, 2, required: true, type: :int32
  field :securityList, 3, repeated: true, type: Qot_Common.Security
end

defmodule Qot_ModifyUserSecurity.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"
end

defmodule Qot_ModifyUserSecurity.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_ModifyUserSecurity.C2S
end

defmodule Qot_ModifyUserSecurity.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_ModifyUserSecurity.S2C
end