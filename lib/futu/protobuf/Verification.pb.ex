defmodule Verification.VerificationType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :VerificationType_Unknow, 0
  field :VerificationType_Picture, 1
  field :VerificationType_Phone, 2
end

defmodule Verification.VerificationOp do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :VerificationOp_Unknow, 0
  field :VerificationOp_Request, 1
  field :VerificationOp_InputAndLogin, 2
end

defmodule Verification.C2S do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :type, 1, required: true, type: :int32
  field :op, 2, required: true, type: :int32
  field :code, 3, optional: true, type: :string
end

defmodule Verification.S2C do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"
end

defmodule Verification.Request do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :c2s, 1, required: true, type: Verification.C2S
end

defmodule Verification.Response do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :retType, 1, required: true, type: :int32, default: -400
  field :retMsg, 2, optional: true, type: :string
  field :errCode, 3, optional: true, type: :int32
  field :s2c, 4, optional: true, type: Verification.S2C
end