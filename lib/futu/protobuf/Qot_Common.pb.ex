defmodule Qot_Common.QotMarket do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :QotMarket_Unknown
          | :QotMarket_HK_Security
          | :QotMarket_HK_Future
          | :QotMarket_US_Security
          | :QotMarket_CNSH_Security
          | :QotMarket_CNSZ_Security
          | :QotMarket_SG_Security
          | :QotMarket_JP_Security

  field :QotMarket_Unknown, 0

  field :QotMarket_HK_Security, 1

  field :QotMarket_HK_Future, 2

  field :QotMarket_US_Security, 11

  field :QotMarket_CNSH_Security, 21

  field :QotMarket_CNSZ_Security, 22

  field :QotMarket_SG_Security, 31

  field :QotMarket_JP_Security, 41
end

defmodule Qot_Common.SecurityType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :SecurityType_Unknown
          | :SecurityType_Bond
          | :SecurityType_Bwrt
          | :SecurityType_Eqty
          | :SecurityType_Trust
          | :SecurityType_Warrant
          | :SecurityType_Index
          | :SecurityType_Plate
          | :SecurityType_Drvt
          | :SecurityType_PlateSet
          | :SecurityType_Future

  field :SecurityType_Unknown, 0

  field :SecurityType_Bond, 1

  field :SecurityType_Bwrt, 2

  field :SecurityType_Eqty, 3

  field :SecurityType_Trust, 4

  field :SecurityType_Warrant, 5

  field :SecurityType_Index, 6

  field :SecurityType_Plate, 7

  field :SecurityType_Drvt, 8

  field :SecurityType_PlateSet, 9

  field :SecurityType_Future, 10
end

defmodule Qot_Common.PlateSetType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :PlateSetType_All
          | :PlateSetType_Industry
          | :PlateSetType_Region
          | :PlateSetType_Concept
          | :PlateSetType_Other

  field :PlateSetType_All, 0

  field :PlateSetType_Industry, 1

  field :PlateSetType_Region, 2

  field :PlateSetType_Concept, 3

  field :PlateSetType_Other, 4
end

defmodule Qot_Common.WarrantType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :WarrantType_Unknown
          | :WarrantType_Buy
          | :WarrantType_Sell
          | :WarrantType_Bull
          | :WarrantType_Bear
          | :WarrantType_InLine

  field :WarrantType_Unknown, 0

  field :WarrantType_Buy, 1

  field :WarrantType_Sell, 2

  field :WarrantType_Bull, 3

  field :WarrantType_Bear, 4

  field :WarrantType_InLine, 5
end

defmodule Qot_Common.OptionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :OptionType_Unknown | :OptionType_Call | :OptionType_Put

  field :OptionType_Unknown, 0

  field :OptionType_Call, 1

  field :OptionType_Put, 2
end

defmodule Qot_Common.IndexOptionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :IndexOptionType_Unknown | :IndexOptionType_Normal | :IndexOptionType_Small

  field :IndexOptionType_Unknown, 0

  field :IndexOptionType_Normal, 1

  field :IndexOptionType_Small, 2
end

defmodule Qot_Common.OptionAreaType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :OptionAreaType_Unknown
          | :OptionAreaType_American
          | :OptionAreaType_European
          | :OptionAreaType_Bermuda

  field :OptionAreaType_Unknown, 0

  field :OptionAreaType_American, 1

  field :OptionAreaType_European, 2

  field :OptionAreaType_Bermuda, 3
end

defmodule Qot_Common.QotMarketState do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :QotMarketState_None
          | :QotMarketState_Auction
          | :QotMarketState_WaitingOpen
          | :QotMarketState_Morning
          | :QotMarketState_Rest
          | :QotMarketState_Afternoon
          | :QotMarketState_Closed
          | :QotMarketState_PreMarketBegin
          | :QotMarketState_PreMarketEnd
          | :QotMarketState_AfterHoursBegin
          | :QotMarketState_AfterHoursEnd
          | :QotMarketState_NightOpen
          | :QotMarketState_NightEnd
          | :QotMarketState_FutureDayOpen
          | :QotMarketState_FutureDayBreak
          | :QotMarketState_FutureDayClose
          | :QotMarketState_FutureDayWaitForOpen
          | :QotMarketState_HkCas
          | :QotMarketState_FutureNightWait
          | :QotMarketState_FutureAfternoon
          | :QotMarketState_FutureSwitchDate
          | :QotMarketState_FutureOpen
          | :QotMarketState_FutureBreak
          | :QotMarketState_FutureBreakOver
          | :QotMarketState_FutureClose
          | :QotMarketState_StibAfterHoursWait
          | :QotMarketState_StibAfterHoursBegin
          | :QotMarketState_StibAfterHoursEnd

  field :QotMarketState_None, 0

  field :QotMarketState_Auction, 1

  field :QotMarketState_WaitingOpen, 2

  field :QotMarketState_Morning, 3

  field :QotMarketState_Rest, 4

  field :QotMarketState_Afternoon, 5

  field :QotMarketState_Closed, 6

  field :QotMarketState_PreMarketBegin, 8

  field :QotMarketState_PreMarketEnd, 9

  field :QotMarketState_AfterHoursBegin, 10

  field :QotMarketState_AfterHoursEnd, 11

  field :QotMarketState_NightOpen, 13

  field :QotMarketState_NightEnd, 14

  field :QotMarketState_FutureDayOpen, 15

  field :QotMarketState_FutureDayBreak, 16

  field :QotMarketState_FutureDayClose, 17

  field :QotMarketState_FutureDayWaitForOpen, 18

  field :QotMarketState_HkCas, 19

  field :QotMarketState_FutureNightWait, 20

  field :QotMarketState_FutureAfternoon, 21

  field :QotMarketState_FutureSwitchDate, 22

  field :QotMarketState_FutureOpen, 23

  field :QotMarketState_FutureBreak, 24

  field :QotMarketState_FutureBreakOver, 25

  field :QotMarketState_FutureClose, 26

  field :QotMarketState_StibAfterHoursWait, 27

  field :QotMarketState_StibAfterHoursBegin, 28

  field :QotMarketState_StibAfterHoursEnd, 29
end

defmodule Qot_Common.TradeDateMarket do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :TradeDateMarket_Unknown
          | :TradeDateMarket_HK
          | :TradeDateMarket_US
          | :TradeDateMarket_CN
          | :TradeDateMarket_NT
          | :TradeDateMarket_ST
          | :TradeDateMarket_JP_Future
          | :TradeDateMarket_SG_Future

  field :TradeDateMarket_Unknown, 0

  field :TradeDateMarket_HK, 1

  field :TradeDateMarket_US, 2

  field :TradeDateMarket_CN, 3

  field :TradeDateMarket_NT, 4

  field :TradeDateMarket_ST, 5

  field :TradeDateMarket_JP_Future, 6

  field :TradeDateMarket_SG_Future, 7
end

defmodule Qot_Common.TradeDateType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :TradeDateType_Whole | :TradeDateType_Morning | :TradeDateType_Afternoon

  field :TradeDateType_Whole, 0

  field :TradeDateType_Morning, 1

  field :TradeDateType_Afternoon, 2
end

defmodule Qot_Common.RehabType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :RehabType_None | :RehabType_Forward | :RehabType_Backward

  field :RehabType_None, 0

  field :RehabType_Forward, 1

  field :RehabType_Backward, 2
end

defmodule Qot_Common.KLType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :KLType_Unknown
          | :KLType_1Min
          | :KLType_Day
          | :KLType_Week
          | :KLType_Month
          | :KLType_Year
          | :KLType_5Min
          | :KLType_15Min
          | :KLType_30Min
          | :KLType_60Min
          | :KLType_3Min
          | :KLType_Quarter

  field :KLType_Unknown, 0

  field :KLType_1Min, 1

  field :KLType_Day, 2

  field :KLType_Week, 3

  field :KLType_Month, 4

  field :KLType_Year, 5

  field :KLType_5Min, 6

  field :KLType_15Min, 7

  field :KLType_30Min, 8

  field :KLType_60Min, 9

  field :KLType_3Min, 10

  field :KLType_Quarter, 11
end

defmodule Qot_Common.KLFields do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :KLFields_None
          | :KLFields_High
          | :KLFields_Open
          | :KLFields_Low
          | :KLFields_Close
          | :KLFields_LastClose
          | :KLFields_Volume
          | :KLFields_Turnover
          | :KLFields_TurnoverRate
          | :KLFields_PE
          | :KLFields_ChangeRate

  field :KLFields_None, 0

  field :KLFields_High, 1

  field :KLFields_Open, 2

  field :KLFields_Low, 4

  field :KLFields_Close, 8

  field :KLFields_LastClose, 16

  field :KLFields_Volume, 32

  field :KLFields_Turnover, 64

  field :KLFields_TurnoverRate, 128

  field :KLFields_PE, 256

  field :KLFields_ChangeRate, 512
end

defmodule Qot_Common.SubType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :SubType_None
          | :SubType_Basic
          | :SubType_OrderBook
          | :SubType_Ticker
          | :SubType_RT
          | :SubType_KL_Day
          | :SubType_KL_5Min
          | :SubType_KL_15Min
          | :SubType_KL_30Min
          | :SubType_KL_60Min
          | :SubType_KL_1Min
          | :SubType_KL_Week
          | :SubType_KL_Month
          | :SubType_Broker
          | :SubType_KL_Qurater
          | :SubType_KL_Year
          | :SubType_KL_3Min

  field :SubType_None, 0

  field :SubType_Basic, 1

  field :SubType_OrderBook, 2

  field :SubType_Ticker, 4

  field :SubType_RT, 5

  field :SubType_KL_Day, 6

  field :SubType_KL_5Min, 7

  field :SubType_KL_15Min, 8

  field :SubType_KL_30Min, 9

  field :SubType_KL_60Min, 10

  field :SubType_KL_1Min, 11

  field :SubType_KL_Week, 12

  field :SubType_KL_Month, 13

  field :SubType_Broker, 14

  field :SubType_KL_Qurater, 15

  field :SubType_KL_Year, 16

  field :SubType_KL_3Min, 17
end

defmodule Qot_Common.TickerDirection do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :TickerDirection_Unknown
          | :TickerDirection_Bid
          | :TickerDirection_Ask
          | :TickerDirection_Neutral

  field :TickerDirection_Unknown, 0

  field :TickerDirection_Bid, 1

  field :TickerDirection_Ask, 2

  field :TickerDirection_Neutral, 3
end

defmodule Qot_Common.TickerType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :TickerType_Unknown
          | :TickerType_Automatch
          | :TickerType_Late
          | :TickerType_NoneAutomatch
          | :TickerType_InterAutomatch
          | :TickerType_InterNoneAutomatch
          | :TickerType_OddLot
          | :TickerType_Auction
          | :TickerType_Bulk
          | :TickerType_Crash
          | :TickerType_CrossMarket
          | :TickerType_BulkSold
          | :TickerType_FreeOnBoard
          | :TickerType_Rule127Or155
          | :TickerType_Delay
          | :TickerType_MarketCenterClosePrice
          | :TickerType_NextDay
          | :TickerType_MarketCenterOpening
          | :TickerType_PriorReferencePrice
          | :TickerType_MarketCenterOpenPrice
          | :TickerType_Seller
          | :TickerType_T
          | :TickerType_ExtendedTradingHours
          | :TickerType_Contingent
          | :TickerType_AvgPrice
          | :TickerType_OTCSold
          | :TickerType_OddLotCrossMarket
          | :TickerType_DerivativelyPriced
          | :TickerType_ReOpeningPriced
          | :TickerType_ClosingPriced
          | :TickerType_ComprehensiveDelayPrice
          | :TickerType_Overseas

  field :TickerType_Unknown, 0

  field :TickerType_Automatch, 1

  field :TickerType_Late, 2

  field :TickerType_NoneAutomatch, 3

  field :TickerType_InterAutomatch, 4

  field :TickerType_InterNoneAutomatch, 5

  field :TickerType_OddLot, 6

  field :TickerType_Auction, 7

  field :TickerType_Bulk, 8

  field :TickerType_Crash, 9

  field :TickerType_CrossMarket, 10

  field :TickerType_BulkSold, 11

  field :TickerType_FreeOnBoard, 12

  field :TickerType_Rule127Or155, 13

  field :TickerType_Delay, 14

  field :TickerType_MarketCenterClosePrice, 15

  field :TickerType_NextDay, 16

  field :TickerType_MarketCenterOpening, 17

  field :TickerType_PriorReferencePrice, 18

  field :TickerType_MarketCenterOpenPrice, 19

  field :TickerType_Seller, 20

  field :TickerType_T, 21

  field :TickerType_ExtendedTradingHours, 22

  field :TickerType_Contingent, 23

  field :TickerType_AvgPrice, 24

  field :TickerType_OTCSold, 25

  field :TickerType_OddLotCrossMarket, 26

  field :TickerType_DerivativelyPriced, 27

  field :TickerType_ReOpeningPriced, 28

  field :TickerType_ClosingPriced, 29

  field :TickerType_ComprehensiveDelayPrice, 30

  field :TickerType_Overseas, 31
end

defmodule Qot_Common.DarkStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :DarkStatus_None | :DarkStatus_Trading | :DarkStatus_End

  field :DarkStatus_None, 0

  field :DarkStatus_Trading, 1

  field :DarkStatus_End, 2
end

defmodule Qot_Common.SecurityStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :SecurityStatus_Unknown
          | :SecurityStatus_Normal
          | :SecurityStatus_Listing
          | :SecurityStatus_Purchasing
          | :SecurityStatus_Subscribing
          | :SecurityStatus_BeforeDrakTradeOpening
          | :SecurityStatus_DrakTrading
          | :SecurityStatus_DrakTradeEnd
          | :SecurityStatus_ToBeOpen
          | :SecurityStatus_Suspended
          | :SecurityStatus_Called
          | :SecurityStatus_ExpiredLastTradingDate
          | :SecurityStatus_Expired
          | :SecurityStatus_Delisted
          | :SecurityStatus_ChangeToTemporaryCode
          | :SecurityStatus_TemporaryCodeTradeEnd
          | :SecurityStatus_ChangedPlateTradeEnd
          | :SecurityStatus_ChangedCodeTradeEnd
          | :SecurityStatus_RecoverableCircuitBreaker
          | :SecurityStatus_UnRecoverableCircuitBreaker
          | :SecurityStatus_AfterCombination
          | :SecurityStatus_AfterTransation

  field :SecurityStatus_Unknown, 0

  field :SecurityStatus_Normal, 1

  field :SecurityStatus_Listing, 2

  field :SecurityStatus_Purchasing, 3

  field :SecurityStatus_Subscribing, 4

  field :SecurityStatus_BeforeDrakTradeOpening, 5

  field :SecurityStatus_DrakTrading, 6

  field :SecurityStatus_DrakTradeEnd, 7

  field :SecurityStatus_ToBeOpen, 8

  field :SecurityStatus_Suspended, 9

  field :SecurityStatus_Called, 10

  field :SecurityStatus_ExpiredLastTradingDate, 11

  field :SecurityStatus_Expired, 12

  field :SecurityStatus_Delisted, 13

  field :SecurityStatus_ChangeToTemporaryCode, 14

  field :SecurityStatus_TemporaryCodeTradeEnd, 15

  field :SecurityStatus_ChangedPlateTradeEnd, 16

  field :SecurityStatus_ChangedCodeTradeEnd, 17

  field :SecurityStatus_RecoverableCircuitBreaker, 18

  field :SecurityStatus_UnRecoverableCircuitBreaker, 19

  field :SecurityStatus_AfterCombination, 20

  field :SecurityStatus_AfterTransation, 21
end

defmodule Qot_Common.HolderCategory do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :HolderCategory_Unknow
          | :HolderCategory_Agency
          | :HolderCategory_Fund
          | :HolderCategory_SeniorManager

  field :HolderCategory_Unknow, 0

  field :HolderCategory_Agency, 1

  field :HolderCategory_Fund, 2

  field :HolderCategory_SeniorManager, 3
end

defmodule Qot_Common.PushDataType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :PushDataType_Unknow
          | :PushDataType_Realtime
          | :PushDataType_ByDisConn
          | :PushDataType_Cache

  field :PushDataType_Unknow, 0

  field :PushDataType_Realtime, 1

  field :PushDataType_ByDisConn, 2

  field :PushDataType_Cache, 3
end

defmodule Qot_Common.SortField do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :SortField_Unknow
          | :SortField_Code
          | :SortField_CurPrice
          | :SortField_PriceChangeVal
          | :SortField_ChangeRate
          | :SortField_Status
          | :SortField_BidPrice
          | :SortField_AskPrice
          | :SortField_BidVol
          | :SortField_AskVol
          | :SortField_Volume
          | :SortField_Turnover
          | :SortField_Amplitude
          | :SortField_Score
          | :SortField_Premium
          | :SortField_EffectiveLeverage
          | :SortField_Delta
          | :SortField_ImpliedVolatility
          | :SortField_Type
          | :SortField_StrikePrice
          | :SortField_BreakEvenPoint
          | :SortField_MaturityTime
          | :SortField_ListTime
          | :SortField_LastTradeTime
          | :SortField_Leverage
          | :SortField_InOutMoney
          | :SortField_RecoveryPrice
          | :SortField_ChangePrice
          | :SortField_Change
          | :SortField_StreetRate
          | :SortField_StreetVol
          | :SortField_WarrantName
          | :SortField_Issuer
          | :SortField_LotSize
          | :SortField_IssueSize
          | :SortField_UpperStrikePrice
          | :SortField_LowerStrikePrice
          | :SortField_InLinePriceStatus
          | :SortField_PreCurPrice
          | :SortField_AfterCurPrice
          | :SortField_PrePriceChangeVal
          | :SortField_AfterPriceChangeVal
          | :SortField_PreChangeRate
          | :SortField_AfterChangeRate
          | :SortField_PreAmplitude
          | :SortField_AfterAmplitude
          | :SortField_PreTurnover
          | :SortField_AfterTurnover
          | :SortField_LastSettlePrice
          | :SortField_Position
          | :SortField_PositionChange

  field :SortField_Unknow, 0

  field :SortField_Code, 1

  field :SortField_CurPrice, 2

  field :SortField_PriceChangeVal, 3

  field :SortField_ChangeRate, 4

  field :SortField_Status, 5

  field :SortField_BidPrice, 6

  field :SortField_AskPrice, 7

  field :SortField_BidVol, 8

  field :SortField_AskVol, 9

  field :SortField_Volume, 10

  field :SortField_Turnover, 11

  field :SortField_Amplitude, 30

  field :SortField_Score, 12

  field :SortField_Premium, 13

  field :SortField_EffectiveLeverage, 14

  field :SortField_Delta, 15

  field :SortField_ImpliedVolatility, 16

  field :SortField_Type, 17

  field :SortField_StrikePrice, 18

  field :SortField_BreakEvenPoint, 19

  field :SortField_MaturityTime, 20

  field :SortField_ListTime, 21

  field :SortField_LastTradeTime, 22

  field :SortField_Leverage, 23

  field :SortField_InOutMoney, 24

  field :SortField_RecoveryPrice, 25

  field :SortField_ChangePrice, 26

  field :SortField_Change, 27

  field :SortField_StreetRate, 28

  field :SortField_StreetVol, 29

  field :SortField_WarrantName, 31

  field :SortField_Issuer, 32

  field :SortField_LotSize, 33

  field :SortField_IssueSize, 34

  field :SortField_UpperStrikePrice, 45

  field :SortField_LowerStrikePrice, 46

  field :SortField_InLinePriceStatus, 47

  field :SortField_PreCurPrice, 35

  field :SortField_AfterCurPrice, 36

  field :SortField_PrePriceChangeVal, 37

  field :SortField_AfterPriceChangeVal, 38

  field :SortField_PreChangeRate, 39

  field :SortField_AfterChangeRate, 40

  field :SortField_PreAmplitude, 41

  field :SortField_AfterAmplitude, 42

  field :SortField_PreTurnover, 43

  field :SortField_AfterTurnover, 44

  field :SortField_LastSettlePrice, 48

  field :SortField_Position, 49

  field :SortField_PositionChange, 50
end

defmodule Qot_Common.Issuer do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :Issuer_Unknow
          | :Issuer_SG
          | :Issuer_BP
          | :Issuer_CS
          | :Issuer_CT
          | :Issuer_EA
          | :Issuer_GS
          | :Issuer_HS
          | :Issuer_JP
          | :Issuer_MB
          | :Issuer_SC
          | :Issuer_UB
          | :Issuer_BI
          | :Issuer_DB
          | :Issuer_DC
          | :Issuer_ML
          | :Issuer_NM
          | :Issuer_RB
          | :Issuer_RS
          | :Issuer_BC
          | :Issuer_HT
          | :Issuer_VT
          | :Issuer_KC
          | :Issuer_MS
          | :Issuer_GJ

  field :Issuer_Unknow, 0

  field :Issuer_SG, 1

  field :Issuer_BP, 2

  field :Issuer_CS, 3

  field :Issuer_CT, 4

  field :Issuer_EA, 5

  field :Issuer_GS, 6

  field :Issuer_HS, 7

  field :Issuer_JP, 8

  field :Issuer_MB, 9

  field :Issuer_SC, 10

  field :Issuer_UB, 11

  field :Issuer_BI, 12

  field :Issuer_DB, 13

  field :Issuer_DC, 14

  field :Issuer_ML, 15

  field :Issuer_NM, 16

  field :Issuer_RB, 17

  field :Issuer_RS, 18

  field :Issuer_BC, 19

  field :Issuer_HT, 20

  field :Issuer_VT, 21

  field :Issuer_KC, 22

  field :Issuer_MS, 23

  field :Issuer_GJ, 24
end

defmodule Qot_Common.IpoPeriod do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :IpoPeriod_Unknow
          | :IpoPeriod_Today
          | :IpoPeriod_Tomorrow
          | :IpoPeriod_Nextweek
          | :IpoPeriod_Lastweek
          | :IpoPeriod_Lastmonth

  field :IpoPeriod_Unknow, 0

  field :IpoPeriod_Today, 1

  field :IpoPeriod_Tomorrow, 2

  field :IpoPeriod_Nextweek, 3

  field :IpoPeriod_Lastweek, 4

  field :IpoPeriod_Lastmonth, 5
end

defmodule Qot_Common.PriceType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :PriceType_Unknow | :PriceType_Outside | :PriceType_WithIn

  field :PriceType_Unknow, 0

  field :PriceType_Outside, 1

  field :PriceType_WithIn, 2
end

defmodule Qot_Common.WarrantStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :WarrantStatus_Unknow
          | :WarrantStatus_Normal
          | :WarrantStatus_Suspend
          | :WarrantStatus_StopTrade
          | :WarrantStatus_PendingListing

  field :WarrantStatus_Unknow, 0

  field :WarrantStatus_Normal, 1

  field :WarrantStatus_Suspend, 2

  field :WarrantStatus_StopTrade, 3

  field :WarrantStatus_PendingListing, 4
end

defmodule Qot_Common.CompanyAct do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :CompanyAct_None
          | :CompanyAct_Split
          | :CompanyAct_Join
          | :CompanyAct_Bonus
          | :CompanyAct_Transfer
          | :CompanyAct_Allot
          | :CompanyAct_Add
          | :CompanyAct_Dividend
          | :CompanyAct_SPDividend

  field :CompanyAct_None, 0

  field :CompanyAct_Split, 1

  field :CompanyAct_Join, 2

  field :CompanyAct_Bonus, 4

  field :CompanyAct_Transfer, 8

  field :CompanyAct_Allot, 16

  field :CompanyAct_Add, 32

  field :CompanyAct_Dividend, 64

  field :CompanyAct_SPDividend, 128
end

defmodule Qot_Common.QotRight do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :QotRight_Unknow
          | :QotRight_Bmp
          | :QotRight_Level1
          | :QotRight_Level2
          | :QotRight_SF
          | :QotRight_No

  field :QotRight_Unknow, 0

  field :QotRight_Bmp, 1

  field :QotRight_Level1, 2

  field :QotRight_Level2, 3

  field :QotRight_SF, 4

  field :QotRight_No, 5
end

defmodule Qot_Common.PriceReminderType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :PriceReminderType_Unknown
          | :PriceReminderType_PriceUp
          | :PriceReminderType_PriceDown
          | :PriceReminderType_ChangeRateUp
          | :PriceReminderType_ChangeRateDown
          | :PriceReminderType_5MinChangeRateUp
          | :PriceReminderType_5MinChangeRateDown
          | :PriceReminderType_VolumeUp
          | :PriceReminderType_TurnoverUp
          | :PriceReminderType_TurnoverRateUp
          | :PriceReminderType_BidPriceUp
          | :PriceReminderType_AskPriceDown
          | :PriceReminderType_BidVolUp
          | :PriceReminderType_AskVolUp
          | :PriceReminderType_3MinChangeRateUp
          | :PriceReminderType_3MinChangeRateDown

  field :PriceReminderType_Unknown, 0

  field :PriceReminderType_PriceUp, 1

  field :PriceReminderType_PriceDown, 2

  field :PriceReminderType_ChangeRateUp, 3

  field :PriceReminderType_ChangeRateDown, 4

  field :PriceReminderType_5MinChangeRateUp, 5

  field :PriceReminderType_5MinChangeRateDown, 6

  field :PriceReminderType_VolumeUp, 7

  field :PriceReminderType_TurnoverUp, 8

  field :PriceReminderType_TurnoverRateUp, 9

  field :PriceReminderType_BidPriceUp, 10

  field :PriceReminderType_AskPriceDown, 11

  field :PriceReminderType_BidVolUp, 12

  field :PriceReminderType_AskVolUp, 13

  field :PriceReminderType_3MinChangeRateUp, 14

  field :PriceReminderType_3MinChangeRateDown, 15
end

defmodule Qot_Common.PriceReminderFreq do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :PriceReminderFreq_Unknown
          | :PriceReminderFreq_Always
          | :PriceReminderFreq_OnceADay
          | :PriceReminderFreq_OnlyOnce

  field :PriceReminderFreq_Unknown, 0

  field :PriceReminderFreq_Always, 1

  field :PriceReminderFreq_OnceADay, 2

  field :PriceReminderFreq_OnlyOnce, 3
end

defmodule Qot_Common.AssetClass do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :AssetClass_Unknow
          | :AssetClass_Stock
          | :AssetClass_Bond
          | :AssetClass_Commodity
          | :AssetClass_CurrencyMarket
          | :AssetClass_Future
          | :AssetClass_Swap

  field :AssetClass_Unknow, 0

  field :AssetClass_Stock, 1

  field :AssetClass_Bond, 2

  field :AssetClass_Commodity, 3

  field :AssetClass_CurrencyMarket, 4

  field :AssetClass_Future, 5

  field :AssetClass_Swap, 6
end

defmodule Qot_Common.ExpirationCycle do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2
  @type t :: integer | :ExpirationCycle_Unknown | :ExpirationCycle_Week | :ExpirationCycle_Month

  field :ExpirationCycle_Unknown, 0

  field :ExpirationCycle_Week, 1

  field :ExpirationCycle_Month, 2
end

defmodule Qot_Common.ExchType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :ExchType_Unknown
          | :ExchType_HK_MainBoard
          | :ExchType_HK_GEMBoard
          | :ExchType_HK_HKEX
          | :ExchType_US_NYSE
          | :ExchType_US_Nasdaq
          | :ExchType_US_Pink
          | :ExchType_US_AMEX
          | :ExchType_US_Option
          | :ExchType_US_NYMEX
          | :ExchType_US_COMEX
          | :ExchType_US_CBOT
          | :ExchType_US_CME
          | :ExchType_US_CBOE
          | :ExchType_CN_SH
          | :ExchType_CN_SZ
          | :ExchType_CN_STIB
          | :ExchType_SG_SGX
          | :ExchType_JP_OSE

  field :ExchType_Unknown, 0

  field :ExchType_HK_MainBoard, 1

  field :ExchType_HK_GEMBoard, 2

  field :ExchType_HK_HKEX, 3

  field :ExchType_US_NYSE, 4

  field :ExchType_US_Nasdaq, 5

  field :ExchType_US_Pink, 6

  field :ExchType_US_AMEX, 7

  field :ExchType_US_Option, 8

  field :ExchType_US_NYMEX, 9

  field :ExchType_US_COMEX, 10

  field :ExchType_US_CBOT, 11

  field :ExchType_US_CME, 12

  field :ExchType_US_CBOE, 13

  field :ExchType_CN_SH, 14

  field :ExchType_CN_SZ, 15

  field :ExchType_CN_STIB, 16

  field :ExchType_SG_SGX, 17

  field :ExchType_JP_OSE, 18
end

defmodule Qot_Common.Security do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          market: integer,
          code: String.t()
        }

  defstruct [:market, :code]

  field :market, 1, required: true, type: :int32
  field :code, 2, required: true, type: :string
end

defmodule Qot_Common.KLine do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          time: String.t(),
          isBlank: boolean,
          highPrice: float | :infinity | :negative_infinity | :nan,
          openPrice: float | :infinity | :negative_infinity | :nan,
          lowPrice: float | :infinity | :negative_infinity | :nan,
          closePrice: float | :infinity | :negative_infinity | :nan,
          lastClosePrice: float | :infinity | :negative_infinity | :nan,
          volume: integer,
          turnover: float | :infinity | :negative_infinity | :nan,
          turnoverRate: float | :infinity | :negative_infinity | :nan,
          pe: float | :infinity | :negative_infinity | :nan,
          changeRate: float | :infinity | :negative_infinity | :nan,
          timestamp: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :time,
    :isBlank,
    :highPrice,
    :openPrice,
    :lowPrice,
    :closePrice,
    :lastClosePrice,
    :volume,
    :turnover,
    :turnoverRate,
    :pe,
    :changeRate,
    :timestamp
  ]

  field :time, 1, required: true, type: :string
  field :isBlank, 2, required: true, type: :bool
  field :highPrice, 3, optional: true, type: :double
  field :openPrice, 4, optional: true, type: :double
  field :lowPrice, 5, optional: true, type: :double
  field :closePrice, 6, optional: true, type: :double
  field :lastClosePrice, 7, optional: true, type: :double
  field :volume, 8, optional: true, type: :int64
  field :turnover, 9, optional: true, type: :double
  field :turnoverRate, 10, optional: true, type: :double
  field :pe, 11, optional: true, type: :double
  field :changeRate, 12, optional: true, type: :double
  field :timestamp, 13, optional: true, type: :double
end

defmodule Qot_Common.OptionBasicQotExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          strikePrice: float | :infinity | :negative_infinity | :nan,
          contractSize: integer,
          contractSizeFloat: float | :infinity | :negative_infinity | :nan,
          openInterest: integer,
          impliedVolatility: float | :infinity | :negative_infinity | :nan,
          premium: float | :infinity | :negative_infinity | :nan,
          delta: float | :infinity | :negative_infinity | :nan,
          gamma: float | :infinity | :negative_infinity | :nan,
          vega: float | :infinity | :negative_infinity | :nan,
          theta: float | :infinity | :negative_infinity | :nan,
          rho: float | :infinity | :negative_infinity | :nan,
          netOpenInterest: integer,
          expiryDateDistance: integer,
          contractNominalValue: float | :infinity | :negative_infinity | :nan,
          ownerLotMultiplier: float | :infinity | :negative_infinity | :nan,
          optionAreaType: integer,
          contractMultiplier: float | :infinity | :negative_infinity | :nan,
          indexOptionType: integer
        }

  defstruct [
    :strikePrice,
    :contractSize,
    :contractSizeFloat,
    :openInterest,
    :impliedVolatility,
    :premium,
    :delta,
    :gamma,
    :vega,
    :theta,
    :rho,
    :netOpenInterest,
    :expiryDateDistance,
    :contractNominalValue,
    :ownerLotMultiplier,
    :optionAreaType,
    :contractMultiplier,
    :indexOptionType
  ]

  field :strikePrice, 1, required: true, type: :double
  field :contractSize, 2, required: true, type: :int32
  field :contractSizeFloat, 17, optional: true, type: :double
  field :openInterest, 3, required: true, type: :int32
  field :impliedVolatility, 4, required: true, type: :double
  field :premium, 5, required: true, type: :double
  field :delta, 6, required: true, type: :double
  field :gamma, 7, required: true, type: :double
  field :vega, 8, required: true, type: :double
  field :theta, 9, required: true, type: :double
  field :rho, 10, required: true, type: :double
  field :netOpenInterest, 11, optional: true, type: :int32
  field :expiryDateDistance, 12, optional: true, type: :int32
  field :contractNominalValue, 13, optional: true, type: :double
  field :ownerLotMultiplier, 14, optional: true, type: :double
  field :optionAreaType, 15, optional: true, type: :int32
  field :contractMultiplier, 16, optional: true, type: :double
  field :indexOptionType, 18, optional: true, type: :int32
end

defmodule Qot_Common.PreAfterMarketData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          price: float | :infinity | :negative_infinity | :nan,
          highPrice: float | :infinity | :negative_infinity | :nan,
          lowPrice: float | :infinity | :negative_infinity | :nan,
          volume: integer,
          turnover: float | :infinity | :negative_infinity | :nan,
          changeVal: float | :infinity | :negative_infinity | :nan,
          changeRate: float | :infinity | :negative_infinity | :nan,
          amplitude: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :price,
    :highPrice,
    :lowPrice,
    :volume,
    :turnover,
    :changeVal,
    :changeRate,
    :amplitude
  ]

  field :price, 1, optional: true, type: :double
  field :highPrice, 2, optional: true, type: :double
  field :lowPrice, 3, optional: true, type: :double
  field :volume, 4, optional: true, type: :int64
  field :turnover, 5, optional: true, type: :double
  field :changeVal, 6, optional: true, type: :double
  field :changeRate, 7, optional: true, type: :double
  field :amplitude, 8, optional: true, type: :double
end

defmodule Qot_Common.FutureBasicQotExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          lastSettlePrice: float | :infinity | :negative_infinity | :nan,
          position: integer,
          positionChange: integer,
          expiryDateDistance: integer
        }

  defstruct [:lastSettlePrice, :position, :positionChange, :expiryDateDistance]

  field :lastSettlePrice, 1, required: true, type: :double
  field :position, 2, required: true, type: :int32
  field :positionChange, 3, required: true, type: :int32
  field :expiryDateDistance, 4, optional: true, type: :int32
end

defmodule Qot_Common.WarrantBasicQotExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          delta: float | :infinity | :negative_infinity | :nan,
          impliedVolatility: float | :infinity | :negative_infinity | :nan,
          premium: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:delta, :impliedVolatility, :premium]

  field :delta, 1, optional: true, type: :double
  field :impliedVolatility, 2, optional: true, type: :double
  field :premium, 3, required: true, type: :double
end

defmodule Qot_Common.BasicQot do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          isSuspended: boolean,
          listTime: String.t(),
          priceSpread: float | :infinity | :negative_infinity | :nan,
          updateTime: String.t(),
          highPrice: float | :infinity | :negative_infinity | :nan,
          openPrice: float | :infinity | :negative_infinity | :nan,
          lowPrice: float | :infinity | :negative_infinity | :nan,
          curPrice: float | :infinity | :negative_infinity | :nan,
          lastClosePrice: float | :infinity | :negative_infinity | :nan,
          volume: integer,
          turnover: float | :infinity | :negative_infinity | :nan,
          turnoverRate: float | :infinity | :negative_infinity | :nan,
          amplitude: float | :infinity | :negative_infinity | :nan,
          darkStatus: integer,
          optionExData: Qot_Common.OptionBasicQotExData.t() | nil,
          listTimestamp: float | :infinity | :negative_infinity | :nan,
          updateTimestamp: float | :infinity | :negative_infinity | :nan,
          preMarket: Qot_Common.PreAfterMarketData.t() | nil,
          afterMarket: Qot_Common.PreAfterMarketData.t() | nil,
          secStatus: integer,
          futureExData: Qot_Common.FutureBasicQotExData.t() | nil,
          warrantExData: Qot_Common.WarrantBasicQotExData.t() | nil
        }

  defstruct [
    :security,
    :isSuspended,
    :listTime,
    :priceSpread,
    :updateTime,
    :highPrice,
    :openPrice,
    :lowPrice,
    :curPrice,
    :lastClosePrice,
    :volume,
    :turnover,
    :turnoverRate,
    :amplitude,
    :darkStatus,
    :optionExData,
    :listTimestamp,
    :updateTimestamp,
    :preMarket,
    :afterMarket,
    :secStatus,
    :futureExData,
    :warrantExData
  ]

  field :security, 1, required: true, type: Qot_Common.Security
  field :isSuspended, 2, required: true, type: :bool
  field :listTime, 3, required: true, type: :string
  field :priceSpread, 4, required: true, type: :double
  field :updateTime, 5, required: true, type: :string
  field :highPrice, 6, required: true, type: :double
  field :openPrice, 7, required: true, type: :double
  field :lowPrice, 8, required: true, type: :double
  field :curPrice, 9, required: true, type: :double
  field :lastClosePrice, 10, required: true, type: :double
  field :volume, 11, required: true, type: :int64
  field :turnover, 12, required: true, type: :double
  field :turnoverRate, 13, required: true, type: :double
  field :amplitude, 14, required: true, type: :double
  field :darkStatus, 15, optional: true, type: :int32
  field :optionExData, 16, optional: true, type: Qot_Common.OptionBasicQotExData
  field :listTimestamp, 17, optional: true, type: :double
  field :updateTimestamp, 18, optional: true, type: :double
  field :preMarket, 19, optional: true, type: Qot_Common.PreAfterMarketData
  field :afterMarket, 20, optional: true, type: Qot_Common.PreAfterMarketData
  field :secStatus, 21, optional: true, type: :int32
  field :futureExData, 22, optional: true, type: Qot_Common.FutureBasicQotExData
  field :warrantExData, 23, optional: true, type: Qot_Common.WarrantBasicQotExData
end

defmodule Qot_Common.TimeShare do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          time: String.t(),
          minute: integer,
          isBlank: boolean,
          price: float | :infinity | :negative_infinity | :nan,
          lastClosePrice: float | :infinity | :negative_infinity | :nan,
          avgPrice: float | :infinity | :negative_infinity | :nan,
          volume: integer,
          turnover: float | :infinity | :negative_infinity | :nan,
          timestamp: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :time,
    :minute,
    :isBlank,
    :price,
    :lastClosePrice,
    :avgPrice,
    :volume,
    :turnover,
    :timestamp
  ]

  field :time, 1, required: true, type: :string
  field :minute, 2, required: true, type: :int32
  field :isBlank, 3, required: true, type: :bool
  field :price, 4, optional: true, type: :double
  field :lastClosePrice, 5, optional: true, type: :double
  field :avgPrice, 6, optional: true, type: :double
  field :volume, 7, optional: true, type: :int64
  field :turnover, 8, optional: true, type: :double
  field :timestamp, 9, optional: true, type: :double
end

defmodule Qot_Common.SecurityStaticBasic do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          security: Qot_Common.Security.t() | nil,
          id: integer,
          lotSize: integer,
          secType: integer,
          name: String.t(),
          listTime: String.t(),
          delisting: boolean,
          listTimestamp: float | :infinity | :negative_infinity | :nan,
          exchType: integer
        }

  defstruct [
    :security,
    :id,
    :lotSize,
    :secType,
    :name,
    :listTime,
    :delisting,
    :listTimestamp,
    :exchType
  ]

  field :security, 1, required: true, type: Qot_Common.Security
  field :id, 2, required: true, type: :int64
  field :lotSize, 3, required: true, type: :int32
  field :secType, 4, required: true, type: :int32
  field :name, 5, required: true, type: :string
  field :listTime, 6, required: true, type: :string
  field :delisting, 7, optional: true, type: :bool
  field :listTimestamp, 8, optional: true, type: :double
  field :exchType, 9, optional: true, type: :int32
end

defmodule Qot_Common.WarrantStaticExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: integer,
          owner: Qot_Common.Security.t() | nil
        }

  defstruct [:type, :owner]

  field :type, 1, required: true, type: :int32
  field :owner, 2, required: true, type: Qot_Common.Security
end

defmodule Qot_Common.OptionStaticExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: integer,
          owner: Qot_Common.Security.t() | nil,
          strikeTime: String.t(),
          strikePrice: float | :infinity | :negative_infinity | :nan,
          suspend: boolean,
          market: String.t(),
          strikeTimestamp: float | :infinity | :negative_infinity | :nan,
          indexOptionType: integer
        }

  defstruct [
    :type,
    :owner,
    :strikeTime,
    :strikePrice,
    :suspend,
    :market,
    :strikeTimestamp,
    :indexOptionType
  ]

  field :type, 1, required: true, type: :int32
  field :owner, 2, required: true, type: Qot_Common.Security
  field :strikeTime, 3, required: true, type: :string
  field :strikePrice, 4, required: true, type: :double
  field :suspend, 5, required: true, type: :bool
  field :market, 6, required: true, type: :string
  field :strikeTimestamp, 7, optional: true, type: :double
  field :indexOptionType, 8, optional: true, type: :int32
end

defmodule Qot_Common.FutureStaticExData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          lastTradeTime: String.t(),
          lastTradeTimestamp: float | :infinity | :negative_infinity | :nan,
          isMainContract: boolean
        }

  defstruct [:lastTradeTime, :lastTradeTimestamp, :isMainContract]

  field :lastTradeTime, 1, required: true, type: :string
  field :lastTradeTimestamp, 2, optional: true, type: :double
  field :isMainContract, 3, required: true, type: :bool
end

defmodule Qot_Common.SecurityStaticInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          basic: Qot_Common.SecurityStaticBasic.t() | nil,
          warrantExData: Qot_Common.WarrantStaticExData.t() | nil,
          optionExData: Qot_Common.OptionStaticExData.t() | nil,
          futureExData: Qot_Common.FutureStaticExData.t() | nil
        }

  defstruct [:basic, :warrantExData, :optionExData, :futureExData]

  field :basic, 1, required: true, type: Qot_Common.SecurityStaticBasic
  field :warrantExData, 2, optional: true, type: Qot_Common.WarrantStaticExData
  field :optionExData, 3, optional: true, type: Qot_Common.OptionStaticExData
  field :futureExData, 4, optional: true, type: Qot_Common.FutureStaticExData
end

defmodule Qot_Common.Broker do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          id: integer,
          name: String.t(),
          pos: integer,
          orderID: integer,
          volume: integer
        }

  defstruct [:id, :name, :pos, :orderID, :volume]

  field :id, 1, required: true, type: :int64
  field :name, 2, required: true, type: :string
  field :pos, 3, required: true, type: :int32
  field :orderID, 4, optional: true, type: :int64
  field :volume, 5, optional: true, type: :int64
end

defmodule Qot_Common.Ticker do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          time: String.t(),
          sequence: integer,
          dir: integer,
          price: float | :infinity | :negative_infinity | :nan,
          volume: integer,
          turnover: float | :infinity | :negative_infinity | :nan,
          recvTime: float | :infinity | :negative_infinity | :nan,
          type: integer,
          typeSign: integer,
          pushDataType: integer,
          timestamp: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :time,
    :sequence,
    :dir,
    :price,
    :volume,
    :turnover,
    :recvTime,
    :type,
    :typeSign,
    :pushDataType,
    :timestamp
  ]

  field :time, 1, required: true, type: :string
  field :sequence, 2, required: true, type: :int64
  field :dir, 3, required: true, type: :int32
  field :price, 4, required: true, type: :double
  field :volume, 5, required: true, type: :int64
  field :turnover, 6, required: true, type: :double
  field :recvTime, 7, optional: true, type: :double
  field :type, 8, optional: true, type: :int32
  field :typeSign, 9, optional: true, type: :int32
  field :pushDataType, 10, optional: true, type: :int32
  field :timestamp, 11, optional: true, type: :double
end

defmodule Qot_Common.OrderBookDetail do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          orderID: integer,
          volume: integer
        }

  defstruct [:orderID, :volume]

  field :orderID, 1, required: true, type: :int64
  field :volume, 2, required: true, type: :int64
end

defmodule Qot_Common.OrderBook do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          price: float | :infinity | :negative_infinity | :nan,
          volume: integer,
          orederCount: integer,
          detailList: [Qot_Common.OrderBookDetail.t()]
        }

  defstruct [:price, :volume, :orederCount, :detailList]

  field :price, 1, required: true, type: :double
  field :volume, 2, required: true, type: :int64
  field :orederCount, 3, required: true, type: :int32
  field :detailList, 4, repeated: true, type: Qot_Common.OrderBookDetail
end

defmodule Qot_Common.ShareHoldingChange do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          holderName: String.t(),
          holdingQty: float | :infinity | :negative_infinity | :nan,
          holdingRatio: float | :infinity | :negative_infinity | :nan,
          changeQty: float | :infinity | :negative_infinity | :nan,
          changeRatio: float | :infinity | :negative_infinity | :nan,
          time: String.t(),
          timestamp: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:holderName, :holdingQty, :holdingRatio, :changeQty, :changeRatio, :time, :timestamp]

  field :holderName, 1, required: true, type: :string
  field :holdingQty, 2, required: true, type: :double
  field :holdingRatio, 3, required: true, type: :double
  field :changeQty, 4, required: true, type: :double
  field :changeRatio, 5, required: true, type: :double
  field :time, 6, required: true, type: :string
  field :timestamp, 7, optional: true, type: :double
end

defmodule Qot_Common.SubInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          subType: integer,
          securityList: [Qot_Common.Security.t()]
        }

  defstruct [:subType, :securityList]

  field :subType, 1, required: true, type: :int32
  field :securityList, 2, repeated: true, type: Qot_Common.Security
end

defmodule Qot_Common.ConnSubInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          subInfoList: [Qot_Common.SubInfo.t()],
          usedQuota: integer,
          isOwnConnData: boolean
        }

  defstruct [:subInfoList, :usedQuota, :isOwnConnData]

  field :subInfoList, 1, repeated: true, type: Qot_Common.SubInfo
  field :usedQuota, 2, required: true, type: :int32
  field :isOwnConnData, 3, required: true, type: :bool
end

defmodule Qot_Common.PlateInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          plate: Qot_Common.Security.t() | nil,
          name: String.t(),
          plateType: integer
        }

  defstruct [:plate, :name, :plateType]

  field :plate, 1, required: true, type: Qot_Common.Security
  field :name, 2, required: true, type: :string
  field :plateType, 3, optional: true, type: :int32
end

defmodule Qot_Common.Rehab do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          time: String.t(),
          companyActFlag: integer,
          fwdFactorA: float | :infinity | :negative_infinity | :nan,
          fwdFactorB: float | :infinity | :negative_infinity | :nan,
          bwdFactorA: float | :infinity | :negative_infinity | :nan,
          bwdFactorB: float | :infinity | :negative_infinity | :nan,
          splitBase: integer,
          splitErt: integer,
          joinBase: integer,
          joinErt: integer,
          bonusBase: integer,
          bonusErt: integer,
          transferBase: integer,
          transferErt: integer,
          allotBase: integer,
          allotErt: integer,
          allotPrice: float | :infinity | :negative_infinity | :nan,
          addBase: integer,
          addErt: integer,
          addPrice: float | :infinity | :negative_infinity | :nan,
          dividend: float | :infinity | :negative_infinity | :nan,
          spDividend: float | :infinity | :negative_infinity | :nan,
          timestamp: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :time,
    :companyActFlag,
    :fwdFactorA,
    :fwdFactorB,
    :bwdFactorA,
    :bwdFactorB,
    :splitBase,
    :splitErt,
    :joinBase,
    :joinErt,
    :bonusBase,
    :bonusErt,
    :transferBase,
    :transferErt,
    :allotBase,
    :allotErt,
    :allotPrice,
    :addBase,
    :addErt,
    :addPrice,
    :dividend,
    :spDividend,
    :timestamp
  ]

  field :time, 1, required: true, type: :string
  field :companyActFlag, 2, required: true, type: :int64
  field :fwdFactorA, 3, required: true, type: :double
  field :fwdFactorB, 4, required: true, type: :double
  field :bwdFactorA, 5, required: true, type: :double
  field :bwdFactorB, 6, required: true, type: :double
  field :splitBase, 7, optional: true, type: :int32
  field :splitErt, 8, optional: true, type: :int32
  field :joinBase, 9, optional: true, type: :int32
  field :joinErt, 10, optional: true, type: :int32
  field :bonusBase, 11, optional: true, type: :int32
  field :bonusErt, 12, optional: true, type: :int32
  field :transferBase, 13, optional: true, type: :int32
  field :transferErt, 14, optional: true, type: :int32
  field :allotBase, 15, optional: true, type: :int32
  field :allotErt, 16, optional: true, type: :int32
  field :allotPrice, 17, optional: true, type: :double
  field :addBase, 18, optional: true, type: :int32
  field :addErt, 19, optional: true, type: :int32
  field :addPrice, 20, optional: true, type: :double
  field :dividend, 21, optional: true, type: :double
  field :spDividend, 22, optional: true, type: :double
  field :timestamp, 23, optional: true, type: :double
end
