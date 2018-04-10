inherited fmDeviceCode: TfmDeviceCode
  Left = 425
  Top = 150
  Width = 598
  Height = 480
  Caption = #44592#44592#44288#47532
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  OldCreateOrder = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl [0]
    Left = 0
    Top = 33
    Width = 590
    Height = 386
    ActivePage = ECUTab
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object MCUTab: TTabSheet
      Caption = #54252#53944#44288#47532
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 582
        Height = 359
        Align = alClient
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 29
          Width = 84
          Height = 12
          Caption = #49884#47532#50620#54252#53944#49440#53469
        end
        object btn_Rs232ConTest: TSpeedButton
          Left = 120
          Top = 50
          Width = 97
          Height = 33
          Caption = #50672#44208#53580#49828#53944
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555FFFFF555555555544C4C5555555555F777775FF5555554C444C444
            5555555775FF55775F55554C4334444445555575577F55557FF554C4C334C4C4
            335557F5577FF55577F554CCC3334444335557555777F555775FCCCCC333CCC4
            C4457F55F777F555557F4CC33333CCC444C57F577777F5F5557FC4333333C3C4
            CCC57F777777F7FF557F4CC33333333C4C457F577777777F557FCCC33CC4333C
            C4C575F7755F777FF5755CCCCC3333334C5557F5FF777777F7F554C333333333
            CC55575777777777F755553333CC3C33C555557777557577755555533CC4C4CC
            5555555775FFFF77555555555C4CCC5555555555577777555555}
          NumGlyphs = 2
          OnClick = btn_Rs232ConTestClick
        end
        object btn_RSetting: TSpeedButton
          Left = 232
          Top = 50
          Width = 105
          Height = 33
          Caption = #49444#51221
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
          OnClick = btn_RSettingClick
        end
        object cmb_ComPort: TComboBox
          Left = 120
          Top = 24
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 0
          OnChange = cmb_ComPortChange
          Items.Strings = (
            ''
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM5'
            'COM6'
            'COM7'
            'COM8'
            'COM9'
            'COM10'
            'COM11'
            'COM12'
            'COM13'
            'COM14'
            'COM15'
            'COM16'
            'COM17'
            'COM18'
            'COM19')
        end
        object st_Connected: TStaticText
          Left = 120
          Top = 94
          Width = 225
          Height = 19
          AutoSize = False
          BevelKind = bkFlat
          TabOrder = 1
        end
        object GroupBox1: TGroupBox
          Left = 2
          Top = 136
          Width = 578
          Height = 221
          Align = alBottom
          Caption = #53685#49888#49345#53468
          TabOrder = 2
          object sg_Event: TAdvStringGrid
            Left = 2
            Top = 14
            Width = 574
            Height = 205
            Cursor = crDefault
            Align = alClient
            ColCount = 6
            DefaultColWidth = 90
            DefaultRowHeight = 21
            FixedCols = 0
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSelect]
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            SearchFooter.FindNextCaption = 'Find next'
            SearchFooter.FindPrevCaption = 'Find previous'
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurence'
            SearchFooter.HintFindPrev = 'Find previous occurence'
            SearchFooter.HintHighlight = 'Highlight occurences'
            SearchFooter.MatchCaseCaption = 'Match case'
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
            FixedColWidth = 46
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            ColumnHeaders.Strings = (
              #49569#49688#49888
              'NO'
              'MSGNO'
              'CMD'
              'LENGTH'
              'DATA')
            Filter = <>
            Version = '3.3.0.1'
            ColWidths = (
              46
              35
              33
              42
              51
              348)
          end
        end
      end
    end
    object ECUTab: TTabSheet
      Caption = #47532#45908#44288#47532
      ImageIndex = 1
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 582
        Height = 359
        Align = alClient
        TabOrder = 0
        object Splitter2: TSplitter
          Left = 241
          Top = 14
          Height = 286
        end
        object Panel6: TPanel
          Left = 244
          Top = 14
          Width = 336
          Height = 286
          Align = alClient
          TabOrder = 0
          object GroupBox10: TGroupBox
            Left = 1
            Top = 1
            Width = 334
            Height = 284
            Align = alClient
            TabOrder = 0
            object Label22: TLabel
              Left = 16
              Top = 45
              Width = 48
              Height = 12
              Caption = #47532#45908#47749#52845
            end
            object Label10: TLabel
              Left = 16
              Top = 18
              Width = 48
              Height = 12
              Caption = #47532#45908#48264#54840
            end
            object Label1: TLabel
              Left = 16
              Top = 69
              Width = 48
              Height = 12
              Caption = #47532#45908#44396#48516
              Visible = False
            end
            object ed_EcuName: TEdit
              Left = 80
              Top = 41
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 30
              TabOrder = 0
            end
            object ed_Ecuno: TSpinEdit
              Left = 80
              Top = 14
              Width = 217
              Height = 21
              MaxValue = 99
              MinValue = 0
              TabOrder = 1
              Value = 1
            end
            object ed_gubun: TEdit
              Left = 80
              Top = 65
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 30
              TabOrder = 2
              Visible = False
            end
          end
        end
        object Panel5: TPanel
          Left = 2
          Top = 14
          Width = 239
          Height = 286
          Align = alLeft
          TabOrder = 1
          object sg_ECUCode: TAdvStringGrid
            Left = 1
            Top = 1
            Width = 237
            Height = 284
            Cursor = crDefault
            ColCount = 19
            DefaultColWidth = 90
            DefaultRowHeight = 21
            FixedCols = 0
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSelect]
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
            OnClick = sg_ECUCodeClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            SearchFooter.FindNextCaption = 'Find next'
            SearchFooter.FindPrevCaption = 'Find previous'
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurence'
            SearchFooter.HintFindPrev = 'Find previous occurence'
            SearchFooter.HintHighlight = 'Highlight occurences'
            SearchFooter.MatchCaseCaption = 'Match case'
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
            FixedColWidth = 85
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            ColumnHeaders.Strings = (
              #47532#45908#48264#54840
              #47532#45908#47749#52845
              'NODE'#48264#54840
              '')
            Filter = <>
            Version = '3.3.0.1'
            ColWidths = (
              85
              121
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
          end
        end
        object GroupBox8: TGroupBox
          Left = 2
          Top = 300
          Width = 578
          Height = 57
          Align = alBottom
          TabOrder = 2
          object btn_Insert: TSpeedButton
            Left = 16
            Top = 16
            Width = 81
            Height = 25
            Caption = #52628#44032
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333FF33333333FF333993333333300033377F3333333777333993333333
              300033F77FFF3333377739999993333333333777777F3333333F399999933333
              33003777777333333377333993333333330033377F3333333377333993333333
              3333333773333333333F333333333333330033333333F33333773333333C3333
              330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
              333333333337733333FF3333333C333330003333333733333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btn_InsertClick
          end
          object btn_Update: TSpeedButton
            Left = 108
            Top = 16
            Width = 81
            Height = 25
            Caption = #49688#51221
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
            OnClick = btn_UpdateClick
          end
          object btn_Save: TSpeedButton
            Left = 294
            Top = 16
            Width = 81
            Height = 25
            Caption = #51200#51109
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
              7700333333337777777733333333008088003333333377F73377333333330088
              88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
              000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
              FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
              99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
              99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
              99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
              93337FFFF7737777733300000033333333337777773333333333}
            NumGlyphs = 2
            OnClick = btn_SaveClick
          end
          object btn_Delete: TSpeedButton
            Left = 201
            Top = 16
            Width = 81
            Height = 25
            Caption = #49325#51228
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              300033FFFFFF3333377739999993333333333777777F3333333F399999933333
              3300377777733333337733333333333333003333333333333377333333333333
              3333333333333333333F333333333333330033333F33333333773333C3333333
              330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
              333333377F33333333FF3333C333333330003333733333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btn_DeleteClick
          end
          object btn_Close: TSpeedButton
            Left = 480
            Top = 16
            Width = 81
            Height = 25
            Caption = #45803#44592
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
          object btn_Cancel: TSpeedButton
            Left = 387
            Top = 16
            Width = 81
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
            OnClick = btn_CancelClick
          end
        end
      end
    end
    object AlarmTab: TTabSheet
      Caption = #52636#51077#47928' '#44288#47532
      ImageIndex = 3
      TabVisible = False
      object GroupBox16: TGroupBox
        Left = 0
        Top = 0
        Width = 582
        Height = 359
        Align = alClient
        TabOrder = 0
        object Splitter4: TSplitter
          Left = 195
          Top = 14
          Height = 343
        end
        object Panel4: TPanel
          Left = 198
          Top = 14
          Width = 382
          Height = 343
          Align = alClient
          TabOrder = 0
          object GroupBox17: TGroupBox
            Left = 1
            Top = 1
            Width = 380
            Height = 341
            Align = alClient
            TabOrder = 0
            object Label35: TLabel
              Left = 16
              Top = 168
              Width = 12
              Height = 12
              Caption = #52789
            end
            object Label36: TLabel
              Left = 16
              Top = 193
              Width = 60
              Height = 12
              Caption = #54924#51032#49892#53076#46300
            end
            object Label38: TLabel
              Left = 16
              Top = 24
              Width = 42
              Height = 12
              Caption = 'MCU'#53076#46300
            end
            object Label39: TLabel
              Left = 16
              Top = 49
              Width = 42
              Height = 12
              Caption = 'ECU'#53076#46300
            end
            object Label40: TLabel
              Left = 16
              Top = 101
              Width = 60
              Height = 12
              Caption = #51316#44396#50669#47749#52845
            end
            object Label45: TLabel
              Left = 16
              Top = 75
              Width = 60
              Height = 12
              Caption = #44048#51648#51316#48264#54840
            end
            object Label46: TLabel
              Left = 16
              Top = 131
              Width = 72
              Height = 12
              Caption = #54868#47732#51312#54924#49692#49436
              Visible = False
            end
            object cmb_sFloorCode4: TComboBox
              Left = 120
              Top = 164
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 0
            end
            object cmb_sMeetingRoomCode4: TComboBox
              Left = 120
              Top = 189
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 1
            end
            object cmb_sMCUCode4: TComboBox
              Left = 120
              Top = 20
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 2
            end
            object cmb_sECUCode4: TComboBox
              Left = 120
              Top = 45
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ItemIndex = 0
              TabOrder = 3
              Items.Strings = (
                ''
                '01'
                '02'
                '03'
                '04'
                '05'
                '06'
                '07'
                '08'
                '09'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16'
                '17'
                '18'
                '19'
                '20'
                '21'
                '22'
                '23'
                '24'
                '25'
                '26'
                '27'
                '28'
                '29'
                '30'
                '31'
                '32'
                '33'
                '34'
                '35'
                '36'
                '37'
                '38'
                '39'
                '40'
                '41'
                '42'
                '43'
                '44'
                '45'
                '46'
                '47'
                '48'
                '49'
                '50'
                '51'
                '52'
                '53'
                '54'
                '55'
                '56'
                '57'
                '58'
                '59'
                '60'
                '61'
                '62'
                '63'
                '64'
                '65'
                '66'
                '67'
                '68'
                '69'
                '70'
                '71'
                '72'
                '73'
                '74'
                '75'
                '76'
                '77'
                '78'
                '79'
                '80'
                '81'
                '82'
                '83'
                '84'
                '85'
                '86'
                '87'
                '88'
                '89'
                '90'
                '91'
                '92'
                '93'
                '94'
                '95'
                '96'
                '97'
                '98'
                '99')
            end
            object ed_AlarmName4: TEdit
              Left = 120
              Top = 97
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 30
              TabOrder = 4
            end
            object ed_AlarmNo4: TSpinEdit
              Left = 120
              Top = 71
              Width = 217
              Height = 21
              MaxValue = 8
              MinValue = 1
              TabOrder = 5
              Value = 1
            end
            object ed_AlarmViewSeq: TEdit
              Left = 120
              Top = 127
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 30
              TabOrder = 6
              Visible = False
            end
            object ed_NodeNo4: TEdit
              Left = 120
              Top = 8
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 7
              Visible = False
            end
          end
        end
        object Panel7: TPanel
          Left = 2
          Top = 14
          Width = 193
          Height = 343
          Align = alLeft
          TabOrder = 1
          object GroupBox18: TGroupBox
            Left = 1
            Top = 1
            Width = 191
            Height = 56
            Align = alTop
            TabOrder = 0
            object Label41: TLabel
              Left = 16
              Top = 24
              Width = 48
              Height = 12
              Caption = #44592#44592#53076#46300
            end
            object Label44: TLabel
              Left = 16
              Top = 72
              Width = 48
              Height = 12
              Caption = #44396#50669#53076#46300
              Visible = False
            end
            object cmb_DeviceCode: TComboBox
              Left = 72
              Top = 20
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 0
            end
            object cmb_AreaCode4: TComboBox
              Left = 72
              Top = 68
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 1
              Visible = False
            end
          end
          object sg_AlarmCode: TAdvStringGrid
            Left = 1
            Top = 57
            Width = 191
            Height = 285
            Cursor = crDefault
            Align = alClient
            ColCount = 3
            DefaultColWidth = 90
            DefaultRowHeight = 21
            FixedCols = 0
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSelect]
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 1
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            SearchFooter.FindNextCaption = 'Find next'
            SearchFooter.FindPrevCaption = 'Find previous'
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurence'
            SearchFooter.HintFindPrev = 'Find previous occurence'
            SearchFooter.HintHighlight = 'Highlight occurences'
            SearchFooter.MatchCaseCaption = 'Match case'
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
            FixedColWidth = 84
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            ColumnHeaders.Strings = (
              #48169#48276#44396#50669#48264#54840
              #48169#48276#44396#50669#47749#52845
              'NODENO'
              'MCUID'
              'ECUID'
              #48716#46377#53076#46300
              #52789#53076#46300
              #44396#50669#53076#46300
              #54868#47732#51312#54924#49692#49436
              #50948#52824#46321#47197#51221#48372
              'TotWidth'
              'TotHeight'
              'CurX'
              'CurY')
            Filter = <>
            Version = '3.3.0.1'
            ColWidths = (
              84
              90
              90)
          end
        end
      end
    end
  end
  object StatusBar1: TStatusBar [1]
    Left = 0
    Top = 419
    Width = 590
    Height = 27
    Panels = <>
  end
  object Panel12: TPanel [2]
    Left = 0
    Top = 0
    Width = 590
    Height = 33
    Align = alTop
    Caption = #44592#44592#44288#47532
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
  object ADONode: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 32
    Top = 176
  end
  object ADOECU: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 56
    Top = 176
  end
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 8
    Top = 56
  end
  object ADOExec: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 96
    Top = 168
  end
  object ADOLink: TADOQuery
    Parameters = <>
    Left = 40
    Top = 232
  end
  object Off_Timer: TTimer
    Enabled = False
    Left = 40
    Top = 1
  end
end
