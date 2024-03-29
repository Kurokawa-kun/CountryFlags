//+------------------------------------------------------------------+
//|                                                  CountryFlag.mq5 |
//|                                         Copyright 2024, Kurokawa |
//|                                   https://twitter.com/ImKurokawa |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Kurokawa"
#property link      "https://twitter.com/ImKurokawa"
#property version   "1.00"
#property indicator_chart_window
#property indicator_color1     clrBlack   //  コンパイル時における警告メッセージ抑止のため
#include <Flag.mqh>
#include <CheckEnvironment.mqh>
#define MARGIN_X           4
#define MARGIN_Y           16
#define MARGIN_IMAGE       6
#define HEIGHT_ONE_CLICK   64

CFlag *FlagMarginCurrency;
CFlag *FlagProfitCurrency;

int OnInit()
{
   //  起動可能か判断するためのチェック
   if (!CheckEnvironment(ChkExclusiveInChart, NULL, NULL, NULL, NULL))
   {
      ChartIndicatorDelete(0, 0, MQLInfoString(MQL_PROGRAM_NAME));
      return INIT_FAILED;
   }   
   
   FlagMarginCurrency = new CFlag();
   FlagProfitCurrency = new CFlag();
   FlagMarginCurrency.Create(0, "FlagMarginCurrency", 0);
   FlagProfitCurrency.Create(0, "FlagProfitCurrency", 0);
   
   string MarginCurrency = SymbolInfoString(Symbol(), SYMBOL_CURRENCY_MARGIN);
   string ProfitCurrency = SymbolInfoString(Symbol(), SYMBOL_CURRENCY_PROFIT);
   
   if (MarginCurrency == ProfitCurrency)
   {
      FlagMarginCurrency.SetFlag(32, "NO_IMAGE");
      FlagProfitCurrency.SetFlag(32, "NO_IMAGE");
   }
   else
   {
      string MarginCurrencyCountryName = FlagMarginCurrency.GetCountryName(MarginCurrency);
      FlagMarginCurrency.SetFlag(32, StringSubstr(MarginCurrencyCountryName, 0, StringFind(MarginCurrencyCountryName, ",")));
      string ProfitCurrencyCountryName = FlagProfitCurrency.GetCountryName(ProfitCurrency);         
      FlagProfitCurrency.SetFlag(32, StringSubstr(ProfitCurrencyCountryName, 0, StringFind(ProfitCurrencyCountryName, ",")));
   }
   
   Draw();
   return INIT_SUCCEEDED;
}

void OnDeinit(const int reason)
{
   FlagMarginCurrency.Destroy();
   delete FlagMarginCurrency;
   FlagProfitCurrency.Destroy();
   delete FlagProfitCurrency;
}

int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
   return rates_total;
}

void OnChartEvent(const int id, const long& lparam, const double& dparam, const string& sparam)
{
   if (id == CHARTEVENT_CHART_CHANGE)
   {
      Draw();
   }
}

void Draw()
{
   int OneClick = (int)ChartGetInteger(0, CHART_SHOW_ONE_CLICK);  //  ワンクリックトレードが表示されているか（表示されている場合はY方向に動かす）
   FlagMarginCurrency.Move(MARGIN_X, MARGIN_Y + HEIGHT_ONE_CLICK * OneClick + (32 - (int)ObjectGetInteger(0, "PictureFlagMarginCurrency", OBJPROP_YSIZE)) / 2);
   FlagProfitCurrency.Move(MARGIN_X + 32 + MARGIN_IMAGE, MARGIN_Y + HEIGHT_ONE_CLICK * OneClick + (32 - (int)ObjectGetInteger(0, "PictureFlagProfitCurrency", OBJPROP_YSIZE)) / 2);
   ChartRedraw(0);
}
