defmodule Qot_RequestTradeDate.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :market, 1, required: true, type: :int32
  field :beginTime, 2, required: true, type: :string
  field :endTime, 3, required: true, type: :string
  field :security, 4, optional: true, type: Qot_Common.Security
end

defmodule Qot_RequestTradeDate.TradeDate do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :time, 1, required: true, type: :string
  field :timestamp, 2, optional: true, type: :double
  field :tradeDateType, 3, optional: true, type: :int32
end

defmodule Qot_RequestTradeDate.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :tradeDateList, 1, repeated: true, type: Qot_RequestTradeDate.TradeDate
end

defmodule Qot_RequestTradeDate.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_RequestTradeDate.C2S
end

defmodule Qot_RequestTradeDate.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_RequestTradeDate.S2C
end