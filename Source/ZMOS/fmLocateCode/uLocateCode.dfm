inherited fmLocateCode: TfmLocateCode
  Left = 416
  Top = 205
  Width = 653
  Height = 534
  Caption = #50948#52824#51221#48372#44288#47532
  Color = clWhite
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
    Width = 645
    Height = 389
    ActivePage = AreaTab
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object BuildingTab: TTabSheet
      Caption = #48716#46377#53076#46300#44288#47532
      object GroupBox7: TGroupBox
        Left = 0
        Top = 0
        Width = 637
        Height = 362
        Align = alClient
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 247
          Top = 14
          Height = 346
        end
        object Panel2: TPanel
          Left = 2
          Top = 14
          Width = 245
          Height = 346
          Align = alLeft
          Color = clWhite
          TabOrder = 0
          object sg_BuildingCode: TAdvStringGrid
            Left = 1
            Top = 1
            Width = 243
            Height = 344
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
            ScrollBars = ssVertical
            TabOrder = 0
            OnClick = sg_BuildingCodeClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              #48716#46377#53076#46300
              #48716#46377#47749#52845)
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
            FixedColWidth = 84
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
              84
              135
              90)
          end
        end
        object Panel3: TPanel
          Left = 250
          Top = 14
          Width = 385
          Height = 346
          Align = alClient
          Color = clWhite
          TabOrder = 1
          object GroupBox8: TGroupBox
            Left = 1
            Top = 1
            Width = 383
            Height = 344
            Align = alClient
            TabOrder = 0
            object lb_sbuildingcode1: TLabel
              Left = 16
              Top = 32
              Width = 90
              Height = 12
              Caption = #48716#46377#53076#46300'(3'#51088#47532')'
            end
            object lb_sBuildingName1: TLabel
              Left = 16
              Top = 58
              Width = 48
              Height = 12
              Caption = #48716#46377#47749#52845
            end
            object Label3: TLabel
              Left = 16
              Top = 125
              Width = 48
              Height = 12
              Caption = #50948#52824#51221#48372
            end
            object btn_BuildingSearch: TSpeedButton
              Left = 120
              Top = 119
              Width = 81
              Height = 25
              Caption = #52286#44592
              OnClick = btn_BuildingSearchClick
            end
            object Label16: TLabel
              Left = 16
              Top = 85
              Width = 48
              Height = 12
              Caption = #50672#46041#53076#46300
            end
            object ed_BuildingCode: TEdit
              Left = 120
              Top = 28
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 3
              TabOrder = 0
              OnChange = ed_BuildingCodeChange
            end
            object ed_BuildingName: TEdit
              Left = 120
              Top = 54
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 1
            end
            object Panel4: TPanel
              Left = 16
              Top = 152
              Width = 353
              Height = 161
              BevelOuter = bvLowered
              TabOrder = 2
              object imgBuilding: TImage
                Left = 1
                Top = 1
                Width = 351
                Height = 159
                Align = alClient
                Stretch = True
              end
            end
            object ed_Buildingimg: TEdit
              Left = 216
              Top = 121
              Width = 97
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 3
              Visible = False
            end
            object chk_BuildingAuto: TCheckBox
              Left = 232
              Top = 30
              Width = 113
              Height = 17
              Caption = #53076#46300#51088#46041#49373#49457
              Checked = True
              State = cbChecked
              TabOrder = 4
              OnClick = chk_BuildingAutoClick
            end
            object ed_BuildingRelayCode: TEdit
              Left = 120
              Top = 81
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 5
            end
          end
        end
      end
    end
    object FloorTab: TTabSheet
      Caption = #52789#53076#46300#44288#47532
      ImageIndex = 1
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 637
        Height = 362
        Align = alClient
        TabOrder = 0
        object Splitter2: TSplitter
          Left = 247
          Top = 14
          Height = 346
        end
        object Panel6: TPanel
          Left = 250
          Top = 14
          Width = 385
          Height = 346
          Align = alClient
          Color = clWhite
          TabOrder = 0
          object GroupBox9: TGroupBox
            Left = 1
            Top = 1
            Width = 383
            Height = 344
            Align = alClient
            TabOrder = 0
            object lb_sFloorCode2: TLabel
              Left = 16
              Top = 47
              Width = 78
              Height = 12
              Caption = #52789#53076#46300'(3'#51088#47532')'
            end
            object lb_sFloorName2: TLabel
              Left = 16
              Top = 74
              Width = 36
              Height = 12
              Caption = #52789#47749#52845
            end
            object Label6: TLabel
              Left = 16
              Top = 125
              Width = 48
              Height = 12
              Caption = #50948#52824#51221#48372
            end
            object btn_FloorSearch: TSpeedButton
              Left = 120
              Top = 119
              Width = 81
              Height = 25
              Caption = #52286#44592
              OnClick = btn_FloorSearchClick
            end
            object lb_sbuildingcode2: TLabel
              Left = 16
              Top = 21
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
            end
            object Label17: TLabel
              Left = 16
              Top = 101
              Width = 48
              Height = 12
              Caption = #50672#46041#53076#46300
            end
            object ed_FloorCode: TEdit
              Left = 120
              Top = 43
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 3
              TabOrder = 0
              OnChange = ed_FloorCodeChange
            end
            object ed_FloorName: TEdit
              Left = 120
              Top = 70
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 1
            end
            object Panel7: TPanel
              Left = 16
              Top = 152
              Width = 353
              Height = 161
              BevelOuter = bvLowered
              TabOrder = 2
              object imgFloor: TImage
                Left = 1
                Top = 1
                Width = 351
                Height = 159
                Align = alClient
                Stretch = True
              end
            end
            object cmb_sBuildingCode1: TComboBox
              Left = 120
              Top = 17
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 3
              OnChange = cmb_sBuildingCode1Change
            end
            object ed_FloorImg: TEdit
              Left = 216
              Top = 121
              Width = 97
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 4
              Visible = False
            end
            object chk_FloorAuto: TCheckBox
              Left = 232
              Top = 45
              Width = 113
              Height = 17
              Caption = #53076#46300#51088#46041#49373#49457
              Checked = True
              State = cbChecked
              TabOrder = 5
              OnClick = chk_FloorAutoClick
            end
            object ed_FloorRelayCode: TEdit
              Left = 120
              Top = 97
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 6
            end
          end
        end
        object Panel5: TPanel
          Left = 2
          Top = 14
          Width = 245
          Height = 346
          Align = alLeft
          Color = clWhite
          TabOrder = 1
          object GroupBox10: TGroupBox
            Left = 1
            Top = 1
            Width = 243
            Height = 57
            Align = alTop
            TabOrder = 0
            object lb_buildingcode2: TLabel
              Left = 16
              Top = 24
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
            end
            object cmb_BuildingCode1: TComboBox
              Left = 88
              Top = 20
              Width = 137
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 0
              OnChange = cmb_BuildingCode1Change
            end
          end
          object sg_FloorCode: TAdvStringGrid
            Left = 1
            Top = 58
            Width = 243
            Height = 287
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
            ScrollBars = ssVertical
            TabOrder = 1
            OnClick = sg_FloorCodeClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              #52789#53076#46300
              #52789#47749#52845)
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
            FixedColWidth = 84
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
              84
              134
              90
              90)
          end
        end
      end
    end
    object AreaTab: TTabSheet
      Caption = #44396#50669#53076#46300#44288#47532
      ImageIndex = 2
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 637
        Height = 362
        Align = alClient
        TabOrder = 0
        object Splitter3: TSplitter
          Left = 247
          Top = 14
          Height = 346
        end
        object Panel9: TPanel
          Left = 250
          Top = 14
          Width = 385
          Height = 346
          Align = alClient
          Color = clWhite
          TabOrder = 0
          object GroupBox11: TGroupBox
            Left = 1
            Top = 1
            Width = 383
            Height = 344
            Align = alClient
            TabOrder = 0
            object lb_sAreaCode3: TLabel
              Left = 16
              Top = 70
              Width = 90
              Height = 12
              Caption = #44396#50669#53076#46300'(3'#51088#47532')'
            end
            object lb_sAreaName3: TLabel
              Left = 16
              Top = 93
              Width = 48
              Height = 12
              Caption = #44396#50669#47749#52845
            end
            object Label12: TLabel
              Left = 16
              Top = 141
              Width = 48
              Height = 12
              Caption = #50948#52824#51221#48372
            end
            object btn_AreaSearch: TSpeedButton
              Left = 120
              Top = 135
              Width = 81
              Height = 25
              Caption = #52286#44592
              OnClick = btn_AreaSearchClick
            end
            object lb_sbuildingcode3: TLabel
              Left = 16
              Top = 24
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
            end
            object lb_sFloorCode3: TLabel
              Left = 16
              Top = 47
              Width = 36
              Height = 12
              Caption = #52789#53076#46300
            end
            object Label18: TLabel
              Left = 16
              Top = 117
              Width = 48
              Height = 12
              Caption = #50672#46041#53076#46300
            end
            object ed_AreaCode: TEdit
              Left = 120
              Top = 66
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 3
              TabOrder = 0
              OnChange = ed_AreaCodeChange
            end
            object ed_AreaName: TEdit
              Left = 120
              Top = 89
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 1
            end
            object Panel10: TPanel
              Left = 16
              Top = 168
              Width = 353
              Height = 145
              BevelOuter = bvLowered
              TabOrder = 2
              object imgArea: TImage
                Left = 1
                Top = 1
                Width = 351
                Height = 143
                Align = alClient
                Stretch = True
              end
            end
            object cmb_sBuildingCode2: TComboBox
              Left = 120
              Top = 20
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 3
              OnChange = cmb_sBuildingCode2Change
            end
            object cmb_sFloorCode2: TComboBox
              Left = 120
              Top = 43
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 4
              OnChange = cmb_sFloorCode2Change
            end
            object ed_AreaImg: TEdit
              Left = 216
              Top = 137
              Width = 97
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 5
              Visible = False
            end
            object chk_ArearAuto: TCheckBox
              Left = 232
              Top = 68
              Width = 113
              Height = 17
              Caption = #53076#46300#51088#46041#49373#49457
              Checked = True
              State = cbChecked
              TabOrder = 6
              OnClick = chk_ArearAutoClick
            end
            object ed_AreaRelayCode: TEdit
              Left = 120
              Top = 113
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 7
            end
          end
        end
        object Panel8: TPanel
          Left = 2
          Top = 14
          Width = 245
          Height = 346
          Align = alLeft
          Color = clWhite
          TabOrder = 1
          object GroupBox12: TGroupBox
            Left = 1
            Top = 1
            Width = 243
            Height = 80
            Align = alTop
            TabOrder = 0
            object lb_buildingcode3: TLabel
              Left = 16
              Top = 24
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
            end
            object lb_FloorCode3: TLabel
              Left = 16
              Top = 48
              Width = 36
              Height = 12
              Caption = #52789#53076#46300
            end
            object cmb_BuildingCode2: TComboBox
              Left = 88
              Top = 20
              Width = 137
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 0
              OnChange = cmb_BuildingCode2Change
            end
            object cmb_FloorCode2: TComboBox
              Left = 88
              Top = 44
              Width = 137
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 1
              OnChange = cmb_FloorCode2Change
            end
          end
          object sg_AreaCode: TAdvStringGrid
            Left = 1
            Top = 81
            Width = 243
            Height = 264
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
            ScrollBars = ssVertical
            TabOrder = 1
            OnClick = sg_AreaCodeClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              #44396#50669#53076#46300
              #44396#50669#47749#52845)
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
            FixedColWidth = 84
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
              84
              138
              90
              90
              90)
          end
        end
      end
    end
  end
  object StatusBar1: TStatusBar [1]
    Left = 0
    Top = 479
    Width = 645
    Height = 28
    Panels = <>
  end
  object GroupBox2: TGroupBox [2]
    Left = 0
    Top = 422
    Width = 645
    Height = 57
    Align = alBottom
    TabOrder = 2
    object btn_Insert: TSpeedButton
      Left = 64
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
      Left = 153
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
      Left = 243
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
      Left = 332
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
      Left = 512
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
      OnClick = btn_ClsoeClick
    end
    object btn_Cancel: TSpeedButton
      Left = 422
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
  object Panel11: TPanel [3]
    Left = 0
    Top = 0
    Width = 645
    Height = 33
    Align = alTop
    Caption = #50948#52824#51221#48372#44288#47532
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object RzOpenDialog1: TOpenDialog
    Left = 60
    Top = 324
  end
  object FileCtrl: TLMDFileCtrl
    Options = [ffNoActionConfirm, ffShowNoProgress, ffUseRecycleBin]
    Left = 107
    Top = 309
  end
  object ADOAutoQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 48
    Top = 176
  end
end
