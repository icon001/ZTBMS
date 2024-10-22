inherited fmLOMOSEmployee: TfmLOMOSEmployee
  Left = 312
  Top = 153
  Width = 662
  Height = 667
  BorderIcons = [biSystemMenu]
  Caption = 'LOMOS '#49324#50896#46321#47197
  Font.Height = -12
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel [0]
    Left = 0
    Top = 33
    Width = 654
    Height = 571
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object sg_Employ: TAdvStringGrid
      Left = 0
      Top = 161
      Width = 654
      Height = 410
      Cursor = crDefault
      Align = alClient
      ColCount = 37
      DefaultColWidth = 90
      DefaultRowHeight = 21
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      OnCheckBoxClick = sg_EmployCheckBoxClick
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        'CARD_NO'
        'CO_CODE'
        'CO_NAME'
        'LOCAL_CODE'
        'LOCAL_NAME'
        'DEPART_CODE'
        'DEPART_NAME'
        'POSI_CODE'
        'POSI_NAME'
        'ID_NO'
        'USER_NAME'
        'ISMASTER'
        'AGROUP_CODE'
        'TP_CODE'
        'USE_EXP'
        'S_DATE'
        'E_DATE'
        'USE_ATTEND'
        'ATTEND_GROUP')
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
      FilterDropDown.Font.Style = []
      FilterDropDownClear = '(All)'
      FixedColWidth = 205
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      ScrollSynch = True
      SearchFooter.FindNextCaption = 'Find next'
      SearchFooter.FindPrevCaption = 'Find previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurence'
      SearchFooter.HintFindPrev = 'Find previous occurence'
      SearchFooter.HintHighlight = 'Highlight occurences'
      SearchFooter.MatchCaseCaption = 'Match case'
      SortSettings.AutoColumnMerge = True
      SortSettings.Show = True
      Version = '6.0.4.4'
      ColWidths = (
        205
        137
        173
        197
        84
        90
        90
        90
        90
        174
        186
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90
        90)
      object Gauge1: TGauge
        Left = 168
        Top = 128
        Width = 329
        Height = 33
        ForeColor = clBlue
        Progress = 0
        Visible = False
      end
    end
    object GroupBox3: TGroupBox
      Left = 0
      Top = 0
      Width = 654
      Height = 161
      Align = alTop
      TabOrder = 1
      object btn_EmployInsert: TSpeedButton
        Left = 40
        Top = 52
        Width = 153
        Height = 40
        Caption = 'LOMOS '#54028#51068#48520#47084#50724#44592
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        NumGlyphs = 2
        OnClick = btn_EmployInsertClick
      end
      object GroupBox1: TGroupBox
        Left = 232
        Top = 14
        Width = 420
        Height = 145
        Align = alRight
        Caption = #52636#51077#44288#47532#54532#47196#44536#47016
        TabOrder = 0
        object lb_CompanyName: TLabel
          Left = 16
          Top = 20
          Width = 48
          Height = 12
          Caption = #54924#49324#53076#46300
        end
        object lb_JijumName: TLabel
          Left = 16
          Top = 44
          Width = 48
          Height = 12
          Caption = #51648#51216#53076#46300
        end
        object lb_DepartName: TLabel
          Left = 16
          Top = 68
          Width = 48
          Height = 12
          Caption = #48512#49436#53076#46300
        end
        object lb_PosiName: TLabel
          Left = 16
          Top = 92
          Width = 48
          Height = 12
          Caption = #51649#50948#53076#46300
        end
        object btn_Close: TSpeedButton
          Left = 290
          Top = 64
          Width = 113
          Height = 41
          Caption = ' '#45803#44592
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000730B0000730B00000001000000000000000000003300
            00006600000099000000CC000000FF0000000033000033330000663300009933
            0000CC330000FF33000000660000336600006666000099660000CC660000FF66
            000000990000339900006699000099990000CC990000FF99000000CC000033CC
            000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
            0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
            330000333300333333006633330099333300CC333300FF333300006633003366
            33006666330099663300CC663300FF6633000099330033993300669933009999
            3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
            330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
            66006600660099006600CC006600FF0066000033660033336600663366009933
            6600CC336600FF33660000666600336666006666660099666600CC666600FF66
            660000996600339966006699660099996600CC996600FF99660000CC660033CC
            660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
            6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
            990000339900333399006633990099339900CC339900FF339900006699003366
            99006666990099669900CC669900FF6699000099990033999900669999009999
            9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
            990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
            CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
            CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
            CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
            CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
            CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
            FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
            FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
            FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
            FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
            000000808000800000008000800080800000C0C0C00080808000191919004C4C
            4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
            6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
            EEE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8EEE8E8E8E8E8E8E8E8E8E8E8E8EEE3AC
            E3EEE8E8E8E8E8E8E8E8E8E8E8EEE8ACE3EEE8E8E8E8E8E8E8E8E8EEE3E28257
            57E2ACE3EEE8E8E8E8E8E8EEE8E2818181E2ACE8EEE8E8E8E8E8E382578282D7
            578181E2E3E8E8E8E8E8E881818181D7818181E2E8E8E8E8E8E857828989ADD7
            57797979EEE8E8E8E8E88181DEDEACD781818181EEE8E8E8E8E857898989ADD7
            57AAAAA2D7ADE8E8E8E881DEDEDEACD781DEDE81D7ACE8E8E8E857898989ADD7
            57AACEA3AD10E8E8E8E881DEDEDEACD781DEAC81AC81E8E8E8E85789825EADD7
            57ABCFE21110E8E8E8E881DE8181ACD781ACACE28181E8E8E8E8578957D7ADD7
            57ABDE101010101010E881DE56D7ACD781ACDE818181818181E857898257ADD7
            57E810101010101010E881DE8156ACD781E381818181818181E857898989ADD7
            57E882101010101010E881DEDEDEACD781E381818181818181E857898989ADD7
            57ACEE821110E8E8E8E881DEDEDEACD781ACEE818181E8E8E8E857898989ADD7
            57ABE8AB8910E8E8E8E881DEDEDEACD781ACE3ACDE81E8E8E8E857828989ADD7
            57ACE8A3E889E8E8E8E88181DEDEACD781ACE381E8DEE8E8E8E8E8DE5E8288D7
            57A2A2A2E8E8E8E8E8E8E8DE8181DED781818181E8E8E8E8E8E8E8E8E8AC8257
            57E8E8E8E8E8E8E8E8E8E8E8E8AC818181E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
          OnClick = btn_CloseClick
        end
        object lb_emType: TLabel
          Left = 16
          Top = 116
          Width = 48
          Height = 12
          Caption = #51649#50896#53076#46300
        end
        object cmb_Company: TComboBox
          Left = 80
          Top = 16
          Width = 169
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 0
          OnChange = cmb_CompanyChange
        end
        object cmb_Jijum: TComboBox
          Left = 80
          Top = 40
          Width = 169
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 1
          OnChange = cmb_JijumChange
        end
        object cmb_Depart: TComboBox
          Left = 80
          Top = 64
          Width = 169
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 2
        end
        object cmb_Posi: TComboBox
          Left = 80
          Top = 88
          Width = 169
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 3
        end
        object btn_Save: TBitBtn
          Left = 290
          Top = 16
          Width = 113
          Height = 41
          Caption = #51200#51109#54616#44592
          TabOrder = 4
          OnClick = btn_SaveClick
          Glyph.Data = {
            82060000424D8206000000000000420000002800000028000000140000000100
            1000030000004006000000000000000000000000000000000000007C0000E003
            00001F0000000042004200420042004200420042004200420042004200420042
            0042004200420042004200420042004200420042004200420042004200420042
            00420042FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00420042004200420042
            0042004200420042004200000000000000000000000000000000000000420042
            0042004200420042004200420042004200421042104210421042104210421042
            10421042FF7F00420042004200420042004200420042004200420000E07FFF7F
            E07FFF7FE07FFF7FE07F00000042004200420042FF7FFF7FFF7FFF7FFF7FFF7F
            FF7F1042FF7F0042FF7FFF7FFF7FFF7FFF7F1042FF7F00420042000000000000
            000000000000000000000000FF7F10421042104210421042FF7F000000420042
            0042104210421042104210421042104210421042FF7F10421042104210421042
            00421042FF7F004200001863FF7F1863FF7F1863FF7F1863FF7F0000E07FFF7F
            E07FFF7FE07FFF7FE07F0000004200421042FF7F004200420042004200420042
            00421042FF7F004200420042FF7FFF7FFF7F1042FF7F00420000FF7F1863FF7F
            1863FF7F1863FF7F18630000FF7F18631863104210421042FF7F000000420042
            1042FF7F00420042004200420042004200421042FF7FFF7FFF7F104210421042
            00421042FF7F004200001863FF7F1863FF7F1863FF7F18631000100010001000
            E07FFF7FE07FFF7FE07F0000004200421042FF7F004200420042004200420042
            1042104210421042FF7F0042FF7FFF7FFF7F1042FF7F00420000FF7F1863FF7F
            1863FF7F1863FF7F18631F00100010001863104210421042FF7F000000420042
            1042FF7F0042004200420042004200420042104210421042FF7F104210421042
            00421042FF7F004200001863FF7F1863FF7F1863FF7F1863100010001F001000
            E07FFF7FE07FFF7FE07F0000004200421042FF7F004200420042004200420042
            1042104210421042FF7F004200420042FF7F1042FF7F00420000FF7F1863FF7F
            1863FF7F1863100010001000FF7F1000FF7FFF7FFF7F10421042000000420042
            1042FF7F00420042004200420042104210421042FF7F10420042004200421042
            104210420042004200001863FF7F1863FF7F18631000100010000000E07FFF7F
            E07FFF7FE07F104200000042004200421042FF7F004200420042004210421042
            10421042FF7FFF7FFF7FFF7FFF7F104210420042004200420000FF7F1863FF7F
            1863100010001000186300000000000000000000000000000042004200420042
            1042FF7F00420042004210421042104200421042104210421042104210421042
            004200420042004200001863FF7F1863FF7F186310001863FF7F1863FF7F0000
            004200420042004200420042004200421042FF7F004200420042004210420042
            0042004200421042FF7F00420042004200420042004200420000FF7F1863FF7F
            1863FF7F1863FF7F1863FF7F1863000000420042004200420042004200420042
            1042FF7F0042004200420042004200420042004200421042FF7F004200420042
            004200420042004200001863FF7F1863FF7F1863FF7F1863FF7F1863FF7F0000
            004200420042004200420042004200421042FF7F00420042FF7FFF7FFF7FFF7F
            FF7FFF7F00421042FF7F00420042004200420042004200420000FF7F18631000
            10001000100010001000FF7F1863000000420042004200420042004200420042
            10420042FF7F104210421042104210421042FF7FFF7F10420042004200420042
            0042004200420042004200000000FF031F001F001F001F001000000000000042
            0042004200420042004200420042004200421042104200421042104210421042
            104210421042004200420042004200420042004200420042004200420042FF03
            1F001F001F001F00100000420042004200420042004200420042004200420042
            0042004200420042104210421042104210420042004200420042004200420042
            00420042004200420042004200420042FF03FF03FF03FF030042004200420042
            0042004200420042004200420042004200420042004200420042004200420042
            0042004200420042004200420042004200420042004200420042004200420042
            0042004200420042004200420042004200420042004200420042004200420042
            0042004200420042004200420042004200420042004200420042004200420042
            004200420042}
          NumGlyphs = 2
        end
        object cmb_EmpType: TComboBox
          Left = 80
          Top = 112
          Width = 169
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 5
        end
      end
    end
  end
  object StatusBar1: TStatusBar [1]
    Left = 0
    Top = 604
    Width = 654
    Height = 29
    Panels = <
      item
        Width = 1000
      end>
  end
  object Panel6: TPanel [2]
    Left = 0
    Top = 0
    Width = 654
    Height = 33
    Align = alTop
    Caption = 'LOMOS '#49324#50896' '#46321#47197
    Color = 15387318
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentBackground = True
    ParentFont = False
    TabOrder = 2
  end
  inherited CommandArray: TCommandArray
    Commands = <
      item
        CommandName = 'ZipCode'
        CommandKind = 0
        Name = 'TCommand0'
      end
      item
        CommandName = 'CARDDATA'
        CommandKind = 0
        Name = 'TCommand1'
      end>
  end
  object RzOpenDialog1: TOpenDialog
    Left = 844
    Top = 220
  end
  object ReaderPort: TApdComPort
    Baud = 9600
    AutoOpen = False
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    Left = 8
    Top = 564
  end
  object ApdDataPacket1: TApdDataPacket
    Enabled = True
    AutoEnable = False
    ComPort = ReaderPort
    PacketSize = 0
    OnStringPacket = ApdDataPacket1StringPacket
    Left = 40
    Top = 564
  end
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 416
    Top = 32
  end
  object FileCtrl: TLMDFileCtrl
    Options = [ffNoActionConfirm, ffShowNoProgress, ffUseRecycleBin]
    Left = 659
    Top = 125
  end
  object SaveDialog1: TSaveDialog
    Left = 28
    Top = 28
  end
  object OpenDialog1: TOpenDialog
    Left = 68
    Top = 28
  end
  object ADOExec: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 464
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 416
  end
  object fdmsADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 464
  end
end
