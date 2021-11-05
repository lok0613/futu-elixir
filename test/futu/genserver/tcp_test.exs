defmodule Futu.GenServer.TCPTest do
  use ExUnit.Case, async: false
  @moduletag :opend

  alias Futu.GenServer.TCP

  describe "start_link/1" do
    test "all default" do
      assert {:ok, pid} = TCP.start_link()
      assert :ok = GenServer.stop(pid)
    end

    test "pass host" do
      assert {:ok, pid} = TCP.start_link(%{host: "localhost"})
      assert :ok = GenServer.stop(pid)
    end
  end
end
