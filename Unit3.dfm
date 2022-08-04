object Form3: TForm3
  Left = 576
  Top = 184
  AutoScroll = False
  Caption = #1054#1089#1090#1072#1083#1086#1089#1100
  ClientHeight = 87
  ClientWidth = 231
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RxLabel1: TRxLabel
    Left = 8
    Top = 8
    Width = 217
    Height = 19
    Caption = #1044#1086' '#1087#1077#1088#1077#1093#1086#1076#1072' '#1074' '#1078#1076#1091#1097#1080#1081' '#1088#1077#1078#1080#1084
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clMaroon
    ShadowSize = 0
    Transparent = True
  end
  object RxLabel2: TRxLabel
    Left = 8
    Top = 32
    Width = 74
    Height = 19
    Caption = #1086#1089#1090#1072#1083#1086#1089#1100': '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clMaroon
    ShadowSize = 0
    Transparent = True
  end
  object RxLabel3: TRxLabel
    Left = 88
    Top = 31
    Width = 68
    Height = 19
    Caption = 'RxLabel3'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clMaroon
    ShadowSize = 0
    Transparent = True
  end
  object LMDButton1: TLMDButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 0
    OnClick = LMDButton1Click
  end
  object LMDButton2: TLMDButton
    Left = 144
    Top = 56
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 1
    OnClick = LMDButton2Click
  end
  object LMDFormShape1: TLMDFormShape
    Region.Shape = rsRect
    FillObject.Style = sfGradient
    FillObject.Gradient.Color = clActiveCaption
    FillObject.Gradient.ColorCount = 58
    FillObject.Gradient.Style = gstHorizontal
    FillObject.Gradient.EndColor = clSkyBlue
    Left = 40
    Top = 8
  end
  object LMDHiTimer1: TLMDHiTimer
    OnTimer = LMDHiTimer1Timer
    Left = 192
    Top = 24
  end
end
