object fmAmount: TfmAmount
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086
  ClientHeight = 112
  ClientWidth = 186
  Color = clBtnFace
  Constraints.MaxHeight = 188
  Constraints.MaxWidth = 251
  Constraints.MinHeight = 137
  Constraints.MinWidth = 190
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblCount: TLabel
    Left = 17
    Top = 11
    Width = 105
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object edtAmount: TEdit
    Left = 17
    Top = 30
    Width = 151
    Height = 21
    TabOrder = 0
    Text = '1'
    OnKeyPress = edtAmountKeyPress
  end
  object btnOk: TButton
    Left = 16
    Top = 70
    Width = 73
    Height = 25
    Caption = #1054#1082
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 95
    Top = 70
    Width = 73
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = btnCancelClick
  end
end
