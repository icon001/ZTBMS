inherited fmCardAccessTime: TfmCardAccessTime
  Left = 241
  Top = 128
  Width = 1023
  Height = 648
  Caption = #52636#51077#49884#44036#44288#47532
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  FormStyle = fsMDIChild
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel12: TPanel [0]
    Left = 0
    Top = 0
    Width = 1015
    Height = 33
    Align = alTop
    Caption = #52636#51077#49884#44036#44288#47532
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentBackground = True
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 33
    Width = 1015
    Height = 128
    Align = alTop
    Color = clWhite
    TabOrder = 1
    DesignSize = (
      1015
      128)
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
    object Label4: TLabel
      Left = 264
      Top = 20
      Width = 48
      Height = 12
      Caption = #44592#53440#51312#44148
    end
    object lb_search: TLabel
      Left = 264
      Top = 44
      Width = 24
      Height = 12
      Caption = #51060#47492
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
    object cmb_Jijum: TComboBox
      Left = 80
      Top = 40
      Width = 169
      Height = 20
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
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 2
      OnChange = cmb_DepartChange
    end
    object cmb_Posi: TComboBox
      Left = 80
      Top = 88
      Width = 169
      Height = 20
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 3
      OnChange = cmb_PosiChange
    end
    object cmb_SearchType: TComboBox
      Left = 352
      Top = 16
      Width = 169
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 4
      Text = #51060#47492
      OnChange = cmb_SearchTypeChange
      Items.Strings = (
        #51060#47492
        #49324#48264
        '')
    end
    object ed_searchText: TEdit
      Left = 352
      Top = 40
      Width = 169
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 5
      OnChange = ed_searchTextChange
    end
    object btn_Search: TBitBtn
      Left = 664
      Top = 38
      Width = 150
      Height = 41
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      Caption = #51312#54924
      ParentBiDiMode = False
      TabOrder = 6
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
    object btn_Close: TBitBtn
      Left = 840
      Top = 38
      Width = 150
      Height = 41
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      Caption = #45803#44592
      ParentBiDiMode = False
      TabOrder = 7
      OnClick = btn_CloseClick
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
    end
  end
  object sg_Employ: TAdvStringGrid [2]
    Left = 0
    Top = 161
    Width = 1015
    Height = 382
    Cursor = crDefault
    Align = alClient
    ColCount = 21
    DefaultColWidth = 110
    DefaultRowHeight = 21
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing, goRowSelect]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
    OnCheckBoxClick = sg_EmployCheckBoxClick
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ColumnHeaders.Strings = (
      #54924#49324#47749
      #51648#51216#47749
      #48512#49436#47749
      #51649#50948#47749
      #49324#48264
      #51060#47492
      #53440#51076#53076#46300#49324#50857#50976#47924
      #53440#51076#53076#46300#44536#47353#48264#54840
      '1'#53440#51076
      '2'#53440#51076
      '3'#53440#51076
      '4'#53440#51076
      #51068
      #50900
      #54868
      #49688
      #47785
      #44552
      #53664
      #54924#49324#53076#46300)
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
    FixedColWidth = 110
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
    ScrollWidth = 16
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
    SortSettings.AutoFormat = False
    Version = '6.0.4.4'
    ColWidths = (
      110
      110
      110
      110
      110
      110
      110
      110
      41
      41
      41
      41
      21
      21
      21
      21
      21
      21
      21
      110
      110)
    object pan_gauge: TPanel
      Left = 338
      Top = 160
      Width = 329
      Height = 73
      Color = clWhite
      TabOrder = 3
      Visible = False
      object Label2: TLabel
        Left = 24
        Top = 16
        Width = 289
        Height = 14
        AutoSize = False
        Caption = #45936#51060#53552' '#51204#49569#51473#51077#45768#45796'.'
      end
      object Gauge1: TGauge
        Left = 24
        Top = 40
        Width = 289
        Height = 17
        ForeColor = clBlue
        Progress = 0
      end
    end
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 543
    Width = 1015
    Height = 78
    Align = alBottom
    Color = clWhite
    TabOrder = 3
    object gb_TimeCode: TGroupBox
      Left = 1
      Top = 1
      Width = 767
      Height = 76
      Align = alClient
      Caption = #52636#51077#49884#44036#49444#51221
      TabOrder = 0
      object pan_TimeCode: TPanel
        Left = 97
        Top = 14
        Width = 668
        Height = 60
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        TabOrder = 0
        Visible = False
        object Panel7: TPanel
          Left = 1
          Top = 31
          Width = 666
          Height = 28
          Align = alClient
          Color = clWhite
          TabOrder = 0
          object chk_TimeSun: TCheckBox
            Left = 8
            Top = 6
            Width = 33
            Height = 17
            Caption = #51068
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object chk_TimeMon: TCheckBox
            Left = 52
            Top = 6
            Width = 33
            Height = 17
            Caption = #50900
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object chk_TimeTue: TCheckBox
            Left = 96
            Top = 6
            Width = 33
            Height = 17
            Caption = #54868
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object chk_TimeWed: TCheckBox
            Left = 140
            Top = 6
            Width = 33
            Height = 17
            Caption = #49688
            Checked = True
            State = cbChecked
            TabOrder = 3
          end
          object chk_TimeThu: TCheckBox
            Left = 184
            Top = 6
            Width = 33
            Height = 17
            Caption = #47785
            Checked = True
            State = cbChecked
            TabOrder = 4
          end
          object chk_TimeFri: TCheckBox
            Left = 228
            Top = 6
            Width = 33
            Height = 17
            Caption = #44552
            Checked = True
            State = cbChecked
            TabOrder = 5
          end
          object chk_TimeSat: TCheckBox
            Left = 272
            Top = 6
            Width = 33
            Height = 17
            Caption = #53664
            Checked = True
            State = cbChecked
            TabOrder = 6
          end
        end
        object Panel8: TPanel
          Left = 1
          Top = 1
          Width = 666
          Height = 30
          Align = alTop
          Color = clWhite
          TabOrder = 1
          object chk_Time1: TCheckBox
            Left = 8
            Top = 6
            Width = 89
            Height = 17
            Caption = '00:00-00:00'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object chk_Time2: TCheckBox
            Left = 96
            Top = 6
            Width = 89
            Height = 17
            Caption = '00:00-00:00'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object chk_Time3: TCheckBox
            Left = 184
            Top = 6
            Width = 89
            Height = 17
            Caption = '00:00-00:00'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object chk_Time4: TCheckBox
            Left = 272
            Top = 6
            Width = 89
            Height = 17
            Caption = '00:00-00:00'
            Checked = True
            State = cbChecked
            TabOrder = 3
          end
        end
      end
      object Panel6: TPanel
        Left = 2
        Top = 14
        Width = 95
        Height = 60
        Align = alLeft
        BevelOuter = bvLowered
        Color = clWhite
        TabOrder = 1
        object rg_TimeCodeNotUse: TRadioButton
          Left = 8
          Top = 8
          Width = 75
          Height = 17
          Caption = #48120#49324#50857
          TabOrder = 0
          OnClick = rg_TimeCodeNotUseClick
        end
        object rg_TimeGroup1: TRadioButton
          Left = 8
          Top = 24
          Width = 75
          Height = 17
          Caption = '1'#44536#47353#53440#51076
          TabOrder = 1
          OnClick = rg_TimeGroup1Click
        end
        object rg_TimeGroup2: TRadioButton
          Left = 8
          Top = 40
          Width = 75
          Height = 17
          Caption = '2'#44536#47353#53440#51076
          TabOrder = 2
          OnClick = rg_TimeGroup2Click
        end
      end
    end
    object Panel3: TPanel
      Left = 768
      Top = 1
      Width = 246
      Height = 76
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 1
      DesignSize = (
        246
        76)
      object btn_ChangeValidDate: TSpeedButton
        Left = 56
        Top = 21
        Width = 150
        Height = 41
        Anchors = [akRight, akBottom]
        BiDiMode = bdRightToLeft
        Caption = #52636#51077#49884#44036#48320#44221
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
        ParentBiDiMode = False
        OnClick = btn_ChangeValidDateClick
      end
    end
  end
  inherited CommandArray: TCommandArray
    Commands = <
      item
        CommandName = 'Close'
        CommandKind = 0
        Name = 'TClose'
        OnExecute = CommandArrayCommandsTCloseExecute
      end>
  end
end
