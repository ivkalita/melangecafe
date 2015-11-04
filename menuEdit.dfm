object fmMenuEdit: TfmMenuEdit
  Left = 0
  Top = 0
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1084#1077#1085#1102
  ClientHeight = 486
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAdditBtns: TPanel
    Left = 0
    Top = 0
    Width = 604
    Height = 113
    Align = alTop
    TabOrder = 0
    object btnOpen: TButton
      Left = 16
      Top = 0
      Width = 107
      Height = 35
      Caption = #1054#1090#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = btnOpenClick
    end
    object btnSave: TButton
      Left = 129
      Top = 0
      Width = 107
      Height = 35
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnSaveAs: TButton
      Left = 16
      Top = 41
      Width = 107
      Height = 35
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082
      TabOrder = 2
      OnClick = btnSaveAsClick
    end
    object edtPath: TEdit
      Left = 16
      Top = 82
      Width = 220
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = 'edtPath'
    end
    object btnMakeCurrent: TButton
      Left = 129
      Top = 41
      Width = 107
      Height = 35
      Caption = #1057#1076#1077#1083#1072#1090#1100' '#1090#1077#1082#1091#1097#1080#1084
      TabOrder = 4
      OnClick = btnMakeCurrentClick
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 113
    Width = 604
    Height = 327
    Align = alClient
    Caption = 'pnlGrid'
    TabOrder = 1
    ExplicitTop = 97
    ExplicitHeight = 343
    object sgMenu: TStringGrid
      Left = 1
      Top = 1
      Width = 602
      Height = 325
      Align = alClient
      ColCount = 2
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goEditing]
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitHeight = 341
      ColWidths = (
        267
        223)
    end
  end
  object pnlBtns: TPanel
    Left = 0
    Top = 440
    Width = 604
    Height = 46
    Align = alBottom
    TabOrder = 2
    object btnDelete: TButton
      Left = 152
      Top = 6
      Width = 113
      Height = 33
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      TabOrder = 0
      OnClick = btnDeleteClick
    end
    object btnAdd: TButton
      Left = 16
      Top = 6
      Width = 113
      Height = 33
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      TabOrder = 1
      OnClick = btnAddClick
    end
  end
  object flpndlg1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 448
    Top = 24
  end
  object flsvdlg1: TFileSaveDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 488
    Top = 24
  end
end
