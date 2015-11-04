unit MenuDesigner;

interface

uses
   Winapi.Windows,
   Winapi.Messages,
   System.SysUtils,
   System.Variants,
   System.Classes,
   Vcl.Graphics,
   Vcl.Controls,
   Vcl.Forms,
   Vcl.Dialogs,
   Vcl.StdCtrls,
   Vcl.ExtCtrls,
//   ClientModule,
   common_functions,
   Vcl.ComCtrls,
   Vcl.Menus,
   AmountInput,
   Math,
   StrUtils;

type

   stNode = (stInsert, stUpdate, stNoChanges, stDelete, stMove);

   RGood = record
      id: integer;
      name: string;
   end;

   RGoods = array of RGood;

   RCategory = record
      id, parent_id: integer;
      name: string;
      goods: RGoods;
   end;

   RCategories = array of RCategory;

   RPoint = record
      point_id: integer;
      categories: RCategories;
      goods: RGoods;
   end;

   RPoints = array of RPoint;

   TNode = class(TObject)
   public
      id, first_parent_id: integer;
      function isGoodClass: boolean; virtual; abstract;
      constructor Create(AId, AParent_id: integer); overload;
   end;

   TGoodNode = class(TNode)      //true
   public
      function isGoodClass: boolean; override;
   end;

   TCategoryNode = class(TNode)  //false
   public
      function isGoodClass: boolean; override;
   end;

   TfmMenuDesigner = class(TForm)
      pnlTools: TPanel;
      lblPoint: TLabel;
      cbPoint: TComboBox;
	  treeMenu: TTreeView;
      btnSave: TButton;
      pmTree: TPopupMenu;
      cmiAddSubcategory: TMenuItem;
      cmiDeleteCategory: TMenuItem;
      procedure FormCreate(Sender: TObject);
      procedure cbPointChange(Sender: TObject);
	  procedure treeMenuCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
         State: TCustomDrawState; var DefaultDraw: Boolean);
      procedure treeMenuDblClick(Sender: TObject);
      procedure treeMenuEdited(Sender: TObject; Node: TTreeNode; var S: string);
      procedure treeMenuDragDrop(Sender, Source: TObject; X, Y: Integer);
      procedure treeMenuDragOver(Sender, Source: TObject; X, Y: Integer;
         State: TDragState; var Accept: Boolean);
      procedure treeMenuEditing(Sender: TObject; Node: TTreeNode;
         var AllowEdit: Boolean);
      procedure treeMenuMouseUp(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure cmiAddSubcategoryClick(Sender: TObject);
      procedure cmiDeleteCategoryClick(Sender: TObject);
      procedure btnSaveClick(Sender: TObject);
   private
      point_id: integer;
      point_goods: RPoints;
      contextNode: TTreeNode;
      isChangeTree: boolean;
      function isHasGood(APoint_id: integer): boolean;
      procedure fillPointInfo(point_id: integer);
      procedure MakeMenu(APoint_id: integer);
   public
      BaseName: string;
      constructor Create(AOwner: TComponent);
      destructor Destroy;
   end;

procedure AddPoint(var point_goods: RPoints; APoint_id: integer);
procedure AddPointGood(var goods: RGoods; AId: integer; AName: string);
procedure DeletePoint(var point_goods: RPoints; point_id: integer);
function GetIdxByPointId(var point_goods: RPoints; APoint_id: integer): integer;

implementation

uses
  db_comps_additional;

{$R *.dfm}

var
	adc: TDBCompsAddit;

procedure save_create_adc(BaseName: string);
begin
	if (adc = nil) then
	begin
		adc := TDBCompsAddit.Create(BaseName);
		adc.Init();
    end;

end;

procedure AddPoint(var point_goods: RPoints; APoint_id: integer);
begin
   SetLength(point_goods, Length(point_goods) + 1);
   with point_goods[High(point_goods)] do
      point_id := APoint_id;
end;

procedure AddPointGood(var goods: RGoods; AId: integer; AName: string);
begin
   SetLength(goods, Length(goods) + 1);
   with goods[High(goods)] do
   begin
      id := AId;
      name := AName;
   end;
end;

procedure DeletePoint(var point_goods: RPoints; point_id: integer);
var
   i, idx: integer;
begin
   idx := GetIdxByPointId(point_goods, point_id);
   if idx = -1 then exit;
   for i := idx + 1 to Length(point_goods) - 1 do
      point_goods[i - 1] := point_goods[i];
   SetLength(point_goods, Length(point_goods) - 1);
end;

function GetIdxByPointId(var point_goods: RPoints; APoint_id: integer): integer;
var
   i: integer;
begin
   result := -1;
   for i := 0 to Length(point_goods) - 1 do
      if point_goods[i].point_id = APoint_id then
      begin
         result := i;
         break;
      end;
end;

procedure TfmMenuDesigner.btnSaveClick(Sender: TObject);
var
   sqlCount: TStringList;
   node1: TTreeNode;
   qryList: TStringList;
   isExit: boolean;

   procedure UpdateTreeMenu(parentNode: TTreeNode; node: TTreeNode; isRoot: boolean);
   var
//      adc: TDBCompsAddit;
	  n: TNode;
      pn: TNode;
      lastId: integer;
      curChild: TTreeNode;
      tmpNode: TTreeNode;
   begin
      while ((node <> nil) and (Assigned(node))) do
      begin
//         ShowMessage(parentNode.Text);
//         ShowMessage(node.Text);
//         adc := TDBCompsAddit.Create(BaseName);
//         adc.Init;
         n := TNode(node.Data);
         pn := TNode(parentNode.data);
         with adc.query do
         begin
            if not adc.trans.Active then
               adc.trans.Active := true;
            if n.isGoodClass then
            begin
               SQL.Text := Format(
                  'UPDATE GOODS SET parent_cat = %d WHERE id = %d', [pn.id, n.id]
               );
//               ExecQuery;
               ExecSQL;
               n.first_parent_id := pn.id;
            end
            else if isRoot then
            begin
               SQL.Text := Format(
                  'INSERT INTO cats(caption) VALUES (%s)', [#39 + node.Text + #39]
               );
//               ExecQuery;
               ExecSQL;
               SQL.Text := 'SELECT GEN_ID(GEN_CATS_ID, 0) FROM rdb$database';
//               ExecQuery;
               Open;
               lastId := Fields[0].AsInteger;
               Close;
               SQL.Text := Format(
                  'UPDATE CATS SET parent_id = %d WHERE id = %d',
                  [lastId, lastId]
               );
//               ExecQuery;
               ExecSQL;
               n.id := lastId;
               n.first_parent_id := lastId;
            end
            else
            begin
               SQL.Text := Format(
                  'INSERT INTO cats(parent_id, caption) VALUES (%d, %s)',
                  [pn.id, #39 + node.Text + #39]
               );
//               ExecQuery;
               ExecSQL;
               SQL.Text := 'SELECT GEN_ID(GEN_CATS_ID, 0) FROM rdb$database';
//               ExecQuery;
               Open;
               lastId := Fields[0].AsInteger;
               Close;
               n.id := lastId;
               n.first_parent_id := pn.id;
            end;
            adc.trans.Commit;
         end;
         tmpNode := node;
         curChild := tmpNode.getFirstChild;
//         while (curChild <> nil) do
//         begin
            UpdateTreeMenu(tmpNode, curChild, false);
//            curChild := tmpNode.GetNextChild(curChild);
//         end;
//         if (node.getNextSibling = node) then
//            exit;
         node := node.getNextSibling;
//         if tmpNode = nil then
//            exit;
//         UpdateTreeMenu(parentNode, tmpNode, isRoot);
      end;
   end;

   procedure FreeTables;
//   var
//	  adc: TDBCompsAddit;
   begin
	  with adc.query do
	  begin
		 if not adc.trans.active then
			adc.trans.Active := true;
		 SQL.Text := 'DELETE FROM Cats';
//         ExecQuery;
		 ExecSQL;
		 adc.trans.Commit;
	  end;
   end;

begin
  adc := TDBCompsAddit.Create(BaseName);
  adc.Init;
   if not isChangeTree then
   begin
      ShowMessage('�� �� ������� ������� ���������!');
      exit;
   end;
   FreeTables;
   if treeMenu.Items.Count <> 1 then
      UpdateTreeMenu(treeMenu.Items[0], treeMenu.Items[0].getFirstChild, true);
      DeletePoint(point_goods, point_id);
	  ShowMessage('���� ������� ���������!');
   FreeAndNil(adc);
end;

procedure TfmMenuDesigner.cbPointChange(Sender: TObject);
begin
   point_id := Integer(cbPoint.Items.Objects[cbPoint.ItemIndex]);
//   if (not isHasGood(point_id)) then
   fillPointInfo(0);
   MakeMenu(0);
end;

procedure TfmMenuDesigner.cmiAddSubcategoryClick(Sender: TObject);
var
   fmAmount: TfmAmount;
   parent_id: integer;
begin
   if not Assigned(contextNode) then exit;
   fmAmount := TfmAmount.Create(nil);
   with fmAmount do
   begin
      Caption := '������� �������� ���������';
      lblCount.Caption := '�������� ���������:';
      edtAmount.OnKeyPress := edtKeyPress;
      edtAmount.Text := '';
      if ShowModal = mrOk then
      begin
         treeMenu.Items.AddChildObjectFirst(
            contextNode,
            edtAmount.Text,
            TCategoryNode.Create(-1, IfThen(Assigned(contextNode.Data), TNode(contextNode.Data).id, -1)));
//         contextNode.Expanded := true;
         isChangeTree := true;
      end;
   end;
   FreeAndNil(fmAmount);
end;

procedure TfmMenuDesigner.cmiDeleteCategoryClick(Sender: TObject);
var
   good_node: TTreeNode;
   isMenuRoot: boolean;

   procedure DeleteSubCategory(node: TTreeNode);
   var
      tmp_node: TTreeNode;
   begin
      tmp_node := node;
      while Assigned(tmp_node) do
      begin
         if TNode(tmp_node.Data).isGoodClass then
            treemenu.Items.AddChildObject(treeMenu.Items[0].getNextSibling, tmp_node.Text, tmp_node.Data)
         else
            DeleteSubCategory(tmp_node.getFirstChild);
         tmp_node := tmp_node.getNextSibling;
      end;
   end;

begin
   good_node := treeMenu.Items[0].getNextSibling;
   if not Assigned(contextNode) then exit;
   if MessageDlg('�� �������, ��� ������ ������� ��� ���������?',
		 mtConfirmation, mbOKCancel, 0) <> mrOk then exit;
   DeleteSubCategory(contextNode.getFirstChild);
   isMenuRoot := contextNode = treeMenu.Items[0];
   treeMenu.Items.Delete(contextNode);
   if isMenuRoot then
	  treeMenu.Items.AddFirst(treeMenu.Items[0], '����');
   isChangeTree := true;
end;

constructor TfmMenuDesigner.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   contextNode := nil;
end;

destructor TfmMenuDesigner.Destroy;
begin
   inherited Destroy;
end;

procedure TfmMenuDesigner.fillPointInfo(point_id: integer);
const
   IDX_GOOD_ID = 0;
   IDX_GOOD_NAME = 1;
   IDX_GOOD_CATEGORY_ID = 2;
   IDX_CATEGORY_ID = 0;
   IDX_CATEGORY_PARENT_ID = 1;
   IDX_CATEGORY_NAME = 2;
type
   RGood = record
      id, category_id: integer;
      name: string;
   end;

   RGoods = array of RGood;
var
   i: integer;
   lst, fldsLst: TStringList;
   goods: RGoods;

   procedure AddGood(AId, ACategory_id: integer; AName: string);
   begin
      SetLength(goods, Length(goods) + 1);
      with goods[High(goods)] do
      begin
         id := AId;
         category_id := ACategory_id;
         name := AName;
      end;
   end;

   procedure AddCategory(AId, AParent_id: integer; AName: string);
   var
      catLen: integer;
      i: integer;
      cat: ^RCategory;
   begin
	  catLen := Length(point_goods[High(point_goods)].categories);
      SetLength(point_goods[High(point_goods)].categories,  catLen + 1);
      cat := @point_goods[High(point_goods)].categories[catLen];
      with cat^ do
	  begin
		 id := AId;
		 parent_id := AParent_id;
		 name := AName;
	  end;
	  for i := 0 to Length(goods) - 1 do
		 if goods[i].category_id = cat^.id then
		 begin
			SetLength(cat^.goods, Length(cat^.goods) + 1);
			with cat^.goods[High(cat^.goods)] do
			begin
			   id := goods[i].id;
			   name := goods[i].name;
			end;
		 end;
   end;
//   var
//	  adc: TDBCompsAddit;
begin
   AddPoint(point_goods, point_id);
   save_create_adc(BaseName);

//   adc := TDBCompsAddit.Create(BaseName);
//   if not adc.Init then
//   begin
//	  !!!!!
//	  Close;
//	  Exit;
//   end;
   with adc.query do
   begin
	  SQL.Text :=
		'SELECT g.id, g.caption, g.parent_cat ' +
		'FROM ' +
			'goods g INNER JOIN priced_goods pg ON g.id = pg.good_id ' +
		'WHERE ' +
			'pg.expiredAt is null and g.parent_cat = 0 ORDER BY g.parent_cat';
	  if Transaction.Active then
		 Transaction.Commit;
	  Transaction.StartTransaction;
//      ExecQuery;
	  Open;
	  while not EOF do
	  begin
		 AddPointGood(
			point_goods[High(point_goods)].goods,
			Fields[0].AsInteger,
			Fields[1].AsString
		 );
		 Next;
	  end;
	  Close;
	  SQL.Text :=
		'SELECT g.id, g.caption, c.id ' +
		'FROM ' +
			'goods g INNER JOIN priced_goods pg ON g.id = pg.good_id ' +
			'INNER JOIN cats c ON g.parent_cat = c.id ' +
		'WHERE ' +
			'pg.expiredAt is null ORDER BY c.id';
//      ExecQuery;
	  Open;
	  while not EOF do
	  begin
         AddGood(
            Fields[0].AsInteger,
            Fields[2].AsInteger,
            Fields[1].AsString
         );
         Next;
      end;
      Close;
      SQL.Text := 'SELECT c.id, c.parent_id, c.caption FROM cats c ORDER BY c.id, c.parent_id';
//      ExecQuery;
      Open;
      while not EOF do
      begin
		 AddCategory(
            Fields[0].AsInteger,
            Fields[1].AsInteger,
            Fields[2].AsString
         );
         Next;
      end;
      Close;
   end;
//   FreeAndNil(adc);
end;

procedure TfmMenuDesigner.FormCreate(Sender: TObject);
const
   IDX_POINT_ID = 0;
   IDX_POINT_NAME = 1;
var
   i: integer;
   lst, fldsLst: TStringList;
begin
   isChangeTree := false;
   cbPoint.AddItem('�������', TObject(1));
end;

function TfmMenuDesigner.isHasGood(APoint_id: integer): boolean;
var
   i: integer;
begin
   result := false;
   for i := 0 to Length(point_goods) - 1 do
      result := result or (point_goods[i].point_id = APoint_id);
end;

procedure TfmMenuDesigner.MakeMenu(APoint_id: integer);
var
   i, j, point_idx: integer;
   node, tmp: TTreeNode;
   cat: ^RCategories;

   function InsertMenuCategory(cat: RCategory): TTreeNode;
   var
      i: integer;
      node: TTreeNode;

      function findParentCategory(node: TTreeNode; id: integer): TTreeNode;
      var
         tmp_node: TTreeNode;
      begin
		 result := nil;
         while (node <> nil) do
         begin
            if (not TNode(node.Data).isGoodClass and (TNode(node.Data).id = id)) then
            begin
               result := node;
               break;
            end;
            tmp_node := findParentCategory(node.getFirstChild, id);
            if tmp_node <> nil then
            begin
               result := tmp_node;
               break;
            end;
            node := node.getNextSibling;
         end;
      end;

   begin
      if (cat.id = cat.parent_id) then
         result := treeMenu.Items.AddChildObjectFirst(
			treeMenu.Items[0],
            cat.name,
            TCategoryNode.Create(
               cat.id,
               cat.id
            )
         )
      else
         result := treeMenu.Items.AddChildObjectFirst(
			findParentCategory(treeMenu.Items[0].getFirstChild,
            cat.parent_id),
            cat.name,
            TCategoryNode.Create(
               cat.id,
               cat.parent_id
			   )
            );
   end;

begin
   treeMenu.Items[0].DeleteChildren;
   treeMenu.Items[1].DeleteChildren;
//   point_idx := GetIdxByPointId(point_goods, APoint_id);
   cat := @point_goods[0].categories;
   for i := 0 to Length(cat^) - 1 do
   begin
      node := InsertMenuCategory(cat^[i]);
      node.Expanded := false;
      for j := 0 to Length(cat^[i].goods) - 1 do
         treeMenu.Items.AddChildObject(
            node,
            cat^[i].goods[j].name,
            TGoodNode.Create(
               cat^[i].goods[j].id,
               cat^[i].parent_id
            )
         );
   end;
   point_idx := APoint_id;
   node := treeMenu.Items[0].getNextSibling;
   for i := 0 to Length(point_goods[point_idx].goods) - 1 do
      treemenu.Items.AddChildObject(
         node,
         point_goods[point_idx].goods[i].name,
         TGoodNode.Create(
            point_goods[point_idx].goods[i].id,
            -1
         )
      );
//   treeMenu.FullExpand;
end;

procedure TfmMenuDesigner.treeMenuCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
   with treeMenu.Canvas do
      begin
      if (Node.Data <> nil) and not TNode(Node.Data).isGoodClass then
         Font.Style := [fsBold]
      else
         Font.Style := [];
      DefaultDraw := true;
   end;
end;

procedure TfmMenuDesigner.treeMenuDblClick(Sender: TObject);
var
   pt: TPoint;
   node: TTreeNode;
begin
   GetCursorPos(pt);
   pt := treeMenu.ScreenToClient(pt);
   node := treeMenu.GetNodeAt(pt.X, pt.Y);
   if (node  <> nil) and (treeMenu.Selected = node)
      and (node.Data <> nil) then
   begin
      treeMenu.Items.BeginUpdate;
      treeMenu.Selected.Expanded:= not treeMenu.Selected.Expanded;
      treeMenu.Items.EndUpdate;
      if not TNode(node.Data).isGoodClass then
         node.EditText;
   end;
end;

procedure TfmMenuDesigner.treeMenuDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
   src, dst: TTreeNode;
   isExpand: boolean;
begin
   isChangeTree := true;
   src := treeMenu.Selected;
   dst := treeMenu.GetNodeAt(X, Y);
   isExpand := src.Expanded;
   if TNode(src.Data).isGoodClass then
      src.MoveTo(dst, naAddChild)
   else
      src.MoveTo(dst, naAddChildFirst);
   src.Expanded := isExpand;
end;

procedure TfmMenuDesigner.treeMenuDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
   src, dst: TTreeNode;
   HitTests: THitTests;
begin
	HitTests := treeMenu.GetHitTestInfoAt(X,Y);
	if (htAbove in HitTests) then
		treeMenu.TopItem := treeMenu.TopItem.GetPrevVisible
	else if (htBelow in HitTests) then
    	treeMenu.TopItem := treeMenu.TopItem.GetNextVisible;

   src := treeMenu.Selected;
   dst := treeMenu.GetNodeAt(X, Y);
   Accept := Assigned(src) and Assigned(dst) and Assigned(src.Data) and (src <> dst);
   if not Accept then exit;
   if TNode(src.Data).isGoodClass then
      Accept := (Assigned(dst.Data) and not TNode(dst.Data).isGoodClass) or (dst = treeMenu.Items[0].getNextSibling)
   else
      Accept := (Assigned(dst.Data) and not TNode(dst.Data).isGoodClass) and (dst <> treeMenu.Items[0].getNextSibling)
                or (dst = treeMenu.Items[0]);
end;

procedure TfmMenuDesigner.treeMenuEdited(Sender: TObject; Node: TTreeNode;
  var S: string);
begin
   isChangeTree := true;
end;

procedure TfmMenuDesigner.treeMenuEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
   AllowEdit:= (node.Data <> nil) and not TNode(node.Data).isGoodClass;
end;

procedure TfmMenuDesigner.treeMenuMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   node: TTreeNode;
   pt: TPoint;
begin
   if cbPoint.ItemIndex < 0 then exit;
   node := treeMenu.GetNodeAt(X, Y);
   pt.X := X;
   pt.Y := Y;
   pt := treeMenu.ClientToScreen(pt);
   if (node = treeMenu.Items[0]) or Assigned(node) and Assigned(node.Data)
      and not TNode(node.Data).isGoodClass and (Button = mbRight) then
   begin
      contextNode := node;
      pmTree.Items[1].Caption := '�������';
      if (node = treeMenu.Items[0]) then
		 pmTree.Items[1].Caption := '������� ��� ����';
      pmTree.Popup(pt.X, pt.Y);
   end
   else
      contextNode := nil;
end;

{ TCategoryNode }

function TCategoryNode.isGoodClass: boolean;
begin
   result := false;
end;

{ TGoodNode }

function TGoodNode.isGoodClass: boolean;
begin
   result := true;
end;

{ TNode }

constructor TNode.Create(AId, AParent_id: integer);
begin
   id := AId;
   first_parent_id := AParent_id;
end;

end.
