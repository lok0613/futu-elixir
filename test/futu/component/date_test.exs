defmodule Futu.Component.DateTest do
  @moduledoc false
  use ExUnit.Case, async: true
  import Futu.Component.Date

  test "to_lead_zero_string/1" do
    assert "05" = to_lead_zero_string(5)
  end
end
