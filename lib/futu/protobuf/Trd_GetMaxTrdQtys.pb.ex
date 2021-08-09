defmodule Trd_GetMaxTrdQtys.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          orderType: integer,
          code: String.t(),
          price: float | :infinity | :negative_infinity | :nan,
          orderID: non_neg_integer,
          adjustPrice: boolean,
          adjustSideAndLimit: float | :infinity | :negative_infinity | :nan,
          secMarket: integer
        }

  defstruct [
    :header,
    :orderType,
    :code,
    :price,
    :orderID,
    :adjustPrice,
    :adjustSideAndLimit,
    :secMarket
  ]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :orderType, 2, required: true, type: :int32
  field :code, 3, required: true, type: :string
  field :price, 4, required: true, type: :double
  field :orderID, 5, optional: true, type: :uint64
  field :adjustPrice, 6, optional: true, type: :bool
  field :adjustSideAndLimit, 7, optional: true, type: :double
  field :secMarket, 8, optional: true, type: :int32
end

defmodule Trd_GetMaxTrdQtys.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          maxTrdQtys: Trd_Common.MaxTrdQtys.t() | nil
        }

  defstruct [:header, :maxTrdQtys]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :maxTrdQtys, 2, optional: true, type: Trd_Common.MaxTrdQtys
end

defmodule Trd_GetMaxTrdQtys.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Trd_GetMaxTrdQtys.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Trd_GetMaxTrdQtys.C2S
end

defmodule Trd_GetMaxTrdQtys.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Trd_GetMaxTrdQtys.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_GetMaxTrdQtys.S2C
end
