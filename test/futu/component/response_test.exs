defmodule Futu.Component.ResponseTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias Futu.Component.Response

  describe "get_body_size/1" do
    test "retrieve only body size" do
      fake_response = <<0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1>>

      assert 7 = Response.get_body_size(fake_response)
    end
  end

  describe "parse/1" do
    test "wrong proto_id" do
      fake_incomplete_connect_response =
        <<70, 84, 1, 0, 0, 0, 0, 0, 71, 60, 237, 38, 47, 0, 0, 0, 203, 83, 108, 72, 70, 13, 88,
          121, 188, 167, 172, 202, 209, 128, 12, 101, 180, 169, 228, 108, 0, 0, 0, 0, 0, 0, 0, 0,
          8, 255, 255, 255, 255, 255, 255, 255, 255>>

      assert {:error, "check_proto_id/2, expected: 1001, actual: 1"} =
               Response.parse(fake_incomplete_connect_response, 1001)
    end

    test "incomplete body" do
      fake_incomplete_connect_response =
        <<70, 84, 233, 3, 0, 0, 0, 0, 71, 60, 237, 38, 47, 0, 0, 0, 203, 83, 108, 72, 70, 13, 88,
          121, 188, 167, 172, 202, 209, 128, 12, 101, 180, 169, 228, 108, 0, 0, 0, 0, 0, 0, 0, 0,
          8, 255, 255, 255, 255, 255, 255, 255, 255>>

      assert {:error, "check_body_length/3, proto_id: 1001"} =
               Response.parse(fake_incomplete_connect_response, 1001)
    end

    test "valid message" do
      fake_init_connect_response =
        <<70, 84, 233, 3, 0, 0, 0, 0, 180, 143, 61, 39, 66, 0, 0, 0, 82, 0, 33, 150, 216, 56, 86,
          0, 43, 156, 248, 85, 144, 248, 66, 144, 68, 22, 23, 16, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0,
          18, 0, 24, 0, 34, 58, 8, 249, 3, 16, 243, 194, 237, 2, 24, 240, 150, 199, 140, 238, 235,
          243, 228, 94, 34, 16, 56, 55, 52, 48, 48, 52, 53, 52, 49, 66, 57, 52, 68, 52, 69, 67,
          40, 10, 50, 16, 68, 48, 65, 66, 70, 65, 57, 51, 54, 54, 55, 54, 48, 67, 65, 66, 56, 1>>

      assert {:ok, s2c} = Response.parse(fake_init_connect_response, 1001)

      assert <<8, 0, 18, 0, 24, 0, 34, 58, 8, 249, 3, 16, 243, 194, 237, 2, 24, 240, 150, 199,
               140, 238, 235, 243, 228, 94, 34, 16, 56, 55, 52, 48, 48, 52, 53, 52, 49, 66, 57,
               52, 68, 52, 69, 67, 40, 10, 50, 16, 68, 48, 65, 66, 70, 65, 57, 51, 54, 54, 55, 54,
               48, 67, 65, 66, 56, 1>> = s2c
    end
  end
end
