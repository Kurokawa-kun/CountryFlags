//+------------------------------------------------------------------+
//|                                                         Flag.mqh |
//|                                         Copyright 2024, Kurokawa |
//|                                   https://twitter.com/ImKurokawa |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Kurokawa"
#property link      "https://twitter.com/ImKurokawa"
#include <Controls\Picture.mqh>
#include <Controls\Label.mqh>
#include <Generic\HashMap.mqh>

enum Country
{
   ARGENTINE,
   ASEAN,
   AU,
   AUSTRALIA,
   BRAZIL,
   CANADA,
   CHINA,
   CZECH,
   DENMARK,
   EU,
   FRANCE,
   GERMANY,
   HONG_KONG,
   HUNGARY,
   INDIA,
   INDONESIA,
   ISRAEL,
   ITALY,
   JAPAN,
   MALAYSIA,
   MEXICO,
   NEW_ZEALAND,
   NORWAY,
   NO_IMAGE,
   PHILIPPINES,
   POLAND,
   ROMANIA,
   RUSSIA,
   SAUDI_ARABIA,
   SINGAPORE,
   SOUTH_AFRICA,
   SOUTH_KOREA,
   SPAIN,
   SWEDEN,
   SWITZERLAND,
   TAIWAN,
   THAILAND,
   TURKEY,
   UK,
   UNITED_ARAB_EMIRATES,
   USA,
   VIETNAM
};

class CFlag
{
   public:
      CFlag(void);
      ~CFlag(void);
      virtual bool Create(const long chart, const string name, const int subwin);
      virtual void Destroy();
      virtual bool SetFlag(const int flagsize, const string flag);
      virtual void Move(int x, int y);
      virtual void SetText(string t);
      static string GetCountryName(const string currency);
      static Country StringToCountry(const string name);

      static CHashMap<string, string> GetCountryMap();
      static CHashMap<string, string> GetRegionMap();
      static CHashMap<string, string> GetCurrencyMap();
   protected:
      CPicture *Picture;
      CLabel *Label;
      int FlagSize;
      string Name;
      static int NumberOfInstances;
      static CHashMap<string, string> *CountryMap;
      static CHashMap<string, string> *RegionMap;
      static CHashMap<string, string> *CurrencyMap;
      
};

int CFlag::NumberOfInstances = 0;
CHashMap<string, string> *CFlag::CountryMap = NULL;
CHashMap<string, string> *CFlag::RegionMap = NULL;
CHashMap<string, string> *CFlag::CurrencyMap = NULL;

CFlag::CFlag(void)
{
   Picture = new CPicture();
   Label = new CLabel();
   
   CFlag::NumberOfInstances++;
   if (CFlag::NumberOfInstances == 1)
   {
      CFlag::CountryMap = new CHashMap<string, string>();
      CountryMap.Add("ARS", "ARGENTINE,Argentine");
      CountryMap.Add("AUD", "AUSTRALIA,Australia");
      CountryMap.Add("BRL", "BRAZIL,Brazil");
      CountryMap.Add("CAD", "CANADA,Canada");
      CountryMap.Add("CNH", "CHINA,China");
      CountryMap.Add("CZK", "CZECH,Czech");
      CountryMap.Add("DKK", "DENMARK,Denmark");
      CountryMap.Add("EUR", "EU,EU");
      CountryMap.Add("HKD", "HONG_KONG,HongKong");
      CountryMap.Add("HUF", "HUNGARY,Hungary");
      CountryMap.Add("INR", "INDIA,India");
      CountryMap.Add("IDR", "INDONESIA,Indonesia");
      CountryMap.Add("ILS", "ISRAEL,Israel");
      CountryMap.Add("JPY", "JAPAN,Japan");
      CountryMap.Add("MYR", "MALAYSIA,Malaysia");
      CountryMap.Add("MXN", "MEXICO,Mexico");
      CountryMap.Add("NZD", "NEW_ZEALAND,NewZealand");
      CountryMap.Add("NOK", "NORWAY,Norway");
      CountryMap.Add("PHP", "PHILIPPINES,Philippines");
      CountryMap.Add("PLN", "POLAND,Poland");
      CountryMap.Add("RON", "ROMANIA,Romania");
      CountryMap.Add("RUB", "RUSSIA,Russia");
      CountryMap.Add("SAR", "SAUDI_ARABIA,SaudiArabia");
      CountryMap.Add("SGD", "SINGAPORE,Singapore");
      CountryMap.Add("ZAR", "SOUTH_AFRICA,SouthAfrica");
      CountryMap.Add("KRW", "SOUTH_KOREA,SouthKorea");
      CountryMap.Add("SEK", "SWEDEN,Sweden");
      CountryMap.Add("CHF", "SWITZERLAND,Switzerland");
      CountryMap.Add("TWD", "TAIWAN,Taiwan");
      CountryMap.Add("THB", "THAILAND,Thailand");
      CountryMap.Add("TRY", "TURKEY,Turkey");
      CountryMap.Add("GBP", "UK,UK");
      CountryMap.Add("AED", "UNITED_ARAB_EMIRATES,UnitedArabEmirates");
      CountryMap.Add("USD", "USA,USA");
      CountryMap.Add("VND", "VIETNAM,Vietnam");
      
      CFlag::RegionMap = new CHashMap<string, string>();      
      RegionMap.Add("Argentine", "SouthAmerica");
      RegionMap.Add("ASEAN", "Asia");
      RegionMap.Add("AU", "Africa");
      RegionMap.Add("Australia", "Oceania");
      RegionMap.Add("Brazil", "SouthAmerica");
      RegionMap.Add("Canada", "NorthAmerica");
      RegionMap.Add("China", "Asia");
      RegionMap.Add("Czech", "Europe");
      RegionMap.Add("Denmark", "Europe");
      RegionMap.Add("EU", "Europe");
      RegionMap.Add("France", "Europe");
      RegionMap.Add("Germany", "Europe");
      RegionMap.Add("Hong Kong", "Asia");
      RegionMap.Add("Hungary", "Europe");
      RegionMap.Add("India", "Asia");
      RegionMap.Add("Indonesia", "Asia");
      RegionMap.Add("Israel", "MiddleEast");
      RegionMap.Add("Italy", "Europe");
      RegionMap.Add("Japan", "Asia");
      RegionMap.Add("Malaysia", "Asia");
      RegionMap.Add("Mexico", "SouthAmerica");
      RegionMap.Add("New Zealand", "Oceania");
      RegionMap.Add("Norway", "Europe");
      RegionMap.Add("Philippines", "Asia");
      RegionMap.Add("Poland", "Europe");
      RegionMap.Add("Romania", "Europe");
      RegionMap.Add("Russia", "Europe");
      RegionMap.Add("Saudi Arabia", "MiddleEast");
      RegionMap.Add("Singapore", "Asia");
      RegionMap.Add("South Africa", "Africa");
      RegionMap.Add("South Korea", "Asia");
      RegionMap.Add("Spain", "Europe");
      RegionMap.Add("Sweden", "Europe");
      RegionMap.Add("Switzerland", "Europe");
      RegionMap.Add("Taiwan", "Asia");
      RegionMap.Add("Thailand", "Asia");
      RegionMap.Add("Turkey", "MiddleEast");
      RegionMap.Add("UK", "Europe");
      RegionMap.Add("United ArabEmirates", "MiddleEast");
      RegionMap.Add("USA", "NorthAmerica");
      RegionMap.Add("Vietnam", "Asia");

      CFlag::CurrencyMap = new CHashMap<string, string>();      
      CurrencyMap.Add("NorthAmerica", "CAD,USD");
      CurrencyMap.Add("SouthAmerica", "ARS,BRL,MXN");
      CurrencyMap.Add("Oceania", "AUD,NZD");
      CurrencyMap.Add("Asia", "CNH,HKD,INR,IDR,JPY,MYR,PHP,SGD,KRW,TWD,THB,VND");
      CurrencyMap.Add("Africa", "ZAR");
      CurrencyMap.Add("Europe", "CZK,EUR,HUF,PLN,RON,CHF,GBP,DKK,NOK,SEK,RUB");
      CurrencyMap.Add("MiddleEast", "ILS,SAR,TRY,AED");      
   }
}

CFlag::~CFlag(void)
{
   CFlag::NumberOfInstances--;   
   delete Picture;
   delete Label;
   
   if (CFlag::NumberOfInstances == 0)
   {
      delete CFlag::CountryMap;
      delete CFlag::RegionMap;
      delete CFlag::CurrencyMap;
   }
}

bool CFlag::Create(const long chart, const string name, const int subwin)
{
   this.FlagSize = 32; 
   this.Name = name;
   if (!Picture.Create(chart, "Picture" + this.Name, subwin, 0, 0, 0, 0)) return false;
   if (!Label.Create(chart, "Label" + this.Name, subwin, 0, 0, 0, 0)) return false;
   Label.Text("");
   
   //  グローバル変数に色が登録されている場合
   if (GlobalVariableCheck(StringFormat("ForegroundColor_%lld", ChartID())))
   {
      Label.Color((color)GlobalVariableGet(StringFormat("ForegroundColor_%lld", ChartID())));
   }
   else
   {
      Label.Color((color)ChartGetInteger(0, CHART_COLOR_FOREGROUND, 0));
   }

   return true;
}

void CFlag::Destroy()
{
   Picture.Destroy(REASON_REMOVE);
   Label.Destroy(REASON_REMOVE);
}

bool CFlag::SetFlag(const int flagsize, const string country)
{
   this.FlagSize = flagsize;
   string FlagName = StringFormat("Flags\\%s\\%s.bmp", IntegerToString(flagsize), country);
   
   if (!FileIsExist(FlagName))
   {
      FlagName = StringFormat("Flags\\%s\\%s.bmp", IntegerToString(flagsize), "NO_IMAGE");
   }

   FlagName = "\\Files\\" + FlagName;
   Picture.BmpName(FlagName);
   Label.FontSize((int)(ObjectGetInteger(0, "Picture" + this.Name, OBJPROP_YSIZE) * 0.75));
   
   return true;
}

void CFlag::Move(const int x, const int y)
{
   Picture.Move(x + 4, y + (int)((this.FlagSize - ObjectGetInteger(0, "Picture" + this.Name, OBJPROP_YSIZE)) / 2));
   Label.Move(x + 4 + (int)ObjectGetInteger(0, "Picture" + this.Name, OBJPROP_XSIZE) + 4, y);
}

void CFlag::SetText(string t)
{
   this.Label.Text(t);
}

string CFlag::GetCountryName(const string currency)
{
   string CountryName;
   CountryMap.TryGetValue(currency, CountryName);
   return CountryName;
}

Country CFlag::StringToCountry(const string name)
{
   if (name == "Argentine")
   {
      return ARGENTINE;
   }
   else if (name == "ASEAN")
   {
      return ASEAN;
   }
   else if (name == "AU")
   {
      return AU;
   }
   else if (name == "Australia")
   {
      return AUSTRALIA;
   }
   else if (name == "Brazil")
   {
      return BRAZIL;
   }
   else if (name == "Canada")
   {
      return CANADA;
   }
   else if (name == "China")
   {
      return CHINA;
   }
   else if (name == "Czech")
   {
      return CZECH;
   }
   else if (name == "Denmark")
   {
      return DENMARK;
   }
   else if (name == "EU")
   {
      return EU;
   }
   else if (name == "France")
   {
      return FRANCE;
   }
   else if (name == "Germany")
   {
      return GERMANY;
   }
   else if (name == "Hong Kong")
   {
      return HONG_KONG;
   }
   else if (name == "Hungary")
   {
      return HUNGARY;
   }
   else if (name == "India")
   {
      return INDIA;
   }
   else if (name == "Indonesia")
   {
      return INDONESIA;
   }
   else if (name == "Israel")
   {
      return ISRAEL;
   }
   else if (name == "Italy")
   {
      return ITALY;
   }
   else if (name == "Japan")
   {
      return JAPAN;
   }
   else if (name == "Malaysia")
   {
      return MALAYSIA;
   }
   else if (name == "Mexico")
   {
      return MEXICO;
   }
   else if (name == "New Zealand")
   {
      return NEW_ZEALAND;
   }
   else if (name == "Norway")
   {
      return NORWAY;
   }
   else if (name == "Philippines")
   {
      return PHILIPPINES;
   }
   else if (name == "Poland")
   {
      return POLAND;
   }
   else if (name == "Romania")
   {
      return ROMANIA;
   }
   else if (name == "Russia")
   {
      return RUSSIA;
   }
   else if (name == "Saudi Arabia")
   {
      return SAUDI_ARABIA;
   }
   else if (name == "Singapore")
   {
      return SINGAPORE;
   }
   else if (name == "South Africa")
   {
      return SOUTH_AFRICA;
   }
   else if (name == "South Korea")
   {
      return SOUTH_KOREA;
   }
   else if (name == "Spain")
   {
      return SPAIN;
   }
   else if (name == "Sweden")
   {
      return SWEDEN;
   }
   else if (name == "Switzerland")
   {
      return SWITZERLAND;
   }
   else if (name == "Taiwan")
   {
      return TAIWAN;
   }
   else if (name == "Thailand")
   {
      return THAILAND;
   }
   else if (name == "Turkey")
   {
      return TURKEY;
   }
   else if (name == "UK")
   {
      return UK;
   }
   else if (name == "United Arab Emirates")
   {
      return UNITED_ARAB_EMIRATES;
   }
   else if (name == "USA")
   {
      return USA;
   }
   else if (name == "Vietnam")
   {
      return VIETNAM;
   }
   else
   {
      return NO_IMAGE;
   }
}

CHashMap<string, string> CFlag::GetCountryMap()
{
   return CFlag::CountryMap;
}

CHashMap<string, string> CFlag::GetRegionMap()
{
   return CFlag::RegionMap;
}

CHashMap<string, string> CFlag::GetCurrencyMap()
{
   return CFlag::CurrencyMap;
}
