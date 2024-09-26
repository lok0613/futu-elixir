defmodule Futu.GenServer.SerialNumberTest do
  use ExUnit.Case
  alias Futu.GenServer.SerialNumber

  setup_all do
    {:ok, pid} = SerialNumber.start_link([])
    {:ok, pid: pid}
  end

  describe "generate" do
    test "increments", %{pid: pid} do
      sn_1 = GenServer.call(pid, :generate)
      sn_2 = GenServer.call(pid, :generate)
      sn_3 = GenServer.call(pid, :generate)

      assert sn_3 > sn_2
      assert sn_2 > sn_1
    end
  end
end
