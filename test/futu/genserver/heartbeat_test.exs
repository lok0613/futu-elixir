defmodule Futu.GenServer.HeartBeatTest do
  use ExUnit.Case, async: false
  @moduletag :opend

  alias Futu.GenServer.TCP
  alias Futu.GenServer.HeartBeat

  setup_all do
    {:ok, _pid} = TCP.start_link(%{name: :heat_beat_test})
    {:ok, name: :heat_beat_test}
  end

  describe "start_link/1" do
    test "all default", %{name: name} do
      assert {:ok, pid} = HeartBeat.start_link(name)
      assert :ok = GenServer.stop(pid)
    end
  end
end
