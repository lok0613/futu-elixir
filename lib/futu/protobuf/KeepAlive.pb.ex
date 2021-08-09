defmodule KeepAlive.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          time: integer
        }

  defstruct [:time]

  field :time, 1, required: true, type: :int64
end

defmodule KeepAlive.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          time: integer
        }

  defstruct [:time]

  field :time, 1, required: true, type: :int64
end

defmodule KeepAlive.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: KeepAlive.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: KeepAlive.C2S
end

defmodule KeepAlive.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: KeepAlive.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: KeepAlive.S2C
end
