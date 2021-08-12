defmodule Futu do
  @moduledoc """
  Futu Elixir API Client
  """

  alias Futu.Component.{
    Request,
    Response,
    SerialNumber
  }

  @doc """
  1001 InitConnect
  This function will execute in Futu.GenServer automatically
  """
  @spec init_connect() :: {:ok, any()} | {:error, bitstring()}
  def init_connect() do
    request(Futu.Basic.InitConnect, [])
  end

  @doc """
  1004 KeepAlive
  Cast for the heartbeat, no reply
  This function will execute in Futu.GenServer automatically
  """
  @spec heartbeat() :: binary()
  def heartbeat() do
    proto_msg = Futu.Basic.Heartbeat.encode()
    serial_no = SerialNumber.generate()
    Request.build(Futu.Basic.Heartbeat.proto_id(), serial_no, proto_msg)
  end

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
  @spec historical(list()) :: {:ok, any()} | {:error, bitstring()}
  def historical(list) do
    request(Futu.Quote.Historical, list)
  end

  @doc """
  Refer to historical/1, I don't like the function name
  """
  @spec request_history_kl(list()) :: {:ok, any()} | {:error, bitstring()}
  defdelegate request_history_kl(list), to: Futu, as: :historical

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
  @spec request(module(), list()) :: {:ok, any()} | {:error, bitstring()}
  def request(module, opts) do
    proto_msg = module.encode(opts)
    serial_no = SerialNumber.generate()
    tcp_msg = Request.build(module.proto_id, serial_no, proto_msg)

    tcp_reply = GenServer.call(Futu.GenServer.TCP, {:send, tcp_msg}, 20000)

    case Response.parse(tcp_reply, module.proto_id) do
      {:ok, str_body} -> module.decode(str_body, opts)
      {:error, msg} -> {:error, msg}
    end
  end
end
