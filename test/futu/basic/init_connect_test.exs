defmodule Futu.Basic.InitConnectTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias Futu.Basic.InitConnect

  test "map_c2s/1" do
    assert [
             clientVer: 241,
             clientID: "FutuElixir",
             recvNotify: false,
             programmingLanguage: "Elixir"
           ] = InitConnect.map_c2s()
  end
end
