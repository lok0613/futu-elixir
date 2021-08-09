defmodule Qot_Sub.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          securityList: [Qot_Common.Security.t()],
          subTypeList: [integer],
          isSubOrUnSub: boolean,
          isRegOrUnRegPush: boolean,
          regPushRehabTypeList: [integer],
          isFirstPush: boolean,
          isUnsubAll: boolean,
          isSubOrderBookDetail: boolean,
          extendedTime: boolean
        }

  defstruct [
    :securityList,
    :subTypeList,
    :isSubOrUnSub,
    :isRegOrUnRegPush,
    :regPushRehabTypeList,
    :isFirstPush,
    :isUnsubAll,
    :isSubOrderBookDetail,
    :extendedTime
  ]

  field :securityList, 1, repeated: true, type: Qot_Common.Security
  field :subTypeList, 2, repeated: true, type: :int32
  field :isSubOrUnSub, 3, required: true, type: :bool
  field :isRegOrUnRegPush, 4, optional: true, type: :bool
  field :regPushRehabTypeList, 5, repeated: true, type: :int32
  field :isFirstPush, 6, optional: true, type: :bool
  field :isUnsubAll, 7, optional: true, type: :bool
  field :isSubOrderBookDetail, 8, optional: true, type: :bool
  field :extendedTime, 9, optional: true, type: :bool
end

defmodule Qot_Sub.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2
  @type t :: %__MODULE__{}

  defstruct []
end

defmodule Qot_Sub.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_Sub.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_Sub.C2S
end

defmodule Qot_Sub.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_Sub.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_Sub.S2C
end
