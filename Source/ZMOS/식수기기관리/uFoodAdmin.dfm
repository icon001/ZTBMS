object fmFoodAdmin: TfmFoodAdmin
  Left = 196
  Top = 96
  Width = 767
  Height = 543
  Caption = #49885#49688#44396#50669#44288#47532
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object pan_header: TPanel
    Left = 0
    Top = 0
    Width = 759
    Height = 41
    Align = alTop
    Caption = #49885#49688#44396#50669#44288#47532
    Color = 15387318
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 41
    Width = 759
    Height = 370
    Align = alClient
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 361
      Top = 14
      Height = 354
    end
    object Panel6: TPanel
      Left = 364
      Top = 14
      Width = 393
      Height = 354
      Align = alClient
      TabOrder = 0
      object GroupBox10: TGroupBox
        Left = 1
        Top = 1
        Width = 391
        Height = 352
        Align = alClient
        TabOrder = 0
        object Label7: TLabel
          Left = 16
          Top = 24
          Width = 54
          Height = 12
          Caption = #44592#44592' '#47749#52845
        end
        object Label13: TLabel
          Left = 16
          Top = 104
          Width = 48
          Height = 12
          Caption = #48716#46377#53076#46300
        end
        object Label15: TLabel
          Left = 16
          Top = 129
          Width = 36
          Height = 12
          Caption = #52789#53076#46300
        end
        object Label23: TLabel
          Left = 16
          Top = 155
          Width = 48
          Height = 12
          Caption = #44396#50669#53076#46300
        end
        object Label12: TLabel
          Left = 16
          Top = 181
          Width = 48
          Height = 12
          Caption = #50948#52824#51221#48372
          Visible = False
        end
        object Label10: TLabel
          Left = 16
          Top = 49
          Width = 78
          Height = 12
          Caption = #52852#46300#47532#45908' '#48264#54840
        end
        object Label22: TLabel
          Left = 16
          Top = 74
          Width = 78
          Height = 12
          Caption = #49885#49688#44396#50669' '#47749#52845
        end
        object Label4: TLabel
          Left = 8
          Top = 323
          Width = 78
          Height = 12
          Caption = #52852#46300#47532#45908' Type'
          Visible = False
        end
        object Label1: TLabel
          Left = 16
          Top = 253
          Width = 48
          Height = 12
          Caption = #51312#49885#44552#50529
        end
        object Label2: TLabel
          Left = 16
          Top = 274
          Width = 48
          Height = 12
          Caption = #51473#49885#44552#50529
        end
        object Label3: TLabel
          Left = 16
          Top = 295
          Width = 48
          Height = 12
          Caption = #49437#49885#44552#50529
        end
        object Label5: TLabel
          Left = 16
          Top = 317
          Width = 48
          Height = 12
          Caption = #50556#49885#44552#50529
        end
        object cmb_regDeviceCode: TComboBox
          Left = 120
          Top = 20
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 0
          OnChange = cmb_regDeviceCodeChange
        end
        object cmb_sBuildingCode: TComboBox
          Left = 120
          Top = 100
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 3
          OnChange = cmb_sBuildingCodeChange
        end
        object cmb_sFloorCode: TComboBox
          Left = 120
          Top = 125
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 4
          OnChange = cmb_sFloorCodeChange
        end
        object cmb_sAreaCode: TComboBox
          Left = 120
          Top = 150
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 6
          OnChange = cmb_sAreaCodeChange
        end
        object ed_TotWidth: TEdit
          Left = 128
          Top = 192
          Width = 25
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 5
          Visible = False
        end
        object ed_TotHeight: TEdit
          Left = 160
          Top = 192
          Width = 25
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 13
          Visible = False
        end
        object ed_CurX: TEdit
          Left = 192
          Top = 192
          Width = 25
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 14
          Visible = False
        end
        object ed_CurY: TEdit
          Left = 224
          Top = 192
          Width = 25
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 15
          Visible = False
        end
        object btnFoodPosition: TBitBtn
          Left = 120
          Top = 176
          Width = 217
          Height = 25
          Caption = #50948#52824#46321#47197
          Enabled = False
          TabOrder = 7
          OnClick = btnFoodPositionClick
        end
        object chk_FoodReg: TCheckBox
          Left = 72
          Top = 176
          Width = 49
          Height = 17
          Caption = #46321#47197
          TabOrder = 16
          Visible = False
        end
        object ed_regReaderNo: TSpinEdit
          Left = 120
          Top = 45
          Width = 217
          Height = 21
          MaxValue = 8
          MinValue = 1
          TabOrder = 1
          Value = 1
        end
        object ed_regFoodName: TEdit
          Left = 120
          Top = 70
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          MaxLength = 30
          TabOrder = 2
        end
        object cmb_CardReaderType: TComboBox
          Left = 112
          Top = 319
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 17
          Text = '0.SCR-102'
          Visible = False
          Items.Strings = (
            '0.SCR-102'
            '1.'#51648#47928#47532#45908
            '2.Wiegand '#52852#46300#47532#45908'(26BIT)'
            '3.Wiegand '#52852#46300#47532#45908'(34BIT)')
        end
        object ed_BreakAmt: TEdit
          Left = 120
          Top = 249
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 9
          Text = '5000'
        end
        object ed_LunchAmt: TEdit
          Left = 120
          Top = 270
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 10
          Text = '5000'
        end
        object ed_EveningAmt: TEdit
          Left = 120
          Top = 291
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 11
          Text = '5000'
        end
        object ed_MidNightAmt: TEdit
          Left = 120
          Top = 313
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 12
          Text = '5000'
        end
        object Group_CardReaderNo: TRzCheckGroup
          Left = 16
          Top = 203
          Width = 321
          Height = 41
          Caption = #49324#50857' '#52852#46300#47532#45908' '#51648#51221
          Columns = 8
          Items.Strings = (
            '01'
            '02'
            '03'
            '04'
            '05'
            '06'
            '07'
            '08')
          TabOrder = 8
          TextStyle = tsRecessed
          Visible = False
          OnChange = Group_CardReaderNoChange
          CheckStates = (
            0
            0
            0
            0
            0
            0
            0
            0)
        end
        object chk_foodUpdate: TCheckBox
          Left = 8
          Top = 0
          Width = 153
          Height = 25
          Caption = #49885#49688#44396#50669#51221#48372#50629#45936#51060#53944
          TabOrder = 18
          Visible = False
        end
      end
    end
    object Panel5: TPanel
      Left = 2
      Top = 14
      Width = 359
      Height = 354
      Align = alLeft
      TabOrder = 1
      object GroupBox11: TGroupBox
        Left = 1
        Top = 1
        Width = 357
        Height = 48
        Align = alTop
        TabOrder = 0
        object Label9: TLabel
          Left = 16
          Top = 24
          Width = 36
          Height = 12
          Caption = #44592#44592#47749
        end
        object cmb_DeviceCode: TComboBox
          Left = 72
          Top = 20
          Width = 185
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 0
          OnChange = cmb_DeviceCodeChange
        end
      end
      object sg_Food: TAdvStringGrid
        Left = 1
        Top = 49
        Width = 357
        Height = 304
        Cursor = crDefault
        Align = alClient
        ColCount = 20
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
        OnClick = sg_FoodClick
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
        FixedColWidth = 121
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        ColumnHeaders.Strings = (
          #49885#49688#44396#50669' '#47749#52845
          #44592#44592' '#47749#52845
          #52852#46300#47532#45908
          #45432#46300#48264#54840
          'ECUID'
          #52852#46300#47532#45908'TYPE'
          #48716#46377#53076#46300
          #52789#53076#46300
          #44396#50669#53076#46300
          #50948#52824#49324#50857
          #52509#45331#51060
          #52509#45458#51060
          #54788#51116'X'
          #54788#51116'Y'
          #51312#49885#44552#50529
          #51473#49885#44552#50529
          #49437#49885#44552#50529
          #50556#49885#44552#50529)
        Filter = <>
        Version = '3.3.0.1'
        ColWidths = (
          121
          130
          70
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 411
    Width = 759
    Height = 64
    Align = alBottom
    TabOrder = 2
    object btn_Insert: TSpeedButton
      Left = 32
      Top = 16
      Width = 100
      Height = 35
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
      Left = 152
      Top = 16
      Width = 100
      Height = 35
      Caption = #49688#51221
      Enabled = False
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
      Left = 392
      Top = 16
      Width = 100
      Height = 35
      Caption = #51200#51109
      Enabled = False
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
      Left = 272
      Top = 16
      Width = 100
      Height = 35
      Caption = #49325#51228
      Enabled = False
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
      Left = 632
      Top = 16
      Width = 100
      Height = 35
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
      Left = 512
      Top = 16
      Width = 100
      Height = 35
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 475
    Width = 759
    Height = 34
    Panels = <>
  end
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 24
    Top = 8
  end
end
