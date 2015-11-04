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
		money: Double;

		constructor Create(AId: integer; ADt: TDateTime; ASession: TSession; ADiscount: TDiscount; ASType: TSaleType; AMoney: double); overload;
		constructor Create(AId: integer; ADt: TDateTime; ASession: TSession; ADiscount: TDiscount; ASType: integer; AMoney: double); overload;
		function getStringifiedSaleType(): string;
		function getStringifiedIsHasDiscount(): string;
		function getRealMoney(): double;
	end;

	TSalesArray = array of TSale;

implementation

{ TSale }

constructor TSale.Create(AId: integer; ADt: TDateTime; ASession: TSession;
  ADiscount: TDiscount; ASType: TSaleType; AMoney: double);
begin
	id := AId;
	dt := ADt;
	session := ASession;
	discount := ADiscount;
	stype := ASType;
	money := AMoney;
end;

constructor TSale.Create(AId: integer; ADt: TDateTime; ASession: TSession;
  ADiscount: TDiscount; ASType: integer; AMoney: double);
begin
	id := AId;
	dt := ADt;
	session := ASession;
	discount := ADiscount;
	stype := TSaleType(ASType);
	money := AMoney;
end;

function TSale.getRealMoney: double;
begin
	if (discount.id = 0) then
	begin
        result := money;
	end
	else
	begin
        result := money * 0.9;
    end;
end;

function TSale.getStringifiedIsHasDiscount: string;
begin
	if (discount.id = 0) then
	begin
		result := '���';
	end
	else
	begin
        result := '��';
    end;

end;

function TSale.getStringifiedSaleType: string;
begin
	if (stype = stCash) then
	begin
		result := '���';
	end
	else
	begin
        result := '������';
    end;
end;

end.
