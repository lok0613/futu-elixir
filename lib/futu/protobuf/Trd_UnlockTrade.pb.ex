defmodule Trd_UnlockTrade.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          unlock: boolean,
          pwdMD5: String.t(),
          securityFirm: integer
        }

  defstruct [:unlock, :pwdMD5, :securityFirm]

  field :unlock, 1, required: true, type: :bool
  field :pwdMD5, 2, optional: true, type: :string
  field :securityFirm, 3, optional: true, type: :int32
end

defmodule Trd_UnlockTrade.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2
  @type t :: %__MODULE__{}

  defstruct []
end

defmodule Trd_UnlockTrade.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Trd_UnlockTrade.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Trd_UnlockTrade.C2S
end

defmodule Trd_UnlockTrade.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Trd_UnlockTrade.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Trd_UnlockTrade.S2C
end
