defmodule Futu.Component.Request do
  @moduledoc false
  import Futu.Component.Binary

  @proto_fmt_type 0
  @proto_version 0
  @reserved <<0, 0, 0, 0, 0, 0, 0, 0>>

  @spec build(integer(), integer(), bitstring()) :: binary()
  def build(proto_id, serial_no, str_body) do
    body_length = byte_size(str_body)
    body_sha = :crypto.hash(:sha, str_body)

    "FT" <>
      pack(proto_id, :u32_t) <>
      pack(@proto_fmt_type, :u8_t) <>
      pack(@proto_version, :u8_t) <>
      pack(serial_no, :u32_t) <> pack(body_length, :u32_t) <> body_sha <> @reserved <> str_body
  end
end
