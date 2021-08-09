defmodule Qot_UpdateBasicQot.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          basicQotList: [Qot_Common.BasicQot.t()]
        }

  defstruct [:basicQotList]

  field :basicQotList, 1, repeated: true, type: Qot_Common.BasicQot
end

defmodule Qot_UpdateBasicQot.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_UpdateBasicQot.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_UpdateBasicQot.S2C
end
