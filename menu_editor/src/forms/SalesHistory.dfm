object fmSalesHistory: TfmSalesHistory
  Left = 0
  Top = 0
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1087#1088#1086#1076#1072#1078
  ClientHeight = 578
  ClientWidth = 984
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
  object pnlFilters: TPanel
    Left = 688
    Top = 0
    Width = 296
    Height = 410
    Align = alRight
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 11
      Width = 71
      Height = 23
      Caption = #1053#1072#1095#1072#1083#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 98
      Width = 60
      Height = 23
      Caption = #1050#1086#1085#1077#1094':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dtpStart: TDateTimePicker
      Left = 24
      Top = 32
      Width = 114
      Height = 27
      Date = 42101.000000000000000000
      Time = 42101.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dtpEnd: TDateTimePicker
      Left = 24
      Top = 119
      Width = 114
      Height = 27
      Date = 42101.999988425920000000
      Time = 42101.999988425920000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object btnGoodFilters: TButton
      Left = 24
      Top = 188
      Width = 114
      Height = 100
      Caption = #1058#1086#1074#1072#1088#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnGoodFiltersClick
    end
    object btnXLExport: TButton
      Left = 144
      Top = 294
      Width = 113
      Height = 100
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      WordWrap = True
      OnClick = btnXLExportClick
    end
    object btnStart: TButton
      Left = 24
      Top = 294
      Width = 114
      Height = 100
      Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnStartClick
    end
    object btnSessStart: TButton
      Left = 144
      Top = 32
      Width = 114
      Height = 60
      Caption = #1057#1077#1089#1089#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnSessStartClick
    end
    object btnSessEnd: TButton
      Left = 144
      Top = 119
      Width = 114
      Height = 60
      Caption = #1057#1077#1089#1089#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btnSessEndClick
    end
    object dtpStartTime: TDateTimePicker
      Left = 24
      Top = 65
      Width = 114
      Height = 27
      Date = 42101.000000000000000000
      Time = 42101.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkTime
      ParentFont = False
      TabOrder = 7
    end
    object dtpEndTime: TDateTimePicker
      Left = 24
      Top = 152
      Width = 114
      Height = 27
      Date = 42101.999988425920000000
      Time = 42101.999988425920000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkTime
      ParentFont = False
      TabOrder = 8
    end
  end
  object sgHistory: TStringGrid
    Left = 0
    Top = 0
    Width = 688
    Height = 410
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ParentFont = False
    TabOrder = 1
  end
  object pnlGoodFilters: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 410
    Align = alClient
    TabOrder = 2
    Visible = False
    object clGoods: TCheckListBox
      Left = 1
      Top = 1
      Width = 551
      Height = 408
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 19
      ParentFont = False
      TabOrder = 0
    end
    object pnlGoodAdditionalFilters: TPanel
      Left = 552
      Top = 1
      Width = 135
      Height = 408
      Align = alRight
      TabOrder = 1
      object cbBar: TCheckBox
        Left = 14
        Top = 39
        Width = 97
        Height = 17
        Caption = #1041#1072#1088
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
        OnClick = cbBarClick
      end
      object cbKitchen: TCheckBox
        Left = 14
        Top = 62
        Width = 97
        Height = 29
        Caption = #1050#1091#1093#1085#1103
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
        OnClick = cbBarClick
      end
    end
  end
  object pnlResults: TPanel
    Left = 0
    Top = 410
    Width = 984
    Height = 168
    Align = alBottom
    TabOrder = 3
    object sgResults: TStringGrid
      Left = 1
      Top = 1
      Width = 982
      Height = 166
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ColWidths = (
        64
        64
        64
        64
        64)
    end
  end
end
