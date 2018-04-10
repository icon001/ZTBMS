inherited fmMDIDeviceCode: TfmMDIDeviceCode
  Left = 570
  Top = 122
  Width = 1021
  Height = 630
  Caption = #52968#53944#47204#47084#44288#47532
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label67: TLabel [0]
    Left = 16
    Top = 24
    Width = 42
    Height = 12
    Caption = 'MCU'#53076#46300
  end
  object PageControl1: TPageControl [1]
    Left = 0
    Top = 33
    Width = 1013
    Height = 471
    ActivePage = ECUTab
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object MCUTab: TTabSheet
      Caption = #47700#51064#44288#47532
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 1005
        Height = 444
        Align = alClient
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 505
          Top = 14
          Height = 428
        end
        object Panel2: TPanel
          Left = 2
          Top = 14
          Width = 503
          Height = 428
          Align = alLeft
          TabOrder = 0
          object GroupBox14: TGroupBox
            Left = 1
            Top = 1
            Width = 501
            Height = 104
            Align = alTop
            TabOrder = 0
            object Label26: TLabel
              Left = 16
              Top = 24
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
            end
            object Label27: TLabel
              Left = 16
              Top = 48
              Width = 36
              Height = 12
              Caption = #52789#53076#46300
            end
            object Label28: TLabel
              Left = 16
              Top = 72
              Width = 48
              Height = 12
              Caption = #44396#50669#53076#46300
            end
            object cmb_BuildingCode1: TComboBox
              Left = 72
              Top = 20
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 0
              OnChange = cmb_BuildingCode1Change
            end
            object cmb_FloorCode1: TComboBox
              Left = 72
              Top = 44
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 1
              OnChange = cmb_FloorCode1Change
            end
            object cmb_AreaCode1: TComboBox
              Left = 72
              Top = 68
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 2
              OnChange = cmb_AreaCode1Change
            end
          end
          object sg_MCUCode: TAdvStringGrid
            Left = 1
            Top = 105
            Width = 501
            Height = 322
            Cursor = crDefault
            Align = alClient
            ColCount = 28
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
            TabOrder = 1
            OnClick = sg_MCUCodeClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              #47700#51064'ID'
              #47700#51064#44396#48516
              #47700#51064#47749#52845
              'NODE'#48264#54840
              'MCUID'
              'ACTYPE'
              'ATTYPE'
              'FDTYPE'
              'PTTYPE'
              'DONGCODE'
              'FLOORCODE'
              'AREACODE'
              #51312#54924#49692#49436
              'MCUIP'
              'MCUPORT'
              #50948#52824#49324#50857#50976#47924
              #52509#45331#51060
              #52509#45458#51060
              #54788#51116'X'#52629
              #54788#51116'Y'#52629
              #52852#46300#47532#45908#53440#51077)
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
            FixedColWidth = 143
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
            SortSettings.AutoFormat = False
            Version = '6.0.4.4'
            ColWidths = (
              143
              229
              226
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
          end
        end
        object Panel3: TPanel
          Left = 508
          Top = 14
          Width = 495
          Height = 428
          Align = alClient
          TabOrder = 1
          object GroupBox7: TGroupBox
            Left = 1
            Top = 1
            Width = 493
            Height = 426
            Align = alClient
            TabOrder = 0
            object lb_McuIp: TLabel
              Left = 16
              Top = 13
              Width = 42
              Height = 12
              Caption = #47700#51064' IP'
            end
            object Label3: TLabel
              Left = 16
              Top = 269
              Width = 48
              Height = 12
              Caption = #50948#52824#51221#48372
              Visible = False
            end
            object Label1: TLabel
              Left = 16
              Top = 200
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
            end
            object Label16: TLabel
              Left = 16
              Top = 223
              Width = 36
              Height = 12
              Caption = #52789#53076#46300
            end
            object Label17: TLabel
              Left = 16
              Top = 246
              Width = 48
              Height = 12
              Caption = #44396#50669#53076#46300
            end
            object Label20: TLabel
              Left = 360
              Top = 13
              Width = 48
              Height = 12
              Caption = #47700#51064'PORT'
              Visible = False
            end
            object lb_McuID: TLabel
              Left = 16
              Top = 13
              Width = 78
              Height = 12
              Caption = #47700#51064'ID(7'#51088#47532')'
              Visible = False
            end
            object Label19: TLabel
              Left = 16
              Top = 37
              Width = 48
              Height = 12
              Caption = #47700#51064#47749#52845
            end
            object Label74: TLabel
              Left = 16
              Top = 62
              Width = 48
              Height = 12
              Caption = #52852#46300#53440#51077
            end
            object Label75: TLabel
              Left = 16
              Top = 86
              Width = 48
              Height = 12
              Caption = #49548#53011#53440#51077
            end
            object ed_McuIp: TEdit
              Left = 120
              Top = 9
              Width = 200
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 26
              TabOrder = 1
            end
            object cmb_sBuildingCode1: TComboBox
              Left = 120
              Top = 196
              Width = 200
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 4
              OnChange = cmb_sBuildingCode1Change
            end
            object cmb_sFloorCode1: TComboBox
              Left = 120
              Top = 218
              Width = 200
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 5
              OnChange = cmb_sFloorCode1Change
            end
            object cmb_sAreaCode1: TComboBox
              Left = 120
              Top = 241
              Width = 200
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 6
              OnChange = cmb_sAreaCode1Change
            end
            object ed_McuPort: TEdit
              Left = 360
              Top = 33
              Width = 104
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 5
              TabOrder = 3
              Text = '3000'
              Visible = False
            end
            object ed_MCUID: TEdit
              Left = 120
              Top = 9
              Width = 200
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 7
              TabOrder = 0
              Visible = False
            end
            object ed_MCUname: TEdit
              Left = 120
              Top = 33
              Width = 200
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 70
              TabOrder = 2
            end
            object gb_Device: TGroupBox
              Left = 16
              Top = 304
              Width = 393
              Height = 49
              Caption = #44592#44592#53440#51077
              TabOrder = 8
              object chk_McuAC: TCheckBox
                Left = 24
                Top = 24
                Width = 57
                Height = 17
                Caption = #52636#51077
                Checked = True
                Enabled = False
                State = cbChecked
                TabOrder = 0
                OnClick = chk_McuACClick
              end
              object chk_MCUFd: TCheckBox
                Left = 177
                Top = 20
                Width = 57
                Height = 25
                Caption = #49885#49688
                TabOrder = 3
                OnClick = chk_MCUFdClick
              end
              object chk_MCUPt: TCheckBox
                Left = 75
                Top = 24
                Width = 57
                Height = 17
                Caption = #48169#48276
                Checked = True
                Enabled = False
                State = cbChecked
                TabOrder = 1
                OnClick = chk_MCUPtClick
              end
              object chk_McuAT: TCheckBox
                Left = 126
                Top = 24
                Width = 43
                Height = 17
                Caption = #44540#53468
                TabOrder = 2
                OnClick = chk_McuATClick
              end
              object chk_MCUJavara: TCheckBox
                Left = 229
                Top = 20
                Width = 57
                Height = 25
                Caption = #51088#48148#46972
                TabOrder = 4
                OnClick = chk_MCUJavaraClick
              end
              object chk_MCUTimeCode: TCheckBox
                Left = 293
                Top = 20
                Width = 68
                Height = 25
                Caption = #53440#51076#53076#46300
                TabOrder = 5
                OnClick = chk_ECUJavaraClick
              end
            end
            object chk_McuReg: TCheckBox
              Left = 56
              Top = 264
              Width = 49
              Height = 17
              Caption = #46321#47197
              TabOrder = 9
              Visible = False
            end
            object ed_TotWidth1: TEdit
              Left = 176
              Top = 296
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 10
              Visible = False
            end
            object ed_TotHeight1: TEdit
              Left = 208
              Top = 296
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 11
              Visible = False
            end
            object ed_CurX1: TEdit
              Left = 240
              Top = 296
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 12
              Visible = False
            end
            object ed_CurY1: TEdit
              Left = 272
              Top = 296
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 13
              Visible = False
            end
            object ed_NodeNo: TEdit
              Left = 336
              Top = 8
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 14
              Visible = False
            end
            object btnMCUPosition: TBitBtn
              Left = 120
              Top = 263
              Width = 201
              Height = 25
              Caption = #50948#52824#46321#47197
              TabOrder = 7
              OnClick = btnMCUPositionClick
            end
            object chk_McuUpdate: TCheckBox
              Left = 16
              Top = 352
              Width = 121
              Height = 17
              Caption = 'MCU'#50629#45936#51060#53944
              TabOrder = 15
              Visible = False
            end
            object chk_EcuName: TCheckBox
              Left = 16
              Top = 368
              Width = 57
              Height = 17
              Caption = #47196#52972#47749
              Enabled = False
              TabOrder = 16
              OnClick = chk_McuACClick
            end
            object chk_DoorName: TCheckBox
              Left = 88
              Top = 367
              Width = 73
              Height = 17
              Caption = #52636#51077#47928#47749
              Enabled = False
              TabOrder = 17
              OnClick = chk_McuACClick
            end
            object chk_PtName: TCheckBox
              Left = 168
              Top = 367
              Width = 81
              Height = 17
              Caption = #48169#48276#44396#50669#47749
              Enabled = False
              TabOrder = 18
              OnClick = chk_McuACClick
            end
            object gbKTT: TGroupBox
              Left = 8
              Top = 104
              Width = 337
              Height = 89
              TabOrder = 19
              object Label2: TLabel
                Left = 8
                Top = 37
                Width = 84
                Height = 12
                Caption = 'MUX     '#50500#51060#46356
              end
              object Label18: TLabel
                Left = 8
                Top = 13
                Width = 84
                Height = 12
                Caption = #49884#49828#53596'  '#50500#51060#46356
              end
              object Label76: TLabel
                Left = 8
                Top = 61
                Width = 84
                Height = 12
                Caption = 'DECODER '#50500#51060#46356
              end
              object ed_muxid: TEdit
                Left = 112
                Top = 33
                Width = 200
                Height = 20
                ImeName = 'Microsoft IME 2003'
                MaxLength = 2
                TabOrder = 0
              end
              object ed_systemid: TEdit
                Left = 112
                Top = 9
                Width = 200
                Height = 20
                ImeName = 'Microsoft IME 2003'
                MaxLength = 4
                TabOrder = 1
              end
              object ed_decoderid: TEdit
                Left = 112
                Top = 57
                Width = 200
                Height = 20
                ImeName = 'Microsoft IME 2003'
                MaxLength = 5
                TabOrder = 2
              end
            end
            object cmb_CardType: TComboBox
              Left = 120
              Top = 57
              Width = 200
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 20
              Items.Strings = (
                '0.'#48276#50857'(4Byte)'
                '1.'#44032#48320'(16Byte)'
                '2.KT'#49324#50725'(11Byte)')
            end
            object cmb_SockType: TComboBox
              Left = 120
              Top = 81
              Width = 200
              Height = 20
              Style = csDropDownList
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 21
              OnChange = cmb_SockTypeChange
              Items.Strings = (
                '1.PC->'#52968#53944#47204#47084#51217#49549#47784#46300
                '2.PC<-'#52968#53944#47204#47084#51217#49549#47784#46300)
            end
          end
        end
      end
    end
    object ECUTab: TTabSheet
      Caption = #47196#52972#44288#47532
      ImageIndex = 1
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 1005
        Height = 444
        Align = alClient
        TabOrder = 0
        object Splitter2: TSplitter
          Left = 521
          Top = 14
          Height = 428
        end
        object Panel6: TPanel
          Left = 524
          Top = 14
          Width = 479
          Height = 428
          Align = alClient
          TabOrder = 0
          object GroupBox10: TGroupBox
            Left = 1
            Top = 1
            Width = 477
            Height = 426
            Align = alClient
            TabOrder = 0
            object Label4: TLabel
              Left = 16
              Top = 144
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
            end
            object Label5: TLabel
              Left = 16
              Top = 168
              Width = 36
              Height = 12
              Caption = #52789#53076#46300
            end
            object Label6: TLabel
              Left = 16
              Top = 192
              Width = 48
              Height = 12
              Caption = #44396#50669#53076#46300
            end
            object Label7: TLabel
              Left = 16
              Top = 24
              Width = 48
              Height = 12
              Caption = #47700#51064#44396#48516
            end
            object Label22: TLabel
              Left = 16
              Top = 68
              Width = 48
              Height = 12
              Caption = #47196#52972#47749#52845
            end
            object Label10: TLabel
              Left = 16
              Top = 46
              Width = 36
              Height = 12
              Caption = #47196#52972'ID'
            end
            object Label21: TLabel
              Left = 16
              Top = 221
              Width = 48
              Height = 12
              Caption = #50948#52824#51221#48372
              Visible = False
            end
            object cmb_sBuildingCode2: TComboBox
              Left = 120
              Top = 140
              Width = 200
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 9
              OnChange = cmb_sBuildingCode2Change
            end
            object cmb_sFloorCode2: TComboBox
              Left = 120
              Top = 164
              Width = 200
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 10
              OnChange = cmb_sFloorCode2Change
            end
            object cmb_sAreaCode2: TComboBox
              Left = 120
              Top = 188
              Width = 200
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 11
              OnChange = cmb_sAreaCode2Change
            end
            object ed_EcuName: TEdit
              Left = 120
              Top = 64
              Width = 200
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 70
              TabOrder = 8
              OnEnter = ed_EcuNameEnter
            end
            object ed_Ecuno: TSpinEdit
              Left = 120
              Top = 42
              Width = 200
              Height = 21
              MaxValue = 99
              MinValue = 1
              TabOrder = 7
              Value = 1
              OnChange = ed_EcunoChange
            end
            object chk_EcuReg: TCheckBox
              Left = 120
              Top = 192
              Width = 49
              Height = 17
              Caption = #46321#47197
              TabOrder = 0
              Visible = False
            end
            object gb_Device2: TGroupBox
              Left = 16
              Top = 248
              Width = 401
              Height = 49
              Caption = #44592#44592#53440#51077
              TabOrder = 14
              object chk_EcuAC: TCheckBox
                Left = 24
                Top = 24
                Width = 57
                Height = 17
                Caption = #52636#51077
                Checked = True
                Enabled = False
                State = cbChecked
                TabOrder = 0
                OnClick = chk_EcuACClick
              end
              object chk_EcuFd: TCheckBox
                Left = 195
                Top = 20
                Width = 57
                Height = 25
                Caption = #49885#49688
                TabOrder = 3
                OnClick = chk_EcuFdClick
              end
              object chk_EcuPt: TCheckBox
                Left = 81
                Top = 24
                Width = 57
                Height = 17
                Caption = #48169#48276
                Checked = True
                Enabled = False
                State = cbChecked
                TabOrder = 1
                OnClick = chk_EcuPtClick
              end
              object chk_EcuAT: TCheckBox
                Left = 138
                Top = 24
                Width = 57
                Height = 17
                Caption = #44540#53468
                TabOrder = 2
                OnClick = chk_EcuATClick
              end
              object chk_ECUJavara: TCheckBox
                Left = 253
                Top = 20
                Width = 57
                Height = 25
                Caption = #51088#48148#46972
                TabOrder = 4
                OnClick = chk_ECUJavaraClick
              end
              object chk_ECUTimeCode: TCheckBox
                Left = 317
                Top = 20
                Width = 68
                Height = 25
                Caption = #53440#51076#53076#46300
                TabOrder = 5
                OnClick = chk_ECUJavaraClick
              end
            end
            object ed_NodeNo2: TEdit
              Left = 120
              Top = 8
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 1
              Visible = False
            end
            object ed_TotWidth2: TEdit
              Left = 176
              Top = 192
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 2
              Visible = False
            end
            object ed_TotHeight2: TEdit
              Left = 208
              Top = 192
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 3
              Visible = False
            end
            object ed_CurX2: TEdit
              Left = 240
              Top = 192
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 4
              Visible = False
            end
            object ed_CurY2: TEdit
              Left = 272
              Top = 192
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 5
              Visible = False
            end
            object cmb_sMCUCode2: TComboBox
              Left = 120
              Top = 20
              Width = 200
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 6
              OnChange = cmb_sMCUCode2Change
            end
            object btnECUPosition: TBitBtn
              Left = 120
              Top = 216
              Width = 200
              Height = 25
              Caption = #50948#52824#46321#47197
              TabOrder = 13
              OnClick = btnECUPositionClick
            end
            object chk_EcuUpdate: TCheckBox
              Left = 16
              Top = 288
              Width = 121
              Height = 17
              Caption = 'ECU'#50629#45936#51060#53944
              TabOrder = 12
              Visible = False
            end
            object chk_ECUDoorName: TCheckBox
              Left = 16
              Top = 303
              Width = 73
              Height = 17
              Caption = #52636#51077#47928#47749
              Enabled = False
              TabOrder = 15
              OnClick = chk_McuACClick
            end
            object chk_ECUPtName: TCheckBox
              Left = 96
              Top = 303
              Width = 81
              Height = 17
              Caption = #48169#48276#44396#50669#47749
              Enabled = False
              TabOrder = 16
              OnClick = chk_McuACClick
            end
          end
        end
        object Panel5: TPanel
          Left = 2
          Top = 14
          Width = 519
          Height = 428
          Align = alLeft
          TabOrder = 1
          object GroupBox11: TGroupBox
            Left = 1
            Top = 1
            Width = 517
            Height = 136
            Align = alTop
            TabOrder = 0
            object Label9: TLabel
              Left = 16
              Top = 104
              Width = 48
              Height = 12
              Caption = #47700#51064#44396#48516
            end
            object Label29: TLabel
              Left = 16
              Top = 16
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
            end
            object Label30: TLabel
              Left = 16
              Top = 45
              Width = 36
              Height = 12
              Caption = #52789#53076#46300
            end
            object Label31: TLabel
              Left = 16
              Top = 74
              Width = 48
              Height = 12
              Caption = #44396#50669#53076#46300
            end
            object cmb_MCUCode2: TComboBox
              Left = 72
              Top = 100
              Width = 200
              Height = 20
              Style = csDropDownList
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 0
              OnChange = cmb_MCUCode2Change
            end
            object cmb_BuildingCode2: TComboBox
              Left = 72
              Top = 12
              Width = 200
              Height = 20
              Style = csDropDownList
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 1
              OnChange = cmb_BuildingCode2Change
            end
            object cmb_FloorCode2: TComboBox
              Left = 72
              Top = 41
              Width = 200
              Height = 20
              Style = csDropDownList
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 2
              OnChange = cmb_FloorCode2Change
            end
            object cmb_AreaCode2: TComboBox
              Left = 72
              Top = 70
              Width = 200
              Height = 20
              Style = csDropDownList
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 3
              OnChange = cmb_AreaCode2Change
            end
          end
          object sg_ECUCode: TAdvStringGrid
            Left = 1
            Top = 137
            Width = 517
            Height = 290
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
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 1
            OnClick = sg_ECUCodeClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              #47700#51064#44396#48516
              #47196#52972'ID'
              #47196#52972#47749#52845
              'NODE'#48264#54840
              'ACTYPE'
              'ATTYPE'
              'FDTYPE'
              'PTTYPE'
              'DONGCODE'
              'FLOORCODE'
              'AREACODE'
              #51312#54924#49692#49436
              'MCUIP'
              'MCUPORT'
              #50948#52824#49324#50857#50976#47924
              #52509#45331#51060
              #52509#45458#51060
              #54788#51116'X'#52629
              #54788#51116'Y'#52629)
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
            FixedColWidth = 167
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
            Version = '6.0.4.4'
            ColWidths = (
              167
              50
              245
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
    end
    object DoorTab: TTabSheet
      Caption = #52636#51077#47928#44288#47532
      ImageIndex = 2
      TabVisible = False
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 1005
        Height = 444
        Align = alClient
        TabOrder = 0
        object Splitter3: TSplitter
          Left = 289
          Top = 14
          Height = 428
        end
        object Panel9: TPanel
          Left = 292
          Top = 14
          Width = 711
          Height = 428
          Align = alClient
          TabOrder = 0
          object GroupBox12: TGroupBox
            Left = 1
            Top = 1
            Width = 709
            Height = 336
            Align = alTop
            TabOrder = 0
            object Label11: TLabel
              Left = 16
              Top = 106
              Width = 60
              Height = 12
              Caption = #52636#51077#47928#47749#52845
            end
            object Label12: TLabel
              Left = 16
              Top = 261
              Width = 48
              Height = 12
              Caption = #50948#52824#51221#48372
              Visible = False
            end
            object Label13: TLabel
              Left = 16
              Top = 152
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
            end
            object Label15: TLabel
              Left = 16
              Top = 177
              Width = 36
              Height = 12
              Caption = #52789#53076#46300
            end
            object Label23: TLabel
              Left = 16
              Top = 203
              Width = 48
              Height = 12
              Caption = #44396#50669#53076#46300
            end
            object Label24: TLabel
              Left = 16
              Top = 24
              Width = 48
              Height = 12
              Caption = #47700#51064#44396#48516
            end
            object Label25: TLabel
              Left = 16
              Top = 51
              Width = 36
              Height = 12
              Caption = #47196#52972'ID'
            end
            object Label48: TLabel
              Left = 16
              Top = 78
              Width = 60
              Height = 12
              Caption = #52636#51077#47928#48264#54840
            end
            object Label49: TLabel
              Left = 16
              Top = 227
              Width = 72
              Height = 12
              Caption = #54868#47732#51312#54924#49692#49436
            end
            object ed_sDoorName: TEdit
              Left = 96
              Top = 102
              Width = 170
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 0
            end
            object cmb_sBuildingCode3: TComboBox
              Left = 96
              Top = 148
              Width = 170
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 1
              OnChange = cmb_sBuildingCode3Change
            end
            object cmb_sFloorCode3: TComboBox
              Left = 96
              Top = 173
              Width = 170
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 2
              OnChange = cmb_sFloorCode3Change
            end
            object cmb_sAreaCode3: TComboBox
              Left = 96
              Top = 198
              Width = 170
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 3
              OnChange = cmb_sAreaCode3Change
            end
            object cmb_sMCUCode3: TComboBox
              Left = 96
              Top = 20
              Width = 170
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 4
              OnChange = cmb_sMCUCode3Change
            end
            object cmb_sECUCode3: TComboBox
              Left = 96
              Top = 47
              Width = 170
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 5
            end
            object ed_sDoorNo: TSpinEdit
              Left = 96
              Top = 74
              Width = 170
              Height = 21
              MaxValue = 2
              MinValue = 0
              TabOrder = 6
              Value = 0
            end
            object chk_DoorReg: TCheckBox
              Left = 120
              Top = 256
              Width = 49
              Height = 17
              Caption = #46321#47197
              TabOrder = 7
              Visible = False
            end
            object ed_NodeNo3: TEdit
              Left = 120
              Top = 8
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 8
              Visible = False
            end
            object ed_TotWidth3: TEdit
              Left = 112
              Top = 248
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 9
              Visible = False
            end
            object ed_TotHeight3: TEdit
              Left = 144
              Top = 248
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 10
              Visible = False
            end
            object ed_CurX3: TEdit
              Left = 176
              Top = 248
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 11
              Visible = False
            end
            object ed_CurY3: TEdit
              Left = 208
              Top = 248
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 12
              Visible = False
            end
            object ed_DoorViewSeq: TEdit
              Left = 96
              Top = 223
              Width = 170
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 30
              TabOrder = 13
            end
            object btnDoorPosition: TBitBtn
              Left = 96
              Top = 256
              Width = 170
              Height = 25
              Caption = #50948#52824#46321#47197
              TabOrder = 14
              OnClick = btnDoorPositionClick
            end
          end
        end
        object Panel8: TPanel
          Left = 2
          Top = 14
          Width = 287
          Height = 428
          Align = alLeft
          TabOrder = 1
          object GroupBox13: TGroupBox
            Left = 1
            Top = 1
            Width = 285
            Height = 72
            Align = alTop
            TabOrder = 0
            object Label8: TLabel
              Left = 16
              Top = 24
              Width = 48
              Height = 12
              Caption = #47700#51064#44396#48516
            end
            object Label14: TLabel
              Left = 16
              Top = 48
              Width = 48
              Height = 12
              Caption = #47196#52972#44396#48516
            end
            object Label32: TLabel
              Left = 16
              Top = 80
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
              Visible = False
            end
            object Label33: TLabel
              Left = 16
              Top = 104
              Width = 36
              Height = 12
              Caption = #52789#53076#46300
              Visible = False
            end
            object Label34: TLabel
              Left = 16
              Top = 128
              Width = 48
              Height = 12
              Caption = #44396#50669#53076#46300
              Visible = False
            end
            object cmb_MCUCode3: TComboBox
              Left = 72
              Top = 20
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 0
              OnChange = cmb_MCUCode3Change
            end
            object cmb_ECUCode3: TComboBox
              Left = 72
              Top = 44
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 1
              OnChange = cmb_ECUCode3Change
            end
            object cmb_BuildingCode3: TComboBox
              Left = 72
              Top = 76
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 2
              Visible = False
              OnChange = cmb_BuildingCode3Change
            end
            object cmb_FloorCode3: TComboBox
              Left = 72
              Top = 100
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 3
              Visible = False
              OnChange = cmb_FloorCode3Change
            end
            object cmb_AreaCode3: TComboBox
              Left = 72
              Top = 124
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 4
              Visible = False
              OnChange = cmb_AreaCode3Change
            end
          end
          object sg_DoorCode: TAdvStringGrid
            Left = 1
            Top = 73
            Width = 285
            Height = 354
            Cursor = crDefault
            Align = alClient
            ColCount = 14
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
            OnClick = sg_DoorCodeClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              #47700#51064#44396#48516
              #47196#52972'ID'
              #52636#51077#47928#48264#54840
              #52636#51077#47928#47749#52845
              'NODENO'
              #48716#46377#53076#46300
              #52789#53076#46300
              #44396#50669#53076#46300
              #54868#47732#51312#54924#49692#49436
              #50948#52824#46321#47197#51221#48372
              'TotWidth'
              'TotHeight'
              'CurX'
              'CurY')
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
            FixedColWidth = 83
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
            Version = '6.0.4.4'
            ColWidths = (
              83
              51
              73
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
    end
    object AlarmTab: TTabSheet
      Caption = #48169#48276#44396#50669#44288#47532
      ImageIndex = 3
      TabVisible = False
      object GroupBox16: TGroupBox
        Left = 0
        Top = 0
        Width = 1005
        Height = 444
        Align = alClient
        TabOrder = 0
        object Splitter4: TSplitter
          Left = 281
          Top = 14
          Height = 428
        end
        object Panel4: TPanel
          Left = 284
          Top = 14
          Width = 719
          Height = 428
          Align = alClient
          TabOrder = 0
          object GroupBox17: TGroupBox
            Left = 1
            Top = 1
            Width = 717
            Height = 426
            Align = alClient
            TabOrder = 0
            object Label35: TLabel
              Left = 16
              Top = 168
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
            end
            object Label36: TLabel
              Left = 16
              Top = 193
              Width = 36
              Height = 12
              Caption = #52789#53076#46300
            end
            object Label37: TLabel
              Left = 16
              Top = 218
              Width = 48
              Height = 12
              Caption = #44396#50669#53076#46300
            end
            object Label38: TLabel
              Left = 16
              Top = 24
              Width = 48
              Height = 12
              Caption = 'MCU '#53076#46300
            end
            object Label39: TLabel
              Left = 16
              Top = 49
              Width = 36
              Height = 12
              Caption = 'ECU NO'
            end
            object Label40: TLabel
              Left = 16
              Top = 101
              Width = 72
              Height = 12
              Caption = #48169#48276#44396#50669#47749#52845
            end
            object Label45: TLabel
              Left = 16
              Top = 75
              Width = 72
              Height = 12
              Caption = #48169#48276#44396#50669#48264#54840
            end
            object Label46: TLabel
              Left = 16
              Top = 131
              Width = 72
              Height = 12
              Caption = #54868#47732#51312#54924#49692#49436
            end
            object Label47: TLabel
              Left = 16
              Top = 157
              Width = 48
              Height = 12
              Caption = #50948#52824#51221#48372
              Visible = False
            end
            object cmb_sBuildingCode4: TComboBox
              Left = 96
              Top = 164
              Width = 180
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 0
              OnChange = cmb_sBuildingCode4Change
            end
            object cmb_sFloorCode4: TComboBox
              Left = 96
              Top = 189
              Width = 180
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 1
              OnChange = cmb_sFloorCode4Change
            end
            object cmb_sAreaCode4: TComboBox
              Left = 96
              Top = 214
              Width = 180
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 2
              OnChange = cmb_sAreaCode4Change
            end
            object cmb_sMCUCode4: TComboBox
              Left = 96
              Top = 20
              Width = 180
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 3
              OnChange = cmb_sMCUCode4Change
            end
            object cmb_sECUCode4: TComboBox
              Left = 96
              Top = 45
              Width = 180
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ItemIndex = 0
              TabOrder = 4
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
              Left = 96
              Top = 97
              Width = 180
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 30
              TabOrder = 5
            end
            object ed_AlarmNo4: TSpinEdit
              Left = 96
              Top = 71
              Width = 180
              Height = 21
              MaxValue = 1000
              MinValue = 1
              TabOrder = 6
              Value = 1
            end
            object ed_AlarmViewSeq: TEdit
              Left = 96
              Top = 127
              Width = 180
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 30
              TabOrder = 7
            end
            object chk_AlarmReg: TCheckBox
              Left = 96
              Top = 152
              Width = 49
              Height = 17
              Caption = #46321#47197
              TabOrder = 8
              Visible = False
            end
            object ed_NodeNo4: TEdit
              Left = 96
              Top = 8
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 9
              Visible = False
            end
            object ed_TotWidth4: TEdit
              Left = 152
              Top = 152
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 10
              Visible = False
            end
            object ed_TotHeight4: TEdit
              Left = 184
              Top = 152
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 11
              Visible = False
            end
            object ed_CurX4: TEdit
              Left = 216
              Top = 152
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 12
              Visible = False
            end
            object ed_CurY4: TEdit
              Left = 248
              Top = 152
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 13
              Visible = False
            end
            object btnAlarmPosition: TBitBtn
              Left = 96
              Top = 248
              Width = 180
              Height = 25
              Caption = #50948#52824#46321#47197
              TabOrder = 14
              OnClick = btnAlarmPositionClick
            end
          end
        end
        object Panel7: TPanel
          Left = 2
          Top = 14
          Width = 279
          Height = 428
          Align = alLeft
          TabOrder = 1
          object GroupBox18: TGroupBox
            Left = 1
            Top = 1
            Width = 277
            Height = 56
            Align = alTop
            TabOrder = 0
            object Label41: TLabel
              Left = 16
              Top = 24
              Width = 42
              Height = 12
              Caption = 'MCU'#53076#46300
            end
            object Label42: TLabel
              Left = 16
              Top = 24
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
              Visible = False
            end
            object Label43: TLabel
              Left = 16
              Top = 48
              Width = 36
              Height = 12
              Caption = #52789#53076#46300
              Visible = False
            end
            object Label44: TLabel
              Left = 16
              Top = 72
              Width = 48
              Height = 12
              Caption = #44396#50669#53076#46300
              Visible = False
            end
            object cmb_MCUCode4: TComboBox
              Left = 72
              Top = 20
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 0
              OnChange = cmb_MCUCode4Change
            end
            object cmb_BuildingCode4: TComboBox
              Left = 160
              Top = 20
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 1
              Visible = False
              OnChange = cmb_BuildingCode4Change
            end
            object cmb_FloorCode4: TComboBox
              Left = 72
              Top = 44
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 2
              Visible = False
              OnChange = cmb_FloorCode4Change
            end
            object cmb_AreaCode4: TComboBox
              Left = 72
              Top = 68
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 3
              Visible = False
              OnChange = cmb_AreaCode4Change
            end
          end
          object sg_AlarmCode: TAdvStringGrid
            Left = 1
            Top = 57
            Width = 277
            Height = 370
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
            TabOrder = 1
            OnClick = sg_AlarmCodeClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              'MCU'#44396#48516
              'ECUID'
              #48169#48276#48264#54840
              #48169#48276#47749#52845
              'NODENO'
              #48716#46377#53076#46300
              #52789#53076#46300
              #44396#50669#53076#46300
              #54868#47732#51312#54924#49692#49436
              #50948#52824#46321#47197#51221#48372
              'TotWidth'
              'TotHeight'
              'CurX'
              'CurY')
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
            FixedColWidth = 61
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
            Version = '6.0.4.4'
            ColWidths = (
              61
              42
              59
              90)
          end
        end
      end
    end
    object ZoneTab: TTabSheet
      Caption = #51316#50948#52824#44288#47532
      ImageIndex = 5
      TabVisible = False
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 1005
        Height = 444
        Align = alClient
        TabOrder = 0
        object Splitter6: TSplitter
          Left = 281
          Top = 14
          Height = 428
        end
        object Panel1: TPanel
          Left = 284
          Top = 14
          Width = 719
          Height = 428
          Align = alClient
          TabOrder = 0
          object GroupBox15: TGroupBox
            Left = 1
            Top = 1
            Width = 717
            Height = 426
            Align = alClient
            TabOrder = 0
            object Label64: TLabel
              Left = 16
              Top = 168
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
              Visible = False
            end
            object Label65: TLabel
              Left = 16
              Top = 193
              Width = 36
              Height = 12
              Caption = #52789#53076#46300
              Visible = False
            end
            object Label66: TLabel
              Left = 16
              Top = 218
              Width = 48
              Height = 12
              Caption = #44396#50669#53076#46300
              Visible = False
            end
            object Label68: TLabel
              Left = 16
              Top = 17
              Width = 48
              Height = 12
              Caption = #48169#48276#44396#50669
            end
            object Label69: TLabel
              Left = 16
              Top = 101
              Width = 36
              Height = 12
              Caption = #51316#47749#52845
              Visible = False
            end
            object Label70: TLabel
              Left = 16
              Top = 43
              Width = 36
              Height = 12
              Caption = #51316#48264#54840
            end
            object Label72: TLabel
              Left = 16
              Top = 157
              Width = 48
              Height = 12
              Caption = #50948#52824#51221#48372
              Visible = False
            end
            object cmb_sBuildingCode6: TComboBox
              Left = 96
              Top = 164
              Width = 180
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 0
              Visible = False
              OnChange = cmb_sBuildingCode6Change
            end
            object cmb_sFloorCode6: TComboBox
              Left = 96
              Top = 189
              Width = 180
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 1
              Visible = False
              OnChange = cmb_sFloorCode6Change
            end
            object cmb_sAreaCode6: TComboBox
              Left = 96
              Top = 214
              Width = 180
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 2
              Visible = False
            end
            object cmb_sAlarmCode6: TComboBox
              Left = 96
              Top = 13
              Width = 180
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
            object ed_ZoneName: TEdit
              Left = 96
              Top = 97
              Width = 180
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 30
              TabOrder = 4
              Visible = False
            end
            object ed_ZoneNo6: TSpinEdit
              Left = 96
              Top = 39
              Width = 180
              Height = 21
              MaxValue = 8
              MinValue = 1
              TabOrder = 5
              Value = 1
            end
            object chk_ZoneReg: TCheckBox
              Left = 96
              Top = 152
              Width = 49
              Height = 17
              Caption = #46321#47197
              TabOrder = 6
              Visible = False
            end
            object ed_TotWidth6: TEdit
              Left = 152
              Top = 152
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 7
              Visible = False
            end
            object ed_TotHeight6: TEdit
              Left = 184
              Top = 152
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 8
              Visible = False
            end
            object ed_CurX6: TEdit
              Left = 216
              Top = 152
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 9
              Visible = False
            end
            object ed_CurY6: TEdit
              Left = 248
              Top = 152
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 10
              Visible = False
            end
            object btnZonePosition: TBitBtn
              Left = 96
              Top = 248
              Width = 180
              Height = 25
              Caption = #50948#52824#46321#47197
              TabOrder = 11
              OnClick = btnZonePositionClick
            end
          end
        end
        object Panel13: TPanel
          Left = 2
          Top = 14
          Width = 279
          Height = 428
          Align = alLeft
          TabOrder = 1
          object GroupBox19: TGroupBox
            Left = 1
            Top = 1
            Width = 277
            Height = 80
            Align = alTop
            TabOrder = 0
            object Label73: TLabel
              Left = 16
              Top = 24
              Width = 48
              Height = 12
              Caption = #47700#51064#44396#48516
            end
            object Label71: TLabel
              Left = 16
              Top = 48
              Width = 48
              Height = 12
              Caption = #48169#48276#44396#50669
            end
            object cmb_MCUCode6: TComboBox
              Left = 72
              Top = 20
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 0
              OnChange = cmb_MCUCode6Change
            end
            object cmb_AlarmCode6: TComboBox
              Left = 72
              Top = 44
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 1
              OnChange = cmb_AlarmCode6Change
            end
          end
          object sg_ZoneCode: TAdvStringGrid
            Left = 1
            Top = 81
            Width = 277
            Height = 346
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
            TabOrder = 1
            OnClick = sg_ZoneCodeClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              #48169#48276#48264#54840
              #47700#51064#44396#48516
              #47196#52972'ID'
              'Zone NO'
              'NODENO'
              #48716#46377#53076#46300
              #52789#53076#46300
              #44396#50669#53076#46300
              #54868#47732#51312#54924#49692#49436
              #50948#52824#46321#47197#51221#48372
              'TotWidth'
              'TotHeight'
              'CurX'
              'CurY')
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
            FixedColWidth = 69
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
            Version = '6.0.4.4'
            ColWidths = (
              69
              61
              48
              64)
          end
        end
      end
    end
    object FoodTab: TTabSheet
      Caption = #49885#49688#44288#47532
      ImageIndex = 4
      TabVisible = False
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 1005
        Height = 444
        Align = alClient
        TabOrder = 0
        object Splitter5: TSplitter
          Left = 195
          Top = 14
          Height = 428
        end
        object Panel10: TPanel
          Left = 198
          Top = 14
          Width = 805
          Height = 428
          Align = alClient
          TabOrder = 0
          object GroupBox5: TGroupBox
            Left = 1
            Top = 1
            Width = 803
            Height = 336
            Align = alTop
            TabOrder = 0
            object Label50: TLabel
              Left = 16
              Top = 106
              Width = 78
              Height = 12
              Caption = #49885#49688#44396#50669' '#47749#52845
            end
            object Label51: TLabel
              Left = 16
              Top = 261
              Width = 48
              Height = 12
              Caption = #50948#52824#51221#48372
              Visible = False
            end
            object Label52: TLabel
              Left = 16
              Top = 176
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
            end
            object Label53: TLabel
              Left = 16
              Top = 201
              Width = 36
              Height = 12
              Caption = #52789#53076#46300
            end
            object Label54: TLabel
              Left = 16
              Top = 227
              Width = 48
              Height = 12
              Caption = #44396#50669#53076#46300
            end
            object Label55: TLabel
              Left = 16
              Top = 24
              Width = 48
              Height = 12
              Caption = #47700#51064#44396#48516
            end
            object Label56: TLabel
              Left = 16
              Top = 51
              Width = 36
              Height = 12
              Caption = #47196#52972'ID'
            end
            object Label57: TLabel
              Left = 16
              Top = 78
              Width = 60
              Height = 12
              Caption = #52636#51077#47928#48264#54840
            end
            object Label58: TLabel
              Left = 16
              Top = 130
              Width = 72
              Height = 12
              Caption = #49885#49688#44552#50529' PER'
              Visible = False
            end
            object ed_sFoodName: TEdit
              Left = 120
              Top = 102
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 0
            end
            object cmb_sBuildingCode5: TComboBox
              Left = 120
              Top = 172
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 1
              OnChange = cmb_sBuildingCode5Change
            end
            object cmb_sFloorCode5: TComboBox
              Left = 120
              Top = 197
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 2
              OnChange = cmb_sFloorCode5Change
            end
            object cmb_sAreaCode5: TComboBox
              Left = 120
              Top = 222
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 3
            end
            object cmb_sMCUCode5: TComboBox
              Left = 120
              Top = 20
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 4
              OnChange = cmb_sMCUCode5Change
            end
            object cmb_sECUCode5: TComboBox
              Left = 120
              Top = 47
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 5
            end
            object ed_sFoodNo: TSpinEdit
              Left = 120
              Top = 74
              Width = 217
              Height = 21
              MaxValue = 2
              MinValue = 1
              TabOrder = 6
              Value = 1
            end
            object chk_FoodReg: TCheckBox
              Left = 120
              Top = 256
              Width = 49
              Height = 17
              Caption = #46321#47197
              TabOrder = 7
              Visible = False
            end
            object ed_NodeNo5: TEdit
              Left = 120
              Top = 8
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 8
              Visible = False
            end
            object ed_TotWidth5: TEdit
              Left = 176
              Top = 248
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 9
              Visible = False
            end
            object ed_TotHeight5: TEdit
              Left = 208
              Top = 248
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 10
              Visible = False
            end
            object ed_CurX5: TEdit
              Left = 240
              Top = 248
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 11
              Visible = False
            end
            object ed_CurY5: TEdit
              Left = 272
              Top = 248
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 12
              Visible = False
            end
            object ed_FoodAmtPer: TEdit
              Left = 120
              Top = 126
              Width = 217
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 13
              Text = '100'
              Visible = False
            end
            object btnFoodPosition: TBitBtn
              Left = 120
              Top = 248
              Width = 217
              Height = 25
              Caption = #50948#52824#46321#47197
              TabOrder = 14
              OnClick = btnFoodPositionClick
            end
          end
        end
        object Panel11: TPanel
          Left = 2
          Top = 14
          Width = 193
          Height = 428
          Align = alLeft
          TabOrder = 1
          object GroupBox9: TGroupBox
            Left = 1
            Top = 1
            Width = 191
            Height = 72
            Align = alTop
            TabOrder = 0
            object Label59: TLabel
              Left = 16
              Top = 24
              Width = 48
              Height = 12
              Caption = #47700#51064#44396#48516
            end
            object Label60: TLabel
              Left = 16
              Top = 48
              Width = 36
              Height = 12
              Caption = #47196#52972'ID'
            end
            object Label61: TLabel
              Left = 16
              Top = 80
              Width = 48
              Height = 12
              Caption = #48716#46377#53076#46300
              Visible = False
            end
            object Label62: TLabel
              Left = 16
              Top = 104
              Width = 36
              Height = 12
              Caption = #52789#53076#46300
              Visible = False
            end
            object Label63: TLabel
              Left = 16
              Top = 128
              Width = 48
              Height = 12
              Caption = #44396#50669#53076#46300
              Visible = False
            end
            object cmb_MCUCode5: TComboBox
              Left = 72
              Top = 20
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 0
              OnChange = cmb_MCUCode5Change
            end
            object cmb_ECUCode5: TComboBox
              Left = 72
              Top = 44
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 1
              OnChange = cmb_ECUCode5Change
            end
            object ComboBox8: TComboBox
              Left = 72
              Top = 76
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 2
              Visible = False
              OnChange = cmb_BuildingCode3Change
            end
            object ComboBox9: TComboBox
              Left = 72
              Top = 100
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 3
              Visible = False
              OnChange = cmb_FloorCode3Change
            end
            object ComboBox10: TComboBox
              Left = 72
              Top = 124
              Width = 105
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 0
              TabOrder = 4
              Visible = False
              OnChange = cmb_AreaCode3Change
            end
          end
          object sg_FoodCode: TAdvStringGrid
            Left = 1
            Top = 73
            Width = 191
            Height = 354
            Cursor = crDefault
            Align = alClient
            ColCount = 14
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
            OnClick = sg_FoodCodeClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              'DOOR'#48264#54840
              #49885#49688#44396#50669#47749#52845
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
            FixedColWidth = 76
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
            Version = '6.0.4.4'
            ColWidths = (
              76
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
    end
  end
  object StatusBar1: TStatusBar [2]
    Left = 0
    Top = 569
    Width = 1013
    Height = 27
    Panels = <>
  end
  object GroupBox8: TGroupBox [3]
    Left = 0
    Top = 504
    Width = 1013
    Height = 65
    Align = alBottom
    TabOrder = 2
    object btn_Insert: TSpeedButton
      Left = 24
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
      Left = 115
      Top = 16
      Width = 100
      Height = 35
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
      Left = 206
      Top = 16
      Width = 100
      Height = 35
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
      Left = 297
      Top = 16
      Width = 100
      Height = 35
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
      Left = 388
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
  object Panel12: TPanel [4]
    Left = 0
    Top = 0
    Width = 1013
    Height = 33
    Align = alTop
    Caption = #52968#53944#47204#47084#44288#47532
    Color = 15387318
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object ADONode: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 64
    Top = 24
  end
  object ADOECU: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 128
    Top = 24
  end
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 200
    Top = 24
  end
  object ADOExec: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 240
    Top = 24
  end
end
