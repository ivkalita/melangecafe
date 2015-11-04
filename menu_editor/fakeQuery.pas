unit fakeQuery;

interface
type
   RCat = record
      id: integer;
      caption: string;
      parent_id: integer;
   end;

   RGood = record
      id: integer;
      caption: string;
      price: double;
      parent_cat: integer;
      action_able: integer;
   end;

   TFakeDB = class

   end;

   TFakeQuery = class
   private
      cats: array of RCat;
      goods: array of RGood;
      FBaseName: string;
   private
      procedure AddCat(AId: integer; ACaption: string; AParentId: integer);
      procedure AddGood(AId: integer; ACaption: string; AParentCat: integer; AAAble: Integer);
   public
      constructor Create(ABaseName: string);
      procedure Clean;
      procedure FillCats;
      procedure FillGoods;
   end;

implementation

uses
  db_comps_additional;

{ TFakeQuery }

procedure TFakeQuery.AddCat(AId: integer; ACaption: string; AParentId: integer);
begin
   setlength(cats, length(cats) + 1);
   with cats[high(cats)] do
   begin
      id := AId;
      caption := ACaption;
      parent_id := AParentId;
   end;
end;

procedure TFakeQuery.AddGood(AId: integer; ACaption: string; AParentCat,
  AAAble: Integer);
begin
   setlength(goods, length(goods) + 1);
   with goods[high(goods)] do
   begin
      id := AId;
      caption := ACaption;
      parent_cat := AParentCat;
      action_able := AAAble;
   end;
end;

procedure TFakeQuery.Clean;
begin
   setlength(cats, 0);
   setlength(goods, 0);
end;

constructor TFakeQuery.Create(ABaseName: string);
begin
   FBaseName := ABaseName;
   FillCats;
   FillGoods;
end;

procedure TFakeQuery.FillCats;
var
   adc: TDBCompsAddit;
begin
   SetLength(cats, 0);
   adc := TDBCompsAddit.Create(FBaseName);
   if not adc.Init then
   begin
      adc.Destroy;
      Exit;
   end;
   with adc.query do
   begin
      SQL.Text := 'SELECT * FROM Cats WHERE actual = 1';
      Open;
      while not EOF do
      begin
         AddCat(
            FieldByName('id').AsInteger,
            FieldByName('caption').AsString,
            FieldByName('parent_cat').AsInteger
         );
         Next;
      end;
      Close;
   end;
   adc.Destroy;
end;

procedure TFakeQuery.FillGoods;
var
   adc: TDBCompsAddit;
begin
   SetLength(goods, 0);
   adc := TDBCompsAddit.Create(FBaseName);
   if not adc.Init then
   begin
      adc.Destroy;
      Exit;
   end;
   with adc.query do
   begin
      SQL.Text := 'SELECT * FROM Cats WHERE actual = 1';
      Open;
      while not EOF do
      begin
         AddGood(
            FieldByName('id').AsInteger,
            FieldByName('caption').AsString,
            FieldByName('parent_cat').AsInteger,
            FieldByName('action_able').AsInteger
         );
         Next;
      end;
      Close;
   end;
   adc.Destroy;

end;

end.
