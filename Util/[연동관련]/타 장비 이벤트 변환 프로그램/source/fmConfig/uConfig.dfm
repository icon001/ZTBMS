object fmConfig: TfmConfig
  Left = 442
  Top = 333
  Width = 419
  Height = 274
  Caption = #54872#44221#49444#51221
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object sbSave: TSpeedButton
    Left = 80
    Top = 160
    Width = 89
    Height = 25
    Caption = #51201#50857
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    OnClick = sbSaveClick
  end
  object sbCancel: TSpeedButton
    Left = 240
    Top = 160
    Width = 89
    Height = 25
    Caption = #52712#49548
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      3333333777333777FF3333993333339993333377FF3333377FF3399993333339
      993337777FF3333377F3393999333333993337F777FF333337FF993399933333
      399377F3777FF333377F993339993333399377F33777FF33377F993333999333
      399377F333777FF3377F993333399933399377F3333777FF377F993333339993
      399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
      99333773FF3333777733339993333339933333773FFFFFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    NumGlyphs = 2
    OnClick = sbCancelClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 206
    Width = 411
    Height = 34
    Panels = <
      item
        Width = 300
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 411
    Height = 145
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #52852#46300#53440#51077
      object StaticText1: TStaticText
        Left = 16
        Top = 26
        Width = 137
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvNone
        BevelKind = bkSoft
        BevelOuter = bvRaised
        BiDiMode = bdLeftToRight
        BorderStyle = sbsSunken
        Caption = #51077#47141#53440#51077
        ParentBiDiMode = False
        TabOrder = 0
      end
      object StaticText2: TStaticText
        Left = 16
        Top = 50
        Width = 137
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvNone
        BevelKind = bkSoft
        BevelOuter = bvRaised
        BiDiMode = bdLeftToRight
        BorderStyle = sbsSunken
        Caption = #51200#51109#53440#51077
        ParentBiDiMode = False
        TabOrder = 1
      end
      object cmb_InCardType: TComboBox
        Left = 168
        Top = 24
        Width = 185
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 2
        Text = '0.'#49884#47532#50620'-HEX'
        Items.Strings = (
          '0.'#49884#47532#50620'-HEX'
          '1.'#49884#47532#50620'-Decimal'
          '2.'#49884#47532#50620'-HID'
          '3.ASCII')
      end
      object cmb_SaveCardType: TComboBox
        Left = 168
        Top = 48
        Width = 185
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 3
        Text = '0.'#49884#47532#50620'-HEX'
        Items.Strings = (
          '0.'#49884#47532#50620'-HEX'
          '1.ASCII')
      end
    end
    object TabSheet2: TTabSheet
      Caption = #51077#47141#44592#44592
      ImageIndex = 1
      object StaticText3: TStaticText
        Left = 16
        Top = 26
        Width = 137
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvNone
        BevelKind = bkSoft
        BevelOuter = bvRaised
        BiDiMode = bdLeftToRight
        BorderStyle = sbsSunken
        Caption = #51077#47141#53440#51077
        ParentBiDiMode = False
        TabOrder = 0
      end
      object cmb_InDeviceType: TComboBox
        Left = 168
        Top = 24
        Width = 185
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 1
        Text = '0.'#46321#47197#44592
        OnChange = cmb_InDeviceTypeChange
        Items.Strings = (
          '0.'#46321#47197#44592
          '1.'#49828#54588#46300#44172#51060#53944)
      end
      object rg_CardRegType: TGroupBox
        Left = 16
        Top = 56
        Width = 337
        Height = 57
        Caption = #46321#47197#44592' '#49444#51221
        TabOrder = 2
        object StaticText4: TStaticText
          Left = 32
          Top = 26
          Width = 105
          Height = 17
          Alignment = taCenter
          AutoSize = False
          BevelInner = bvNone
          BevelKind = bkSoft
          BevelOuter = bvRaised
          BiDiMode = bdLeftToRight
          BorderStyle = sbsSunken
          Caption = #54252#53944
          ParentBiDiMode = False
          TabOrder = 0
        end
        object cmb_ComPort: TComboBox
          Left = 152
          Top = 24
          Width = 137
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 1
          Text = '0.'#46321#47197#44592
          Items.Strings = (
            '0.'#46321#47197#44592
            '1.'#49828#54588#46300#44172#51060#53944)
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #51204#49569#53440#51077
      ImageIndex = 2
      object StaticText5: TStaticText
        Left = 16
        Top = 26
        Width = 137
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvNone
        BevelKind = bkSoft
        BevelOuter = bvRaised
        BiDiMode = bdLeftToRight
        BorderStyle = sbsSunken
        Caption = #51077#47141#52852#46300#53440#51077
        ParentBiDiMode = False
        TabOrder = 0
      end
      object cmb_IncardLength: TComboBox
        Left = 168
        Top = 24
        Width = 185
        Height = 20
        Style = csDropDownList
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 1
        Text = '0.4Byte'
        Items.Strings = (
          '0.4Byte'
          '1.16'#51088#47532#44256#51221
          '2.'#44032#48320#45936#51060#53552)
      end
    end
  end
end
