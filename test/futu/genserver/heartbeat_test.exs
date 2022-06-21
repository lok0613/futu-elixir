defmodule Futu.GenServer.HeartBeatTest do
  use ExUnit.Case, async: false
  @moduletag :opend

  alias Futu.GenServer.TCP
  alias Futu.GenServer.TcpHeartBeat

  setup_all do
    {:ok, _pid} = TCP.start_link(%{name: :heart_beat_test})
    {:ok, name: :heart_beat_test}
  end

  describe "start_link/1" do
    test "all default", opts do
      assert {:ok, pid} = TcpHeartBeat.start_link(opts)
      assert :ok = GenServer.stop(pid)
    end
  end
end
