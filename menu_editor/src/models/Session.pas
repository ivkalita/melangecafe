unit Session;

interface

type
	TSession = class
	public
		Id: integer;
		DtStart: TDateTime;
		DtEnd: TDateTime;
		constructor Create(AId: integer; ADtStart, ADtEnd: TDateTime); overload;
		constructor Create; overload;
	end;

	TSessionArray = array of TSession;

implementation

{ TSession }

	constructor TSession.Create(AId: integer; ADtStart, ADtEnd: TDateTime);
	begin
		Id := AId;
		DtStart := ADtStart;
		DtEnd := ADtEnd;
	end;

	constructor TSession.Create;
	begin
		Id := -1;
		DtStart := 0;
		DtEnd := 0;
	end;

end.
