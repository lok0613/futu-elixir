defmodule GetUserInfo.UpdateType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :UpdateType_None | :UpdateType_Advice | :UpdateType_Force

  field :UpdateType_None, 0

  field :UpdateType_Advice, 1

  field :UpdateType_Force, 2
end

defmodule GetUserInfo.UserInfoField do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :UserInfoField_Basic
          | :UserInfoField_API
          | :UserInfoField_QotRight
          | :UserInfoField_Disclaimer
          | :UserInfoField_Update
          | :UserInfoField_WebKey

  field :UserInfoField_Basic, 1

  field :UserInfoField_API, 2

  field :UserInfoField_QotRight, 4

  field :UserInfoField_Disclaimer, 8

  field :UserInfoField_Update, 16

  field :UserInfoField_WebKey, 2048
end

defmodule GetUserInfo.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          flag: integer
        }

  defstruct [:flag]

  field :flag, 2, optional: true, type: :int32
end

defmodule GetUserInfo.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          nickName: String.t(),
          avatarUrl: String.t(),
          apiLevel: String.t(),
          hkQotRight: integer,
          usQotRight: integer,
          cnQotRight: integer,
          isNeedAgreeDisclaimer: boolean,
          userID: integer,
          updateType: integer,
          webKey: String.t(),
          webJumpUrlHead: String.t(),
          hkOptionQotRight: integer,
          hasUSOptionQotRight: boolean,
          hkFutureQotRight: integer,
          subQuota: integer,
          historyKLQuota: integer,
          usFutureQotRight: integer,
          usOptionQotRight: integer,
          userAttribution: integer,
          updateWhatsNew: String.t()
        }

  defstruct [
    :nickName,
    :avatarUrl,
    :apiLevel,
    :hkQotRight,
    :usQotRight,
    :cnQotRight,
    :isNeedAgreeDisclaimer,
    :userID,
    :updateType,
    :webKey,
    :webJumpUrlHead,
    :hkOptionQotRight,
    :hasUSOptionQotRight,
    :hkFutureQotRight,
    :subQuota,
    :historyKLQuota,
    :usFutureQotRight,
    :usOptionQotRight,
    :userAttribution,
    :updateWhatsNew
  ]

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
end

defmodule GetUserInfo.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: GetUserInfo.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: GetUserInfo.C2S
end

defmodule GetUserInfo.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: GetUserInfo.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: GetUserInfo.S2C
end
