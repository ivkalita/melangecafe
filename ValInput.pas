unit ValInput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Touch.Keyboard,
  Vcl.ExtCtrls;

type
  TfmInputQuery = class(TForm)
    kbdMain: TTouchKeyboard;
    mmoInput: TMemo;
    pnlMain: TPanel;
    lblPromt: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInputQuery: TfmInputQuery;
function GetText(ANumOnly: boolean; ACaption: string; APromt: string): string;

implementation
{$R *.dfm}
function GetText(ANumOnly: boolean; ACaption: string; APromt: string): string;
begin
   with fmInputQuery do
   begin
      mmoInput.Lines.Text := '';
      Caption := ACaption;
      lblPromt.Caption := APromt;
      Height := 600;
      if ANumOnly then
      begin
         kbdMain.Layout := 'NumPad';
         Width := 500;
      end
      else
      begin
         kbdMain.Layout := 'Standard';
         Width := 600;
      end;
      ShowModal;
      result := mmoInput.Text;
      result := StringReplace(result, #$D#$A, '', [rfReplaceAll, rfIgnoreCase]);
      if ANumOnly then
         result := StringReplace(result, '.', ',', [rfReplaceAll, rfIgnoreCase]);
      mmoInput.Text := '';
   end;
end;

procedure TfmInputQuery.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = VK_RETURN then
      Close;
end;

end.
