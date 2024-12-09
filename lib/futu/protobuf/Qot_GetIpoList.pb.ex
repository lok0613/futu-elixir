defmodule Qot_GetIpoList.BasicIpoData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :security, 1, required: true, type: Qot_Common.Security
  field :name, 2, required: true, type: :string
  field :listTime, 3, optional: true, type: :string
  field :listTimestamp, 4, optional: true, type: :double
end

defmodule Qot_GetIpoList.CNIpoExData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

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

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :winningName, 1, required: true, type: :string
  field :winningInfo, 2, required: true, type: :string
end

defmodule Qot_GetIpoList.HKIpoExData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

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

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :ipoPriceMin, 1, required: true, type: :double
  field :ipoPriceMax, 2, required: true, type: :double
  field :issueSize, 3, required: true, type: :int64
end

defmodule Qot_GetIpoList.IpoData do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :basic, 1, required: true, type: Qot_GetIpoList.BasicIpoData
  field :cnExData, 2, optional: true, type: Qot_GetIpoList.CNIpoExData
  field :hkExData, 3, optional: true, type: Qot_GetIpoList.HKIpoExData
  field :usExData, 4, optional: true, type: Qot_GetIpoList.USIpoExData
end

defmodule Qot_GetIpoList.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :market, 1, required: true, type: :int32
end

defmodule Qot_GetIpoList.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :ipoList, 1, repeated: true, type: Qot_GetIpoList.IpoData
end

defmodule Qot_GetIpoList.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetIpoList.C2S
end

defmodule Qot_GetIpoList.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetIpoList.S2C
end