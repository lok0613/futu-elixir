defmodule Futu.UpdateNotifier do
  @moduledoc """
  Example of handle Futu subscrption
  """
  require Logger

  def handle_info(order) do
    Logger.debug("order updated: #{inspect(order)}")
    order
  end
end
