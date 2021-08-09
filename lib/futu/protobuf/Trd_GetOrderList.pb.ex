defmodule Trd_GetOrderList.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          filterConditions: Trd_Common.TrdFilterConditions.t() | nil,
          filterStatusList: [integer],
          refreshCache: boolean
        }

  defstruct [:header, :filterConditions, :filterStatusList, :refreshCache]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :filterConditions, 2, optional: true, type: Trd_Common.TrdFilterConditions
  field :filterStatusList, 3, repeated: true, type: :int32
  field :refreshCache, 4, optional: true, type: :bool
end

defmodule Trd_GetOrderList.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          orderList: [Trd_Common.Order.t()]
        }

  defstruct [:header, :orderList]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :orderList, 2, repeated: true, type: Trd_Common.Order
end

defmodule Trd_GetOrderList.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Trd_GetOrderList.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Trd_GetOrderList.C2S
end

defmodule Trd_GetOrderList.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Trd_GetOrderList.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_GetOrderList.S2C
end
