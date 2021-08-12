defmodule Futu.Component.Mapper.Nothing do
  @moduledoc false
  @behaviour Futu.Component.Mapper

  @spec map(any(), list()) :: any()
  def map(data, _opts), do: data
end
