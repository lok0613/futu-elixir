defmodule Common.RetType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :RetType_Succeed
          | :RetType_Failed
          | :RetType_TimeOut
          | :RetType_DisConnect
          | :RetType_Unknown
          | :RetType_Invalid

  field :RetType_Succeed, 0

  field :RetType_Failed, -1

  field :RetType_TimeOut, -100

  field :RetType_DisConnect, -200

  field :RetType_Unknown, -400

  field :RetType_Invalid, -500
end

defmodule Common.PacketEncAlgo do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :PacketEncAlgo_FTAES_ECB
          | :PacketEncAlgo_None
          | :PacketEncAlgo_AES_ECB
          | :PacketEncAlgo_AES_CBC

  field :PacketEncAlgo_FTAES_ECB, 0

  field :PacketEncAlgo_None, -1

  field :PacketEncAlgo_AES_ECB, 1

  field :PacketEncAlgo_AES_CBC, 2
end

defmodule Common.ProtoFmt do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :ProtoFmt_Protobuf | :ProtoFmt_Json

  field :ProtoFmt_Protobuf, 0

  field :ProtoFmt_Json, 1
end

defmodule Common.UserAttribution do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :UserAttribution_Unknown
          | :UserAttribution_NN
          | :UserAttribution_MM
          | :UserAttribution_SG

  field :UserAttribution_Unknown, 0

  field :UserAttribution_NN, 1

  field :UserAttribution_MM, 2

  field :UserAttribution_SG, 3
end

defmodule Common.ProgramStatusType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :ProgramStatusType_None
          | :ProgramStatusType_Loaded
          | :ProgramStatusType_Loging
          | :ProgramStatusType_NeedPicVerifyCode
          | :ProgramStatusType_NeedPhoneVerifyCode
          | :ProgramStatusType_LoginFailed
          | :ProgramStatusType_ForceUpdate
          | :ProgramStatusType_NessaryDataPreparing
          | :ProgramStatusType_NessaryDataMissing
          | :ProgramStatusType_UnAgreeDisclaimer
          | :ProgramStatusType_Ready
          | :ProgramStatusType_ForceLogout
          | :ProgramStatusType_DisclaimerPullFailed

  field :ProgramStatusType_None, 0

  field :ProgramStatusType_Loaded, 1

  field :ProgramStatusType_Loging, 2

  field :ProgramStatusType_NeedPicVerifyCode, 3

  field :ProgramStatusType_NeedPhoneVerifyCode, 4

  field :ProgramStatusType_LoginFailed, 5

  field :ProgramStatusType_ForceUpdate, 6

  field :ProgramStatusType_NessaryDataPreparing, 7

  field :ProgramStatusType_NessaryDataMissing, 8

  field :ProgramStatusType_UnAgreeDisclaimer, 9

  field :ProgramStatusType_Ready, 10

  field :ProgramStatusType_ForceLogout, 11

  field :ProgramStatusType_DisclaimerPullFailed, 12
end

defmodule Common.PacketID do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          connID: non_neg_integer,
          serialNo: non_neg_integer
        }

  defstruct [:connID, :serialNo]

  field :connID, 1, required: true, type: :uint64
  field :serialNo, 2, required: true, type: :uint32
end

defmodule Common.ProgramStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: Common.ProgramStatusType.t(),
          strExtDesc: String.t()
        }

  defstruct [:type, :strExtDesc]

  field :type, 1, required: true, type: Common.ProgramStatusType, enum: true
  field :strExtDesc, 2, optional: true, type: :string
end
