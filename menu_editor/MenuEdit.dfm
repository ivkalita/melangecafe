object fmMenuEditor: TfmMenuEditor
  Left = 0
  Top = 0
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1084#1077#1085#1102
  ClientHeight = 364
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBtns: TPanel
    Left = 0
    Top = 0
    Width = 697
    Height = 41
    Align = alTop
    TabOrder = 0
    object edtBaseName: TEdit
      Left = 16
      Top = 11
      Width = 345
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object btnSave: TButton
      Left = 416
      Top = 10
      Width = 89
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnSaveClick
    end
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 41
    Width = 697
    Height = 323
    Align = alClient
    TabOrder = 1
    object tvmenu: TTreeView
      Left = 1
      Top = 1
      Width = 695
      Height = 321
      Align = alClient
      Indent = 19
      PopupMenu = pm
      ReadOnly = True
      TabOrder = 0
    end
  end
  object pm: TPopupMenu
    Left = 368
    Top = 8
    object miAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102
      OnClick = miAddClick
    end
    object miRename: TMenuItem
      Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102
      OnClick = miRenameClick
    end
    object miRemove: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102
      OnClick = miRemoveClick
    end
  end
end
