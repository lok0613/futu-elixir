defmodule Qot_RequestHistoryKL.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :rehabType, 1, required: true, type: :int32
  field :klType, 2, required: true, type: :int32
  field :security, 3, required: true, type: Qot_Common.Security
  field :beginTime, 4, required: true, type: :string
  field :endTime, 5, required: true, type: :string
  field :maxAckKLNum, 6, optional: true, type: :int32
  field :needKLFieldsFlag, 7, optional: true, type: :int64
  field :nextReqKey, 8, optional: true, type: :bytes
  field :extendedTime, 9, optional: true, type: :bool
end

defmodule Qot_RequestHistoryKL.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :name, 4, optional: true, type: :string
  field :klList, 2, repeated: true, type: Qot_Common.KLine
  field :nextReqKey, 3, optional: true, type: :bytes
end

defmodule Qot_RequestHistoryKL.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_RequestHistoryKL.C2S
end

defmodule Qot_RequestHistoryKL.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_RequestHistoryKL.S2C
end