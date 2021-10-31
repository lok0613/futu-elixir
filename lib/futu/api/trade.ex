defmodule Futu.Api.Trade do
  defmacro __using__(_opts) do
    quote location: :keep do
      @spec account_funds(list()) :: {:ok, any()} | {:error, bitstring()}
      def account_funds(opts) do
        request(Futu.Trade.AccountFunds, opts)
      end

      @spec account_list(list()) :: {:ok, any()} | {:error, bitstring()}
      def account_list(opts) do
        request(Futu.Trade.AccountList, opts)
      end

      @spec order_list(list()) :: {:ok, any()} | {:error, bitstring()}
      def order_list(opts) do
        request(Futu.Trade.OrderList, opts)
      end

      @spec history_order_list(list()) :: {:ok, any()} | {:error, bitstring()}
      def history_order_list(opts) do
        request(Futu.Trade.HistoryOrderList, opts)
      end
    end
  end
end
