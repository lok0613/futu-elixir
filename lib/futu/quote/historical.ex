defmodule Futu.Quote.Historical do
  @moduledoc false
  use Futu.Component.Api

  import Futu.Component.Formatter.{
    DateTime,
    Code
  }

  alias Qot_Common.{
    RehabType,
    KLType,
    QotMarket,
    Security
  }

  proto_id 3103
  proto_module Qot_RequestHistoryKL

  @spec rehab(atom()) :: integer()
  def rehab(:none), do: Map.get(RehabType.mapping(), :RehabType_None)
  def rehab(:forward), do: Map.get(RehabType.mapping(), :RehabType_Forward)
  def rehab(:backward), do: Map.get(RehabType.mapping(), :RehabType_Backward)
  def rehab(whatever), do: raise("Unknown rehab \"#{inspect(whatever)}\"")

  @spec period(atom()) :: integer()
  def period(:every_1_mins), do: Map.get(KLType.mapping(), :KLType_1Min)
  def period(:daily), do: Map.get(KLType.mapping(), :KLType_Day)
  def period(:weekly), do: Map.get(KLType.mapping(), :KLType_Week)
  def period(:monthly), do: Map.get(KLType.mapping(), :KLType_Month)
  def period(:yearly), do: Map.get(KLType.mapping(), :KLType_Year)
  def period(:every_5_mins), do: Map.get(KLType.mapping(), :KLType_5Min)
  def period(:every_15_mins), do: Map.get(KLType.mapping(), :KLType_15Min)
  def period(:every_30_mins), do: Map.get(KLType.mapping(), :KLType_30Min)
  def period(:every_60_mins), do: Map.get(KLType.mapping(), :KLType_60Min)
  def period(:every_3_mins), do: Map.get(KLType.mapping(), :KLType_3Min)
  def period(:quarterly), do: Map.get(KLType.mapping(), :KLType_Quarter)
  def period(whatever), do: raise("Unknown period \"#{inspect(whatever)}\"")

  @spec market(atom()) :: integer()
  def market(:hk_security), do: Map.get(QotMarket.mapping(), :QotMarket_HK_Security)
  def market(:hk_future), do: Map.get(QotMarket.mapping(), :QotMarket_HK_Future)
  def market(:use_security), do: Map.get(QotMarket.mapping(), :QotMarket_US_Security)
  def market(:cnsh_security), do: Map.get(QotMarket.mapping(), :QotMarket_CNSH_Security)
  def market(:cnsz_security), do: Map.get(QotMarket.mapping(), :QotMarket_CNSZ_Security)
  def market(:sg_security), do: Map.get(QotMarket.mapping(), :QotMarket_SG_Security)
  def market(:jp_security), do: Map.get(QotMarket.mapping(), :QotMarket_JP_Security)
  def market(whatever), do: raise("Unknown market \"#{inspect(whatever)}\"")

  def map_c2s(opts) do
    security =
      Security.new(
        market: opts[:market],
        code: encode_code(opts[:code])
      )

    [
      rehabType: opts[:rehab] || rehab(:forward),
      klType: opts[:period] || period(:daily),
      security: security,
      beginTime: encode_datetime(opts[:from]) || once_a_point_a_time(),
      endTime: encode_datetime(opts[:to]) || now(),
      maxAckKLNum: opts[:max_rows] || nil,
      nextReqKey: opts[:next_page_key] || nil,
      extendedTime: opts[:extended_time] || nil
    ]
  end

  def map_s2c(opts) do
    %Qot_RequestHistoryKL.S2C{klList: quotes} = opts
    quotes
  end
end
