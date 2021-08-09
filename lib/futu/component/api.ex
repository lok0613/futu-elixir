defmodule Futu.Component.Api do
  @moduledoc """

  ## Examples
  proto_id 1001
  proto_module InitConnect

  """

  defmacro __using__(_opts) do
    quote do
      import unquote(__MODULE__)
      Module.register_attribute(__MODULE__, :proto_id, accumulate: false)
      Module.register_attribute(__MODULE__, :proto_mod, accumulate: false)
      @proto_id nil

      @before_compile unquote(__MODULE__)
    end
  end

  defmacro proto_id(code) do
    quote do
      @proto_id unquote(code)
    end
  end

  defmacro proto_module(mod) do
    quote do
      @proto_mod unquote(mod)
    end
  end

  defmacro __before_compile__(_env) do
    quote generated: true do
      require Logger

      @spec proto_id() :: integer()
      def proto_id() do
        case @proto_id do
          nil -> raise "#{__MODULE__} proto_id not set."
          _ -> @proto_id
        end
      end

      @doc """
      Passing to c2s_map/1 and encoding using Protobuf
      """
      @spec encode(List.t()) :: bitstring()
      def encode(opts) do
        c2s = @proto_mod.C2S.new(c2s_map(opts))
        request = @proto_mod.Request.new(c2s: c2s)
        @proto_mod.Request.encode(request)
      end

      @doc """
      """
      @spec decode(bitstring()) :: {:ok, any()} | {:error, bitstring()}
      def decode(str_body) do
        response = @proto_mod.Response.decode(str_body)

        case response do
          %{retType: 0, s2c: s2c} ->
            {:ok, s2c}

          %{retType: retType, retMsg: retMsg, errCode: errCode} ->
            Logger.debug(
              "InitConnect retType: #{inspect(retType)}  retMsg: #{inspect(retMsg)}  errCode: #{
                inspect(response.errCode)
              }"
            )

            {:error, "Seems failure."}
        end
      end
    end
  end
end
