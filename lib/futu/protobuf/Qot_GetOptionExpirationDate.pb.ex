defmodule Qot_GetOptionExpirationDate.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          owner: Qot_Common.Security.t() | nil,
          indexOptionType: integer
        }

  defstruct [:owner, :indexOptionType]

  field :owner, 1, required: true, type: Qot_Common.Security
  field :indexOptionType, 2, optional: true, type: :int32
end

defmodule Qot_GetOptionExpirationDate.OptionExpirationDate do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          strikeTime: String.t(),
          strikeTimestamp: float | :infinity | :negative_infinity | :nan,
          optionExpiryDateDistance: integer,
          cycle: integer
        }

  defstruct [:strikeTime, :strikeTimestamp, :optionExpiryDateDistance, :cycle]

  field :strikeTime, 1, optional: true, type: :string
  field :strikeTimestamp, 2, optional: true, type: :double
  field :optionExpiryDateDistance, 3, required: true, type: :int32
  field :cycle, 4, optional: true, type: :int32
end

defmodule Qot_GetOptionExpirationDate.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          dateList: [Qot_GetOptionExpirationDate.OptionExpirationDate.t()]
        }

  defstruct [:dateList]

  field :dateList, 1, repeated: true, type: Qot_GetOptionExpirationDate.OptionExpirationDate
end

defmodule Qot_GetOptionExpirationDate.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetOptionExpirationDate.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetOptionExpirationDate.C2S
end

defmodule Qot_GetOptionExpirationDate.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetOptionExpirationDate.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetOptionExpirationDate.S2C
end
