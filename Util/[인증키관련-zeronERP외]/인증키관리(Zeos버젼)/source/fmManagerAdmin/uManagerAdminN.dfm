inherited fmManagerAdmin: TfmManagerAdmin
  Left = 280
  Top = 141
  Width = 1029
  Height = 619
  Caption = #45812#45817#51088#44288#47532
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  FormStyle = fsMDIChild
  OldCreateOrder = True
  PopupMenu = PopupMenu2
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel3: TPanel [0]
    Left = 521
    Top = 33
    Width = 500
    Height = 493
    Align = alClient
    TabOrder = 0
    object Label5: TLabel
      Left = 24
      Top = 9
      Width = 48
      Height = 12
      Caption = #45812#45817#51088#47749
    end
    object Label6: TLabel
      Left = 24
      Top = 33
      Width = 48
      Height = 12
      Caption = #54924#49324#53076#46300
    end
    object Label7: TLabel
      Left = 24
      Top = 106
      Width = 36
      Height = 12
      Caption = #51649#50948#47749
    end
    object Label12: TLabel
      Left = 24
      Top = 130
      Width = 42
      Height = 12
      Caption = #51060#47700#51068'1'
    end
    object Label13: TLabel
      Left = 24
      Top = 154
      Width = 42
      Height = 12
      Caption = #51060#47700#51068'2'
    end
    object Label15: TLabel
      Left = 24
      Top = 255
      Width = 24
      Height = 12
      Caption = #44592#53440
    end
    object Label1: TLabel
      Left = 24
      Top = 57
      Width = 48
      Height = 12
      Caption = #51648#51216#53076#46300
    end
    object Label8: TLabel
      Left = 24
      Top = 81
      Width = 48
      Height = 12
      Caption = #48512#49436#53076#46300
    end
    object Label9: TLabel
      Left = 24
      Top = 178
      Width = 48
      Height = 12
      Caption = #50864#54200#48264#54840
    end
    object Label10: TLabel
      Left = 24
      Top = 202
      Width = 24
      Height = 12
      Caption = #51452#49548
    end
    object cmb_Company: TComboBox
      Left = 128
      Top = 29
      Width = 200
      Height = 20
      Enabled = False
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 1
      Text = '0.'#51204#52404
      OnChange = cmb_CompanyChange
      OnExit = cmb_CompanyExit
      OnKeyPress = cmb_CompanyKeyPress
      Items.Strings = (
        '0.'#51204#52404
        '1.'#45936#47788#54532#47196#44536#47016
        '2.'#44288#51228#54532#47196#44536#47016
        '3.'#44540#53468#49885#49688#54532#47196#44536#47016
        '4.'#48169#44284#54980#45936#47788
        '5.'#48169#44284#54980#44288#51228)
    end
    object ed_PersonID: TEdit
      Left = 368
      Top = 3
      Width = 121
      Height = 20
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 8
      Visible = False
    end
    object ed_UserName: TEdit
      Left = 128
      Top = 5
      Width = 200
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
    end
    object ed_Email1: TEdit
      Left = 128
      Top = 126
      Width = 200
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 5
    end
    object ed_Email2: TEdit
      Left = 128
      Top = 150
      Width = 200
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 6
    end
    object mem_etc: TMemo
      Left = 128
      Top = 255
      Width = 329
      Height = 58
      ImeName = 'Microsoft IME 2003'
      ScrollBars = ssVertical
      TabOrder = 7
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 312
      Width = 498
      Height = 180
      Align = alBottom
      Caption = #51204#54868#48264#54840#44288#47532
      TabOrder = 9
      object Panel5: TPanel
        Left = 2
        Top = 14
        Width = 494
        Height = 35
        Align = alTop
        TabOrder = 0
        object btn_PhoneAdd: TSpeedButton
          Left = 360
          Top = 9
          Width = 57
          Height = 17
          Caption = #52628#44032
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
            333333333337F33333333333333033333333333333373F333333333333090333
            33333333337F7F33333333333309033333333333337373F33333333330999033
            3333333337F337F33333333330999033333333333733373F3333333309999903
            333333337F33337F33333333099999033333333373333373F333333099999990
            33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333300033333333333337773333333}
          NumGlyphs = 2
          OnClick = btn_PhoneAddClick
        end
        object Label2: TLabel
          Left = 16
          Top = 11
          Width = 24
          Height = 12
          Caption = #44396#48516
        end
        object cmb_PhoneGubun: TComboBox
          Left = 48
          Top = 7
          Width = 113
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 0
          Text = '1.'#55092#45824#54256
          Items.Strings = (
            '1.'#55092#45824#54256
            '2.'#49324#47924#49892#51204#54868
            '3.FAX'
            '4.'#51665#51204#54868
            '5.'#44592#53440)
        end
        object ed_AddPhone: TEdit
          Left = 168
          Top = 7
          Width = 185
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 1
          OnKeyUp = ed_AddPhoneKeyUp
        end
      end
      object sg_Phone: TAdvStringGrid
        Left = 2
        Top = 49
        Width = 494
        Height = 129
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
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
        ParentFont = False
        PopupMenu = PopupMenu1
        ScrollBars = ssBoth
        TabOrder = 1
        OnDblClick = sg_PhoneDblClick
        OnCanEditCell = sg_PhoneCanEditCell
        OnButtonClick = sg_PhoneButtonClick
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          ''
          #44396#48516
          #51204#54868#48264#54840
          #44396#48516#53076#46300)
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
        FixedColWidth = 18
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
          18
          124
          307)
      end
    end
    object cmb_Jijum: TComboBox
      Left = 128
      Top = 53
      Width = 200
      Height = 20
      Enabled = False
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 2
      Text = '0.'#51204#52404
      OnChange = cmb_JijumChange
      OnExit = cmb_JijumExit
      OnKeyPress = cmb_JijumKeyPress
      Items.Strings = (
        '0.'#51204#52404
        '1.'#45936#47788#54532#47196#44536#47016
        '2.'#44288#51228#54532#47196#44536#47016
        '3.'#44540#53468#49885#49688#54532#47196#44536#47016
        '4.'#48169#44284#54980#45936#47788
        '5.'#48169#44284#54980#44288#51228)
    end
    object cmb_Depart: TComboBox
      Left = 128
      Top = 77
      Width = 200
      Height = 20
      Style = csDropDownList
      Enabled = False
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 3
      Text = '0.'#51204#52404
      Items.Strings = (
        '0.'#51204#52404
        '1.'#45936#47788#54532#47196#44536#47016
        '2.'#44288#51228#54532#47196#44536#47016
        '3.'#44540#53468#49885#49688#54532#47196#44536#47016
        '4.'#48169#44284#54980#45936#47788
        '5.'#48169#44284#54980#44288#51228)
    end
    object cmbPosiName: TComboBox
      Left = 128
      Top = 102
      Width = 200
      Height = 20
      Enabled = False
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 4
      Text = '0.'#51204#52404
      Items.Strings = (
        '0.'#51204#52404
        '1.'#45936#47788#54532#47196#44536#47016
        '2.'#44288#51228#54532#47196#44536#47016
        '3.'#44540#53468#49885#49688#54532#47196#44536#47016
        '4.'#48169#44284#54980#45936#47788
        '5.'#48169#44284#54980#44288#51228)
    end
    object ed_zip: TEdit
      Left = 128
      Top = 174
      Width = 105
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 10
    end
    object ed_addr: TMemo
      Left = 128
      Top = 199
      Width = 329
      Height = 50
      ImeName = 'Microsoft IME 2003'
      ScrollBars = ssVertical
      TabOrder = 11
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 526
    Width = 1021
    Height = 59
    Align = alBottom
    TabOrder = 1
    object btn_Insert: TSpeedButton
      Left = 80
      Top = 18
      Width = 98
      Height = 28
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
      Left = 232
      Top = 18
      Width = 98
      Height = 28
      Caption = #49688#51221'(CTRL+U)'
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
      Left = 384
      Top = 18
      Width = 98
      Height = 28
      Caption = #51200#51109'(CTRL+S)'
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
      Left = 536
      Top = 18
      Width = 98
      Height = 28
      Caption = #49325#51228
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      OnClick = btn_DeleteClick
    end
    object btn_Cancel: TSpeedButton
      Left = 688
      Top = 18
      Width = 98
      Height = 28
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
    object btn_Close: TSpeedButton
      Left = 840
      Top = 18
      Width = 98
      Height = 28
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
  end
  object Panel12: TPanel [2]
    Left = 0
    Top = 0
    Width = 1021
    Height = 33
    Align = alTop
    Caption = #45812#45817#51088' '#44288#47532
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
  object Panel1: TPanel [3]
    Left = 0
    Top = 33
    Width = 521
    Height = 493
    Align = alLeft
    TabOrder = 3
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 519
      Height = 168
      Align = alTop
      TabOrder = 0
      object Label3: TLabel
        Left = 24
        Top = 114
        Width = 48
        Height = 12
        Caption = #45812#45817#51088#47749
      end
      object Label4: TLabel
        Left = 24
        Top = 138
        Width = 48
        Height = 12
        Caption = #51204#54868#48264#54840
      end
      object Label24: TLabel
        Left = 24
        Top = 18
        Width = 48
        Height = 12
        Caption = #54924#49324#44396#48516
      end
      object Label25: TLabel
        Left = 24
        Top = 42
        Width = 48
        Height = 12
        Caption = #54924#49324#53076#46300
      end
      object Label26: TLabel
        Left = 24
        Top = 66
        Width = 48
        Height = 12
        Caption = #51648#51216#53076#46300
      end
      object Label27: TLabel
        Left = 24
        Top = 90
        Width = 48
        Height = 12
        Caption = #48512#49436#53076#46300
      end
      object btn_Search: TBitBtn
        Left = 280
        Top = 16
        Width = 87
        Height = 33
        Caption = #51312#54924
        TabOrder = 0
        OnClick = btn_SearchClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000730E0000730E00000001000000000000000000003300
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
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8B4D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E281E8E8E8E8E8E8E8E8E8E8E8E8E8
          B46C6CD8E8E8E8E8E8E8E8E8E8E8E8E8E2818181E8E8E8E8E8E8E8E8E8E8E8E8
          B46CD86CD8E8E8E8E8E8E8E8E8E8E8E8E281818181E8E8E8E8E8E8E8E8E8E8E8
          B46C6CD86CD8E8E8E8E8E8E8E8E8E8E8E28181818181E8E8E8E8E8E8E8E8E8D7
          5E6C6C6CB46CD8E8E8E8E8E8E8E8E8D781818181E28181E8E8E8E8E8E8E8E8D7
          89896CB4B4B46CD8E8E8E8E8E8E8E8D7ACAC81E2E2E28181E8E8E8E8E8E8D789
          89D7D7B4C7C7C76CE8E8E8E8E8E8D7ACACD7D7E2ACACAC81E8E8E8E8E8D78989
          D7D7D7D76C6C6CE8E8E8E8E8E8D7ACACD7D7D7D7818181E8E8E8E8E8D78989D7
          D7D75E5EE8E8E8E8E8E8E8E8D7ACACD7D7D78181E8E8E8E8E8E8E8D78989D7D7
          D75EE8E8E8E8E8E8E8E8E8D7ACACD7D7D781E8E8E8E8E8E8E8E8D78989D7D7D7
          5EB4E8E8E8E8E8E8E8E8D7ACACD7D7D781E2E8E8E8E8E8E8E8E85E89D7D7D75E
          B4E8E8E8E8E8E8E8E8E881ACD7D7D781E2E8E8E8E8E8E8E8E8E8E85ED7D75EE8
          E8E8E8E8E8E8E8E8E8E8E881D7D781E8E8E8E8E8E8E8E8E8E8E8E8E85E5EE8E8
          E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object ed_sUserName: TEdit
        Left = 104
        Top = 110
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2010'
        TabOrder = 1
        OnExit = ed_sUserNameExit
        OnKeyUp = ed_sUserNameKeyUp
      end
      object ed_sManagerPhone: TEdit
        Left = 104
        Top = 134
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 2
        OnKeyUp = ed_sManagerPhoneKeyUp
      end
      object cmb_sCompanyGubun: TComboBox
        Left = 104
        Top = 14
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 3
        Text = '0.'#51204#52404
        OnChange = cmb_sCompanyGubunChange
        Items.Strings = (
          '0.'#51204#52404
          '1.'#45936#47788#54532#47196#44536#47016
          '2.'#44288#51228#54532#47196#44536#47016
          '3.'#44540#53468#49885#49688#54532#47196#44536#47016
          '4.'#48169#44284#54980#45936#47788
          '5.'#48169#44284#54980#44288#51228)
      end
      object cmb_sCompany: TComboBox
        Left = 104
        Top = 38
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 4
        Text = '0.'#51204#52404
        OnChange = cmb_sCompanyChange
        OnKeyPress = cmb_sCompanyKeyPress
        Items.Strings = (
          '0.'#51204#52404
          '1.'#45936#47788#54532#47196#44536#47016
          '2.'#44288#51228#54532#47196#44536#47016
          '3.'#44540#53468#49885#49688#54532#47196#44536#47016
          '4.'#48169#44284#54980#45936#47788
          '5.'#48169#44284#54980#44288#51228)
      end
      object cmb_sJijum: TComboBox
        Left = 104
        Top = 62
        Width = 161
        Height = 20
        Style = csDropDownList
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 5
        Text = '0.'#51204#52404
        OnChange = cmb_sJijumChange
        Items.Strings = (
          '0.'#51204#52404
          '1.'#45936#47788#54532#47196#44536#47016
          '2.'#44288#51228#54532#47196#44536#47016
          '3.'#44540#53468#49885#49688#54532#47196#44536#47016
          '4.'#48169#44284#54980#45936#47788
          '5.'#48169#44284#54980#44288#51228)
      end
      object cmb_sDepart: TComboBox
        Left = 104
        Top = 86
        Width = 161
        Height = 20
        Style = csDropDownList
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 6
        Text = '0.'#51204#52404
        OnChange = cmb_sDepartChange
        Items.Strings = (
          '0.'#51204#52404
          '1.'#45936#47788#54532#47196#44536#47016
          '2.'#44288#51228#54532#47196#44536#47016
          '3.'#44540#53468#49885#49688#54532#47196#44536#47016
          '4.'#48169#44284#54980#45936#47788
          '5.'#48169#44284#54980#44288#51228)
      end
    end
    object sg_Code: TAdvStringGrid
      Left = 1
      Top = 169
      Width = 519
      Height = 323
      Cursor = crDefault
      Align = alClient
      ColCount = 12
      DefaultRowHeight = 21
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowMoving, goRowSelect]
      ScrollBars = ssBoth
      TabOrder = 1
      OnClick = sg_CodeClick
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        #45812#45817#51088#47749
        #54924#49324#47749
        #51648#51216#47749
        #48512#49436#47749
        #51649#50948#47749
        #49324#48264
        #51060#47700#51068'1'
        #51060#47700#51068'2'
        #47700#47784
        #54924#49324#53076#46300
        #51648#51216#53076#46300
        #48512#49436#53076#46300)
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
      FixedColWidth = 117
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
      SortSettings.Show = True
      Version = '6.0.4.4'
      ColWidths = (
        117
        86
        99
        103
        72
        64
        64
        64
        64
        64
        64
        64)
    end
  end
  object TempQuery: TZQuery
    Connection = dmDB.ZConnection1
    Params = <>
    Left = 8
    Top = 120
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 716
    Top = 450
    object mn_TelNumUpdate: TMenuItem
      Caption = #49688#51221
      OnClick = mn_TelNumUpdateClick
    end
    object mn_TelRing: TMenuItem
      Caption = #51204#54868#44152#44592
      OnClick = mn_TelRingClick
    end
    object N2: TMenuItem
      Caption = #47928#51088#48372#45236#44592
      OnClick = N2Click
    end
  end
  object PopupMenu2: TPopupMenu
    AutoHotkeys = maManual
    Left = 396
    Top = 434
    object MenuItem1: TMenuItem
      Caption = #51200#51109
      ShortCut = 16467
      OnClick = MenuItem1Click
    end
    object N1: TMenuItem
      Caption = #49688#51221
      ShortCut = 16469
      OnClick = N1Click
    end
  end
end
