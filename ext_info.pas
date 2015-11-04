unit ext_info;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, vars,
  Vcl.StdCtrls;

type
  TfmExtInfo = class(TForm)
    sgGoods: TStringGrid;
    pnlCommonInfo: TPanel;
    edtSaleType: TEdit;
    edtSum: TEdit;
    edtDt: TEdit;
  private
    procedure ViewSale(AId: integer; AAType: TEActionType; ADt: TDateTime);
  public
    procedure InitCtrls;
    constructor Create(AAction: TRAction);
  end;

var
  fmExtInfo: TfmExtInfo;

implementation

uses
  db_comps_additional;
var
   SGGOODS_COL_COUNT: integer;
   SGGOODS_COL_CAPS: array of string;
   SGGOODS_COL_WIDTHS: array of integer;
{$R *.dfm}

{ TfmExtInfo }

constructor TfmExtInfo.Create(AAction: TRAction);
begin
   inherited Create(nil);
   InitCtrls;
   case AAction.actionType of
      atSaleCash, atSaleCashFree: ViewSale(AAction.id, AAction.actionType, AAction.dt);
      atIncome: ;
      atOutcome: ;
      atOpenSess: ;
      atCloseSess: ;
   end;
end;

procedure TfmExtInfo.InitCtrls;
var
   i: integer;
begin
   with sgGoods do
   begin
      RowCount := 1;
      for i := 0 to SGGOODS_COL_COUNT - 1 do
      begin
         Cells[i, 0] := SGGOODS_COL_CAPS[i];
         ColWidths[i] := SGGOODS_COL_WIDTHS[i];
      end;
   end;
end;

procedure TfmExtInfo.ViewSale(AId: integer; AAType: TEActionType; ADt: TDateTime);
var
   adc: TDBCompsAddit;
   sum: double;
begin
   adc := TDBCompsAddit.Create(BASE_PATH);
   if not adc.Init then
   begin
      ShowMessage('Не удалось создать компонент подключения к базе.');
      adc.Destroy;
      exit;
   end;
   with adc.query do
   begin
      SQL.Text := 'SELECT g.caption, g.price, s.amount, s.action_amount, g.price * s.amount FROM '+
                  'SALE_GOODS s INNER JOIN GOODS g ON s.good_id = g.id WHERE s.sale_id = :id';
      ParamByName('id').AsInteger := AId;
      try
         Open;
      except
         on E:Exception do
         begin
            ShowMessage('Select statement failed. Error: ' + E.Message);
            adc.Destroy;
            exit;
         end;
      end;
      sum := 0;
      sgGoods.RowCount := 1;
      while not EOF do
         with sgGoods do
         begin
            RowCount := RowCount + 1;
            Cells[0, RowCount - 1] := Fields[0].AsString;
            Cells[1, RowCount - 1] := PriceToStr(Fields[1].AsFloat);
            Cells[2, RowCount - 1] := PriceToStr(Fields[2].AsFloat);
            Cells[3, RowCount - 1] := PriceToStr(Fields[3].AsFloat);
            Cells[4, RowCount - 1] := PriceToStr(Fields[4].AsFloat);
            sum := sum + Fields[4].AsFloat;
            Next;
         end;
   end;
   adc.Destroy;
   if AAType = atSaleCash then
      edtSaleType.Text := 'Продажа нал'
   else
      edtSaleType.Text := 'Продажа безнал';
   edtDt.Text := DateTimeToStr(ADt);
   edtSum.Text := PriceToStr(sum);
end;

initialization
   SGGOODS_COL_COUNT := 5;
   setlength(SGGOODS_COL_CAPS, SGGOODS_COL_COUNT);
   setlength(SGGOODS_COL_WIDTHS, SGGOODS_COL_COUNT);
   SGGOODS_COL_CAPS[0] := 'Наименование';
   SGGOODS_COL_CAPS[1] := 'Цена';
   SGGOODS_COL_CAPS[2] := 'Количество б/а';
   SGGOODS_COL_CAPS[3] := 'Количество c/а';
   SGGOODS_COL_CAPS[4] := 'Стоимость';
   SGGOODS_COL_WIDTHS[0] := 200;
   SGGOODS_COL_WIDTHS[1] := 100;
   SGGOODS_COL_WIDTHS[2] := 100;
   SGGOODS_COL_WIDTHS[3] := 100;
   SGGOODS_COL_WIDTHS[4] := 150;


end.
