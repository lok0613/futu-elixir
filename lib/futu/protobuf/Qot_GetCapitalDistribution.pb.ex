defmodule Qot_GetCapitalDistribution.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
end

defmodule Qot_GetCapitalDistribution.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :capitalInSuper, 9, optional: true, type: :double
  field :capitalInBig, 1, required: true, type: :double
  field :capitalInMid, 2, required: true, type: :double
  field :capitalInSmall, 3, required: true, type: :double
  field :capitalOutSuper, 10, optional: true, type: :double
  field :capitalOutBig, 4, required: true, type: :double
  field :capitalOutMid, 5, required: true, type: :double
  field :capitalOutSmall, 6, required: true, type: :double
  field :updateTime, 7, optional: true, type: :string
  field :updateTimestamp, 8, optional: true, type: :double
end

defmodule Qot_GetCapitalDistribution.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetCapitalDistribution.C2S
end

defmodule Qot_GetCapitalDistribution.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetCapitalDistribution.S2C
end