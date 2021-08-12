defmodule Futu.Component.Formatter.DateTimeTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias Futu.Component.Formatter.DateTime.Calendar
  import Futu.Component.Formatter.DateTime
  import Mock

  test "now/1" do
    with_mock(Calendar, local_time: fn -> {{2021, 8, 11}, {16, 49, 15}} end) do
      assert "2021-08-11 16:49:15" = now()
    end
  end

  describe "encode_datetime/1" do
    test "bitstirng" do
      assert "2021-08-08 00:00:00" = encode_datetime("2021-08-08 00:00:00")
    end

    test "NaiveDateTime" do
      assert "2021-08-08 00:00:00" = encode_datetime(~N[2021-08-08 00:00:00])
    end
  end

  describe "decode_date/1" do
    test "datetime string to date" do
      assert ~D[2021-08-08] = decode_date("2021-08-08 11:11:00")
    end
  end
end
