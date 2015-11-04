unit SaleGood;

interface

uses Sale, PricedGood;

type
	TSaleGood = class
		Sale: TSale;
		PricedGood: TPricedGood;
		Amount: double;
		ActionAmount: double;

		constructor Create(ASale: TSale; APricedGood: TPricedGood; AAmount: double; AActionAmount: double);
	end;

	TSaleGoodArray = array of TSaleGood;

implementation

{ TSaleGood }

constructor TSaleGood.Create(ASale: TSale; APricedGood: TPricedGood; AAmount,
  AActionAmount: double);
begin
	Sale := ASale;
	PricedGood := APricedGood;
	Amount := AAmount;
	ActionAmount := AActionAmount;
end;

end.
