defmodule Futu.Component.Api do
  @moduledoc """

  ## Examples
  proto_id 1001
  proto_module InitConnect

  """

  defmacro __using__(_opts) do
    quote location: :keep do
      import unquote(__MODULE__)
      Module.register_attribute(__MODULE__, :proto_id, accumulate: false)
      Module.register_attribute(__MODULE__, :proto_mod, accumulate: false)
      @proto_id nil

      @before_compile unquote(__MODULE__)

      @mapper_module Application.compile_env(:futu, :mapper_module, nil)

      @spec map_c2s(any()) :: list()
      def map_c2s(opts \\ [])
      def map_c2s(opts), do: opts

      @spec map_s2c(any()) :: any()
      def map_s2c(opts), do: opts

      defp post_process_s2c(s2c, opts) do
        mapped_s2c = map_s2c(s2c)

        case @mapper_module do
          nil -> mapped_s2c
          _ -> apply(@mapper_module, :map, [mapped_s2c, opts])
        end
      end

      defoverridable map_c2s: 1,
                     map_s2c: 1
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
    quote location: :keep, generated: true do
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
        c2s_module = get_c2s_module()
        request_module = get_request_module()

        case Code.ensure_compiled(c2s_module) do
          {:module, _module} ->
            c2s = apply(c2s_module, :new, [map_c2s(opts)])
            request = apply(request_module, :new, [[c2s: c2s]])
            apply(request_module, :encode, [request])

          _ ->
            ""
        end
      end

      @doc """
      """
      @spec decode(bitstring(), list()) :: {:ok, any()} | {:error, bitstring()}
      def decode(str_body, opts \\ []) do
        response = @proto_mod.Response.decode(str_body)

        case response do
          %{retType: 0, s2c: s2c} ->
            {:ok, post_process_s2c(s2c, opts)}

          %{retType: _ret_type, retMsg: ret_msg, errCode: _err_code} ->
            {:error, ret_msg}
        end
      end

      defp get_c2s_module(), do: String.to_existing_atom("#{@proto_mod}.C2S")
      defp get_request_module(), do: String.to_existing_atom("#{@proto_mod}.Request")
    end
  end
end
