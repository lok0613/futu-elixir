defmodule Futu.Api.Basic do
  @moduledoc false

  defmacro __using__(_opts) do
    quote location: :keep do
      alias Futu.Component.{
        Request,
        Response,
        SerialNumber
      }

      @doc """
      1001 InitConnect
      This function will execute in Futu.GenServer automatically
      """
      @spec _init_connect(server()) :: {:ok, any()} | {:error, bitstring()}
      def _init_connect(pid) do
        request(pid, Futu.Basic.InitConnect, [])
      end

      @doc """
      1004 KeepAlive
      Cast for the heartbeat, no reply
      This function will execute in Futu.GenServer automatically
      """
      @spec _heartbeat() :: binary()
      def _heartbeat() do
        proto_msg = Futu.Basic.Heartbeat.encode()
        serial_no = SerialNumber.generate()
        Request.build(Futu.Basic.Heartbeat.proto_id(), serial_no, proto_msg)
      end
    end
  end
end
