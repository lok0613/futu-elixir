defmodule Futu do
  @moduledoc """
  Futu Elixir API Client
  """

  alias Futu.Component.{
    Request,
    Response,
    SerialNumber
  }

  @spec init_connect() :: {:ok, any()} | {:error, bitstring()}
  def init_connect() do
    request(Futu.Basic.InitConnect, [])
  end

  @doc """
  ### Paramters

  required:
  * rehab, checkout Futu.Quote.RequestHistoryKL.rehab/1
  * period, checkout Futu.Quote.RequestHistoryKL.period/1
  * market, checkout Futu.Quote.RequestHistoryKL.market/1
  * code, e.g. "HK.00001"

  optional:
  * from, default "1999-01-01"
  * to, default now
  * max_rows, integer
  * next_page_key, if it's included from the last response
  * extended_time, boolean, to get the pre-market and after-hours data of US stocks, only supports timeframe of 1-minute
  """
  @spec request_historical_quotes(List.t()) :: {:ok, any()} | {:error, bitstring()}
  def request_historical_quotes(list) do
    request(Futu.Quote.RequestHistoryKL, list)
  end

  @doc """
  Refer to request_historical_quotes/1, I don't like the function name
  """
  @spec request_history_kl(List.t()) :: {:ok, any()} | {:error, bitstring()}
  defdelegate request_history_kl(list), to: __MODULE__, as: :request_historical_quotes

  @doc """
  This is the main function of intereacting Futu TCP client.
  Three steps here:
  1. build request: opts -> module.encode/1 -> Request.build/3
  2. send tcp message by GenServer
  3. parse response:
    tcp_reply
      -> Response.parse/2
        success -> module.decode/1
                  success
                  request failure
        header failure

  """
  @spec request(Module.t(), List.t()) :: {:ok, any()} | {:error, bitstring()}
  def request(module, opts) do
    proto_msg = module.encode(opts)
    serial_no = SerialNumber.generate()
    tcp_msg = Request.build(module.proto_id, serial_no, proto_msg)

    tcp_reply = GenServer.call(__MODULE__, {:send, tcp_msg})

    case Response.parse(tcp_reply, module.proto_id) do
      {:ok, str_body} -> module.decode(str_body)
      {:error, msg} -> {:error, msg}
    end
  end
end
