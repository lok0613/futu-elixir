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
end
