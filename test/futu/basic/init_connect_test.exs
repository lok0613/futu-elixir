defmodule Futu.Basic.InitConnectTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias Futu.Basic.InitConnect

  test "c2s_map/1" do
    assert [
             clientVer: 100,
             clientID: "FutuElixir",
             recvNotify: false,
             programmingLanguage: "Elixir"
           ] = InitConnect.c2s_map()
  end
end
