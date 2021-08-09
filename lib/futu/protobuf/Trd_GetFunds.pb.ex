defmodule Trd_GetFunds.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          refreshCache: boolean,
          currency: integer
        }

  defstruct [:header, :refreshCache, :currency]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :refreshCache, 2, optional: true, type: :bool
  field :currency, 3, optional: true, type: :int32
end

defmodule Trd_GetFunds.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          header: Trd_Common.TrdHeader.t() | nil,
          funds: Trd_Common.Funds.t() | nil
        }

  defstruct [:header, :funds]

  field :header, 1, required: true, type: Trd_Common.TrdHeader
  field :funds, 2, optional: true, type: Trd_Common.Funds
end

defmodule Trd_GetFunds.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Trd_GetFunds.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Trd_GetFunds.C2S
end

defmodule Trd_GetFunds.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Trd_GetFunds.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_GetFunds.S2C
end
