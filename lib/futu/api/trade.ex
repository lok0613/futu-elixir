defmodule Futu.Api.Trade do
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

      @spec position_list(server(), list()) :: {:ok, any()} | {:error, bitstring()}
      def position_list(pid, opts) do
        request(pid, Futu.Trade.PositionList, opts)
      end
    end
  end
end
