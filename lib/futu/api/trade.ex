defmodule Futu.Api.Trade do
  @moduledoc false

  defmacro __using__(_opts) do
    quote location: :keep do
      @spec account_funds(server(), list()) :: {:ok, any()} | {:error, bitstring()}
      def account_funds(pid, opts) do
        request(pid, Futu.Trade.AccountFunds, opts)
      end

      @spec account_list(server(), list()) :: {:ok, any()} | {:error, bitstring()}
      def account_list(pid, opts) do
        request(pid, Futu.Trade.AccountList, opts)
      end

      @spec order_list(server(), list()) :: {:ok, any()} | {:error, bitstring()}
      def order_list(pid, opts) do
        request(pid, Futu.Trade.OrderList, opts)
      end

      @spec history_order_list(server(), list()) :: {:ok, any()} | {:error, bitstring()}
      def history_order_list(pid, opts) do
        request(pid, Futu.Trade.HistoryOrderList, opts)
      end

      @spec position_list(server(), list()) ::
              {:ok, Trd_GetPositionList.S2C} | {:error, bitstring()}
      def position_list(pid, opts) do
        request(pid, Futu.Trade.PositionList, opts)
      end

      @spec max_trade_quantities(server(), list()) :: {:ok, any()} | {:error, bitstring()}
      def max_trade_quantities(pid, opts) do
        request(pid, Futu.Trade.MaxTradeQuantities, opts)
      end

      @spec place_order(server(), list()) :: {:ok, Trd_PlaceOrder.S2C} | {:error, bitstring()}
      def place_order(pid, opts) do
        request(pid, Futu.Trade.PlaceOrder, opts)
      end

      @spec unlock_trade(server(), list()) :: {:ok, Trd_UnlockTrade.S2C} | {:error, bitstring()}
      def unlock_trade(pid, opts) do
        request(pid, Futu.Trade.Unlock, opts)
      end

      @spec subscription(server(), list()) :: {:ok, any()} | {:error, bitstring()}
      def subscription(pid, opts) do
        request(pid, Futu.Trade.Subscription, opts)
      end
    end
  end
end
