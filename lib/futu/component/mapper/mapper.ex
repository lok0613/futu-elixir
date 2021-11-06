defmodule Futu.Component.Mapper do
  @moduledoc false

  @callback map(any(), list()) :: any()
end
