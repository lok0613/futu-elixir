defmodule Qot_GetOwnerPlate.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :securityList, 1, repeated: true, type: Qot_Common.Security
end

defmodule Qot_GetOwnerPlate.SecurityOwnerPlate do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :name, 3, optional: true, type: :string
  field :plateInfoList, 2, repeated: true, type: Qot_Common.PlateInfo
end

defmodule Qot_GetOwnerPlate.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :ownerPlateList, 1, repeated: true, type: Qot_GetOwnerPlate.SecurityOwnerPlate
end

defmodule Qot_GetOwnerPlate.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetOwnerPlate.C2S
end

defmodule Qot_GetOwnerPlate.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetOwnerPlate.S2C
end