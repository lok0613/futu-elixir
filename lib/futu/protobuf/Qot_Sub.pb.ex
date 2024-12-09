defmodule Qot_Sub.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :securityList, 1, repeated: true, type: Qot_Common.Security
  field :subTypeList, 2, repeated: true, type: :int32
  field :isSubOrUnSub, 3, required: true, type: :bool
  field :isRegOrUnRegPush, 4, optional: true, type: :bool
  field :regPushRehabTypeList, 5, repeated: true, type: :int32
  field :isFirstPush, 6, optional: true, type: :bool
  field :isUnsubAll, 7, optional: true, type: :bool
  field :isSubOrderBookDetail, 8, optional: true, type: :bool
  field :extendedTime, 9, optional: true, type: :bool
end

defmodule Qot_Sub.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"
end

defmodule Qot_Sub.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_Sub.C2S
end

defmodule Qot_Sub.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_Sub.S2C
end