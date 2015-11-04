object fmHistory: TfmHistory
  Left = 0
  Top = 0
  Caption = #1048#1089#1090#1086#1088#1080#1103
  ClientHeight = 578
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlLayout: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 578
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 496
    ExplicitTop = 240
    ExplicitWidth = 185
    ExplicitHeight = 41
    object splMiddle: TSplitter
      Left = 600
      Top = 0
      Height = 578
      ExplicitLeft = 248
      ExplicitTop = 192
      ExplicitHeight = 100
    end
    object pnlLeft: TPanel
      Left = 0
      Top = 0
      Width = 600
      Height = 578
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object splLeft: TSplitter
        Left = 250
        Top = 0
        Height = 578
        ExplicitLeft = 248
        ExplicitTop = 192
        ExplicitHeight = 100
      end
      object pnlLeftLeft: TPanel
        Left = 0
        Top = 0
        Width = 250
        Height = 578
        Align = alLeft
        TabOrder = 0
        object Label1: TLabel
          Left = 1
          Top = 1
          Width = 248
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = #1057#1077#1089#1089#1080#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 50
        end
        object sgSession: TStringGrid
          Left = 1
          Top = 20
          Width = 248
          Height = 557
          Align = alClient
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          TabOrder = 0
          OnClick = sgSessionClick
          ExplicitLeft = 96
          ExplicitTop = 224
          ExplicitWidth = 320
          ExplicitHeight = 120
        end
      end
      object pnlLeftRight: TPanel
        Left = 253
        Top = 0
        Width = 347
        Height = 578
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 8
        ExplicitWidth = 250
        object Label2: TLabel
          Left = 1
          Top = 1
          Width = 345
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = #1055#1088#1086#1076#1072#1078#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 67
        end
        object sgSales: TStringGrid
          Left = 1
          Top = 20
          Width = 345
          Height = 557
          Align = alClient
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          TabOrder = 0
          OnClick = sgSalesClick
          ExplicitLeft = 88
          ExplicitTop = 192
          ExplicitWidth = 320
          ExplicitHeight = 120
        end
      end
    end
    object pnlRight: TPanel
      Left = 603
      Top = 0
      Width = 381
      Height = 578
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 720
      ExplicitWidth = 264
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 381
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = #1058#1086#1074#1072#1088#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 55
      end
      object sgGoods: TStringGrid
        Left = 0
        Top = 19
        Width = 381
        Height = 559
        Align = alClient
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 232
        ExplicitHeight = 576
      end
    end
  end
end
