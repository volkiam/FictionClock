object Form2: TForm2
  Left = 192
  Top = 123
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  ClientHeight = 296
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDPageControl1: TLMDPageControl
    Left = 0
    Top = 0
    Width = 297
    Height = 289
    Color = clSilver
    TabOrder = 0
    Options = [toNoTabIfEmpty, toShowBorder, toShowFocusRect, toShowAccelChar]
    DockOrientation = doNoOrient
    ActivePage = LMDTabSheet1
    FreeClosedPages = False
    object LMDTabSheet1: TLMDTabSheet
      Left = 4
      Top = 28
      Width = 289
      Height = 257
      Bevel.Mode = bmCustom
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      object LMDSimplePanel1: TLMDSimplePanel
        Left = 8
        Top = 0
        Width = 137
        Height = 228
        Bevel.StyleInner = bvFrameRaised
        Bevel.StyleOuter = bvFrameRaised
        Bevel.BorderColor = clInactiveCaption
        Bevel.Mode = bmCustom
        Bevel.ShadowColor = clHighlight
        Color = 15458522
        TabOrder = 0
        object RxLabel1: TRxLabel
          Left = 48
          Top = 8
          Width = 39
          Height = 14
          Caption = #1060#1086#1088#1084#1072
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object RxLabel2: TRxLabel
          Left = 8
          Top = 25
          Width = 36
          Height = 13
          Caption = #1062#1074#1077#1090' 1'
        end
        object RxLabel3: TRxLabel
          Left = 8
          Top = 64
          Width = 33
          Height = 13
          Caption = #1062#1074#1077#1090'2'
        end
        object ColorBox1: TColorBox
          Left = 8
          Top = 40
          Width = 121
          Height = 22
          ItemHeight = 16
          TabOrder = 0
        end
        object ColorBox2: TColorBox
          Left = 8
          Top = 82
          Width = 121
          Height = 22
          ItemHeight = 16
          TabOrder = 1
        end
        object LMDSimplePanel4: TLMDSimplePanel
          Left = 4
          Top = 108
          Width = 129
          Height = 54
          Bevel.StyleInner = bvFrameRaised
          Bevel.StyleOuter = bvFrameRaised
          Bevel.BorderColor = clInactiveCaption
          Bevel.BorderSides = [fsBottom, fsTop]
          Bevel.Mode = bmEdge
          Bevel.ShadowColor = clHighlight
          Color = 15458522
          TabOrder = 2
          Transparent = True
          object LMDCheckBox1: TLMDCheckBox
            Left = 8
            Top = 7
            Width = 105
            Height = 17
            Caption = #1054#1082#1072#1085#1090#1086#1074#1082#1072
            Alignment.Alignment = agTopLeft
            Alignment.Spacing = 4
            TabOrder = 0
            Transparent = True
            BackFX.AlphaBlend.FillObject.AlphaLevel = 255
          end
          object ColorBox3: TColorBox
            Left = 9
            Top = 24
            Width = 121
            Height = 22
            ItemHeight = 16
            TabOrder = 1
          end
        end
        object LMDSimplePanel5: TLMDSimplePanel
          Left = 4
          Top = 160
          Width = 127
          Height = 54
          Bevel.StyleInner = bvFrameRaised
          Bevel.StyleOuter = bvFrameRaised
          Bevel.BorderColor = clInactiveCaption
          Bevel.BorderSides = [fsBottom, fsTop]
          Bevel.Mode = bmEdge
          Bevel.ShadowColor = clHighlight
          Color = 15458522
          TabOrder = 3
          Transparent = True
          object RxLabel4: TRxLabel
            Left = 6
            Top = 4
            Width = 106
            Height = 14
            Caption = #1055#1086#1083#1091#1087#1088#1086#1079#1088#1072#1095#1085#1086#1089#1090#1100
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RxLabel5: TRxLabel
            Left = 53
            Top = 19
            Width = 20
            Height = 14
            Caption = '255'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object LMDScrollBar1: TLMDScrollBar
            Left = 4
            Top = 33
            Width = 121
            Height = 16
            BackFX.AlphaBlend.FillObject.AlphaLevel = 255
            Bevel.StyleInner = bvNormal
            Bevel.StyleOuter = bvLowered
            Bevel.Mode = bmStandard
            Max = 255
            Min = 40
            Position = 255
            BarWidth = 0
            ThumbBevel.StyleOuter = bvRaised
            ThumbBevel.Mode = bmCustom
            Back.Style = sfBrushBitmap
            Back.AlphaLevel = 255
            TabOrder = 0
            OnScroll = LMDScrollBar1Scroll
          end
        end
      end
      object LMDSimplePanel2: TLMDSimplePanel
        Left = 150
        Top = 0
        Width = 137
        Height = 173
        Bevel.StyleInner = bvFrameRaised
        Bevel.StyleOuter = bvFrameRaised
        Bevel.BorderColor = clInactiveCaption
        Bevel.Mode = bmCustom
        Bevel.ShadowColor = clHighlight
        Color = 15458522
        TabOrder = 1
        object RxLabel6: TRxLabel
          Left = 24
          Top = 8
          Width = 91
          Height = 14
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label1: TLabel
          Left = 26
          Top = 113
          Width = 107
          Height = 13
          Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1080#1089#1095#1077#1079#1072#1085#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LMDCheckBox2: TLMDCheckBox
          Left = 11
          Top = 40
          Width = 105
          Height = 17
          Caption = #1048#1082#1086#1085#1082#1072' '#1074' '#1090#1088#1077#1077
          Alignment.Alignment = agTopLeft
          Alignment.Spacing = 4
          TabOrder = 0
          Transparent = True
          BackFX.AlphaBlend.FillObject.AlphaLevel = 255
        end
        object LMDCheckBox3: TLMDCheckBox
          Left = 11
          Top = 64
          Width = 105
          Height = 17
          Caption = #1040#1074#1090#1086#1079#1072#1075#1088#1091#1079#1082#1072
          Alignment.Alignment = agTopLeft
          Alignment.Spacing = 4
          TabOrder = 1
          Transparent = True
          BackFX.AlphaBlend.FillObject.AlphaLevel = 255
        end
        object LMDCheckBox4: TLMDCheckBox
          Left = 11
          Top = 85
          Width = 105
          Height = 30
          Caption = #1048#1089#1095#1077#1079#1072#1090#1100' '#13#10#1087#1088#1080' '#1085#1072#1074#1077#1076#1077#1085#1080#1080
          Alignment.Alignment = agTopLeft
          Alignment.Spacing = 4
          TabOrder = 2
          Transparent = True
          BackFX.AlphaBlend.FillObject.AlphaLevel = 255
        end
        object ComboBox1: TComboBox
          Left = 26
          Top = 129
          Width = 81
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          Text = '10'
          Items.Strings = (
            '5'
            '10'
            '15'
            '20')
        end
      end
      object LMDButton2: TLMDButton
        Left = 12
        Top = 232
        Width = 129
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 2
        OnClick = LMDButton2Click
      end
      object LMDButton3: TLMDButton
        Left = 156
        Top = 233
        Width = 129
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 3
        OnClick = LMDButton3Click
      end
      object LMDSimplePanel3: TLMDSimplePanel
        Left = 150
        Top = 174
        Width = 138
        Height = 54
        Bevel.StyleInner = bvFrameRaised
        Bevel.StyleOuter = bvFrameRaised
        Bevel.BorderColor = clInactiveCaption
        Bevel.Mode = bmCustom
        Bevel.ShadowColor = clHighlight
        Color = 15458522
        TabOrder = 4
        object RxLabel7: TRxLabel
          Left = 48
          Top = 6
          Width = 41
          Height = 14
          Caption = #1064#1088#1080#1092#1090
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object LMDButton1: TLMDButton
          Left = 8
          Top = 23
          Width = 121
          Height = 25
          Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100
          TabOrder = 0
          OnClick = LMDButton1Click
        end
      end
    end
    object LMDTabSheet3: TLMDTabSheet
      Left = 4
      Top = 28
      Width = 289
      Height = 257
      Bevel.Mode = bmCustom
      Caption = #1055#1086#1084#1086#1097#1100'   '
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 289
        Height = 257
        Color = clHotFlame
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Lines.Strings = (
          '1. '#1056#1072#1079#1084#1077#1088' '#1092#1086#1088#1084#1099' '#1079#1072#1074#1080#1089#1080#1090' '#1086#1090' '#1088#1072#1079#1084#1077#1088#1072' '
          #1096#1088#1080#1092#1090#1072'.'
          '2. '#1044#1083#1103' '#1090#1086#1075#1086', '#1095#1090#1086#1073#1099' '#1091#1079#1085#1072#1090#1100' '#1089#1082#1086#1083#1100#1082#1086' '
          #1074#1088#1077#1084#1077#1085#1080' '#1086#1089#1090#1072#1083#1086#1089#1100' '#1076#1086' '#1074#1099#1082#1083#1102#1095#1077#1085#1080#1103
          '('#1087#1077#1088#1077#1079#1072#1075#1088#1091#1079#1082#1080', '#1078#1076#1091#1097#1077#1075#1086' '#1088#1077#1078#1080#1084#1072') '
          #1085#1091#1078#1085#1086' '#1087#1088#1086#1089#1090#1086' '#1085#1072#1074#1077#1089#1090#1080' '#1084#1099#1096#1082#1091
          #1085#1072' '#1095#1072#1089#1099' '#1080#1083#1080' '#1085#1072' '#1080#1082#1086#1085#1082#1091' '#1074' '#1090#1088#1077#1077'!'
          '3. '#1047#1072' 1 '#1084#1080#1085#1091#1090#1091' '#1076#1086' '#1074#1099#1082#1083#1102#1095#1077#1085#1080#1103' '
          #1087#1086#1103#1074#1080#1090#1089#1103' '#1086#1082#1085#1086', '#1074' '#1082#1086#1090#1086#1088#1086#1084' '#1074#1099' '#1084#1086#1078#1077#1090#1077' '
          #1087#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1074#1099#1082#1083#1102#1095#1077#1085#1080#1077' '
          '('#1087#1077#1088#1077#1079#1072#1075#1088#1091#1079#1082#1091', '#1078#1076#1091#1097#1080#1081' '
          #1088#1077#1078#1080#1084') '#1080#1083#1080' '#1086#1090#1084#1077#1085#1080#1090#1100'. '
          '4. '#1042' '#1086#1089#1090#1072#1083#1100#1085#1086#1084' '#1087#1088#1086#1075#1088#1072#1084#1084#1072
          #1080#1084#1077#1077#1090' '#1080#1090#1091#1080#1090#1080#1074#1085#1086' '#1087#1086#1085#1103#1090#1085#1099#1081
          #1080#1085#1090#1077#1088#1092#1077#1081#1089'!')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object LMDTabSheet4: TLMDTabSheet
      Left = 4
      Top = 28
      Width = 289
      Height = 257
      Bevel.Mode = bmCustom
      Caption = #1044#1086#1087'. '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      Color = clWhite
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 259
        Height = 13
        Caption = #1058#1077#1082#1089#1090' '#1074' '#1073#1091#1092#1077#1088' '#1086#1073#1084#1077#1085#1072' '#1087#1088#1080' '#1082#1083#1080#1082#1077' '#1084#1099#1096#1082#1086#1081' '#1085#1072' '#1095#1072#1089#1099':'
      end
      object Edit2: TEdit
        Left = 8
        Top = 24
        Width = 265
        Height = 21
        PasswordChar = '*'
        TabOrder = 0
      end
      object Button1: TButton
        Left = 192
        Top = 224
        Width = 75
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 1
        OnClick = Button1Click
      end
    end
    object LMDTabSheet2: TLMDTabSheet
      Left = 4
      Top = 28
      Width = 289
      Height = 257
      Bevel.Mode = bmCustom
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      object LMDGraphicLabel1: TLMDGraphicLabel
        Left = 48
        Top = 0
        Width = 193
        Height = 38
        Bevel.Mode = bmCustom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Arial'
        Font.Style = []
        FontFX.ShadowDepth = 2
        FillObject.Style = sfGradient
        FillObject.Gradient.Color = clHotLight
        FillObject.Gradient.ColorCount = 25
        FillObject.Gradient.Style = gstElliptic
        FillObject.Gradient.EndColor = clRed
        FillObject.AlphaLevel = 255
        ParentFont = False
        Caption = 'Fiction Clock'
      end
      object RxLabel10: TRxLabel
        Left = 0
        Top = 40
        Width = 256
        Height = 133
        Caption = 
          #1042#1077#1088#1089#1080#1103': 1.2.1'#13#10#1056#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082': '#1053#1077#1095#1080#1087#1086#1088#1077#1085#1082#1086' '#1040'.'#1053'.'#13#10#1057' '#1074#1086#1087#1088#1086#1089#1072#1084#1080' '#1080' '#1087#1086#1078#1077 +
          #1083#1072#1085#1080#1103#1084#1080' '#13#10#1086#1073#1088#1072#1097#1072#1090#1100#1089#1103' '#1085#1072' '#13#10'     e-mail: fictionmail@mail.ru'#13#10'    ' +
          ' ICQ: 400-200-358'#13#10#1054#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1084#1086#1078#1085#1086' '#1085#1072#1081#1090#1080' '#1085#1072' '#1089#1072#1081#1090#1077
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object acURLLabel1: TacURLLabel
        Left = 5
        Top = 203
        Width = 165
        Height = 20
        Cursor = crLinkSelect
        Caption = 'www.fictionpro.narod.ru'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        FontClick.Color = clRed
        FontClick.Style = [fsUnderline]
        FontHover.Color = clRed
        FontHover.Style = [fsUnderline]
        FontHover.Used = True
        Highlight.Enabled = False
        Highlight.Color = clHighlightText
        Highlight.ColorHover = clHighlightText
        Highlight.ColorClick = clHighlightText
        Highlight.Direction = edUpLeft
        Shadow.Enabled = False
        Shadow.Color = clGrayText
        Shadow.ColorHover = clGrayText
        Shadow.ColorClick = clGrayText
        Shadow.Direction = edDownRight
        URL = 'www.fictionpro.narod.ru'
      end
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 252
    Top = 59
  end
end
