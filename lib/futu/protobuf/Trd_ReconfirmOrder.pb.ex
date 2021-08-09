defmodule Trd_ReconfirmOrder.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          packetID: Common.PacketID.t() | nil,
          header: Trd_Common.TrdHeader.t() | nil,
          orderID: non_neg_integer,
          reconfirmReason: integer
        }

  defstruct [:packetID, :header, :orderID, :reconfirmReason]

  field :packetID, 1, required: true, type: Common.PacketID
  field :header, 2, required: true, type: Trd_Common.TrdHeader
  field :orderID, 3, required: true, type: :uint64
  field :reconfirmReason, 4, required: true, type: :int32
end

defmodule Trd_ReconfirmOrder.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          orderID: non_neg_integer
        }

  defstruct [:header, :orderID]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :orderID, 2, required: true, type: :uint64
end

defmodule Trd_ReconfirmOrder.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Trd_ReconfirmOrder.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Trd_ReconfirmOrder.C2S
end

defmodule Trd_ReconfirmOrder.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Trd_ReconfirmOrder.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_ReconfirmOrder.S2C
end
