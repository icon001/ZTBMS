inherited fmEmployExtraAdmin: TfmEmployExtraAdmin
  Left = 354
  Top = 29
  Width = 579
  Height = 666
  Caption = #49324#50896#48324#49688#45817#44288#47532
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel12: TPanel [0]
    Left = 0
    Top = 0
    Width = 571
    Height = 33
    Align = alTop
    Caption = #49324#50896#48324#49688#45817#44288#47532
    Color = 15387318
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentBackground = True
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 547
    Width = 571
    Height = 56
    Align = alBottom
    TabOrder = 1
    object btn_Insert: TSpeedButton
      Left = -64
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
      Visible = False
    end
    object btn_Update: TSpeedButton
      Left = 91
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
      Left = 191
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
      Left = 290
      Top = 16
      Width = 81
      Height = 25
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
      Left = 390
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
  object StatusBar1: TStatusBar [2]
    Left = 0
    Top = 603
    Width = 571
    Height = 29
    Panels = <>
  end
  object Panel3: TPanel [3]
    Left = 0
    Top = 33
    Width = 571
    Height = 348
    Align = alClient
    TabOrder = 3
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 569
      Height = 120
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 20
        Width = 48
        Height = 12
        Caption = #54924#49324#53076#46300
      end
      object Label2: TLabel
        Left = 16
        Top = 68
        Width = 48
        Height = 12
        Caption = #48512#49436#53076#46300
      end
      object Label3: TLabel
        Left = 16
        Top = 92
        Width = 48
        Height = 12
        Caption = #51649#50948#53076#46300
      end
      object Label4: TLabel
        Left = 272
        Top = 20
        Width = 48
        Height = 12
        Caption = #49324'    '#48264
      end
      object Label5: TLabel
        Left = 272
        Top = 44
        Width = 48
        Height = 12
        Caption = #51060'    '#47492
      end
      object Label21: TLabel
        Left = 16
        Top = 44
        Width = 48
        Height = 12
        Caption = #51648#51216#53076#46300
      end
      object btn_Close: TSpeedButton
        Left = 454
        Top = 64
        Width = 91
        Height = 33
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
      object cmb_Company: TComboBox
        Left = 80
        Top = 16
        Width = 169
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 0
        OnChange = cmb_CompanyChange
      end
      object cmb_Depart: TComboBox
        Left = 80
        Top = 64
        Width = 169
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 1
        OnChange = cmb_DepartChange
      end
      object cmb_Posi: TComboBox
        Left = 80
        Top = 88
        Width = 169
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 2
        OnChange = cmb_PosiChange
      end
      object ed_EmpNo: TEdit
        Left = 336
        Top = 16
        Width = 105
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 3
      end
      object ed_EmpNM: TEdit
        Left = 336
        Top = 40
        Width = 105
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 4
      end
      object btn_Search: TBitBtn
        Left = 456
        Top = 16
        Width = 91
        Height = 33
        Caption = #51312#54924
        TabOrder = 5
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
      object cmb_Jijum: TComboBox
        Left = 80
        Top = 40
        Width = 169
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 6
        OnChange = cmb_JijumChange
      end
      object chk_Extra: TCheckBox
        Left = 272
        Top = 72
        Width = 169
        Height = 17
        Caption = #49688#45817#44288#47532' '#50504' '#46104#50612#51652' '#49324#50896
        TabOrder = 7
      end
    end
    object sg_Employ: TAdvStringGrid
      Left = 1
      Top = 121
      Width = 569
      Height = 226
      Cursor = crDefault
      Align = alClient
      ColCount = 16
      DefaultColWidth = 90
      DefaultRowHeight = 21
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
      OnClick = sg_EmployClick
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      SortSettings.AutoColumnMerge = True
      SortSettings.Show = True
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
      FixedColWidth = 80
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      ColumnHeaders.Strings = (
        #54924#49324#47749
        #51648#51216#47749
        #48512#49436#47749
        #51649#50948#47749
        #49324#48264
        #51060#47492
        #54924#49324#53076#46300
        #49688#45817#53440#51077
        #54217#51068#51312#44592
        #54217#51068#50672#51109
        #54217#51068#49900#50556
        #53664#50836#51312#44592
        #53664#50836#50672#51109
        #53664#50836#49900#50556
        #44277#55092#51312#44592
        #44277#55092#50672#51109
        #44277#55092#49900#50556)
      Filter = <>
      Version = '3.3.0.1'
      ColWidths = (
        80
        86
        78
        77
        77
        140
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
  object Panel1: TPanel [4]
    Left = 0
    Top = 381
    Width = 571
    Height = 166
    Align = alBottom
    TabOrder = 4
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 208
      Height = 164
      Align = alLeft
      Caption = #49440#53469#49324#50896#51221#48372
      TabOrder = 0
      object Label6: TLabel
        Left = 8
        Top = 24
        Width = 24
        Height = 12
        Caption = #54924#49324
      end
      object Label7: TLabel
        Left = 8
        Top = 46
        Width = 24
        Height = 12
        Caption = #51648#51216
      end
      object Label8: TLabel
        Left = 8
        Top = 68
        Width = 24
        Height = 12
        Caption = #48512#49436
      end
      object Label9: TLabel
        Left = 8
        Top = 91
        Width = 24
        Height = 12
        Caption = #51649#50948
      end
      object Label10: TLabel
        Left = 8
        Top = 113
        Width = 24
        Height = 12
        Caption = #49324#48264
      end
      object Label11: TLabel
        Left = 8
        Top = 136
        Width = 24
        Height = 12
        Caption = #51060#47492
      end
      object st_Companyname: TStaticText
        Left = 48
        Top = 22
        Width = 145
        Height = 16
        AutoSize = False
        BevelKind = bkSoft
        TabOrder = 0
      end
      object st_jijumName: TStaticText
        Left = 48
        Top = 44
        Width = 145
        Height = 16
        AutoSize = False
        BevelKind = bkSoft
        TabOrder = 1
      end
      object st_DepartName: TStaticText
        Left = 48
        Top = 66
        Width = 145
        Height = 16
        AutoSize = False
        BevelKind = bkSoft
        TabOrder = 2
      end
      object st_PositionName: TStaticText
        Left = 48
        Top = 89
        Width = 145
        Height = 16
        AutoSize = False
        BevelKind = bkSoft
        TabOrder = 3
      end
      object st_EmNo: TStaticText
        Left = 48
        Top = 111
        Width = 145
        Height = 16
        AutoSize = False
        BevelKind = bkSoft
        TabOrder = 4
      end
      object st_EmNm: TStaticText
        Left = 48
        Top = 134
        Width = 145
        Height = 16
        AutoSize = False
        BevelKind = bkSoft
        TabOrder = 5
      end
      object ed_CompanyCode: TEdit
        Left = 120
        Top = 8
        Width = 81
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 6
        Visible = False
      end
    end
    object GroupBox3: TGroupBox
      Left = 209
      Top = 1
      Width = 361
      Height = 164
      Align = alClient
      Caption = #49688#45817#44288#47532
      TabOrder = 1
      object rg_ExtraType: TRadioGroup
        Left = 2
        Top = 14
        Width = 357
        Height = 43
        Align = alTop
        Caption = #53440#51077#49440#53469
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #49884#44036#51228
          #51221#50529#51228)
        TabOrder = 0
      end
      object PageControl1: TPageControl
        Left = 2
        Top = 57
        Width = 357
        Height = 105
        ActivePage = WeekDayTab
        Align = alClient
        TabOrder = 1
        object WeekDayTab: TTabSheet
          Caption = #54217#51068
          object Label12: TLabel
            Left = 8
            Top = 8
            Width = 48
            Height = 12
            Caption = #51312#44592#52636#44540
          end
          object Label13: TLabel
            Left = 8
            Top = 32
            Width = 48
            Height = 12
            Caption = #50672#51109#44540#47924
          end
          object Label14: TLabel
            Left = 8
            Top = 56
            Width = 48
            Height = 12
            Caption = #49900#50556#44540#47924
          end
          object Label15: TLabel
            Left = 176
            Top = 8
            Width = 12
            Height = 12
            Caption = #50896
          end
          object Label16: TLabel
            Left = 176
            Top = 32
            Width = 12
            Height = 12
            Caption = #50896
          end
          object Label17: TLabel
            Left = 176
            Top = 56
            Width = 12
            Height = 12
            Caption = #50896
          end
          object ed_WEarlyAmt: TEdit
            Left = 80
            Top = 6
            Width = 81
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 0
            Text = '0'
          end
          object ed_WExtendAmt: TEdit
            Left = 80
            Top = 30
            Width = 81
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 1
            Text = '0'
          end
          object ed_WNightAmt: TEdit
            Left = 80
            Top = 54
            Width = 81
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 2
            Text = '0'
          end
        end
        object SaturdayTab: TTabSheet
          Caption = #53664#50836#51068
          ImageIndex = 1
          object Label18: TLabel
            Left = 8
            Top = 8
            Width = 48
            Height = 12
            Caption = #51312#44592#52636#44540
          end
          object Label19: TLabel
            Left = 176
            Top = 8
            Width = 12
            Height = 12
            Caption = #50896
          end
          object Label20: TLabel
            Left = 176
            Top = 32
            Width = 12
            Height = 12
            Caption = #50896
          end
          object Label22: TLabel
            Left = 8
            Top = 32
            Width = 48
            Height = 12
            Caption = #50672#51109#44540#47924
          end
          object Label23: TLabel
            Left = 8
            Top = 56
            Width = 48
            Height = 12
            Caption = #49900#50556#44540#47924
          end
          object Label24: TLabel
            Left = 176
            Top = 56
            Width = 12
            Height = 12
            Caption = #50896
          end
          object ed_SEarlyAmt: TEdit
            Left = 80
            Top = 6
            Width = 81
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 0
            Text = '0'
          end
          object ed_SExtendAmt: TEdit
            Left = 80
            Top = 30
            Width = 81
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 1
            Text = '0'
          end
          object ed_SNightAmt: TEdit
            Left = 80
            Top = 54
            Width = 81
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 2
            Text = '0'
          end
        end
        object HolidayTab: TTabSheet
          Caption = #44277#55092#51068
          ImageIndex = 2
          object Label25: TLabel
            Left = 8
            Top = 8
            Width = 48
            Height = 12
            Caption = #55092#51068#44540#47924
          end
          object Label26: TLabel
            Left = 176
            Top = 8
            Width = 12
            Height = 12
            Caption = #50896
          end
          object Label27: TLabel
            Left = 176
            Top = 32
            Width = 12
            Height = 12
            Caption = #50896
          end
          object Label28: TLabel
            Left = 8
            Top = 32
            Width = 48
            Height = 12
            Caption = #50672#51109#44540#47924
          end
          object Label29: TLabel
            Left = 8
            Top = 56
            Width = 48
            Height = 12
            Caption = #49900#50556#44540#47924
          end
          object Label30: TLabel
            Left = 176
            Top = 56
            Width = 12
            Height = 12
            Caption = #50896
          end
          object ed_HEarlyAmt: TEdit
            Left = 80
            Top = 6
            Width = 81
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 0
            Text = '0'
          end
          object ed_HExtendAmt: TEdit
            Left = 80
            Top = 30
            Width = 81
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 1
            Text = '0'
          end
          object ed_HNightAmt: TEdit
            Left = 80
            Top = 54
            Width = 81
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 2
            Text = '0'
          end
        end
      end
    end
  end
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 64
    Top = 208
  end
end
