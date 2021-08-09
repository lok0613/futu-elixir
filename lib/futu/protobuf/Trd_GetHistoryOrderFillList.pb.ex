defmodule Trd_GetHistoryOrderFillList.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          filterConditions: Trd_Common.TrdFilterConditions.t() | nil
        }

  defstruct [:header, :filterConditions]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :filterConditions, 2, required: true, type: Trd_Common.TrdFilterConditions
end

defmodule Trd_GetHistoryOrderFillList.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          orderFillList: [Trd_Common.OrderFill.t()]
        }

  defstruct [:header, :orderFillList]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :orderFillList, 2, repeated: true, type: Trd_Common.OrderFill
end

defmodule Trd_GetHistoryOrderFillList.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Trd_GetHistoryOrderFillList.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Trd_GetHistoryOrderFillList.C2S
end

defmodule Trd_GetHistoryOrderFillList.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Trd_GetHistoryOrderFillList.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_GetHistoryOrderFillList.S2C
end
