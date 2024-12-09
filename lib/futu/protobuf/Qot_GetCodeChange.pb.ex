defmodule Qot_GetCodeChange.CodeChangeType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :CodeChangeType_Unkown, 0
  field :CodeChangeType_GemToMain, 1
  field :CodeChangeType_Unpaid, 2
  field :CodeChangeType_ChangeLot, 3
  field :CodeChangeType_Split, 4
  field :CodeChangeType_Joint, 5
  field :CodeChangeType_JointSplit, 6
  field :CodeChangeType_SplitJoint, 7
  field :CodeChangeType_Other, 8
end

defmodule Qot_GetCodeChange.TimeFilterType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :TimeFilterType_Unknow, 0
  field :TimeFilterType_Public, 1
  field :TimeFilterType_Effective, 2
  field :TimeFilterType_End, 3
end

defmodule Qot_GetCodeChange.CodeChangeInfo do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :type, 1, required: true, type: :int32
  field :security, 2, required: true, type: Qot_Common.Security
  field :relatedSecurity, 3, required: true, type: Qot_Common.Security
  field :publicTime, 4, optional: true, type: :string
  field :publicTimestamp, 5, optional: true, type: :double
  field :effectiveTime, 6, optional: true, type: :string
  field :effectiveTimestamp, 7, optional: true, type: :double
  field :endTime, 8, optional: true, type: :string
  field :endTimestamp, 9, optional: true, type: :double
end

defmodule Qot_GetCodeChange.TimeFilter do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :type, 1, required: true, type: :int32
  field :beginTime, 2, optional: true, type: :string
  field :endTime, 3, optional: true, type: :string
end

defmodule Qot_GetCodeChange.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :placeHolder, 1, optional: true, type: :int32
  field :securityList, 2, repeated: true, type: Qot_Common.Security
  field :timeFilterList, 3, repeated: true, type: Qot_GetCodeChange.TimeFilter
  field :typeList, 4, repeated: true, type: :int32
end

defmodule Qot_GetCodeChange.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :codeChangeList, 1, repeated: true, type: Qot_GetCodeChange.CodeChangeInfo
end

defmodule Qot_GetCodeChange.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Qot_GetCodeChange.C2S
end

defmodule Qot_GetCodeChange.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Qot_GetCodeChange.S2C
end