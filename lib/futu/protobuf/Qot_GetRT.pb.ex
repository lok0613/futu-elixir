defmodule Qot_GetRT.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil
        }

  defstruct [:security]

  field :security, 1, required: true, type: Qot_Common.Security
end

defmodule Qot_GetRT.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          rtList: [Qot_Common.TimeShare.t()]
        }

  defstruct [:security, :rtList]

  field :security, 1, required: true, type: Qot_Common.Security
  field :rtList, 2, repeated: true, type: Qot_Common.TimeShare
end

defmodule Qot_GetRT.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetRT.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetRT.C2S
end

defmodule Qot_GetRT.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetRT.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetRT.S2C
end
