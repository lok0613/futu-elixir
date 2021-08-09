defmodule Qot_SetPriceReminder.SetPriceReminderOp do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :SetPriceReminderOp_Unknown
          | :SetPriceReminderOp_Add
          | :SetPriceReminderOp_Del
          | :SetPriceReminderOp_Enable
          | :SetPriceReminderOp_Disable
          | :SetPriceReminderOp_Modify
          | :SetPriceReminderOp_DelAll

  field :SetPriceReminderOp_Unknown, 0

  field :SetPriceReminderOp_Add, 1

  field :SetPriceReminderOp_Del, 2

  field :SetPriceReminderOp_Enable, 3

  field :SetPriceReminderOp_Disable, 4

  field :SetPriceReminderOp_Modify, 5

  field :SetPriceReminderOp_DelAll, 6
end

defmodule Qot_SetPriceReminder.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          op: integer,
          key: integer,
          type: integer,
          freq: integer,
          value: float | :infinity | :negative_infinity | :nan,
          note: String.t()
        }

  defstruct [:security, :op, :key, :type, :freq, :value, :note]

  field :security, 1, required: true, type: Qot_Common.Security
  field :op, 2, required: true, type: :int32
  field :key, 3, optional: true, type: :int64
  field :type, 4, optional: true, type: :int32
  field :freq, 7, optional: true, type: :int32
  field :value, 5, optional: true, type: :double
  field :note, 6, optional: true, type: :string
end

defmodule Qot_SetPriceReminder.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          key: integer
        }

  defstruct [:key]

  field :key, 1, required: true, type: :int64
end

defmodule Qot_SetPriceReminder.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_SetPriceReminder.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_SetPriceReminder.C2S
end

defmodule Qot_SetPriceReminder.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_SetPriceReminder.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_SetPriceReminder.S2C
end
