defmodule Qot_RequestHistoryKLQuota.DetailItem do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :name, 4, optional: true, type: :string
  field :requestTime, 2, required: true, type: :string
  field :requestTimeStamp, 3, optional: true, type: :int64
end

defmodule Qot_RequestHistoryKLQuota.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :bGetDetail, 2, optional: true, type: :bool
end

defmodule Qot_RequestHistoryKLQuota.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :usedQuota, 1, required: true, type: :int32
  field :remainQuota, 2, required: true, type: :int32
  field :detailList, 3, repeated: true, type: Qot_RequestHistoryKLQuota.DetailItem
end

defmodule Qot_RequestHistoryKLQuota.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_RequestHistoryKLQuota.C2S
end

defmodule Qot_RequestHistoryKLQuota.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_RequestHistoryKLQuota.S2C
end