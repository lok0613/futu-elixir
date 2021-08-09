defmodule Qot_GetSubInfo.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          isReqAllConn: boolean
        }

  defstruct [:isReqAllConn]

  field :isReqAllConn, 1, optional: true, type: :bool
end

defmodule Qot_GetSubInfo.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          connSubInfoList: [Qot_Common.ConnSubInfo.t()],
          totalUsedQuota: integer,
          remainQuota: integer
        }

  defstruct [:connSubInfoList, :totalUsedQuota, :remainQuota]

  field :connSubInfoList, 1, repeated: true, type: Qot_Common.ConnSubInfo
  field :totalUsedQuota, 2, required: true, type: :int32
  field :remainQuota, 3, required: true, type: :int32
end

defmodule Qot_GetSubInfo.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetSubInfo.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetSubInfo.C2S
end

defmodule Qot_GetSubInfo.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetSubInfo.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetSubInfo.S2C
end
