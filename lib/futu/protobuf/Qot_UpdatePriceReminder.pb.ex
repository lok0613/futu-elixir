defmodule Qot_UpdatePriceReminder.MarketStatus do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :MarketStatus_Unknow, 0
  field :MarketStatus_Open, 1
  field :MarketStatus_USPre, 2
  field :MarketStatus_USAfter, 3
end

defmodule Qot_UpdatePriceReminder.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :name, 11, optional: true, type: :string
  field :price, 2, required: true, type: :double
  field :changeRate, 3, required: true, type: :double
  field :marketStatus, 4, required: true, type: :int32
  field :content, 5, required: true, type: :string
  field :note, 6, required: true, type: :string
  field :key, 7, optional: true, type: :int64
  field :type, 8, optional: true, type: :int32
  field :setValue, 9, optional: true, type: :double
  field :curValue, 10, optional: true, type: :double
end

defmodule Qot_UpdatePriceReminder.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_UpdatePriceReminder.S2C
end