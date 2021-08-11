defmodule Futu.Component.Formatter.CodeTest do
  @moduledoc false
  use ExUnit.Case, async: true
  import Futu.Component.Formatter.Code

  describe "encode_code/1" do
    test "stocks code" do
      assert "00001" = encode_code(1)
    end

    test "futures code" do
      assert "HSImain" = encode_code("HSImain")
    end
  end
end
