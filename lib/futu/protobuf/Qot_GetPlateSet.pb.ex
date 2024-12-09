defmodule Qot_GetPlateSet.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :market, 1, required: true, type: :int32
  field :plateSetType, 2, required: true, type: :int32
end

defmodule Qot_GetPlateSet.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :plateInfoList, 1, repeated: true, type: Qot_Common.PlateInfo
end

defmodule Qot_GetPlateSet.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetPlateSet.C2S
end

defmodule Qot_GetPlateSet.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetPlateSet.S2C
end