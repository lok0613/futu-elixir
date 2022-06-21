defmodule Futu.HandlerExample do
  require Logger

  def handle(proto_id, response) do
    Logger.info("proto_id: #{inspect(proto_id)}")
    Logger.info("response: #{inspect(response)}")
  end
end
