defmodule Qot_GetOptionChain.OptionCondType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :OptionCondType_Unknow, 0
  field :OptionCondType_WithIn, 1
  field :OptionCondType_Outside, 2
end

defmodule Qot_GetOptionChain.DataFilter do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :impliedVolatilityMin, 1, optional: true, type: :double
  field :impliedVolatilityMax, 2, optional: true, type: :double
  field :deltaMin, 3, optional: true, type: :double
  field :deltaMax, 4, optional: true, type: :double
  field :gammaMin, 5, optional: true, type: :double
  field :gammaMax, 6, optional: true, type: :double
  field :vegaMin, 7, optional: true, type: :double
  field :vegaMax, 8, optional: true, type: :double
  field :thetaMin, 9, optional: true, type: :double
  field :thetaMax, 10, optional: true, type: :double
  field :rhoMin, 11, optional: true, type: :double
  field :rhoMax, 12, optional: true, type: :double
  field :netOpenInterestMin, 13, optional: true, type: :double
  field :netOpenInterestMax, 14, optional: true, type: :double
  field :openInterestMin, 15, optional: true, type: :double
  field :openInterestMax, 16, optional: true, type: :double
  field :volMin, 17, optional: true, type: :double
  field :volMax, 18, optional: true, type: :double
end

defmodule Qot_GetOptionChain.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :owner, 1, required: true, type: Qot_Common.Security
  field :indexOptionType, 6, optional: true, type: :int32
  field :type, 2, optional: true, type: :int32
  field :condition, 3, optional: true, type: :int32
  field :beginTime, 4, required: true, type: :string
  field :endTime, 5, required: true, type: :string
  field :dataFilter, 7, optional: true, type: Qot_GetOptionChain.DataFilter
end

defmodule Qot_GetOptionChain.OptionItem do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :call, 1, optional: true, type: Qot_Common.SecurityStaticInfo
  field :put, 2, optional: true, type: Qot_Common.SecurityStaticInfo
end

defmodule Qot_GetOptionChain.OptionChain do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :strikeTime, 1, required: true, type: :string
  field :option, 2, repeated: true, type: Qot_GetOptionChain.OptionItem
  field :strikeTimestamp, 3, optional: true, type: :double
end

defmodule Qot_GetOptionChain.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :optionChain, 1, repeated: true, type: Qot_GetOptionChain.OptionChain
end

defmodule Qot_GetOptionChain.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetOptionChain.C2S
end

defmodule Qot_GetOptionChain.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetOptionChain.S2C
end