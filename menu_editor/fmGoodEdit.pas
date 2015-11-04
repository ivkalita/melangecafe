unit fmGoodEdit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, goodCard, Good;

type
	TfmGoodEditor = class(TForm)
		lstGoods: TListBox;
		pnlbtns: TPanel;
		btnExit: TButton;
		btnAddNew: TButton;
    pnlGoods: TPanel;
    edtSearch: TEdit;
    btnSearch: TButton;
    pnlSearch: TPanel;
		procedure lstGoodsClick(Sender: TObject);
		procedure btnAddNewClick(Sender: TObject);
		procedure btnExitClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
	private
		goods: TGoodArray;
		FBaseName: string;
	public
		procedure Prepare(ABaseName: string);
  end;

var
	fmGoodEditor: TfmGoodEditor;

implementation

uses
	db_comps_additional, vars, MenuEdit, GoodRepository;

{$R *.dfm}

{ TfmGoodEditor }

	procedure TfmGoodEditor.btnAddNewClick(Sender: TObject);
	var
		newGood: TGood;
	begin
		newGood := TGood.Create();
		editGood(@newGood, FBaseName);
		Prepare(FBaseName);
	end;

	procedure TfmGoodEditor.btnExitClick(Sender: TObject);
	begin
		Close;
	end;

	procedure TfmGoodEditor.btnSearchClick(Sender: TObject);
	var
		query: string;
		i: integer;
	begin
		query := edtSearch.Text;
		lstGoods.Items.Clear;
		FBaseName := FBaseName;
		if (query.Length > 0) then
		begin
			goods := TGoodRepository.GetAllByCaption(FBaseName, query)
        end
		else
		begin
			goods := TGoodRepository.GetAll(FBaseName);
        end;
		for i := 0 to high(goods) do
		begin
			lstGoods.AddItem(goods[i].Caption, nil);
		end;
	end;

	procedure TfmGoodEditor.lstGoodsClick(Sender: TObject);
	begin
		if lstGoods.ItemIndex < 0 then
			exit;
		editGood(@goods[lstGoods.ItemIndex], FBaseName);
		Prepare(FBaseName);
	end;

	procedure TfmGoodEditor.Prepare(ABaseName: string);
	var
		adc: TDBCompsAddit;
		i: integer;
	begin
		lstGoods.Items.Clear;
		FBaseName := ABaseName;
		goods := TGoodRepository.GetAll(ABaseName);
		for i := 0 to high(goods) do
		begin
			lstGoods.AddItem(goods[i].Caption, nil);
		end;
	end;

end.
