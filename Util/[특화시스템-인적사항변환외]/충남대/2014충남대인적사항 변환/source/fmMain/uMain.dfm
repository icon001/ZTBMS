inherited fmMain: TfmMain
  Left = 311
  Top = 140
  Width = 702
  Height = 649
  Caption = #52649#45224#45824' '#47196#46300
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox2: TGroupBox [0]
    Left = 0
    Top = 0
    Width = 694
    Height = 41
    Align = alTop
    Caption = #50896#48376#45936#51060#53552#48288#51060#49828#54872#44221
    TabOrder = 0
    object btn_FileSearch: TSpeedButton
      Left = 544
      Top = 10
      Width = 97
      Height = 25
      Caption = #52286#44592
      OnClick = btn_FileSearchClick
    end
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 42
      Height = 12
      Caption = 'CSV'#54028#51068
    end
    object ed_DBPath: TEdit
      Left = 72
      Top = 12
      Width = 457
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
    end
  end
  object GroupBox4: TGroupBox [1]
    Left = 0
    Top = 41
    Width = 694
    Height = 123
    Align = alTop
    Caption = #53440#44191#45936#51060#53552#48288#51060#49828#54872#44221
    TabOrder = 1
    object btn_targetAdoConnect: TSpeedButton
      Left = 384
      Top = 10
      Width = 257
      Height = 87
      Caption = ' '#50672#44208
      Glyph.Data = {
        B6100000424DB610000000000000360000002800000020000000210000000100
        2000000000008010000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007C28
        00007C5400007C5400007C540000FFFFFF00FFFFFF00FFFFFF006C6C6C002C2C
        2C002C2C2C00393939002C2C2C00393939002C2C2C0052525200FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B6900005D1E
        00005D1E00007C2800007C2800007C540000FFFFFF00C0C0C0006C6C6C005F5F
        5F005F5F5F005F5F5F005F5F5F005F5F5F006C6C6C004545450052525200FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00787878005D1E00005D1E
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F9F9F00D2D2D200F8F8
        F80048FF4800DEDEDE00DEDEDE00DEDEDE00DEDEDE00929292002C2C2C007878
        7800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007C5400005D1E00009B69
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000858585008585
        85009F9F9F00858585009292920092929200929292009F9F9F001F1F1F006C6C
        6C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8B8B8005D1E00005D1E0000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006C6C6C001F1F
        1F0039393900393939004545450039393900393939003939390092929200FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF009B6900005D1E00005D1E00005D1E00005D1E00005D1E
        00005D1E000078787800FFFFFF00FFFFFF00FFFFFF00FFFFFF009F9F9F00DEDE
        DE00F0000000F0000000060606009F9F9F009F9F9F00454545001F1F1F001F1F
        1F001F1F1F0039393900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF005D1E00005D1E00005D1E00005D1E00005D1E
        00007C540000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0092929200DEDE
        DE00F0000000F0000000F00000008585850092929200525252001F1F1F008585
        8500858585005252520039393900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007C5400005D1E00005D1E00007C54
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0092929200DEDE
        DE00F0000000F0000000F0000000858585009F9F9F00454545005F5F5F00FFFF
        FF00DEDEDE0092929200393939005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007C5400007C540000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0092929200DEDE
        DE00B8B8B80092929200FFB59000DEDEDE0085858500525252001F1F1F006C6C
        6C006C6C6C009F9F9F002C2C2C006C6C6C00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5C5C5009F9F
        9F00DEDEDE00DEDEDE00DEDEDE00D2D2D200DEDEDE00525252001F1F1F005252
        5200454545002C2C2C009F9F9F00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00929292001F1F1F001F1F1F001F1F
        1F001F1F1F001F1F1F002C2C2C001F1F1F002C2C2C00FFFFFF00FFFFFF00C5C5
        C50085858500858585008585850085858500F0000000F0000000060606009292
        92009F9F9F004545450045454500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0085858500D2D2D200D2D2D200D2D2
        D200D2D2D200D2D2D2009090FF00C5C5C5006C6C6C002C2C2C00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0092929200DEDEDE00F0000000F0000000F00000007878
        78009F9F9F005252520039393900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0092929200C5C5C500C0C0C000C0C0
        C000C5C5C500C5C5C5009090FF00A4A0A000929292004545450052525200FFFF
        FF00FFFFFF00FFFFFF0092929200DEDEDE00F0000000F0000000F00000008585
        85009F9F9F005252520039393900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0092929200C5C5C500C0C0C000C0C0
        C000C0C0C000C0C0C000C5C5C500C5C5C50085858500393939006C6C6C00FFFF
        FF00FFFFFF00FFFFFF0092929200DEDEDE00D2D2D200B8B8B800C5C5C500DEDE
        DE00858585005252520039393900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0092929200C5C5C500C0C0C000C5C5
        C500C0C0C000C5C5C500C0C0C000C5C5C50085858500454545006C6C6C00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF009F9F9F00C0C0C000D2D2D200D2D2D200C0C0
        C000DEDEDE005252520039393900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0085858500C5C5C500B8B8B800B8B8
        B800B8B8B800B8B8B800B8B8B800B8B8B80085858500454545006C6C6C00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009292920092929200929292009292
        9200858585009F9F9F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0092929200DEDEDE00DEDEDE00DEDE
        DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00B8B8B800393939006C6C6C00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0085858500A4A0A000A4A0A000A4A0
        A000A4A0A000A4A0A000A4A0A000A4A0A000525252006C6C6C005F5F5F00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007878
        7800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0085858500A4A0A000A4A0A000A4A0
        A000A4A0A000A4A0A000A4A0A000A4A0A000525252000606060078787800FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00929292005D1E
        00005D1E0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0092929200DEDEDE00D2D2D200D2D2
        D200D2D2D200D2D2D200D2D2D200DEDEDE009F9F9F00393939006C6C6C00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00929292005D1E00005D1E
        00005D1E00005D1E0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0092929200D2D2D200D2D2D200D2D2
        D200D2D2D200D2D2D200D2D2D200D2D2D200858585005F5F5F005F5F5F00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00787878005D1E00005D1E00005D1E
        00005D1E00005D1E00005D1E0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00858585009F9F9F00929292009F9F
        9F0092929200929292009292920092929200393939002C2C2C006C6C6C00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0078787800929292009B6900005D1E
        00005D1E000092929200787878009F9F9F00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0092929200D2D2D200C5C5C500C5C5
        C500C5C5C500C5C5C500C5C5C500C5C5C500858585002C2C2C006C6C6C00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00929292005D1E
        00005D1E0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0092929200DEDEDE00C5C5C500C5C5
        C500C5C5C500C5C5C500D2D2D200C5C5C50092929200393939006C6C6C00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007C5400005D1E00005D1E
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F9F9F00DEDEDE00F8F8F800F8F8
        F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F8004545450052525200FFFF
        FF00FFFFFF007C5400007C280000FFFFFF00FFFFFF007C5400005D1E00005D1E
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5C5C50092929200858585008585
        8500858585008585850085858500858585009F9F9F009F9F9F009F9F9F00FFFF
        FF00FFFFFF00FFFFFF007C5400009B6900007C5400005D1E00007C540000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5C5C500A4A0A000B8B8
        B800B8B8B800B8B8B800A4A0A000B8B8B800A4A0A000C5C5C500FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF007C5400007C5400007C280000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      OnClick = btn_targetAdoConnectClick
    end
    object Label5: TLabel
      Left = 112
      Top = 16
      Width = 30
      Height = 12
      Caption = 'DB IP'
    end
    object Label6: TLabel
      Left = 112
      Top = 37
      Width = 42
      Height = 12
      Caption = 'DB PORT'
    end
    object Label7: TLabel
      Left = 112
      Top = 58
      Width = 24
      Height = 12
      Caption = 'USER'
    end
    object Label8: TLabel
      Left = 112
      Top = 80
      Width = 48
      Height = 12
      Caption = 'PASSWORD'
    end
    object Label9: TLabel
      Left = 112
      Top = 104
      Width = 36
      Height = 12
      Caption = 'DBNAME'
    end
    object ed_Host: TEdit
      Left = 184
      Top = 12
      Width = 145
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object rg_dbtype: TRadioGroup
      Left = 2
      Top = 14
      Width = 103
      Height = 107
      Align = alLeft
      ItemIndex = 0
      Items.Strings = (
        'MSSQL'
        'POSTGRESQL')
      TabOrder = 1
    end
    object ed_Port: TEdit
      Left = 184
      Top = 33
      Width = 145
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 2
      Text = '1433'
    end
    object ed_Userid: TEdit
      Left = 184
      Top = 54
      Width = 145
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 3
      Text = 'sa'
    end
    object ed_Passwd: TEdit
      Left = 184
      Top = 76
      Width = 145
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 4
      Text = 'sapasswd'
    end
    object ed_DBName: TEdit
      Left = 184
      Top = 100
      Width = 145
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 5
      Text = 'zmos'
    end
  end
  object StatusBar1: TStatusBar [2]
    Left = 0
    Top = 596
    Width = 694
    Height = 19
    Panels = <
      item
        Width = 250
      end>
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 164
    Width = 694
    Height = 328
    Align = alClient
    TabOrder = 3
    object sg_Employ: TAdvStringGrid
      Left = 1
      Top = 1
      Width = 692
      Height = 326
      Cursor = crDefault
      Align = alClient
      DefaultColWidth = 90
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
      TabOrder = 0
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        #54617#48264
        #51060#47492
        #51204#54868#48264#54840)
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
      FixedColWidth = 129
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
      SortSettings.AutoFormat = False
      Version = '6.0.4.4'
      ColWidths = (
        129
        74
        185
        149
        101)
      object Gauge1: TGauge
        Left = 160
        Top = 160
        Width = 385
        Height = 25
        ForeColor = clBlue
        Progress = 0
        Visible = False
      end
    end
  end
  object Panel3: TPanel [4]
    Left = 0
    Top = 492
    Width = 694
    Height = 104
    Align = alBottom
    TabOrder = 4
    object lb_CompanyName1: TLabel
      Left = 16
      Top = 20
      Width = 48
      Height = 12
      Caption = #54924#49324#53076#46300
    end
    object lb_JijumName1: TLabel
      Left = 304
      Top = 20
      Width = 48
      Height = 12
      Caption = #51648#51216#53076#46300
    end
    object lb_PosiName1: TLabel
      Left = 304
      Top = 44
      Width = 48
      Height = 12
      Caption = #51649#50948#53076#46300
    end
    object lb_DepartName1: TLabel
      Left = 16
      Top = 44
      Width = 48
      Height = 12
      Caption = #48512#49436#53076#46300
    end
    object lb_emType: TLabel
      Left = 16
      Top = 67
      Width = 48
      Height = 12
      Caption = #51649#50896#53076#46300
    end
    object cmb_sCompany: TComboBox
      Left = 104
      Top = 16
      Width = 169
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 0
      OnChange = cmb_sCompanyChange
    end
    object cmb_sJijum: TComboBox
      Left = 376
      Top = 16
      Width = 169
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 1
      OnChange = cmb_sJijumChange
    end
    object cmb_sPosi: TComboBox
      Left = 376
      Top = 40
      Width = 169
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 2
    end
    object cmb_sDepart: TComboBox
      Left = 104
      Top = 40
      Width = 169
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 3
    end
    object btn_WorkBranch: TBitBtn
      Left = 568
      Top = 16
      Width = 97
      Height = 30
      Caption = #45936#51060#53552#48320#54872
      Enabled = False
      TabOrder = 4
      OnClick = btn_WorkBranchClick
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
    object cmb_emType: TComboBox
      Left = 104
      Top = 63
      Width = 169
      Height = 20
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 5
    end
    object btnClose: TBitBtn
      Left = 568
      Top = 53
      Width = 97
      Height = 30
      Caption = #45803#44592
      TabOrder = 6
      OnClick = btnCloseClick
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
  object OpenDialog1: TOpenDialog
    DefaultExt = 'csv'
    Filter = 'CSV Files (*.csv)|*.csv'
    Left = 496
    Top = 7
  end
  object MDBADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=lomo;Ini' +
      'tial Catalog=LOMO;Data Source=127.0.0.1'
    Provider = 'SQLOLEDB.1'
    Left = 104
    Top = 16
  end
  object TargetADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=lomo;Ini' +
      'tial Catalog=LOMO;Data Source=127.0.0.1'
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 696
  end
  object MdbADO: TADOQuery
    Connection = MDBADOConnection
    Parameters = <>
    Left = 176
    Top = 16
  end
  object targetTempADOQuery: TADOQuery
    Connection = TargetADOConnection
    Parameters = <>
    Left = 288
    Top = 688
  end
  object targetADOExecQuery: TADOQuery
    Connection = TargetADOConnection
    Parameters = <>
    Left = 320
    Top = 688
  end
  object MdbADOTemp: TADOQuery
    Connection = MDBADOConnection
    Parameters = <>
    Left = 144
    Top = 8
  end
end
