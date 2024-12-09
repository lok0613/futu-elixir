defmodule Qot_GetCapitalFlow.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :periodType, 2, optional: true, type: :int32
  field :beginTime, 3, optional: true, type: :string
  field :endTime, 4, optional: true, type: :string
end

defmodule Qot_GetCapitalFlow.CapitalFlowItem do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :inFlow, 1, required: true, type: :double
  field :time, 2, optional: true, type: :string
  field :timestamp, 3, optional: true, type: :double
  field :mainInFlow, 4, optional: true, type: :double
  field :superInFlow, 5, optional: true, type: :double
  field :bigInFlow, 6, optional: true, type: :double
  field :midInFlow, 7, optional: true, type: :double
  field :smlInFlow, 8, optional: true, type: :double
end

defmodule Qot_GetCapitalFlow.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :flowItemList, 1, repeated: true, type: Qot_GetCapitalFlow.CapitalFlowItem
  field :lastValidTime, 2, optional: true, type: :string
  field :lastValidTimestamp, 3, optional: true, type: :double
end

defmodule Qot_GetCapitalFlow.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetCapitalFlow.C2S
end

defmodule Qot_GetCapitalFlow.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetCapitalFlow.S2C
end