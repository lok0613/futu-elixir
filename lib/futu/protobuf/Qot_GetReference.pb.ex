defmodule Qot_GetReference.ReferenceType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :ReferenceType_Unknow, 0
  field :ReferenceType_Warrant, 1
  field :ReferenceType_Future, 2
end

defmodule Qot_GetReference.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :referenceType, 2, required: true, type: :int32
end

defmodule Qot_GetReference.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :staticInfoList, 2, repeated: true, type: Qot_Common.SecurityStaticInfo
end

defmodule Qot_GetReference.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetReference.C2S
end

defmodule Qot_GetReference.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetReference.S2C
end