inherited fmATTypeAdmin: TfmATTypeAdmin
  Left = 298
  Top = 124
  Width = 629
  Height = 797
  BorderIcons = [biSystemMenu]
  Caption = #44540#53468#53440#51077#44288#47532
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
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 621
    Height = 697
    Align = alClient
    TabOrder = 0
    object Panel11: TPanel
      Left = 1
      Top = 1
      Width = 619
      Height = 33
      Align = alTop
      Caption = #44540#53468#53440#51077#44288#47532
      Color = 15387318
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel9: TPanel
      Left = 1
      Top = 281
      Width = 619
      Height = 415
      Align = alClient
      TabOrder = 1
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 280
        Height = 413
        Align = alLeft
        TabOrder = 0
        object sg_ATTypeCode: TAdvStringGrid
          Left = 1
          Top = 1
          Width = 278
          Height = 411
          Cursor = crDefault
          Align = alClient
          ColCount = 42
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
          OnClick = sg_ATTypeCodeClick
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ColumnHeaders.Strings = (
            #44540#53468#53440#51077#53076#46300
            #44540#53468#53440#51077#47749#52845)
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
            170
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
      object Panel4: TPanel
        Left = 281
        Top = 1
        Width = 337
        Height = 413
        Align = alClient
        TabOrder = 1
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 335
          Height = 88
          Align = alTop
          TabOrder = 0
          object Label1: TLabel
            Left = 12
            Top = 8
            Width = 72
            Height = 12
            Caption = #44540#53468#53440#51077#53076#46300
          end
          object Label2: TLabel
            Left = 14
            Top = 32
            Width = 72
            Height = 12
            Caption = #44540#53468#53440#51077#47749#52845
          end
          object lb_WorkerType: TLabel
            Left = 14
            Top = 56
            Width = 60
            Height = 12
            Caption = #44540#47924#51088#53440#51077
          end
          object ed_ATtypeCode: TEdit
            Left = 104
            Top = 4
            Width = 81
            Height = 20
            ImeName = 'Microsoft IME 2003'
            MaxLength = 3
            TabOrder = 0
            OnChange = ed_ATtypeCodeChange
          end
          object ed_atTypeName: TEdit
            Left = 104
            Top = 28
            Width = 209
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 1
          end
          object chk_AutoAtCode: TCheckBox
            Left = 200
            Top = 6
            Width = 113
            Height = 17
            Caption = #53076#46300#51088#46041#49373#49457
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = chk_AutoAtCodeClick
          end
          object cmb_WorkerType: TComboBox
            Left = 104
            Top = 52
            Width = 145
            Height = 20
            Style = csDropDownList
            ImeName = 'Microsoft Office IME 2007'
            ItemHeight = 12
            TabOrder = 3
          end
          object btn_WorkerType: TButton
            Left = 248
            Top = 54
            Width = 65
            Height = 17
            Caption = #53440#51077#44288#47532
            TabOrder = 4
            OnClick = btn_WorkerTypeClick
          end
        end
        object PageControl1: TPageControl
          Left = 1
          Top = 89
          Width = 335
          Height = 323
          ActivePage = WeekTab
          Align = alClient
          TabOrder = 1
          object WeekTab: TTabSheet
            Caption = #54217#51068
            object Label3: TLabel
              Left = 8
              Top = 16
              Width = 72
              Height = 12
              Caption = #52636#44540#44592#51456#49884#44036
            end
            object Label4: TLabel
              Left = 8
              Top = 40
              Width = 72
              Height = 12
              Caption = #51221#49345#52636#44540#49884#44036
            end
            object Label5: TLabel
              Left = 8
              Top = 64
              Width = 72
              Height = 12
              Caption = #52636#44540#44032#45733#49884#44036
            end
            object Label6: TLabel
              Left = 8
              Top = 88
              Width = 48
              Height = 12
              Caption = #53748#44540#49884#44036
            end
            object Label7: TLabel
              Left = 8
              Top = 112
              Width = 96
              Height = 12
              Caption = #50672#51109#44540#47924#49884#51089#49884#44036
            end
            object Label8: TLabel
              Left = 8
              Top = 136
              Width = 96
              Height = 12
              Caption = #50556#44036#44540#47924#49884#51089#49884#44036
            end
            object Label15: TLabel
              Left = 152
              Top = 16
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label16: TLabel
              Left = 200
              Top = 16
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label17: TLabel
              Left = 152
              Top = 40
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label18: TLabel
              Left = 200
              Top = 40
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label19: TLabel
              Left = 152
              Top = 64
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label20: TLabel
              Left = 200
              Top = 64
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label21: TLabel
              Left = 152
              Top = 88
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label22: TLabel
              Left = 200
              Top = 88
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label23: TLabel
              Left = 152
              Top = 112
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label24: TLabel
              Left = 200
              Top = 112
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label25: TLabel
              Left = 200
              Top = 136
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label26: TLabel
              Left = 152
              Top = 136
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label118: TLabel
              Left = 8
              Top = 162
              Width = 72
              Height = 12
              Caption = #53748#44540#44032#45733#49884#44036
            end
            object Label119: TLabel
              Left = 152
              Top = 160
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label120: TLabel
              Left = 200
              Top = 160
              Width = 12
              Height = 12
              Caption = #48516
            end
            object GroupBox1: TGroupBox
              Left = 0
              Top = 175
              Width = 327
              Height = 121
              Align = alBottom
              Caption = #44553#50668#44228#49328#54637#47785
              TabOrder = 0
              object Label9: TLabel
                Left = 8
                Top = 24
                Width = 48
                Height = 12
                Caption = #51312#44592#52636#44540
              end
              object Label10: TLabel
                Left = 8
                Top = 48
                Width = 48
                Height = 12
                Caption = #51221#49345#52636#44540
              end
              object Label11: TLabel
                Left = 8
                Top = 120
                Width = 24
                Height = 12
                Caption = #51648#44033
                Visible = False
              end
              object Label12: TLabel
                Left = 8
                Top = 144
                Width = 24
                Height = 12
                Caption = #51312#53748
                Visible = False
              end
              object Label13: TLabel
                Left = 8
                Top = 72
                Width = 48
                Height = 12
                Caption = #50672#51109#44540#47924
              end
              object Label14: TLabel
                Left = 8
                Top = 96
                Width = 48
                Height = 12
                Caption = #50556#44036#44540#47924
              end
              object Label27: TLabel
                Left = 112
                Top = 24
                Width = 54
                Height = 12
                Caption = #54532#47196' '#44032#49328
              end
              object Label28: TLabel
                Left = 112
                Top = 48
                Width = 54
                Height = 12
                Caption = #54532#47196' '#44032#49328
              end
              object Label29: TLabel
                Left = 112
                Top = 120
                Width = 54
                Height = 12
                Caption = #54532#47196' '#49325#44048
                Visible = False
              end
              object Label30: TLabel
                Left = 112
                Top = 144
                Width = 54
                Height = 12
                Caption = #54532#47196' '#49325#44048
                Visible = False
              end
              object Label31: TLabel
                Left = 112
                Top = 72
                Width = 54
                Height = 12
                Caption = #54532#47196' '#44032#49328
              end
              object Label32: TLabel
                Left = 112
                Top = 96
                Width = 54
                Height = 12
                Caption = #54532#47196' '#44032#49328
              end
              object ed_WEarlyAdd: TEdit
                Left = 80
                Top = 22
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 1
                Text = '0'
              end
              object ed_WNormalAdd: TEdit
                Left = 80
                Top = 46
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 2
                Text = '0'
              end
              object ed_WJigakAdd: TEdit
                Left = 80
                Top = 118
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 3
                Text = '0'
                Visible = False
              end
              object ed_WOutAdd: TEdit
                Left = 80
                Top = 142
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 4
                Text = '0'
                Visible = False
              end
              object ed_WExtendAdd: TEdit
                Left = 80
                Top = 70
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 5
                Text = '50'
              end
              object ed_WNightAdd: TEdit
                Left = 80
                Top = 94
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 6
                Text = '50'
              end
              object Panel6: TPanel
                Left = 176
                Top = 24
                Width = 145
                Height = 89
                TabOrder = 0
                object Label93: TLabel
                  Left = 1
                  Top = 1
                  Width = 143
                  Height = 87
                  Align = alClient
                  Alignment = taCenter
                  Caption = #13#10#44553#50668#54637#47785#51008' '#13#10#45800#49692#52280#44256#50857#51088#47308#51077#45768#45796'.'#13#10#13#10#51208#45824#47196' '#54924#44228#51088#47308#47196' '#13#10#49324#50857#54616#51648' '#47560#49464#50836'.'
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clRed
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
            end
            object ed_WEarlyHH: TEdit
              Left = 120
              Top = 14
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 1
              Text = '00'
            end
            object ed_WEarlyMM: TEdit
              Left = 168
              Top = 14
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 2
              Text = '00'
            end
            object ed_WNormalHH: TEdit
              Left = 120
              Top = 38
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 3
              Text = '09'
            end
            object ed_WNormalMM: TEdit
              Left = 168
              Top = 38
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 4
              Text = '00'
            end
            object ed_WJigakHH: TEdit
              Left = 120
              Top = 62
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 5
              Text = '18'
            end
            object ed_WJigakMM: TEdit
              Left = 168
              Top = 62
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 6
              Text = '00'
            end
            object ed_WOutHH: TEdit
              Left = 120
              Top = 86
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 7
              Text = '18'
            end
            object ed_WOutMM: TEdit
              Left = 168
              Top = 86
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 8
              Text = '00'
            end
            object ed_WExtendHH: TEdit
              Left = 120
              Top = 110
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 9
              Text = '20'
            end
            object ed_WExtendMM: TEdit
              Left = 168
              Top = 110
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 10
              Text = '00'
            end
            object ed_WNightMM: TEdit
              Left = 168
              Top = 134
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 12
              Text = '00'
            end
            object ed_WNightHH: TEdit
              Left = 120
              Top = 134
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 11
              Text = '24'
            end
            object ed_OutRangeHH: TEdit
              Left = 120
              Top = 158
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 13
              Text = '18'
            end
            object ed_OutRangeMM: TEdit
              Left = 168
              Top = 158
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 14
              Text = '00'
            end
          end
          object SaturdayTab: TTabSheet
            Caption = #53664#50836#51068
            ImageIndex = 1
            object Label45: TLabel
              Left = 8
              Top = 16
              Width = 72
              Height = 12
              Caption = #52636#44540#44592#51456#49884#44036
            end
            object Label46: TLabel
              Left = 152
              Top = 16
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label47: TLabel
              Left = 200
              Top = 16
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label48: TLabel
              Left = 200
              Top = 40
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label49: TLabel
              Left = 152
              Top = 40
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label50: TLabel
              Left = 8
              Top = 40
              Width = 72
              Height = 12
              Caption = #51221#49345#52636#44540#49884#44036
            end
            object Label51: TLabel
              Left = 8
              Top = 64
              Width = 72
              Height = 12
              Caption = #52636#44540#44032#45733#49884#44036
            end
            object Label52: TLabel
              Left = 152
              Top = 64
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label53: TLabel
              Left = 200
              Top = 64
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label54: TLabel
              Left = 200
              Top = 88
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label55: TLabel
              Left = 152
              Top = 88
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label56: TLabel
              Left = 8
              Top = 88
              Width = 48
              Height = 12
              Caption = #53748#44540#49884#44036
            end
            object Label57: TLabel
              Left = 8
              Top = 112
              Width = 96
              Height = 12
              Caption = #50672#51109#44540#47924#49884#51089#49884#44036
            end
            object Label58: TLabel
              Left = 152
              Top = 112
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label59: TLabel
              Left = 200
              Top = 112
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label60: TLabel
              Left = 200
              Top = 136
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label61: TLabel
              Left = 152
              Top = 136
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label62: TLabel
              Left = 8
              Top = 136
              Width = 96
              Height = 12
              Caption = #50556#44036#44540#47924#49884#51089#49884#44036
            end
            object Label121: TLabel
              Left = 8
              Top = 160
              Width = 72
              Height = 12
              Caption = #53748#44540#44032#45733#49884#44036
            end
            object Label122: TLabel
              Left = 152
              Top = 160
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label123: TLabel
              Left = 200
              Top = 160
              Width = 12
              Height = 12
              Caption = #48516
            end
            object GroupBox2: TGroupBox
              Left = 0
              Top = 175
              Width = 327
              Height = 121
              Align = alBottom
              Caption = #44553#50668#44228#49328#54637#47785
              TabOrder = 0
              object Label33: TLabel
                Left = 8
                Top = 24
                Width = 48
                Height = 12
                Caption = #51312#44592#52636#44540
              end
              object Label34: TLabel
                Left = 8
                Top = 48
                Width = 48
                Height = 12
                Caption = #51221#49345#52636#44540
              end
              object Label35: TLabel
                Left = 8
                Top = 120
                Width = 24
                Height = 12
                Caption = #51648#44033
                Visible = False
              end
              object Label36: TLabel
                Left = 8
                Top = 144
                Width = 24
                Height = 12
                Caption = #51312#53748
                Visible = False
              end
              object Label37: TLabel
                Left = 8
                Top = 72
                Width = 48
                Height = 12
                Caption = #50672#51109#44540#47924
              end
              object Label38: TLabel
                Left = 8
                Top = 96
                Width = 48
                Height = 12
                Caption = #50556#44036#44540#47924
              end
              object Label39: TLabel
                Left = 112
                Top = 24
                Width = 54
                Height = 12
                Caption = #54532#47196' '#44032#49328
              end
              object Label40: TLabel
                Left = 112
                Top = 48
                Width = 54
                Height = 12
                Caption = #54532#47196' '#44032#49328
              end
              object Label41: TLabel
                Left = 112
                Top = 120
                Width = 54
                Height = 12
                Caption = #54532#47196' '#49325#44048
                Visible = False
              end
              object Label42: TLabel
                Left = 112
                Top = 144
                Width = 54
                Height = 12
                Caption = #54532#47196' '#49325#44048
                Visible = False
              end
              object Label43: TLabel
                Left = 112
                Top = 72
                Width = 54
                Height = 12
                Caption = #54532#47196' '#44032#49328
              end
              object Label44: TLabel
                Left = 112
                Top = 96
                Width = 54
                Height = 12
                Caption = #54532#47196' '#44032#49328
              end
              object ed_SEarlyAdd: TEdit
                Left = 80
                Top = 22
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 1
                Text = '0'
              end
              object ed_SNormalAdd: TEdit
                Left = 80
                Top = 46
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 2
                Text = '0'
              end
              object ed_SJigakAdd: TEdit
                Left = 80
                Top = 118
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 3
                Text = '0'
                Visible = False
              end
              object ed_SOutAdd: TEdit
                Left = 80
                Top = 142
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 4
                Text = '0'
                Visible = False
              end
              object ed_SExtendAdd: TEdit
                Left = 80
                Top = 70
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 5
                Text = '50'
              end
              object ed_SNightAdd: TEdit
                Left = 80
                Top = 94
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 6
                Text = '50'
              end
              object Panel7: TPanel
                Left = 176
                Top = 24
                Width = 145
                Height = 89
                TabOrder = 0
                object Label94: TLabel
                  Left = 1
                  Top = 1
                  Width = 137
                  Height = 72
                  Align = alClient
                  Alignment = taCenter
                  Caption = #13#10#44553#50668#54637#47785#51008' '#13#10#45800#49692#52280#44256#50857#51088#47308#51077#45768#45796'.'#13#10#13#10#51208#45824#47196' '#54924#44228#51088#47308#47196' '#13#10#49324#50857#54616#51648' '#47560#49464#50836'.'
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clRed
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
            end
            object ed_SEarlyHH: TEdit
              Left = 120
              Top = 14
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 1
              Text = '00'
            end
            object ed_SEarlyMM: TEdit
              Left = 168
              Top = 14
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 2
              Text = '00'
            end
            object ed_SNormalMM: TEdit
              Left = 168
              Top = 38
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 4
              Text = '00'
            end
            object ed_SNormalHH: TEdit
              Left = 120
              Top = 38
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 3
              Text = '09'
            end
            object ed_SJigakHH: TEdit
              Left = 120
              Top = 62
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 5
              Text = '13'
            end
            object ed_SJigakMM: TEdit
              Left = 168
              Top = 62
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 6
              Text = '00'
            end
            object ed_SOutMM: TEdit
              Left = 168
              Top = 86
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 8
              Text = '00'
            end
            object ed_SOutHH: TEdit
              Left = 120
              Top = 86
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 7
              Text = '13'
            end
            object ed_SExtendHH: TEdit
              Left = 120
              Top = 110
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 9
              Text = '15'
            end
            object ed_SExtendMM: TEdit
              Left = 168
              Top = 110
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 10
              Text = '00'
            end
            object ed_SNightMM: TEdit
              Left = 168
              Top = 134
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 12
              Text = '00'
            end
            object ed_SNightHH: TEdit
              Left = 120
              Top = 134
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 11
              Text = '20'
            end
            object ed_sOutRangeHH: TEdit
              Left = 120
              Top = 158
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 13
              Text = '18'
            end
            object ed_sOutRangeMM: TEdit
              Left = 168
              Top = 158
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 14
              Text = '00'
            end
          end
          object HolidayTab: TTabSheet
            Caption = #44277#55092#51068'('#51068#50836#51068')'
            ImageIndex = 2
            object Label75: TLabel
              Left = 8
              Top = 16
              Width = 72
              Height = 12
              Caption = #52636#44540#44592#51456#49884#44036
            end
            object Label76: TLabel
              Left = 152
              Top = 16
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label77: TLabel
              Left = 200
              Top = 16
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label78: TLabel
              Left = 200
              Top = 40
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label79: TLabel
              Left = 152
              Top = 40
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label80: TLabel
              Left = 8
              Top = 40
              Width = 72
              Height = 12
              Caption = #51221#49345#52636#44540#49884#44036
            end
            object Label81: TLabel
              Left = 8
              Top = 64
              Width = 72
              Height = 12
              Caption = #52636#44540#44032#45733#49884#44036
            end
            object Label82: TLabel
              Left = 152
              Top = 64
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label83: TLabel
              Left = 200
              Top = 64
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label84: TLabel
              Left = 200
              Top = 88
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label85: TLabel
              Left = 152
              Top = 88
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label86: TLabel
              Left = 8
              Top = 88
              Width = 48
              Height = 12
              Caption = #53748#44540#49884#44036
            end
            object Label87: TLabel
              Left = 8
              Top = 112
              Width = 96
              Height = 12
              Caption = #50672#51109#44540#47924#49884#51089#49884#44036
            end
            object Label88: TLabel
              Left = 152
              Top = 112
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label89: TLabel
              Left = 200
              Top = 112
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label90: TLabel
              Left = 200
              Top = 136
              Width = 12
              Height = 12
              Caption = #48516
            end
            object Label91: TLabel
              Left = 152
              Top = 136
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label92: TLabel
              Left = 8
              Top = 136
              Width = 96
              Height = 12
              Caption = #50556#44036#44540#47924#49884#51089#49884#44036
            end
            object Label124: TLabel
              Left = 8
              Top = 160
              Width = 72
              Height = 12
              Caption = #53748#44540#44032#45733#49884#44036
            end
            object Label125: TLabel
              Left = 152
              Top = 160
              Width = 12
              Height = 12
              Caption = #49884
            end
            object Label126: TLabel
              Left = 200
              Top = 160
              Width = 12
              Height = 12
              Caption = #48516
            end
            object GroupBox3: TGroupBox
              Left = 0
              Top = 175
              Width = 327
              Height = 121
              Align = alBottom
              Caption = #44553#50668#44228#49328#54637#47785
              TabOrder = 0
              object Label63: TLabel
                Left = 8
                Top = 24
                Width = 48
                Height = 12
                Caption = #51312#44592#52636#44540
              end
              object Label64: TLabel
                Left = 8
                Top = 48
                Width = 48
                Height = 12
                Caption = #51221#49345#52636#44540
              end
              object Label65: TLabel
                Left = 8
                Top = 120
                Width = 24
                Height = 12
                Caption = #51648#44033
                Visible = False
              end
              object Label66: TLabel
                Left = 8
                Top = 144
                Width = 24
                Height = 12
                Caption = #51312#53748
                Visible = False
              end
              object Label67: TLabel
                Left = 8
                Top = 72
                Width = 48
                Height = 12
                Caption = #50672#51109#44540#47924
              end
              object Label68: TLabel
                Left = 8
                Top = 96
                Width = 48
                Height = 12
                Caption = #50556#44036#44540#47924
              end
              object Label69: TLabel
                Left = 112
                Top = 24
                Width = 54
                Height = 12
                Caption = #54532#47196' '#44032#49328
              end
              object Label70: TLabel
                Left = 112
                Top = 48
                Width = 54
                Height = 12
                Caption = #54532#47196' '#44032#49328
              end
              object Label71: TLabel
                Left = 112
                Top = 120
                Width = 54
                Height = 12
                Caption = #54532#47196' '#49325#44048
                Visible = False
              end
              object Label72: TLabel
                Left = 112
                Top = 144
                Width = 54
                Height = 12
                Caption = #54532#47196' '#49325#44048
                Visible = False
              end
              object Label73: TLabel
                Left = 112
                Top = 72
                Width = 54
                Height = 12
                Caption = #54532#47196' '#44032#49328
              end
              object Label74: TLabel
                Left = 112
                Top = 96
                Width = 54
                Height = 12
                Caption = #54532#47196' '#44032#49328
              end
              object ed_HEarlyAdd: TEdit
                Left = 80
                Top = 22
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 1
                Text = '0'
              end
              object ed_HNormalAdd: TEdit
                Left = 80
                Top = 46
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 2
                Text = '50'
              end
              object ed_HJigakAdd: TEdit
                Left = 80
                Top = 118
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 3
                Text = '0'
                Visible = False
              end
              object ed_HOutAdd: TEdit
                Left = 80
                Top = 142
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 4
                Text = '0'
                Visible = False
              end
              object ed_HExtendAdd: TEdit
                Left = 80
                Top = 70
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 5
                Text = '50'
              end
              object ed_HNightAdd: TEdit
                Left = 80
                Top = 94
                Width = 25
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 6
                Text = '50'
              end
              object Panel8: TPanel
                Left = 176
                Top = 24
                Width = 145
                Height = 89
                TabOrder = 0
                object Label95: TLabel
                  Left = 1
                  Top = 1
                  Width = 137
                  Height = 72
                  Align = alClient
                  Alignment = taCenter
                  Caption = #13#10#44553#50668#54637#47785#51008' '#13#10#45800#49692#52280#44256#50857#51088#47308#51077#45768#45796'.'#13#10#13#10#51208#45824#47196' '#54924#44228#51088#47308#47196' '#13#10#49324#50857#54616#51648' '#47560#49464#50836'.'
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clRed
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
            end
            object ed_HEarlyHH: TEdit
              Left = 120
              Top = 14
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 1
              Text = '00'
            end
            object ed_HEarlyMM: TEdit
              Left = 168
              Top = 14
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 2
              Text = '00'
            end
            object ed_HNormalMM: TEdit
              Left = 168
              Top = 38
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 4
              Text = '00'
            end
            object ed_HNormalHH: TEdit
              Left = 120
              Top = 38
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 3
              Text = '09'
            end
            object ed_HJigakHH: TEdit
              Left = 120
              Top = 62
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 5
              Text = '18'
            end
            object ed_HJigakMM: TEdit
              Left = 168
              Top = 62
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 6
              Text = '00'
            end
            object ed_HOutMM: TEdit
              Left = 168
              Top = 86
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 8
              Text = '00'
            end
            object ed_HOutHH: TEdit
              Left = 120
              Top = 86
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 7
              Text = '18'
            end
            object ed_HExtendHH: TEdit
              Left = 120
              Top = 110
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 9
              Text = '20'
            end
            object ed_HExtendMM: TEdit
              Left = 168
              Top = 110
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 10
              Text = '00'
            end
            object ed_HNightMM: TEdit
              Left = 168
              Top = 134
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 12
              Text = '00'
            end
            object ed_HNightHH: TEdit
              Left = 120
              Top = 134
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 11
              Text = '24'
            end
            object ed_hOutRangeHH: TEdit
              Left = 120
              Top = 158
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 13
              Text = '18'
            end
            object ed_hOutRangeMM: TEdit
              Left = 168
              Top = 158
              Width = 25
              Height = 20
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              TabOrder = 14
              Text = '00'
            end
          end
        end
      end
    end
    object Panel10: TPanel
      Left = 1
      Top = 114
      Width = 619
      Height = 167
      Align = alTop
      TabOrder = 2
      object GroupBox5: TGroupBox
        Left = 1
        Top = 1
        Width = 617
        Height = 165
        Align = alClient
        Caption = #44540#47924#54872#44221
        TabOrder = 0
        object Panel12: TPanel
          Left = 2
          Top = 85
          Width = 613
          Height = 78
          Align = alBottom
          TabOrder = 0
          object Label100: TLabel
            Left = 8
            Top = 32
            Width = 72
            Height = 12
            Caption = #54217#51068#50672#51109#44540#47924
          end
          object Label101: TLabel
            Left = 128
            Top = 32
            Width = 48
            Height = 12
            Caption = #54532#47196#44032#49328
          end
          object Label102: TLabel
            Left = 8
            Top = 56
            Width = 72
            Height = 12
            Caption = #54217#51068#50556#44036#44540#47924
          end
          object Label103: TLabel
            Left = 128
            Top = 56
            Width = 48
            Height = 12
            Caption = #54532#47196#44032#49328
          end
          object Label104: TLabel
            Left = 8
            Top = 8
            Width = 72
            Height = 12
            Caption = #54217#51068#51312#44592#44540#47924
          end
          object Label105: TLabel
            Left = 128
            Top = 8
            Width = 48
            Height = 12
            Caption = #54532#47196#44032#49328
          end
          object Label106: TLabel
            Left = 184
            Top = 8
            Width = 84
            Height = 12
            Caption = #53664#50836#51068#51312#44592#44540#47924
          end
          object Label107: TLabel
            Left = 304
            Top = 8
            Width = 48
            Height = 12
            Caption = #54532#47196#44032#49328
          end
          object Label108: TLabel
            Left = 304
            Top = 32
            Width = 48
            Height = 12
            Caption = #54532#47196#44032#49328
          end
          object Label109: TLabel
            Left = 184
            Top = 32
            Width = 84
            Height = 12
            Caption = #53664#50836#51068#50672#51109#44540#47924
          end
          object Label110: TLabel
            Left = 184
            Top = 56
            Width = 84
            Height = 12
            Caption = #53664#50836#51068#50556#44036#44540#47924
          end
          object Label111: TLabel
            Left = 304
            Top = 56
            Width = 48
            Height = 12
            Caption = #54532#47196#44032#49328
          end
          object Label112: TLabel
            Left = 368
            Top = 8
            Width = 84
            Height = 12
            Caption = #44277#55092#51068#44592#48376#44540#47924
          end
          object Label113: TLabel
            Left = 488
            Top = 8
            Width = 48
            Height = 12
            Caption = #54532#47196#44032#49328
          end
          object Label114: TLabel
            Left = 368
            Top = 32
            Width = 84
            Height = 12
            Caption = #44277#55092#51068#50672#51109#44540#47924
          end
          object Label115: TLabel
            Left = 488
            Top = 32
            Width = 48
            Height = 12
            Caption = #54532#47196#44032#49328
          end
          object Label116: TLabel
            Left = 368
            Top = 56
            Width = 84
            Height = 12
            Caption = #44277#55092#51068#50556#44036#44540#47924
          end
          object Label117: TLabel
            Left = 488
            Top = 56
            Width = 48
            Height = 12
            Caption = #54532#47196#44032#49328
          end
          object ed_BwExtendAdd: TEdit
            Left = 96
            Top = 28
            Width = 33
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 0
            Text = '25'
            OnExit = ed_BwExtendAddExit
          end
          object ed_BwNightAdd: TEdit
            Left = 96
            Top = 52
            Width = 33
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 1
            Text = '50'
            OnExit = ed_BwNightAddExit
          end
          object ed_BwEarlyAdd: TEdit
            Left = 96
            Top = 4
            Width = 33
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 2
            Text = '0'
            OnExit = ed_BwEarlyAddExit
          end
          object ed_BsEarlyAdd: TEdit
            Left = 272
            Top = 4
            Width = 33
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 3
            Text = '0'
            OnExit = ed_BsEarlyAddExit
          end
          object ed_BsExtendAdd: TEdit
            Left = 272
            Top = 28
            Width = 33
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 4
            Text = '25'
            OnExit = ed_BsExtendAddExit
          end
          object ed_BsNightAdd: TEdit
            Left = 272
            Top = 52
            Width = 33
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 5
            Text = '50'
            OnExit = ed_BsNightAddExit
          end
          object ed_BhNormalAdd: TEdit
            Left = 456
            Top = 4
            Width = 33
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 6
            Text = '25'
            OnExit = ed_BhNormalAddExit
          end
          object ed_BhExtendAdd: TEdit
            Left = 456
            Top = 28
            Width = 33
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 7
            Text = '50'
            OnExit = ed_BhExtendAddExit
          end
          object ed_BhNightAdd: TEdit
            Left = 456
            Top = 52
            Width = 33
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 8
            Text = '50'
            OnExit = ed_BhNightAddExit
          end
        end
        object rg_atTypePay: TRadioGroup
          Left = 2
          Top = 49
          Width = 613
          Height = 40
          Align = alTop
          Caption = #49688#45817' '#44228#49328' '#48169#49885
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            #44540#53468#53440#51077#48324#44228#49328
            #51204#52404#46041#51068#44228#49328
            #44060#51064#48324#44228#49328)
          TabOrder = 1
          OnClick = rg_atTypePayClick
        end
        object Panel13: TPanel
          Left = 2
          Top = 14
          Width = 613
          Height = 35
          Align = alTop
          TabOrder = 2
          object Label96: TLabel
            Left = 8
            Top = 11
            Width = 12
            Height = 12
            Caption = #51452
          end
          object Label97: TLabel
            Left = 72
            Top = 11
            Width = 36
            Height = 12
            Caption = #49884#44036#51228
          end
          object Label98: TLabel
            Left = 160
            Top = 11
            Width = 60
            Height = 12
            Caption = #47588#50900#44592#51456#51068
          end
          object Label99: TLabel
            Left = 272
            Top = 11
            Width = 12
            Height = 12
            Caption = #51068
          end
          object btn_AttendConfig: TSpeedButton
            Left = 471
            Top = 2
            Width = 122
            Height = 30
            Caption = #44540#47924#54872#44221#51200#51109
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
            Visible = False
            OnClick = btn_AttendConfigClick
          end
          object ed_WeekTime: TEdit
            Left = 32
            Top = 7
            Width = 33
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 0
            Text = '40'
            OnExit = ed_WeekTimeExit
          end
          object ed_MonthLastDay: TEdit
            Left = 232
            Top = 7
            Width = 33
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 1
            Text = '31'
            OnExit = ed_MonthLastDayExit
          end
        end
      end
    end
    object rg_atType: TRadioGroup
      Left = 1
      Top = 34
      Width = 619
      Height = 39
      Align = alTop
      Caption = #44368#45824#44540#47924#53440#51077
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        #44256#51221#44540#47924#53440#51077
        #49324#50896#48324#44540#47924#53440#51077
        #44368#45824#44540#47924#53440#51077
        #54844#54633)
      TabOrder = 3
      OnClick = rg_atTypeClick
    end
    object rg_atType1: TRadioGroup
      Left = 1
      Top = 73
      Width = 619
      Height = 41
      Align = alTop
      Caption = #44540#47924#53440#51077#50640' '#46384#47480' '#52636#44540#53440#51077
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #44540#47924#53440#51077#50640#46384#47480#52636#53748#44540#52376#47532
        #51204#49324#50896' '#51221#49884' '#52636#53748#44540#52376#47532)
      TabOrder = 4
      OnClick = rg_atType1Click
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 697
    Width = 621
    Height = 66
    Align = alBottom
    TabOrder = 1
    object btn_Insert: TSpeedButton
      Left = 32
      Top = 16
      Width = 81
      Height = 30
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
      Left = 124
      Top = 16
      Width = 81
      Height = 30
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
      Left = 217
      Top = 16
      Width = 81
      Height = 30
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
      Left = 310
      Top = 16
      Width = 81
      Height = 30
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
    object btn_Cancel: TSpeedButton
      Left = 403
      Top = 16
      Width = 81
      Height = 30
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
      Left = 496
      Top = 16
      Width = 81
      Height = 30
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
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 104
    Top = 96
  end
  object ADOTemp: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 144
    Top = 96
  end
end
