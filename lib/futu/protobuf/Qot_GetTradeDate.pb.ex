defmodule Qot_GetTradeDate.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :market, 1, required: true, type: :int32
  field :beginTime, 2, required: true, type: :string
  field :endTime, 3, required: true, type: :string
end

defmodule Qot_GetTradeDate.TradeDate do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :time, 1, required: true, type: :string
  field :timestamp, 2, optional: true, type: :double
  field :tradeDateType, 3, optional: true, type: :int32
end

defmodule Qot_GetTradeDate.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :tradeDateList, 1, repeated: true, type: Qot_GetTradeDate.TradeDate
end

defmodule Qot_GetTradeDate.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetTradeDate.C2S
end

defmodule Qot_GetTradeDate.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetTradeDate.S2C
end