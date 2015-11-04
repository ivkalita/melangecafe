object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 555
  ClientWidth = 551
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
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 130
    Height = 19
    Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1084#1077#1085#1102
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 320
    Top = 24
    Width = 174
    Height = 19
    Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1088#1086#1076#1072#1078#1072#1084#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Shape1: TShape
    Left = 256
    Top = 0
    Width = 1
    Height = 451
  end
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Height = 555
    ExplicitLeft = 376
    ExplicitTop = 288
    ExplicitHeight = 100
  end
  object btnSaleShot: TButton
    Left = 320
    Top = 451
    Width = 153
    Height = 92
    Caption = #1057#1085#1080#1084#1082#1080' '#1087#1088#1086#1076#1072#1078
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    WordWrap = True
    OnClick = btnSaleShotClick
  end
  object btnMenuEdit: TButton
    Left = 48
    Top = 353
    Width = 153
    Height = 92
    Caption = #1052#1077#1085#1102
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    WordWrap = True
    OnClick = btnMenuEditClick
  end
  object btnGoodsEdit: TButton
    Left = 48
    Top = 255
    Width = 153
    Height = 92
    Caption = #1058#1086#1074#1072#1088#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    WordWrap = True
    OnClick = btnGoodsEditClick
  end
  object btnDiscounts: TButton
    Left = 320
    Top = 353
    Width = 153
    Height = 92
    Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1089#1082#1080#1076#1082#1072#1084#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    WordWrap = True
    OnClick = btnDiscountsClick
  end
  object btnMeasures: TButton
    Left = 48
    Top = 59
    Width = 153
    Height = 92
    Caption = #1045#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    WordWrap = True
    OnClick = btnMeasuresClick
  end
  object btnIngredients: TButton
    Left = 48
    Top = 157
    Width = 153
    Height = 92
    Caption = #1048#1085#1075#1088#1077#1076#1080#1077#1085#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    WordWrap = True
    OnClick = btnIngredientsClick
  end
  object btnSaleHistory: TButton
    Left = 320
    Top = 59
    Width = 153
    Height = 92
    Caption = #1048#1089#1090#1086#1088#1080#1103' '#1087#1088#1086#1076#1072#1078
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    WordWrap = True
    OnClick = btnSaleHistoryClick
  end
  object btnIngredientHistory: TButton
    Left = 320
    Top = 157
    Width = 153
    Height = 92
    Caption = #1048#1089#1090#1086#1088#1080#1103' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    WordWrap = True
    OnClick = btnIngredientHistoryClick
  end
  object btnExportMenu: TButton
    Left = 48
    Top = 451
    Width = 153
    Height = 92
    Caption = #1052#1077#1085#1102' -> XSL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Visible = False
    WordWrap = True
    OnClick = btnExportMenuClick
  end
  object btnGoodHistory: TButton
    Left = 320
    Top = 255
    Width = 153
    Height = 92
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080#1089#1090#1086#1088#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    WordWrap = True
    OnClick = btnGoodHistoryClick
  end
  object dlgfoScript: TOpenTextFileDialog
    Left = 592
    Top = 296
  end
  object dlgfsScript: TSaveTextFileDialog
    Left = 624
    Top = 304
  end
end
