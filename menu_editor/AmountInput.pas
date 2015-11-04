unit AmountInput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfmAmount = class(TForm)
    edtAmount: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    lblCount: TLabel;
    procedure edtKeyPress(Sender: TObject; var Key: char);
    procedure edtAmountKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    procedure edtPriceKeyPress(Sender: TObject; var Key: Char);
  public
    procedure SetPriceKeyPress();
  end;

implementation

{$R *.dfm}


procedure TfmAmount.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfmAmount.btnOkClick(Sender: TObject);
begin
   if edtAmount.Text = '' then
   begin
      ShowMessage('Вы не заполнили поле ввода!');
      exit;
   end;
   ModalResult := mrOk;
end;

procedure TfmAmount.edtAmountKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #8 then     //backspace
   begin
      if length(edtAmount.Text) = 1 then
      begin
         Key := #0;
         edtAmount.Text := '0';
         edtAmount.SelStart := 1;
         edtAmount.SelLength := 0;
      end;
      exit;
   end;
   if Key = #13 then       //enter
   begin
      btnOkClick(btnOk);
      exit;
   end;
   if Key = #27 then
   begin
      btnCancelClick(btnCancel);
      exit;
   end;
   if not (Key in ['0'..'9']) then
   begin
      Key := #0;
      exit;
   end;
   if (Key in ['0'..'9']) and (edtAmount.Text = '0') then
   begin
      edtAmount.Text := '';
   end;
end;

procedure TfmAmount.edtKeyPress(Sender: TObject; var Key: char);
begin
   if Key = #13 then       //enter
   begin
      btnOkClick(btnOk);
      exit;
   end;
end;

procedure TfmAmount.edtPriceKeyPress(Sender: TObject; var Key: Char);

//   function
begin
   if Key = #8 then     //backspace
   begin
      if length(edtAmount.Text) = 1 then
      begin
         Key := #0;
         edtAmount.Text := '0';
         edtAmount.SelStart := 1;
         edtAmount.SelLength := 0;
      end;
      exit;
   end;
   if Key = #13 then       //enter
   begin
      btnOkClick(btnOk);
      exit;
   end;
   if Key = #27 then
   begin
      btnCancelClick(btnCancel);
      exit;
   end;
   if (Key in [',', '.']) then
   begin
      if Pos('.', edtAmount.Text) <> 0 then
         Key := #0
      else
         Key := '.';
      exit;
   end;
   if not (Key in ['0'..'9']) then
   begin
      Key := #0;
      exit;
   end;
   if (Key in ['0'..'9']) and (edtAmount.Text = '0') then
   begin
      edtAmount.Text := '';
   end;
end;

procedure TfmAmount.SetPriceKeyPress;
begin
   edtAmount.OnKeyPress := edtPriceKeyPress;
end;

end.

