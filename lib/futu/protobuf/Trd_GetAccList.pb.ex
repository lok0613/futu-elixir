defmodule Trd_GetAccList.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          userID: non_neg_integer
        }

  defstruct [:userID]

  field :userID, 1, required: true, type: :uint64
end

defmodule Trd_GetAccList.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          accList: [Trd_Common.TrdAcc.t()]
        }

  defstruct [:accList]

  field :accList, 1, repeated: true, type: Trd_Common.TrdAcc
end

defmodule Trd_GetAccList.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Trd_GetAccList.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Trd_GetAccList.C2S
end

defmodule Trd_GetAccList.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Trd_GetAccList.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_GetAccList.S2C
end
