defmodule Trd_UpdateOrderFill.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          orderFill: Trd_Common.OrderFill.t() | nil
        }

  defstruct [:header, :orderFill]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :orderFill, 2, required: true, type: Trd_Common.OrderFill
end

defmodule Trd_UpdateOrderFill.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Trd_UpdateOrderFill.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_UpdateOrderFill.S2C
end
