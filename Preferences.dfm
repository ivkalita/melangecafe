object fmPreferences: TfmPreferences
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Constraints.MaxHeight = 240
  Constraints.MaxWidth = 463
  Constraints.MinHeight = 240
  Constraints.MinWidth = 463
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object rbgKKMMode: TRadioGroup
    Left = 29
    Top = 38
    Width = 185
    Height = 103
    Caption = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099
    Items.Strings = (
      'C '#1082#1072#1089#1089#1086#1074#1099#1084' '#1072#1087#1087#1072#1088#1072#1090#1086#1084
      #1041#1077#1079' '#1082#1072#1089#1089#1086#1074#1086#1075#1086' '#1072#1087#1087#1072#1088#1072#1090#1072)
    TabOrder = 0
  end
  object rbgPlatformMode: TRadioGroup
    Left = 231
    Top = 36
    Width = 185
    Height = 105
    Caption = #1058#1080#1087' '#1087#1083#1072#1090#1092#1086#1088#1084#1099
    Items.Strings = (
      #1055#1083#1072#1085#1096#1077#1090
      #1050#1086#1084#1087#1100#1102#1090#1077#1088)
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 29
    Top = 160
    Width = 124
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOKClick
  end
end
