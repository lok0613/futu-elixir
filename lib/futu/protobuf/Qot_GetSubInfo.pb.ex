defmodule Qot_GetSubInfo.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :isReqAllConn, 1, optional: true, type: :bool
end

defmodule Qot_GetSubInfo.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :connSubInfoList, 1, repeated: true, type: Qot_Common.ConnSubInfo
  field :totalUsedQuota, 2, required: true, type: :int32
  field :remainQuota, 3, required: true, type: :int32
end

defmodule Qot_GetSubInfo.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetSubInfo.C2S
end

defmodule Qot_GetSubInfo.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetSubInfo.S2C
end