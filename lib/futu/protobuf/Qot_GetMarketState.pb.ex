defmodule Qot_GetMarketState.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          securityList: [Qot_Common.Security.t()]
        }

  defstruct [:securityList]

  field :securityList, 1, repeated: true, type: Qot_Common.Security
end

defmodule Qot_GetMarketState.MarketInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          name: String.t(),
          marketState: integer
        }

  defstruct [:security, :name, :marketState]

  field :security, 1, required: true, type: Qot_Common.Security
  field :name, 2, required: true, type: :string
  field :marketState, 3, required: true, type: :int32
end

defmodule Qot_GetMarketState.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          marketInfoList: [Qot_GetMarketState.MarketInfo.t()]
        }

  defstruct [:marketInfoList]

  field :marketInfoList, 1, repeated: true, type: Qot_GetMarketState.MarketInfo
end

defmodule Qot_GetMarketState.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetMarketState.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetMarketState.C2S
end

defmodule Qot_GetMarketState.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetMarketState.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetMarketState.S2C
end
