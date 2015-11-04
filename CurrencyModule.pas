unit CurrencyModule;

interface
type
   RCurrency = record
      number: Integer;
      mantissa: Integer;
   end;

   function CurrToStr(ACurr: RCurrency): string;
   function StrToCurr(AStr: string): RCurrency;
   function Curr(number: integer; mantissa: integer): RCurrency;
   function Curr2(realPart, fracPart: integer): RCurrency;
   function StrReverse(AStr: string): string;
implementation
uses SysUtils;
   function StrReverse(AStr: string): string;
   var
      i: Integer;
   begin
      result := AStr;
      for i := Length(AStr) downto 1 do
         result[length(AStr) - i + 1] := AStr[i];
   end;

   //0.1 + 0.02
   //(1, 1) + (2, 2) = (12, 2)
   //0.1 + 1
   //(1, 1) + (10, 1) = (11, 1)
   //2 + 1
   //(2, 0) + (1, 0) = (3, 0)
   //0.1 * 0.1
   //(1, 1) * (1, 1) = (1, 2)

   function Curr2(realPart, fracPart: integer): RCurrency;
   var
      s: string;
   begin
      s := IntToStr(realPart) +  StrReverse(IntToStr(fracPart));
      result.number := StrToInt(s);
      result.mantissa := Length(IntToStr(fracPart));
   end;

   function Curr(number, mantissa: integer): RCurrency;
   begin
      Result.number := number;
      Result.mantissa := mantissa;
   end;

   function CurrToStr(ACurr: RCurrency): string;
   var
      i: integer;
      s: string;
   begin
      result := '';
      s := IntToStr(ACurr.number);
      for i := 1 to Length(s) - ACurr.mantissa do
         result := result + s[i];
      result := result + '.';
      for i := Length(s) - ACurr.mantissa + 1 to Length(s) do
         result := result + s[i];
   end;


   function StrToCurr(AStr: string): RCurrency;
   var
      i: integer;
   begin
      result.number := StrToInt(StringReplace(AStr, '.', '', []));   //012345
      while (AStr[i] <> '.') do                                  //123.41 = 5 - 3 = 2
         Inc(i);
      result.mantissa := Length(IntToStr(Result.number)) - i;
   end;


end.
