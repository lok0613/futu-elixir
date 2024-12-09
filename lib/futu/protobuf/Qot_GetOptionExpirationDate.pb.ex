defmodule Qot_GetOptionExpirationDate.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :owner, 1, required: true, type: Qot_Common.Security
  field :indexOptionType, 2, optional: true, type: :int32
end

defmodule Qot_GetOptionExpirationDate.OptionExpirationDate do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :strikeTime, 1, optional: true, type: :string
  field :strikeTimestamp, 2, optional: true, type: :double
  field :optionExpiryDateDistance, 3, required: true, type: :int32
  field :cycle, 4, optional: true, type: :int32
end

defmodule Qot_GetOptionExpirationDate.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :dateList, 1, repeated: true, type: Qot_GetOptionExpirationDate.OptionExpirationDate
end

defmodule Qot_GetOptionExpirationDate.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetOptionExpirationDate.C2S
end

defmodule Qot_GetOptionExpirationDate.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetOptionExpirationDate.S2C
end