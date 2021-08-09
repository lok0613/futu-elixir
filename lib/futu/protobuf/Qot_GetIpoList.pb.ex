defmodule Qot_GetIpoList.BasicIpoData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          name: String.t(),
          listTime: String.t(),
          listTimestamp: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:security, :name, :listTime, :listTimestamp]

  field :security, 1, required: true, type: Qot_Common.Security
  field :name, 2, required: true, type: :string
  field :listTime, 3, optional: true, type: :string
  field :listTimestamp, 4, optional: true, type: :double
end

defmodule Qot_GetIpoList.CNIpoExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          applyCode: String.t(),
          issueSize: integer,
          onlineIssueSize: integer,
          applyUpperLimit: integer,
          applyLimitMarketValue: integer,
          isEstimateIpoPrice: boolean,
          ipoPrice: float | :infinity | :negative_infinity | :nan,
          industryPeRate: float | :infinity | :negative_infinity | :nan,
          isEstimateWinningRatio: boolean,
          winningRatio: float | :infinity | :negative_infinity | :nan,
          issuePeRate: float | :infinity | :negative_infinity | :nan,
          applyTime: String.t(),
          applyTimestamp: float | :infinity | :negative_infinity | :nan,
          winningTime: String.t(),
          winningTimestamp: float | :infinity | :negative_infinity | :nan,
          isHasWon: boolean,
          winningNumData: [Qot_GetIpoList.WinningNumData.t()]
        }

  defstruct [
    :applyCode,
    :issueSize,
    :onlineIssueSize,
    :applyUpperLimit,
    :applyLimitMarketValue,
    :isEstimateIpoPrice,
    :ipoPrice,
    :industryPeRate,
    :isEstimateWinningRatio,
    :winningRatio,
    :issuePeRate,
    :applyTime,
    :applyTimestamp,
    :winningTime,
    :winningTimestamp,
    :isHasWon,
    :winningNumData
  ]

  field :applyCode, 1, required: true, type: :string
  field :issueSize, 2, required: true, type: :int64
  field :onlineIssueSize, 3, required: true, type: :int64
  field :applyUpperLimit, 4, required: true, type: :int64
  field :applyLimitMarketValue, 5, required: true, type: :int64
  field :isEstimateIpoPrice, 6, required: true, type: :bool
  field :ipoPrice, 7, required: true, type: :double
  field :industryPeRate, 8, required: true, type: :double
  field :isEstimateWinningRatio, 9, required: true, type: :bool
  field :winningRatio, 10, required: true, type: :double
  field :issuePeRate, 11, required: true, type: :double
  field :applyTime, 12, optional: true, type: :string
  field :applyTimestamp, 13, optional: true, type: :double
  field :winningTime, 14, optional: true, type: :string
  field :winningTimestamp, 15, optional: true, type: :double
  field :isHasWon, 16, required: true, type: :bool
  field :winningNumData, 17, repeated: true, type: Qot_GetIpoList.WinningNumData
end

defmodule Qot_GetIpoList.WinningNumData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          winningName: String.t(),
          winningInfo: String.t()
        }

  defstruct [:winningName, :winningInfo]

  field :winningName, 1, required: true, type: :string
  field :winningInfo, 2, required: true, type: :string
end

defmodule Qot_GetIpoList.HKIpoExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ipoPriceMin: float | :infinity | :negative_infinity | :nan,
          ipoPriceMax: float | :infinity | :negative_infinity | :nan,
          listPrice: float | :infinity | :negative_infinity | :nan,
          lotSize: integer,
          entrancePrice: float | :infinity | :negative_infinity | :nan,
          isSubscribeStatus: boolean,
          applyEndTime: String.t(),
          applyEndTimestamp: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :ipoPriceMin,
    :ipoPriceMax,
    :listPrice,
    :lotSize,
    :entrancePrice,
    :isSubscribeStatus,
    :applyEndTime,
    :applyEndTimestamp
  ]

  field :ipoPriceMin, 1, required: true, type: :double
  field :ipoPriceMax, 2, required: true, type: :double
  field :listPrice, 3, required: true, type: :double
  field :lotSize, 4, required: true, type: :int32
  field :entrancePrice, 5, required: true, type: :double
  field :isSubscribeStatus, 6, required: true, type: :bool
  field :applyEndTime, 7, optional: true, type: :string
  field :applyEndTimestamp, 8, optional: true, type: :double
end

defmodule Qot_GetIpoList.USIpoExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ipoPriceMin: float | :infinity | :negative_infinity | :nan,
          ipoPriceMax: float | :infinity | :negative_infinity | :nan,
          issueSize: integer
        }

  defstruct [:ipoPriceMin, :ipoPriceMax, :issueSize]

  field :ipoPriceMin, 1, required: true, type: :double
  field :ipoPriceMax, 2, required: true, type: :double
  field :issueSize, 3, required: true, type: :int64
end

defmodule Qot_GetIpoList.IpoData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          basic: Qot_GetIpoList.BasicIpoData.t() | nil,
          cnExData: Qot_GetIpoList.CNIpoExData.t() | nil,
          hkExData: Qot_GetIpoList.HKIpoExData.t() | nil,
          usExData: Qot_GetIpoList.USIpoExData.t() | nil
        }

  defstruct [:basic, :cnExData, :hkExData, :usExData]

  field :basic, 1, required: true, type: Qot_GetIpoList.BasicIpoData
  field :cnExData, 2, optional: true, type: Qot_GetIpoList.CNIpoExData
  field :hkExData, 3, optional: true, type: Qot_GetIpoList.HKIpoExData
  field :usExData, 4, optional: true, type: Qot_GetIpoList.USIpoExData
end

defmodule Qot_GetIpoList.C2S do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          market: integer
        }

  defstruct [:market]

  field :market, 1, required: true, type: :int32
end

defmodule Qot_GetIpoList.S2C do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ipoList: [Qot_GetIpoList.IpoData.t()]
        }

  defstruct [:ipoList]

  field :ipoList, 1, repeated: true, type: Qot_GetIpoList.IpoData
end

defmodule Qot_GetIpoList.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          c2s: Qot_GetIpoList.C2S.t() | nil
        }

  defstruct [:c2s]

  field :c2s, 1, required: true, type: Qot_GetIpoList.C2S
end

defmodule Qot_GetIpoList.Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          retType: integer,
          retMsg: String.t(),
          errCode: integer,
          s2c: Qot_GetIpoList.S2C.t() | nil
        }

  defstruct [:retType, :retMsg, :errCode, :s2c]

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetIpoList.S2C
end
