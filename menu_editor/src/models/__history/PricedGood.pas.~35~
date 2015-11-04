unit PricedGood;

interface

uses
	Good;

type
	TPricedGood = class
	public
		Id: integer;
		Good: TGood;
		Price: double;
		CreatedAt: TDateTime;
		ExpiredAt: TDateTime;
		ActionAble: integer;
		constructor Create(AId: integer; AGood: TGood; APrice: double; ACreatedAt,
			AExpiredAt: TDateTime; AActionAble: integer);
	end;

	TPPricedGood = ^TPricedGood;

	TPricedGoodArray = array of TPricedGood;


	THistoryPricedGood = class(TPricedGood)
	public
		Amount: double;
		ActionAmount: double;
		DiscountAmount: double;
		constructor Create(AId: integer; AGood: TGood; APrice: double; ACreatedAt,
			AExpiredAt: TDateTime; AActionAble: integer; AAmount, AActionAmount,
			ADiscountAmount: double);
	end;

	TPHistoryPricedGood = ^THistoryPricedGood;

	THistoryPricedGoodArray = array of THistoryPricedGood;

implementation

{ THistoryPricedGood }

constructor THistoryPricedGood.Create(AId: integer; AGood: TGood;
  APrice: double; ACreatedAt, AExpiredAt: TDateTime; AActionAble: integer;
  AAmount, AActionAmount, ADiscountAmount: double);
begin
	inherited Create(AId, AGood, APrice, ACreatedAt, AExpiredAt, AActionAble);
	Amount := AAmount;
	ActionAmount := AActionAmount;
	DiscountAmount := ADiscountAmount;
end;

{ TPricedGood }

constructor TPricedGood.Create(AId: integer; AGood: TGood; APrice: double;
  ACreatedAt, AExpiredAt: TDateTime; AActionAble: integer);
begin
	Id := AId;
	Good := AGood;
	Price := APrice;
	CreatedAt := ACreatedAt;
	ExpiredAt := AExpiredAt;
	ActionAble := AActionAble;
end;

end.
