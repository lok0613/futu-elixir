defmodule Futu.Basic.InitConnect do
  @moduledoc false
  use Futu.Component.Api
  require Logger

  @client_id "FutuElixir"
  @recv_notify false
  @pro_lang "Elixir"

  proto_id 1001
  proto_module InitConnect

  def map_c2s(_opts) do
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
