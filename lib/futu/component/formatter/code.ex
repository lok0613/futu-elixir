defmodule Futu.Component.Formatter.Code do
  @moduledoc false

  @doc """
  ### Example
  ```elixir
  "00001" = encode_code(1)
  "HSImain" = encode_code("HSImain')
  ```
  """
  @spec encode_code(integer() | bitstring()) :: bitstring()
  def encode_code(code) when is_integer(code), do: lead_zero(code)

  def encode_code(code) when is_bitstring(code), do: code

  defp lead_zero(x) when is_integer(x) do
    x
    |> Integer.to_string()
    |> String.pad_leading(5, "0")
  end
end
