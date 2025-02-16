inherited fmCompanyCode: TfmCompanyCode
  Left = 698
  Top = 233
  Width = 577
  Height = 446
  Caption = #54924#49324#53076#46300#44288#47532
  Font.Height = -12
  OldCreateOrder = True
  ParentBiDiMode = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object pc_Work: TPageControl [0]
    Left = 0
    Top = 33
    Width = 569
    Height = 297
    ActivePage = ZipTab
    Align = alClient
    TabOrder = 0
    OnChange = pc_WorkChange
    object CompanyTab: TTabSheet
      Caption = #54924#49324#53076#46300#44288#47532
      OnShow = CompanyTabShow
      object Splitter1: TSplitter
        Left = 217
        Top = 0
        Height = 270
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 217
        Height = 270
        Align = alLeft
        Color = clWhite
        TabOrder = 0
        object sg_CompanyCode: TAdvStringGrid
          Left = 1
          Top = 1
          Width = 215
          Height = 268
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
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          OnClick = sg_CompanyCodeClick
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ColumnHeaders.Strings = (
            #54924#49324#53076#46300
            #54924#49324#47749#52845
            #45812#45817#51088#47749
            #45812#45817#51088#51204#54868#48264#54840)
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
          FixedColWidth = 90
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
          Version = '6.0.4.4'
        end
      end
      object Panel3: TPanel
        Left = 220
        Top = 0
        Width = 341
        Height = 270
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 1
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 341
          Height = 270
          Align = alClient
          TabOrder = 0
          object lb_CompanyCode: TLabel
            Left = 16
            Top = 32
            Width = 90
            Height = 12
            Caption = #54924#49324#53076#46300'(3'#51088#47532')'
          end
          object lb_CompanyName: TLabel
            Left = 16
            Top = 74
            Width = 48
            Height = 12
            Caption = #54924#49324#47749#52845
          end
          object Label3: TLabel
            Left = 16
            Top = 117
            Width = 48
            Height = 12
            Caption = #45812#45817#51088#47749
          end
          object Label4: TLabel
            Left = 16
            Top = 160
            Width = 84
            Height = 12
            Caption = #45812#45817#51088#51204#54868#48264#54840
          end
          object ed_CompanyCode: TEdit
            Left = 112
            Top = 28
            Width = 81
            Height = 20
            ImeName = 'Microsoft IME 2003'
            MaxLength = 3
            TabOrder = 0
            OnChange = ed_CompanyCodeChange
            OnKeyPress = ed_CompanyCodeKeyPress
          end
          object ed_CompanyName: TEdit
            Left = 112
            Top = 70
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 1
            OnKeyPress = ed_CompanyNameKeyPress
          end
          object ed_CompanyCharge: TEdit
            Left = 112
            Top = 113
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 2
            OnKeyPress = ed_CompanyChargeKeyPress
          end
          object ed_companyTelnum: TEdit
            Left = 112
            Top = 156
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 3
            OnKeyPress = ed_companyTelnumKeyPress
          end
          object chk_AutoCompanyCode: TCheckBox
            Left = 200
            Top = 30
            Width = 97
            Height = 17
            Caption = #53076#46300#51088#46041#49373#49457
            Checked = True
            State = cbChecked
            TabOrder = 4
            OnClick = chk_AutoCompanyCodeClick
          end
        end
      end
    end
    object JijumTab: TTabSheet
      Caption = #51648#51216#53076#46300#44288#47532
      ImageIndex = 4
      OnShow = JijumTabShow
      object Splitter4: TSplitter
        Left = 209
        Top = 0
        Height = 270
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 209
        Height = 270
        Align = alLeft
        Color = clWhite
        TabOrder = 0
        object sg_jijumCode: TAdvStringGrid
          Left = 1
          Top = 57
          Width = 207
          Height = 212
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
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          OnClick = sg_jijumCodeClick
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ColumnHeaders.Strings = (
            #51648#51216#53076#46300
            #51648#51216#47749#52845
            #54924#49324#53076#46300
            #45812#45817#51088#47749
            #45812#45817#51088#51204#54868#48264#54840)
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
          FixedColWidth = 90
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
          Version = '6.0.4.4'
        end
        object GroupBox1: TGroupBox
          Left = 1
          Top = 1
          Width = 207
          Height = 56
          Align = alTop
          TabOrder = 1
          object lb_CompanyCode1: TLabel
            Left = 16
            Top = 24
            Width = 48
            Height = 12
            Caption = #54924#49324#53076#46300
          end
          object cmb_CompanyCode1: TComboBox
            Left = 72
            Top = 20
            Width = 105
            Height = 20
            Style = csDropDownList
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            TabOrder = 0
            OnChange = cmb_CompanyCode1Change
          end
        end
      end
      object Panel11: TPanel
        Left = 212
        Top = 0
        Width = 349
        Height = 270
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 1
        object GroupBox7: TGroupBox
          Left = 0
          Top = 0
          Width = 349
          Height = 270
          Align = alClient
          TabOrder = 0
          object lb_CompanyCode2: TLabel
            Left = 16
            Top = 32
            Width = 48
            Height = 12
            Caption = #54924#49324#53076#46300
          end
          object lb_JijumName: TLabel
            Left = 16
            Top = 116
            Width = 48
            Height = 12
            Caption = #51648#51216#47749#52845
          end
          object Label16: TLabel
            Left = 16
            Top = 158
            Width = 48
            Height = 12
            Caption = #45812#45817#51088#47749
          end
          object Label17: TLabel
            Left = 16
            Top = 200
            Width = 84
            Height = 12
            Caption = #45812#45817#51088#51204#54868#48264#54840
          end
          object lb_JijumCode: TLabel
            Left = 16
            Top = 74
            Width = 90
            Height = 12
            Caption = #51648#51216#53076#46300'(3'#51088#47532')'
          end
          object ed_jijumcode: TEdit
            Left = 120
            Top = 70
            Width = 89
            Height = 20
            ImeName = 'Microsoft IME 2003'
            MaxLength = 3
            TabOrder = 0
            OnChange = ed_jijumcodeChange
          end
          object ed_jijumname: TEdit
            Left = 120
            Top = 112
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 1
          end
          object ed_jijumCharge: TEdit
            Left = 120
            Top = 154
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 2
            OnKeyPress = ed_DepartChargeKeyPress
          end
          object ed_jijumTelnum: TEdit
            Left = 120
            Top = 196
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 3
            OnKeyPress = ed_DepartTelnumKeyPress
          end
          object cmb_sCompanyCode1: TComboBox
            Left = 120
            Top = 28
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            TabOrder = 4
            OnChange = cmb_sCompanyCode1Change
          end
          object chk_AutoJijumCode: TCheckBox
            Left = 216
            Top = 72
            Width = 97
            Height = 17
            Caption = #53076#46300#51088#46041#49373#49457
            Checked = True
            State = cbChecked
            TabOrder = 5
            OnClick = chk_AutoJijumCodeClick
          end
        end
      end
    end
    object DepartTab: TTabSheet
      Caption = #48512#49436#53076#46300#44288#47532
      ImageIndex = 1
      OnShow = DepartTabShow
      object Splitter2: TSplitter
        Left = 209
        Top = 0
        Height = 270
      end
      object Panel4: TPanel
        Left = 212
        Top = 0
        Width = 349
        Height = 270
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 349
          Height = 270
          Align = alClient
          TabOrder = 0
          object lb_CompanyCode4: TLabel
            Left = 16
            Top = 32
            Width = 48
            Height = 12
            Caption = #54924#49324#53076#46300
          end
          object lb_DepartName: TLabel
            Left = 16
            Top = 132
            Width = 48
            Height = 12
            Caption = #48512#49436#47749#52845
          end
          object Label7: TLabel
            Left = 16
            Top = 166
            Width = 48
            Height = 12
            Caption = #45812#45817#51088#47749
          end
          object Label8: TLabel
            Left = 16
            Top = 200
            Width = 84
            Height = 12
            Caption = #45812#45817#51088#51204#54868#48264#54840
          end
          object lb_DepartCode: TLabel
            Left = 16
            Top = 99
            Width = 90
            Height = 12
            Caption = #48512#49436#53076#46300'(3'#51088#47532')'
          end
          object lb_JijumCode2: TLabel
            Left = 16
            Top = 65
            Width = 48
            Height = 12
            Caption = #51648#51216#53076#46300
          end
          object ed_DepartCode: TEdit
            Left = 120
            Top = 95
            Width = 97
            Height = 20
            ImeName = 'Microsoft IME 2003'
            MaxLength = 3
            TabOrder = 0
            OnChange = ed_DepartCodeChange
            OnKeyPress = ed_DepartCodeKeyPress
          end
          object ed_DepartName: TEdit
            Left = 120
            Top = 128
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 1
            OnKeyPress = ed_DepartNameKeyPress
          end
          object ed_DepartCharge: TEdit
            Left = 120
            Top = 162
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 2
            OnKeyPress = ed_DepartChargeKeyPress
          end
          object ed_DepartTelnum: TEdit
            Left = 120
            Top = 196
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 3
            OnKeyPress = ed_DepartTelnumKeyPress
          end
          object cmb_sCompanyCode2: TComboBox
            Left = 120
            Top = 28
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            TabOrder = 4
            OnChange = cmb_sCompanyCode2Change
          end
          object cmb_sjijumCode2: TComboBox
            Left = 120
            Top = 61
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            TabOrder = 5
            OnChange = cmb_sjijumCode2Change
          end
          object chk_AutoDepartCode: TCheckBox
            Left = 224
            Top = 97
            Width = 97
            Height = 17
            Caption = #53076#46300#51088#46041#49373#49457
            Checked = True
            State = cbChecked
            TabOrder = 6
            OnClick = chk_AutoDepartCodeClick
          end
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 209
        Height = 270
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 1
        object sg_DepartCode: TAdvStringGrid
          Left = 0
          Top = 88
          Width = 209
          Height = 182
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
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          OnClick = sg_DepartCodeClick
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ColumnHeaders.Strings = (
            #48512#49436#53076#46300
            #48512#49436#47749#52845
            #54924#49324#53076#46300
            #51648#51216#53076#46300
            #45812#45817#51088#47749
            #45812#45817#51088#51204#54868#48264#54840)
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
          FixedColWidth = 90
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
          Version = '6.0.4.4'
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 209
          Height = 88
          Align = alTop
          Color = clWhite
          ParentColor = False
          TabOrder = 1
          object lb_CompanyCode3: TLabel
            Left = 16
            Top = 24
            Width = 48
            Height = 12
            Caption = #54924#49324#53076#46300
          end
          object lb_JijumCode1: TLabel
            Left = 16
            Top = 56
            Width = 48
            Height = 12
            Caption = #51648#51216#53076#46300
          end
          object cmb_CompanyCode2: TComboBox
            Left = 72
            Top = 20
            Width = 105
            Height = 20
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            TabOrder = 0
            OnChange = cmb_CompanyCode2Change
          end
          object cmb_jijumCode2: TComboBox
            Left = 72
            Top = 52
            Width = 105
            Height = 20
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            TabOrder = 1
            OnChange = cmb_jijumCode2Change
          end
        end
      end
    end
    object PosiTab: TTabSheet
      Caption = #51649#50948#53076#46300#44288#47532
      ImageIndex = 2
      OnShow = PosiTabShow
      object Splitter3: TSplitter
        Left = 217
        Top = 0
        Height = 270
      end
      object Panel6: TPanel
        Left = 220
        Top = 0
        Width = 341
        Height = 270
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        object GroupBox5: TGroupBox
          Left = 0
          Top = 0
          Width = 341
          Height = 270
          Align = alClient
          TabOrder = 0
          object lb_PosiCode: TLabel
            Left = 16
            Top = 72
            Width = 90
            Height = 12
            Caption = #51649#50948#53076#46300'(3'#51088#47532')'
          end
          object lb_PosiName: TLabel
            Left = 16
            Top = 114
            Width = 48
            Height = 12
            Caption = #51649#50948#47749#52845
          end
          object lb_CompanyCode6: TLabel
            Left = 16
            Top = 32
            Width = 48
            Height = 12
            Caption = #54924#49324#53076#46300
          end
          object ed_posicode: TEdit
            Left = 120
            Top = 68
            Width = 97
            Height = 20
            ImeName = 'Microsoft IME 2003'
            MaxLength = 3
            TabOrder = 0
            OnChange = ed_posicodeChange
            OnKeyPress = ed_posicodeKeyPress
          end
          object ed_posiname: TEdit
            Left = 120
            Top = 110
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 1
            OnKeyPress = ed_posinameKeyPress
          end
          object cmb_sCompanyCode3: TComboBox
            Left = 120
            Top = 28
            Width = 201
            Height = 20
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            TabOrder = 2
            OnChange = cmb_sCompanyCode3Change
          end
          object chk_AutoPosiCode: TCheckBox
            Left = 224
            Top = 70
            Width = 97
            Height = 17
            Caption = #53076#46300#51088#46041#49373#49457
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = chk_AutoPosiCodeClick
          end
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 217
        Height = 270
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 1
        object sg_Posi: TAdvStringGrid
          Left = 0
          Top = 56
          Width = 217
          Height = 214
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
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          OnClick = sg_PosiClick
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ColumnHeaders.Strings = (
            #51649#50948#53076#46300
            #51649#50948#47749#52845
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
          FixedColWidth = 90
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
          Version = '6.0.4.4'
        end
        object GroupBox8: TGroupBox
          Left = 0
          Top = 0
          Width = 217
          Height = 56
          Align = alTop
          TabOrder = 1
          object lb_CompanyCode5: TLabel
            Left = 16
            Top = 24
            Width = 48
            Height = 12
            Caption = #54924#49324#53076#46300
          end
          object cmb_CompanyCode3: TComboBox
            Left = 72
            Top = 20
            Width = 105
            Height = 20
            Style = csDropDownList
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            TabOrder = 0
            OnChange = cmb_CompanyCode3Change
          end
        end
      end
    end
    object ZipTab: TTabSheet
      Caption = #50864#54200#48264#54840#44288#47532
      ImageIndex = 3
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 561
        Height = 41
        Align = alTop
        Color = clWhite
        TabOrder = 0
        object btn_zipcodesearch: TSpeedButton
          Left = 376
          Top = 8
          Width = 81
          Height = 25
          Caption = #51312#54924
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
          OnClick = btn_zipcodesearchClick
        end
        object btn_ZipFileUpload: TSpeedButton
          Left = 464
          Top = 8
          Width = 81
          Height = 25
          Caption = #54028#51068#50629#47196#46300
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          OnClick = btn_ZipFileUploadClick
        end
        object StaticText1: TStaticText
          Left = 16
          Top = 12
          Width = 52
          Height = 16
          BevelInner = bvNone
          BevelKind = bkFlat
          Caption = #46041'/'#51021'/'#47732
          TabOrder = 0
        end
        object ed_Sdong: TEdit
          Left = 80
          Top = 10
          Width = 281
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 1
          OnKeyPress = ed_SdongKeyPress
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 41
        Width = 561
        Height = 139
        Align = alClient
        Color = clWhite
        TabOrder = 1
        object sg_Zipcode: TAdvStringGrid
          Left = 1
          Top = 1
          Width = 559
          Height = 137
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
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          OnClick = sg_ZipcodeClick
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ColumnHeaders.Strings = (
            #50864#54200#48264#54840
            #49884'/'#46020
            #44396'/'#44400
            #46041'/'#51021'/'#47732
            #48264#51648)
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
          FixedColWidth = 90
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
          Version = '6.0.4.4'
          ColWidths = (
            90
            99
            106
            139
            93)
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 180
        Width = 561
        Height = 90
        Align = alBottom
        Color = clWhite
        TabOrder = 2
        object Gauge1: TGauge
          Left = 16
          Top = 72
          Width = 521
          Height = 17
          ForeColor = clNavy
          Progress = 0
          Visible = False
        end
        object StaticText2: TStaticText
          Left = 16
          Top = 28
          Width = 73
          Height = 16
          Alignment = taCenter
          AutoSize = False
          BevelInner = bvNone
          BevelKind = bkFlat
          Caption = #49884'/'#46020
          TabOrder = 5
        end
        object ed_sido: TEdit
          Left = 96
          Top = 26
          Width = 161
          Height = 20
          Enabled = False
          ImeName = 'Microsoft IME 2003'
          TabOrder = 1
          OnKeyPress = ed_sidoKeyPress
        end
        object StaticText3: TStaticText
          Left = 296
          Top = 28
          Width = 73
          Height = 16
          Alignment = taCenter
          AutoSize = False
          BevelInner = bvNone
          BevelKind = bkFlat
          Caption = #44396'/'#44400
          TabOrder = 6
        end
        object ed_gugun: TEdit
          Left = 376
          Top = 26
          Width = 161
          Height = 20
          Enabled = False
          ImeName = 'Microsoft IME 2003'
          TabOrder = 2
          OnKeyPress = ed_gugunKeyPress
        end
        object StaticText4: TStaticText
          Left = 16
          Top = 52
          Width = 73
          Height = 16
          Alignment = taCenter
          AutoSize = False
          BevelInner = bvNone
          BevelKind = bkFlat
          Caption = #46041'/'#51021'/'#47732
          TabOrder = 7
        end
        object ed_dong: TEdit
          Left = 96
          Top = 50
          Width = 161
          Height = 20
          Enabled = False
          ImeName = 'Microsoft IME 2003'
          TabOrder = 3
          OnKeyPress = ed_dongKeyPress
        end
        object StaticText5: TStaticText
          Left = 296
          Top = 52
          Width = 73
          Height = 16
          Alignment = taCenter
          AutoSize = False
          BevelInner = bvNone
          BevelKind = bkFlat
          Caption = #48264#51648
          TabOrder = 8
        end
        object ed_bunji: TEdit
          Left = 376
          Top = 50
          Width = 161
          Height = 20
          Enabled = False
          ImeName = 'Microsoft IME 2003'
          TabOrder = 4
          OnKeyPress = ed_bunjiKeyPress
        end
        object StaticText6: TStaticText
          Left = 16
          Top = 4
          Width = 73
          Height = 16
          Alignment = taCenter
          AutoSize = False
          BevelInner = bvNone
          BevelKind = bkFlat
          Caption = #50864#54200#48264#54840
          TabOrder = 9
        end
        object ed_zipcode: TEdit
          Left = 96
          Top = 2
          Width = 161
          Height = 20
          Enabled = False
          ImeName = 'Microsoft IME 2003'
          TabOrder = 0
          OnKeyPress = ed_zipcodeKeyPress
        end
      end
    end
  end
  object StatusBar1: TStatusBar [1]
    Left = 0
    Top = 396
    Width = 569
    Height = 23
    Color = clWhite
    Panels = <>
  end
  object GroupBox6: TGroupBox [2]
    Left = 0
    Top = 330
    Width = 569
    Height = 66
    Align = alBottom
    Color = clWhite
    ParentColor = False
    TabOrder = 2
    object btn_Insert: TSpeedButton
      Left = 24
      Top = 25
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
      Left = 110
      Top = 25
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
      Left = 196
      Top = 25
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
      Left = 283
      Top = 25
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
      Left = 456
      Top = 25
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
      Left = 369
      Top = 24
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
  object Panel12: TPanel [3]
    Left = 0
    Top = 0
    Width = 569
    Height = 33
    Align = alTop
    Caption = #54924#49324#53076#46300#44288#47532
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentBackground = True
    ParentFont = False
    TabOrder = 3
  end
  object RzOpenDialog1: TOpenDialog
    Left = 60
    Top = 324
  end
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 16
    Top = 64
  end
end
