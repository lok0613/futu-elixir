defmodule Futu.Component.Response do
  @moduledoc false
  import Futu.Component.Binary

  @reserved <<0, 0, 0, 0, 0, 0, 0, 0>>

  def header_length(), do: 44

  @doc """
  Validate all part of the header, return the body string
  """
  @spec parse(bitstring(), integer()) :: {:ok, bitstring()} | {:error, bitstring()}
  def parse(binary, req_proto_id) do
    "FT" <> rest = binary
    <<proto_id::binary-size(4)>> <> rest = rest
    <<proto_fmt_type::binary-size(1)>> <> rest = rest
    <<proto_version::binary-size(1)>> <> rest = rest
    <<_serial_no::binary-size(4)>> <> rest = rest
    <<body_length::binary-size(4)>> <> rest = rest
    <<body_sha::binary-size(20)>> <> rest = rest
    @reserved <> str_body = rest

    {:ok, str_body}
    with {:ok} <- check_proto_id(proto_id, req_proto_id),
         {:ok} <- check_proto_fmt_type(proto_fmt_type, req_proto_id),
         {:ok} <- check_proto_version(proto_version, req_proto_id),
         {:ok} <- check_body_length(body_length, str_body, req_proto_id),
         {:ok} <- check_body_sha(body_sha, str_body, req_proto_id) do
      {:ok, str_body}
    else
      {:error, msg} ->
        {:error, msg}
    end
  end

  @spec get_body_size(bitstring()) :: integer()
  def get_body_size(binary) do
    <<_head::binary-size(12)>> <> <<body_length::binary-size(4)>> <> _rest = binary
    unpack(body_length, :u32_t)
  end

  defp check_header() do

  end

  defp check_proto_id(proto_id, req_proto_id) do
    case unpack(proto_id, :u32_t) == req_proto_id do
      true ->
        {:ok}

      false ->
        {:error, "check_proto_id/2, req_proto_id: #{req_proto_id}"}
    end
  end

  defp check_proto_fmt_type(proto_fmt_type, proto_id) do
    case unpack(proto_fmt_type, :u8_t) == 0 do
      true -> {:ok}
      false -> {:error, "check_proto_fmt_type/2, proto_id: #{proto_id}"}
    end
  end

  defp check_proto_version(proto_version, proto_id) do
    case unpack(proto_version, :u8_t) == 0 do
      true -> {:ok}
      false -> {:error, "check_proto_version/2, proto_id: #{proto_id}"}
    end
  end

  defp check_body_length(body_length, str_body, proto_id) do
    case byte_size(str_body) == unpack(body_length, :u32_t) do
      true -> {:ok}
      false -> {:error, "check_body_length/3, proto_id: #{proto_id}"}
    end
  end

  defp check_body_sha(body_sha, str_body, proto_id) do
    case :crypto.hash(:sha, str_body) == body_sha do
      true -> {:ok}
      false -> {:error, "check_body_sha/3, proto_id: #{proto_id}"}
    end
  end
end
