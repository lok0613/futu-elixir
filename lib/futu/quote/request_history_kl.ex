defmodule Futu.Quote.RequestHistoryKL do
  @moduledoc false
  use Futu.Component.Api

  import Futu.Component.Date

  alias Qot_Common.{
    RehabType,
    KLType,
    QotMarket,
    Security
  }

  # Request,
  # Response,
  # C2S
  # S2C

  proto_id 3031
  proto_module Qot_RequestHistoryKL

  @spec rehab(atom()) :: integer()
  def rehab(:none), do: Map.get(RehabType.mapping(), :RehabType_None)
  def rehab(:forward), do: Map.get(RehabType.mapping(), :RehabType_Forward)
  def rehab(:backward), do: Map.get(RehabType.mapping(), :RehabType_Backward)

  @spec period(atom()) :: integer()
  def period(:every_1_min), do: Map.get(KLType.mapping(), :KLType_1Min)
  def period(:daily), do: Map.get(KLType.mapping(), :KLType_Day)
  def period(:weekly), do: Map.get(KLType.mapping(), :KLType_Week)
  def period(:monthly), do: Map.get(KLType.mapping(), :KLType_Month)
  def period(:yearly), do: Map.get(KLType.mapping(), :KLType_Year)
  def period(:every_5_min), do: Map.get(KLType.mapping(), :KLType_5Min)
  def period(:every_15_min), do: Map.get(KLType.mapping(), :KLType_15Min)
  def period(:every_30_min), do: Map.get(KLType.mapping(), :KLType_30Min)
  def period(:every_60_min), do: Map.get(KLType.mapping(), :KLType_60Min)
  def period(:every_3_min), do: Map.get(KLType.mapping(), :KLType_3Min)
  def period(:quarterly), do: Map.get(KLType.mapping(), :KLType_Quarter)
  def period(_wtf_is_this), do: Map.get(KLType.mapping(), :KLType_Unknown)

  @spec market(atom()) :: integer()
  def market(:hk_security), do: Map.get(QotMarket.mapping(), :QotMarket_HK_Security)
  def market(:hk_future), do: Map.get(QotMarket.mapping(), :QotMarket_HK_Future)
  def market(:use_security), do: Map.get(QotMarket.mapping(), :QotMarket_US_Security)
  def market(:cnsh_security), do: Map.get(QotMarket.mapping(), :QotMarket_CNSH_Security)
  def market(:cnsz_security), do: Map.get(QotMarket.mapping(), :QotMarket_CNSZ_Security)
  def market(:sg_security), do: Map.get(QotMarket.mapping(), :QotMarket_SG_Security)
  def market(:jp_security), do: Map.get(QotMarket.mapping(), :QotMarket_JP_Security)
  def market(_wtf_is_this), do: Map.get(QotMarket.mapping(), :QotMarket_Unknown)

  # @spec encode(List.t()) :: bitstring()
  # def encode(opt) do
  #   request = Request.new(c2s: C2S.new(c2s_map(opt)))
  #   Request.encode(request)
  # end

  @spec c2s_map(List.t()) :: List.t()
  def c2s_map(opts) do
    security =
      Security.new(
        market: opts[:market],
        code: opts[:code]
      )

    map = [
      rehabType: opts[:rehab] || rehab(:forward),
      klType: opts[:period] || period(:daily),
      security: security,
      beginTime: opts[:from] || "1999-01-01",
      endTime: opts[:to] || today()
    ]

    map =
      case opts do
        [max_rows: max_rows] -> [{:maxAckKLNum, max_rows} | map]
        _ -> map
      end

    map =
      case opts do
        [next_page_key: next_page_key] -> [{:nextReqKey, next_page_key} | map]
        _ -> map
      end

    map =
      case opts do
        [extended_time: extended_time] -> [{:extendedTime, extended_time} | map]
        _ -> map
      end

    map
  end
end
