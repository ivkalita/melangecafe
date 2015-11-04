unit MenuEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, DBMenu,
  Vcl.Menus;

type
   TfmMenuEditor = class(TForm)
      pnlBtns: TPanel;
      pnlMenu: TPanel;
      edtBaseName: TEdit;
      tvmenu: TTreeView;
      pm: TPopupMenu;
      miAdd: TMenuItem;
      miRename: TMenuItem;
      miRemove: TMenuItem;
      btnSave: TButton;
      procedure btnSaveClick(Sender: TObject);
      procedure miAddClick(Sender: TObject);
      procedure miRenameClick(Sender: TObject);
      procedure miRemoveClick(Sender: TObject);

   private
      FDbMenu: TDbMenu;
      FBaseName: string;
      procedure SetBaseName(value: string);
      procedure SelectCat(Sender: TObject);
   public
      tmpRes: integer;
      procedure Prepare;
      function GetSelectedCat: integer;
      property BaseName: string read FBaseName write SetBaseName;
      constructor Create; overload;
   end;

var
   fmMenuEditor: TfmMenuEditor;

implementation

{$R *.dfm}

procedure TfmMenuEditor.btnSaveClick(Sender: TObject);
begin
   FDbMenu.Save;
   FDbMenu.Destroy;
   FDbMenu := TDBMenu.Create(FBaseName);
   tvmenu.CleanupInstance;
   FDbMenu.SyncWithTV(tvmenu);
end;

constructor TfmMenuEditor.Create;
begin
   inherited Create(nil);
end;

function TfmMenuEditor.GetSelectedCat: integer;
begin
   btnSave.Visible := false;
   tmpRes := -1;
   tvmenu.PopupMenu := nil;
   tvmenu.OnDblClick := SelectCat;
   ShowModal;
end;

procedure TfmMenuEditor.miAddClick(Sender: TObject);
begin
   FDbMenu.miAddClick(Sender);
end;

procedure TfmMenuEditor.miRemoveClick(Sender: TObject);
begin
   FDbMenu.miRemoveClick(Sender);
end;

procedure TfmMenuEditor.miRenameClick(Sender: TObject);
begin
   FDbMenu.miRenameClick(Sender);
end;

procedure TfmMenuEditor.Prepare;
begin
   if FBaseName <> '' then
   begin
      FDbMenu := TDBMenu.Create(FBaseName);
      FDbMenu.SyncWithTV(tvmenu);
   end;
end;

procedure TfmMenuEditor.SelectCat(Sender: TObject);
begin
   if TDBObj(tvmenu.Selected.Data).isGood then
      exit
   else
   begin
      tmpRes := TDBObj(tvmenu.Selected.Data).id;
      Close;
   end;
end;

procedure TfmMenuEditor.SetBaseName(value: string);
begin
   FBaseName := value;
   edtBaseName.Text := value;
end;

end.
