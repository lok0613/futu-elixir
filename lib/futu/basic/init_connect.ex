defmodule Futu.Basic.InitConnect do
  @moduledoc false
  use Futu.Component.Api
  require Logger

  @client_id "FutuElixir"
  @recv_notify false
  @pro_lang "Elixir"

  proto_id 1001
  proto_module InitConnect

  # @spec encode(List.t()) :: binary()
  # def encode(_opts \\ []) do
  #   request = Request.new(c2s: C2S.new(c2s_map()))
  #   Request.encode(request)
  # end

  # def decode(str_body) do
  #   response = Response.decode(str_body)
  #   %Response{retType: retType, retMsg: retMsg, s2c: s2c} = response

  #   Logger.debug(
  #     "InitConnect retType: #{inspect(retType)}  retMsg: #{inspect(retMsg)}  errCode: #{
  #       inspect(response.errCode)
  #     }"
  #   )

  #   %S2C{
  #     aesCBCiv: _aesCBCiv,
  #     connAESKey: _connAESKey,
  #     connID: _connID,
  #     keepAliveInterval: _keepAliveInterval,
  #     loginUserID: _loginUserID,
  #     serverVer: _serverVer,
  #     userAttribution: _userAttribution
  #   } = s2c

  #   {:ok, s2c}
  # end

  @spec c2s_map(List.t()) :: List.t()
  def c2s_map(_opts \\ []) do
    [
      clientVer: client_version(),
      clientID: @client_id,
      recvNotify: @recv_notify,
      programmingLanguage: @pro_lang
    ]
  end

  defp client_version() do
    {:ok, vsn} = :application.get_key(:futu, :vsn)

    [major_str, minor_str, patch_str] =
      vsn
      |> List.to_string()
      |> String.split(".")

    {major, ""} = Integer.parse(major_str)
    {minor, ""} = Integer.parse(minor_str)
    {patch, ""} = Integer.parse(patch_str)

    major * 100 + minor * 10 + patch
  end
end
