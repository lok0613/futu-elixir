defmodule Futu.Component.BinaryTest do
  @moduledoc false
  use ExUnit.Case, async: true
  import Futu.Component.Binary

  describe "reverse/1" do
    test "reverse it right" do
      assert <<1, 2, 3, 4>> = reverse(<<4, 3, 2, 1>>)
    end
  end

  describe "pack/2" do
    test "u8_t" do
      assert <<5>> = pack(5, :u8_t)
    end

    test "u32_t" do
      assert <<233, 3, 0, 0>> = pack(1001, :u32_t)
    end
  end

  describe "unpack/2" do
    test "u8_t" do
      assert 5 = unpack(<<5>>, :u8_t)
    end

    test "ut32_t" do
      assert 1001 = unpack(<<233, 3, 0, 0>>, :u32_t)
    end
  end
end
