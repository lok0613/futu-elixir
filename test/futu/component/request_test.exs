defmodule Futu.Component.RequestTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias Futu.Component.Request

  test "build" do
    bins = Request.build(1001, 123_456, "body")

    assert "FT" <> rest = bins
    assert <<233, 3, 0, 0>> <> rest = rest
    assert <<0>> <> rest = rest
    assert <<0>> <> rest = rest
    assert <<64, 226, 1, 0>> <> rest = rest
    assert <<4, 0, 0, 0>> <> rest = rest
    assert <<_sha::binary-size(20)>> <> rest = rest
    assert <<0, 0, 0, 0, 0, 0, 0, 0>> <> rest = rest
    assert "body" = rest
  end
end
