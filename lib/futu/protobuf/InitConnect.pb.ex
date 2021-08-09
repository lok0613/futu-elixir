defmodule InitConnect.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          clientVer: integer,
          clientID: String.t(),
          recvNotify: boolean,
          packetEncAlgo: integer,
          pushProtoFmt: integer,
          programmingLanguage: String.t()
        }

  defstruct [
    :clientVer,
    :clientID,
    :recvNotify,
    :packetEncAlgo,
    :pushProtoFmt,
    :programmingLanguage
  ]

  field :clientVer, 1, required: true, type: :int32
  field :clientID, 2, required: true, type: :string
  field :recvNotify, 3, optional: true, type: :bool
  field :packetEncAlgo, 4, optional: true, type: :int32
  field :pushProtoFmt, 5, optional: true, type: :int32
  field :programmingLanguage, 6, optional: true, type: :string
end

defmodule InitConnect.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          serverVer: integer,
          loginUserID: non_neg_integer,
          connID: non_neg_integer,
          connAESKey: String.t(),
          keepAliveInterval: integer,
          aesCBCiv: String.t(),
          userAttribution: integer
        }

  defstruct [
    :serverVer,
    :loginUserID,
    :connID,
    :connAESKey,
    :keepAliveInterval,
    :aesCBCiv,
    :userAttribution
  ]

  field :serverVer, 1, required: true, type: :int32
  field :loginUserID, 2, required: true, type: :uint64
  field :connID, 3, required: true, type: :uint64
  field :connAESKey, 4, required: true, type: :string
  field :keepAliveInterval, 5, required: true, type: :int32
  field :aesCBCiv, 6, optional: true, type: :string
  field :userAttribution, 7, optional: true, type: :int32
end

defmodule InitConnect.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: InitConnect.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: InitConnect.C2S
end

defmodule InitConnect.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: InitConnect.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: InitConnect.S2C
end
