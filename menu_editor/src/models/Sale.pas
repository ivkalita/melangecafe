unit Sale;

interface

uses Session, Discount;

type
	TSaleType = (stCashFree = 3, stCash = 0);

	TSale = class
		id: integer;
		dt: TDateTime;
		session: TSession;
		discount: TDiscount;
		stype: TSaleType;

		constructor Create(AId: integer; ADt: TDateTime; ASession: TSession; ADiscount: TDiscount; ASType: TSaleType); overload;
		constructor Create(AId: integer; ADt: TDateTime; ASession: TSession; ADiscount: TDiscount; ASType: integer); overload;
	end;

	TSalesArray = array of TSale;

implementation

{ TSale }

constructor TSale.Create(AId: integer; ADt: TDateTime; ASession: TSession;
  ADiscount: TDiscount; ASType: TSaleType);
begin
	id := AId;
	dt := ADt;
	session := ASession;
	discount := ADiscount;
	stype := ASType;
end;

constructor TSale.Create(AId: integer; ADt: TDateTime; ASession: TSession;
  ADiscount: TDiscount; ASType: integer);
begin
	id := AId;
	dt := ADt;
	session := ASession;
	discount := ADiscount;
	stype := TSaleType(ASType);
end;

end.