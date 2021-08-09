defmodule Futu.Component.Binary do
  @moduledoc false

  def pack(integer, :u8_t) do
    reverse(<<integer::integer-unsigned-8>>)
  end

  def pack(integer, :u32_t) do
    reverse(<<integer::integer-unsigned-32>>)
  end

  def unpack(binary, :u8_t) do
    <<integer::integer-unsigned-8>> = reverse(binary)
    integer
  end

  def unpack(binary, :u32_t) do
    <<integer::integer-unsigned-32>> = reverse(binary)
    integer
  end

  def reverse(binary) do
    binary
    |> :binary.bin_to_list()
    |> Enum.reverse()
    |> :binary.list_to_bin()
  end
end
