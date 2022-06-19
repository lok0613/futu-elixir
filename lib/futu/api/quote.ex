defmodule Futu.Api.Quote do
  @moduledoc false

  defmacro __using__(_opts) do
    quote location: :keep do
      alias Futu.Component.{
        Request,
        Response,
        SerialNumber
      }

      @doc """
      3103 Qot_RequestHistoryKL

      ### Paramters

      required:
      * period, checkout Futu.Quote.Historical.period/1
      * market, checkout Futu.Quote.Historical.market/1
      * code, e.g. 1

      optional:
      * rehab, checkout Futu.Quote.Historical.rehab/1
      * from, default ~N[1999-01-01 00:00:00]
      * to, default now
      * max_rows, integer
      * next_page_key, if it's included from the last response
      * extended_time, boolean, to get the pre-market and after-hours data of US stocks, only supports timeframe of 1-minute
      """

      @spec historical(server(), list()) :: {:ok, any()} | {:error, bitstring()}
      def historical(pid, list) do
        request(pid, Futu.Quote.Historical, list)
      end

      @doc """
      Refer to historical/1, I don't like the function name
      """
      @spec request_history_kl(server(), list()) :: {:ok, any()} | {:error, bitstring()}
      defdelegate request_history_kl(pid, list), to: Futu, as: :historical

      @spec security_snapshot(server(), list()) ::
              {:ok, Qot_GetSecuritySnapshot.S2C.t()} | {:error, bitstring()}
      def security_snapshot(pid, list) do
        request(pid, Futu.Quote.SecuritySnapshot, list)
      end
    end
  end
end
