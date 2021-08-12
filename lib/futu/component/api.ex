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
      @mapper_module Application.compile_env(:futu, :mapper_module)

      @spec map_s2c(list()) :: list()
      def map_s2c(opts), do: opts

      @spec proto_id() :: integer()
      def proto_id() do
        case @proto_id do
          nil -> raise "#{__MODULE__} proto_id not set."
          _ -> @proto_id
        end
      end

      @doc """
      Passing to map_c2s/1 and encoding using Protobuf
      """
      @spec encode(list()) :: bitstring()
      def encode(opts \\ []) do
        c2s = @proto_mod.C2S.new(map_c2s(opts))
        request = @proto_mod.Request.new(c2s: c2s)
        @proto_mod.Request.encode(request)
      end

      @doc """
      """
      @spec decode(bitstring(), list()) :: {:ok, any()} | {:error, bitstring()}
      def decode(str_body, opts \\ []) do
        response = @proto_mod.Response.decode(str_body)

        case response do
          %{retType: 0, s2c: s2c} ->
            {:ok, post_process_s2c(s2c, opts)}

          %{retType: retType, retMsg: retMsg, errCode: errCode} ->
            # InitConnect retType: -1  retMsg: "Unknown stock HK.02800"  errCode: 0
            Logger.debug(
              "InitConnect retType: #{inspect(retType)}  retMsg: #{inspect(retMsg)}  errCode: #{
                inspect(response.errCode)
              }"
            )

            {:error, retMsg}
        end
      end

      defp post_process_s2c(s2c, opts) do
        mapped_s2c = map_s2c(s2c)
        IO.inspect(@mapper_module)

        case @mapper_module do
          nil -> mapped_s2c
          _ -> apply(@mapper_module, :map, [mapped_s2c, opts])
        end
      end

      defoverridable map_s2c: 1
    end
  end
end
