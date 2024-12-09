defmodule Qot_GetFutureInfo.TradeTime do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :begin, 1, optional: true, type: :double
  field :end, 2, optional: true, type: :double
end

defmodule Qot_GetFutureInfo.FutureInfo do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :name, 1, required: true, type: :string
  field :security, 2, required: true, type: Qot_Common.Security
  field :lastTradeTime, 3, required: true, type: :string
  field :lastTradeTimestamp, 4, optional: true, type: :double
  field :owner, 5, optional: true, type: Qot_Common.Security
  field :ownerOther, 6, required: true, type: :string
  field :exchange, 7, required: true, type: :string
  field :contractType, 8, required: true, type: :string
  field :contractSize, 9, required: true, type: :double
  field :contractSizeUnit, 10, required: true, type: :string
  field :quoteCurrency, 11, required: true, type: :string
  field :minVar, 12, required: true, type: :double
  field :minVarUnit, 13, required: true, type: :string
  field :quoteUnit, 14, optional: true, type: :string
  field :tradeTime, 15, repeated: true, type: Qot_GetFutureInfo.TradeTime
  field :timeZone, 16, required: true, type: :string
  field :exchangeFormatUrl, 17, required: true, type: :string
  field :origin, 18, optional: true, type: Qot_Common.Security
end

defmodule Qot_GetFutureInfo.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :securityList, 1, repeated: true, type: Qot_Common.Security
end

defmodule Qot_GetFutureInfo.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :futureInfoList, 1, repeated: true, type: Qot_GetFutureInfo.FutureInfo
end

defmodule Qot_GetFutureInfo.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetFutureInfo.C2S
end

defmodule Qot_GetFutureInfo.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetFutureInfo.S2C
end