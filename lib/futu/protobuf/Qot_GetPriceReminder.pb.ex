defmodule Qot_GetPriceReminder.PriceReminderItem do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :key, 1, required: true, type: :int64
  field :type, 2, required: true, type: :int32
  field :value, 3, required: true, type: :double
  field :note, 4, required: true, type: :string
  field :freq, 5, required: true, type: :int32
  field :isEnable, 6, required: true, type: :bool
end

defmodule Qot_GetPriceReminder.PriceReminder do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :name, 3, optional: true, type: :string
  field :itemList, 2, repeated: true, type: Qot_GetPriceReminder.PriceReminderItem
end

defmodule Qot_GetPriceReminder.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, optional: true, type: Qot_Common.Security
  field :market, 2, optional: true, type: :int32
end

defmodule Qot_GetPriceReminder.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :priceReminderList, 1, repeated: true, type: Qot_GetPriceReminder.PriceReminder
end

defmodule Qot_GetPriceReminder.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetPriceReminder.C2S
end

defmodule Qot_GetPriceReminder.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetPriceReminder.S2C
end