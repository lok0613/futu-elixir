defmodule Qot_GetUserSecurityGroup.GroupType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :GroupType_Unknown, 0
  field :GroupType_Custom, 1
  field :GroupType_System, 2
  field :GroupType_All, 3
end

defmodule Qot_GetUserSecurityGroup.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :groupType, 1, required: true, type: :int32
end

defmodule Qot_GetUserSecurityGroup.GroupData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :groupName, 1, required: true, type: :string
  field :groupType, 2, required: true, type: :int32
end

defmodule Qot_GetUserSecurityGroup.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :groupList, 1, repeated: true, type: Qot_GetUserSecurityGroup.GroupData
end

defmodule Qot_GetUserSecurityGroup.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetUserSecurityGroup.C2S
end

defmodule Qot_GetUserSecurityGroup.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetUserSecurityGroup.S2C
end