inherited fmDupCardEmploy: TfmDupCardEmploy
  Left = 369
  Top = 121
  Width = 998
  Height = 734
  Caption = #49324#50896#44288#47532
  Font.Height = -12
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel [0]
    Left = 0
    Top = 33
    Width = 990
    Height = 611
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 393
      Top = 0
      Width = 1
      Height = 611
      Align = alRight
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 393
      Height = 611
      Align = alClient
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 1
        Top = 1
        Width = 391
        Height = 168
        Align = alTop
        TabOrder = 0
        object lb_CompanyName: TLabel
          Left = 16
          Top = 20
          Width = 48
          Height = 12
          Caption = #54924#49324#53076#46300
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
        object SpeedButton1: TSpeedButton
          Left = 288
          Top = 8
          Width = 81
          Height = 25
          Caption = #54028#51068#50629#47196#46300
          Visible = False
        end
        object lb_JijumName: TLabel
          Left = 16
          Top = 44
          Width = 48
          Height = 12
          Caption = #51648#51216#53076#46300
        end
        object Label4: TLabel
          Left = 16
          Top = 116
          Width = 48
          Height = 12
          Caption = #44592#53440#51312#44148
        end
        object lb_search: TLabel
          Left = 16
          Top = 140
          Width = 24
          Height = 12
          Caption = #49324#48264
        end
        object Label1: TLabel
          Left = 288
          Top = 56
          Width = 73
          Height = 12
          AutoSize = False
          Caption = #51312#54924#44148#49688
        end
        object lb_Count: TLabel
          Left = 288
          Top = 72
          Width = 73
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0 '#44148#13#10' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_Excel: TSpeedButton
          Left = 288
          Top = 104
          Width = 81
          Height = 25
          Caption = #50641#49472
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
            FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
            FF00FFFFFF0080808000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF0000000000FFFFFF00FFFF
            FF00FFFFFF0080808000FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0
            C000C0C0C000FFFFFF00C0C0C000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
            FF00FFFFFF0080808000FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0
            C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
            FF00FFFFFF0080808000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000FFFFFF00C0C0C000FFFFFF00FFFFFF0000000000008000000080
            0000008000000080000000800000008000000080000000800000FFFFFF00FFFF
            FF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000800000FFFF
            FF00FFFFFF00FFFFFF0080808000808080008080800000800000FFFFFF00FFFF
            FF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008000008080
            80008080800080808000FFFFFF0080808000FFFFFF0000800000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF000000000000800000FFFF
            FF0080808000FFFFFF008080800080808000FFFFFF0000800000FFFFFF00FFFF
            FF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000800000FFFF
            FF00FFFFFF00808080008080800080808000FFFFFF0000800000FFFFFF00FFFF
            FF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008000008080
            800080808000808080008080800080808000FFFFFF0000800000C0C0C000C0C0
            C000C0C0C000C0C0C0000000000000000000000000000000000000800000FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00008000000080
            0000008000000080000000800000008000000080000000800000FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00}
          OnClick = btn_ExcelClick
        end
        object btn_Search: TBitBtn
          Left = 288
          Top = 24
          Width = 81
          Height = 25
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
        object cmb_Company: TComboBox
          Left = 80
          Top = 16
          Width = 169
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 1
          OnChange = cmb_CompanyChange
        end
        object cmb_Jijum: TComboBox
          Left = 80
          Top = 40
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 2
          OnChange = cmb_JijumChange
        end
        object cmb_Depart: TComboBox
          Left = 80
          Top = 64
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 3
          OnChange = cmb_DepartChange
        end
        object cmb_Posi: TComboBox
          Left = 80
          Top = 88
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 4
          OnChange = cmb_PosiChange
        end
        object cmb_SearchType: TComboBox
          Left = 80
          Top = 112
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 5
          Text = #49324#48264
          OnChange = cmb_SearchTypeChange
          Items.Strings = (
            #49324#48264
            #51060#47492
            #49324#45236#51204#54868#48264#54840
            #51665#51204#54868#48264#54840
            #55092#45824#54256#48264#54840)
        end
        object ed_searchText: TEdit
          Left = 80
          Top = 136
          Width = 169
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 6
          OnEnter = ed_searchTextEnter
          OnKeyPress = ed_searchTextKeyPress
        end
        object chk_CardRegSearch: TCheckBox
          Left = 256
          Top = 138
          Width = 113
          Height = 17
          Caption = #52852#46300#46321#47197#44592' '#51312#54924
          TabOrder = 7
          OnClick = chk_CardRegClick
          OnKeyPress = chk_CardRegKeyPress
        end
        object cmb_regGubun1: TComboBox
          Left = 80
          Top = 136
          Width = 169
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 8
          Text = '0.'#51204#52404
          Visible = False
          Items.Strings = (
            '0.'#51204#52404
            '1.'#46321#47197
            '2.'#48516#49892
            '3.'#51221#51648)
        end
      end
      object sg_Employ: TAdvStringGrid
        Left = 1
        Top = 169
        Width = 391
        Height = 441
        Cursor = crDefault
        Align = alClient
        ColCount = 31
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
        ColumnHeaders.Strings = (
          #54924#49324#47749
          #49324#48264
          #51060#47492
          #51648#51216#47749
          #48512#49436#47749
          #51649#50948#47749
          #54924#49324#53076#46300
          #51648#51216#53076#46300
          #48512#49436#53076#46300
          #51649#50948#53076#46300
          #49324#45236#51204#54868#48264#54840
          #51077#49324#51068
          #53748#49324#51068
          #50864#54200#48264#54840
          #51452#49548'1'
          #51452#49548'2'
          #51665#51204#54868#48264#54840
          #55092#45824#54256#48264#54840
          #49324#51652#46321#47197#50976#47924
          #51649#50896#44396#48516#53076#46300
          #51648#47928#48264#54840
          #53440#51076#53076#46300#49324#50857#50976#47924
          #53440#51076#44536#47353
          #53440#51076'1'
          #53440#51076'2'
          #53440#51076'3'
          #53440#51076'4'
          #51452#44036)
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
        FixedColWidth = 82
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
          82
          83
          90
          69
          84
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
        object pan_gauge: TPanel
          Left = 34
          Top = 96
          Width = 329
          Height = 73
          TabOrder = 3
          Visible = False
          object Label2: TLabel
            Left = 24
            Top = 16
            Width = 116
            Height = 14
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
    end
    object pn_Employ: TPanel
      Left = 394
      Top = 0
      Width = 596
      Height = 611
      Align = alRight
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 1
        Top = 1
        Width = 594
        Height = 1
        Cursor = crVSplit
        Align = alTop
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 480
        Width = 594
        Height = 130
        Align = alBottom
        Caption = #52852#46300#44288#47532
        TabOrder = 0
        object Panel4: TPanel
          Left = 2
          Top = 14
          Width = 590
          Height = 35
          Align = alTop
          TabOrder = 0
          object btn_visitAdd: TSpeedButton
            Left = 352
            Top = 8
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
            OnClick = btn_visitAddClick
          end
          object chk_CardReg: TCheckBox
            Left = 8
            Top = 7
            Width = 113
            Height = 17
            Caption = #52852#46300#46321#47197#44592' '#49324#50857
            TabOrder = 0
            OnClick = chk_CardRegClick
            OnKeyPress = chk_CardRegKeyPress
          end
          object ed_CardNo: TEdit
            Left = 128
            Top = 5
            Width = 209
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 1
          end
          object cmb_CardGubun: TComboBox
            Left = 432
            Top = 5
            Width = 89
            Height = 20
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ItemIndex = 0
            TabOrder = 2
            Text = '1.'#51068#48152#52852#46300
            Items.Strings = (
              '1.'#51068#48152#52852#46300
              '2.'#47784#48148#51068#52852#46300)
          end
        end
        object sg_Card: TAdvStringGrid
          Left = 2
          Top = 49
          Width = 590
          Height = 79
          Cursor = crDefault
          Align = alClient
          ColCount = 4
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
          ScrollBars = ssBoth
          TabOrder = 1
          OnSelectCell = sg_CardSelectCell
          OnCanEditCell = sg_CardCanEditCell
          OnButtonClick = sg_CardButtonClick
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ColumnHeaders.Strings = (
            ''
            #52852#46300#44396#48516
            #52852#46300#48264#54840
            #52852#46300#49345#53468)
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
            217
            144)
          object cbCardType: TRzComboBox
            Left = 360
            Top = 21
            Width = 145
            Height = 22
            Style = csDropDownList
            Ctl3D = False
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 14
            ParentCtl3D = False
            TabOrder = 3
            Visible = False
            OnChange = cbCardTypeChange
            OnExit = cbCardTypeExit
            Items.Strings = (
              '1111'
              '2222')
          end
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 2
        Width = 594
        Height = 478
        Align = alClient
        TabOrder = 1
        object lb_sabun: TLabel
          Left = 16
          Top = 20
          Width = 48
          Height = 12
          Caption = #49324'    '#48264
        end
        object lb_Name: TLabel
          Left = 16
          Top = 46
          Width = 48
          Height = 12
          Caption = #51060'    '#47492
        end
        object lb_CompanyName1: TLabel
          Left = 16
          Top = 72
          Width = 48
          Height = 12
          Caption = #54924#49324#53076#46300
        end
        object lb_JijumName1: TLabel
          Left = 16
          Top = 98
          Width = 48
          Height = 12
          Caption = #51648#51216#53076#46300
        end
        object lb_DepartName1: TLabel
          Left = 16
          Top = 124
          Width = 48
          Height = 12
          Caption = #48512#49436#53076#46300
        end
        object lb_PosiName1: TLabel
          Left = 16
          Top = 151
          Width = 48
          Height = 12
          Caption = #51649#50948#53076#46300
        end
        object lb_emType: TLabel
          Left = 16
          Top = 177
          Width = 48
          Height = 12
          Caption = #51649#50896#44396#48516
        end
        object lb_CompanyPhone: TLabel
          Left = 16
          Top = 229
          Width = 72
          Height = 12
          Caption = #49324#45236#51204#54868#48264#54840
        end
        object lb_inDate: TLabel
          Left = 16
          Top = 256
          Width = 36
          Height = 12
          Caption = #51077#49324#51068
        end
        object lb_OutDate: TLabel
          Left = 296
          Top = 256
          Width = 36
          Height = 12
          Caption = #53748#49324#51068
        end
        object Label11: TLabel
          Left = 16
          Top = 282
          Width = 48
          Height = 12
          Caption = #50864#54200#48264#54840
        end
        object btn_ZipcodeSearch: TSpeedButton
          Left = 288
          Top = 276
          Width = 81
          Height = 25
          Caption = #50864#54200#48264#54840#51312#54924
          OnClick = btn_ZipcodeSearchClick
        end
        object lb_Addr1: TLabel
          Left = 16
          Top = 308
          Width = 30
          Height = 12
          Caption = #51452#49548'1'
        end
        object lb_Addr2: TLabel
          Left = 16
          Top = 334
          Width = 30
          Height = 12
          Caption = #51452#49548'2'
        end
        object Label15: TLabel
          Left = 16
          Top = 361
          Width = 60
          Height = 12
          Caption = #51665#51204#54868#48264#54840
        end
        object lb_handphone: TLabel
          Left = 296
          Top = 361
          Width = 66
          Height = 12
          Caption = #55092#45824#54256' '#48264#54840
        end
        object btn_Image: TSpeedButton
          Left = 368
          Top = 192
          Width = 81
          Height = 25
          Caption = #49324#51652#46321#47197
          OnClick = btn_ImageClick
        end
        object lb_fdmsno: TLabel
          Left = 296
          Top = 385
          Width = 48
          Height = 12
          Caption = #51648#47928#48264#54840
          Visible = False
        end
        object Label3: TLabel
          Left = 16
          Top = 203
          Width = 48
          Height = 12
          Caption = #51116#51649#44396#48516
        end
        object ed_sEmpNo: TEdit
          Left = 112
          Top = 16
          Width = 73
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 0
          OnExit = ed_sEmpNoExit
          OnKeyPress = ed_sEmpNoKeyPress
        end
        object chk_AutoSabun: TCheckBox
          Left = 192
          Top = 18
          Width = 97
          Height = 17
          Caption = #49324#48264#51088#46041#49373#49457
          TabOrder = 1
          OnClick = chk_AutoSabunClick
        end
        object ed_sEmpNM: TEdit
          Left = 112
          Top = 42
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 2
          OnEnter = ed_searchTextEnter
          OnKeyPress = ed_sEmpNMKeyPress
        end
        object cmb_sCompany: TComboBox
          Left = 112
          Top = 68
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 3
          OnChange = cmb_sCompanyChange
          OnKeyPress = cmb_sCompanyKeyPress
        end
        object cmb_sJijum: TComboBox
          Left = 112
          Top = 94
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 4
          OnChange = cmb_sJijumChange
          OnKeyPress = cmb_sDepartKeyPress
        end
        object cmb_sDepart: TComboBox
          Left = 112
          Top = 120
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 5
          OnKeyPress = cmb_sDepartKeyPress
        end
        object cmb_sPosi: TComboBox
          Left = 112
          Top = 147
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 6
          OnKeyPress = cmb_sPosiKeyPress
        end
        object cmb_emType: TComboBox
          Left = 112
          Top = 173
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 7
          OnKeyPress = cmb_sPosiKeyPress
        end
        object ed_sCompanyPhone: TEdit
          Left = 112
          Top = 225
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 8
          OnKeyPress = ed_sCompanyPhoneKeyPress
        end
        object dt_sJoinDt: TDateTimePicker
          Left = 112
          Top = 252
          Width = 145
          Height = 20
          Date = 39315.456619826390000000
          Time = 39315.456619826390000000
          ImeName = 'Microsoft IME 2003'
          TabOrder = 9
          OnKeyPress = dt_sJoinDtKeyPress
        end
        object dt_sRetireDt: TDateTimePicker
          Left = 376
          Top = 252
          Width = 145
          Height = 20
          Date = 2958464.456619827000000000
          Time = 2958464.456619827000000000
          ImeName = 'Microsoft IME 2003'
          TabOrder = 10
          OnChange = dt_sRetireDtChange
          OnKeyPress = dt_sRetireDtKeyPress
        end
        object ed_EmpImg: TEdit
          Left = 328
          Top = 224
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 11
          Visible = False
          OnKeyPress = ed_sEmpNoKeyPress
        end
        object ed_sZipcode: TEdit
          Left = 112
          Top = 278
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 12
          OnKeyPress = ed_sZipcodeKeyPress
        end
        object ed_sAddr1: TEdit
          Left = 112
          Top = 304
          Width = 409
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 13
          OnKeyPress = ed_sAddr1KeyPress
        end
        object ed_sAddr2: TEdit
          Left = 112
          Top = 330
          Width = 409
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 14
          OnKeyPress = ed_sAddr2KeyPress
        end
        object ed_sHomePhone: TEdit
          Left = 112
          Top = 357
          Width = 169
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 15
          OnKeyPress = ed_sHomePhoneKeyPress
        end
        object ed_sHandphone: TEdit
          Left = 376
          Top = 357
          Width = 145
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 16
          OnKeyPress = ed_sHandphoneKeyPress
        end
        object Panel5: TPanel
          Left = 328
          Top = 16
          Width = 161
          Height = 169
          BevelOuter = bvLowered
          TabOrder = 17
          object Image1: TImage
            Left = 1
            Top = 1
            Width = 159
            Height = 167
            Align = alClient
            Stretch = True
          end
        end
        object ed_fdmsNo: TEdit
          Left = 376
          Top = 381
          Width = 145
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 18
          Visible = False
        end
        object gb_TimeCode: TGroupBox
          Left = 1
          Top = 403
          Width = 592
          Height = 74
          Align = alBottom
          Caption = #52636#51077#49884#44036#49444#51221
          TabOrder = 19
          object pan_TimeCode: TPanel
            Left = 97
            Top = 14
            Width = 493
            Height = 58
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            Visible = False
            object Panel7: TPanel
              Left = 1
              Top = 31
              Width = 491
              Height = 26
              Align = alClient
              TabOrder = 0
              object chk_TimeSun: TCheckBox
                Left = 8
                Top = 6
                Width = 33
                Height = 17
                Caption = #51068
                TabOrder = 0
                OnClick = chk_Time1Click
              end
              object chk_TimeMon: TCheckBox
                Left = 52
                Top = 6
                Width = 33
                Height = 17
                Caption = #50900
                TabOrder = 1
                OnClick = chk_Time1Click
              end
              object chk_TimeTue: TCheckBox
                Left = 96
                Top = 6
                Width = 33
                Height = 17
                Caption = #54868
                TabOrder = 2
                OnClick = chk_Time1Click
              end
              object chk_TimeWed: TCheckBox
                Left = 140
                Top = 6
                Width = 33
                Height = 17
                Caption = #49688
                TabOrder = 3
                OnClick = chk_Time1Click
              end
              object chk_TimeThu: TCheckBox
                Left = 184
                Top = 6
                Width = 33
                Height = 17
                Caption = #47785
                TabOrder = 4
                OnClick = chk_Time1Click
              end
              object chk_TimeFri: TCheckBox
                Left = 228
                Top = 6
                Width = 33
                Height = 17
                Caption = #44552
                TabOrder = 5
                OnClick = chk_Time1Click
              end
              object chk_TimeSat: TCheckBox
                Left = 272
                Top = 6
                Width = 33
                Height = 17
                Caption = #53664
                TabOrder = 6
                OnClick = chk_Time1Click
              end
            end
            object Panel8: TPanel
              Left = 1
              Top = 1
              Width = 491
              Height = 30
              Align = alTop
              TabOrder = 1
              object chk_Time1: TCheckBox
                Left = 8
                Top = 6
                Width = 89
                Height = 17
                Caption = '00:00-00:00'
                TabOrder = 0
                OnClick = chk_Time1Click
              end
              object chk_Time2: TCheckBox
                Left = 96
                Top = 6
                Width = 89
                Height = 17
                Caption = '00:00-00:00'
                TabOrder = 1
                OnClick = chk_Time1Click
              end
              object chk_Time3: TCheckBox
                Left = 184
                Top = 6
                Width = 89
                Height = 17
                Caption = '00:00-00:00'
                TabOrder = 2
                OnClick = chk_Time1Click
              end
              object chk_Time4: TCheckBox
                Left = 272
                Top = 6
                Width = 89
                Height = 17
                Caption = '00:00-00:00'
                TabOrder = 3
                OnClick = chk_Time1Click
              end
            end
          end
          object Panel9: TPanel
            Left = 2
            Top = 14
            Width = 95
            Height = 58
            Align = alLeft
            BevelOuter = bvLowered
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
        object chk_Master: TCheckBox
          Left = 16
          Top = 383
          Width = 65
          Height = 17
          Caption = #47560#49828#53552
          TabOrder = 20
          OnClick = chk_MasterClick
        end
        object cmb_WorkGubun: TComboBox
          Left = 112
          Top = 199
          Width = 169
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 21
        end
        object ed_SelectCompanyCode: TEdit
          Left = 264
          Top = 0
          Width = 73
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 22
        end
        object ed_SelectEmCode: TEdit
          Left = 264
          Top = 24
          Width = 73
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 23
        end
      end
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 644
    Width = 990
    Height = 56
    Align = alBottom
    TabOrder = 1
    OnResize = Panel2Resize
    object btn_Insert: TSpeedButton
      Left = 152
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
      Left = 265
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
      Left = 379
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
      Left = 492
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
    object btn_Close: TSpeedButton
      Left = 720
      Top = 16
      Width = 81
      Height = 25
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
    object btn_Cancel: TSpeedButton
      Left = 606
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
  object Panel12: TPanel [2]
    Left = 0
    Top = 0
    Width = 990
    Height = 33
    Align = alTop
    Caption = #49324#50896#44288#47532
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
        OnExecute = CommandArrayCommandsTCommand0Execute
      end
      item
        CommandName = 'Close'
        CommandKind = 0
        Name = 'TClose'
        OnExecute = CommandArrayCommandsTCloseExecute
      end>
  end
  object RzOpenDialog1: TOpenDialog
    Left = 844
    Top = 220
  end
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 32
    Top = 96
  end
  object FileCtrl: TLMDFileCtrl
    Options = [ffNoActionConfirm, ffShowNoProgress, ffUseRecycleBin]
    Left = 203
    Top = 485
  end
  object fdmsADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 440
    Top = 112
  end
  object ADOCardQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 808
    Top = 472
  end
  object DeleteADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 840
    Top = 536
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'XLS'
    Filter = 'EXCEL Files (*.xls)|*.xls|All Files (*.*)|*.*'
    InitialDir = #51200#51109#54624' '#54028#51068#51012' '#49440#53469' '#46608#45716' '#51077#47141' '#54616#49464#50836
    Options = [ofOverwritePrompt, ofHideReadOnly]
    Left = 72
    Top = 448
  end
end
