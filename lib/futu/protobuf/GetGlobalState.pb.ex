defmodule GetGlobalState.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          userID: non_neg_integer
        }

  defstruct [:userID]

  field :userID, 1, required: true, type: :uint64
end

defmodule GetGlobalState.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          marketHK: integer,
          marketUS: integer,
          marketSH: integer,
          marketSZ: integer,
          marketHKFuture: integer,
          marketUSFuture: integer,
          marketSGFuture: integer,
          marketJPFuture: integer,
          qotLogined: boolean,
          trdLogined: boolean,
          serverVer: integer,
          serverBuildNo: integer,
          time: integer,
          localTime: float | :infinity | :negative_infinity | :nan,
          programStatus: Common.ProgramStatus.t() | nil,
          qotSvrIpAddr: String.t(),
          trdSvrIpAddr: String.t(),
          connID: non_neg_integer
        }

  defstruct [
    :marketHK,
    :marketUS,
    :marketSH,
    :marketSZ,
    :marketHKFuture,
    :marketUSFuture,
    :marketSGFuture,
    :marketJPFuture,
    :qotLogined,
    :trdLogined,
    :serverVer,
    :serverBuildNo,
    :time,
    :localTime,
    :programStatus,
    :qotSvrIpAddr,
    :trdSvrIpAddr,
    :connID
  ]

  field :marketHK, 1, required: true, type: :int32
  field :marketUS, 2, required: true, type: :int32
  field :marketSH, 3, required: true, type: :int32
  field :marketSZ, 4, required: true, type: :int32
  field :marketHKFuture, 5, required: true, type: :int32
  field :marketUSFuture, 15, optional: true, type: :int32
  field :marketSGFuture, 17, optional: true, type: :int32
  field :marketJPFuture, 18, optional: true, type: :int32
  field :qotLogined, 6, required: true, type: :bool
  field :trdLogined, 7, required: true, type: :bool
  field :serverVer, 8, required: true, type: :int32
  field :serverBuildNo, 9, required: true, type: :int32
  field :time, 10, required: true, type: :int64
  field :localTime, 11, optional: true, type: :double
  field :programStatus, 12, optional: true, type: Common.ProgramStatus
  field :qotSvrIpAddr, 13, optional: true, type: :string
  field :trdSvrIpAddr, 14, optional: true, type: :string
  field :connID, 16, optional: true, type: :uint64
end

defmodule GetGlobalState.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: GetGlobalState.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: GetGlobalState.C2S
end

defmodule GetGlobalState.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: GetGlobalState.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: GetGlobalState.S2C
end
