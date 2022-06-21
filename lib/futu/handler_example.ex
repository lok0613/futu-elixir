defmodule Futu.HandlerExample do
  require Logger

  def handle(tcp_name, proto_id, response) do
    Logger.info("tcp_name: #{inspect(tcp_name)}")
    Logger.info("proto_id: #{inspect(proto_id)}")
    Logger.info("response: #{inspect(response)}")
  end
end
