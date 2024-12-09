defmodule Qot_SetPriceReminder.SetPriceReminderOp do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :SetPriceReminderOp_Unknown, 0
  field :SetPriceReminderOp_Add, 1
  field :SetPriceReminderOp_Del, 2
  field :SetPriceReminderOp_Enable, 3
  field :SetPriceReminderOp_Disable, 4
  field :SetPriceReminderOp_Modify, 5
  field :SetPriceReminderOp_DelAll, 6
end

defmodule Qot_SetPriceReminder.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :op, 2, required: true, type: :int32
  field :key, 3, optional: true, type: :int64
  field :type, 4, optional: true, type: :int32
  field :freq, 7, optional: true, type: :int32
  field :value, 5, optional: true, type: :double
  field :note, 6, optional: true, type: :string
end

defmodule Qot_SetPriceReminder.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :key, 1, required: true, type: :int64
end

defmodule Qot_SetPriceReminder.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_SetPriceReminder.C2S
end

defmodule Qot_SetPriceReminder.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_SetPriceReminder.S2C
end