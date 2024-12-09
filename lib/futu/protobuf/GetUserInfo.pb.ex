defmodule GetUserInfo.UpdateType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :UpdateType_None, 0
  field :UpdateType_Advice, 1
  field :UpdateType_Force, 2
end

defmodule GetUserInfo.UserInfoField do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :UserInfoField_Basic, 1
  field :UserInfoField_API, 2
  field :UserInfoField_QotRight, 4
  field :UserInfoField_Disclaimer, 8
  field :UserInfoField_Update, 16
  field :UserInfoField_WebKey, 2048
end

defmodule GetUserInfo.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :flag, 2, optional: true, type: :int32
end

defmodule GetUserInfo.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :nickName, 1, optional: true, type: :string
  field :avatarUrl, 2, optional: true, type: :string
  field :apiLevel, 3, optional: true, type: :string
  field :hkQotRight, 4, optional: true, type: :int32
  field :usQotRight, 5, optional: true, type: :int32
  field :cnQotRight, 6, optional: true, type: :int32
  field :isNeedAgreeDisclaimer, 7, optional: true, type: :bool
  field :userID, 8, optional: true, type: :int64
  field :updateType, 9, optional: true, type: :int32
  field :webKey, 10, optional: true, type: :string
  field :webJumpUrlHead, 18, optional: true, type: :string
  field :hkOptionQotRight, 11, optional: true, type: :int32
  field :hasUSOptionQotRight, 12, optional: true, type: :bool
  field :hkFutureQotRight, 13, optional: true, type: :int32
  field :subQuota, 14, optional: true, type: :int32
  field :historyKLQuota, 15, optional: true, type: :int32
  field :usFutureQotRight, 16, optional: true, type: :int32
  field :usOptionQotRight, 17, optional: true, type: :int32
  field :userAttribution, 19, optional: true, type: :int32
  field :updateWhatsNew, 20, optional: true, type: :string
  field :usIndexQotRight, 21, optional: true, type: :int32
  field :usOtcQotRight, 22, optional: true, type: :int32
  field :usCMEFutureQotRight, 23, optional: true, type: :int32
  field :usCBOTFutureQotRight, 24, optional: true, type: :int32
  field :usNYMEXFutureQotRight, 25, optional: true, type: :int32
  field :usCOMEXFutureQotRight, 26, optional: true, type: :int32
  field :usCBOEFutureQotRight, 27, optional: true, type: :int32
  field :sgFutureQotRight, 28, optional: true, type: :int32
  field :jpFutureQotRight, 29, optional: true, type: :int32
  field :isAppNNOrMM, 30, optional: true, type: :bool
  field :shQotRight, 31, optional: true, type: :int32
  field :szQotRight, 32, optional: true, type: :int32
end

defmodule GetUserInfo.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: GetUserInfo.C2S
end

defmodule GetUserInfo.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: GetUserInfo.S2C
end