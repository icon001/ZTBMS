inherited fmQueryAlarmMonitoring: TfmQueryAlarmMonitoring
  Left = 230
  Top = 20
  Width = 1016
  Height = 650
  Caption = #44288#51228#49884#49828#53596
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter [0]
    Left = 217
    Top = 0
    Height = 616
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 217
    Height = 616
    Align = alLeft
    TabOrder = 0
    OnResize = Panel1Resize
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 215
      Height = 614
      ActivePage = tbDEVICE
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object tbLOCATE: TTabSheet
        Caption = #50948#52824#48324#44396#49457
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 207
          Height = 587
          Align = alClient
          TabOrder = 0
          object TreeView_Location: TTreeView
            Left = 2
            Top = 23
            Width = 203
            Height = 562
            Align = alClient
            BorderStyle = bsNone
            HotTrack = True
            Images = toolslist
            Indent = 19
            PopupMenu = Popup_Locate
            TabOrder = 0
            ToolTips = False
            OnClick = TreeView_LocationClick
            Items.Data = {
              010000001D0000000B0000000B000000FFFFFFFFFFFFFFFF0000000002000000
              04C0A7C4A11B0000000700000007000000FFFFFFFFFFFFFFFF00000000020000
              0002B5BF1B0000000800000008000000FFFFFFFFFFFFFFFF0000000001000000
              02C3FE1D0000000900000000000000FFFFFFFFFFFFFFFF000000000200000004
              B1B8BFAA1B0000000A00000000000000FFFFFFFFFFFFFFFF0000000000000000
              02B9AE210000000000000000000000FFFFFFFFFFFFFFFF000000000000000008
              B9E6B9FCB1B8BFAA1B0000000800000008000000FFFFFFFFFFFFFFFF00000000
              0000000002C3FE1B0000000700000007000000FFFFFFFFFFFFFFFF0000000001
              00000002B5BF1B0000000800000008000000FFFFFFFFFFFFFFFF000000000100
              000002C3FE1D0000000900000000000000FFFFFFFFFFFFFFFF00000000040000
              0004B1B8BFAA1B0000000A00000000000000FFFFFFFFFFFFFFFF000000000000
              000002B9AE1B0000000A00000000000000FFFFFFFFFFFFFFFF00000000000000
              0002B9AE210000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
              08B0E6BAF1B1B8BFAA190000000000000000000000FFFFFFFFFFFFFFFF000000
              000000000000}
          end
          object Shader2: TShader
            Left = 2
            Top = 14
            Width = 203
            Height = 9
            Align = alTop
            Caption = 'Shader1'
            TabOrder = 1
            FromColor = 15591915
            ToColor = clSilver
            Direction = False
            Version = '1.1.0.0'
          end
          object TreeView_LocationCode: TTreeView
            Left = 2
            Top = 424
            Width = 203
            Height = 81
            Align = alCustom
            BorderStyle = bsNone
            HotTrack = True
            Images = toolslist
            Indent = 19
            TabOrder = 2
            ToolTips = False
            Visible = False
            Items.Data = {
              010000001D0000000B0000000B000000FFFFFFFFFFFFFFFF0000000002000000
              04C0A7C4A11B0000000700000007000000FFFFFFFFFFFFFFFF00000000020000
              0002B5BF1B0000000800000008000000FFFFFFFFFFFFFFFF0000000001000000
              02C3FE1D0000000900000000000000FFFFFFFFFFFFFFFF000000000200000004
              B1B8BFAA1B0000000A00000000000000FFFFFFFFFFFFFFFF0000000000000000
              02B9AE210000000000000000000000FFFFFFFFFFFFFFFF000000000000000008
              B9E6B9FCB1B8BFAA1B0000000800000008000000FFFFFFFFFFFFFFFF00000000
              0000000002C3FE1B0000000700000007000000FFFFFFFFFFFFFFFF0000000001
              00000002B5BF1B0000000800000008000000FFFFFFFFFFFFFFFF000000000100
              000002C3FE1D0000000900000000000000FFFFFFFFFFFFFFFF00000000040000
              0004B1B8BFAA1B0000000A00000000000000FFFFFFFFFFFFFFFF000000000000
              000002B9AE1B0000000A00000000000000FFFFFFFFFFFFFFFF00000000000000
              0002B9AE210000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
              08B0E6BAF1B1B8BFAA190000000000000000000000FFFFFFFFFFFFFFFF000000
              000000000000}
          end
        end
      end
      object tbDEVICE: TTabSheet
        Caption = #44592#44592#48324#44396#49457
        ImageIndex = 1
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 207
          Height = 587
          Align = alClient
          TabOrder = 0
          object TreeView_Device: TTreeView
            Left = 2
            Top = 23
            Width = 203
            Height = 562
            Align = alClient
            BorderStyle = bsNone
            HotTrack = True
            Images = toolslist
            Indent = 19
            PopupMenu = Popup_Device
            TabOrder = 0
            OnClick = TreeView_DeviceClick
            Items.Data = {
              010000001F0000000000000000000000FFFFFFFFFFFFFFFF0000000002000000
              065365727665722A0000000100000000000000FFFFFFFFFFFFFFFF0000000003
              000000113139322E3136382E302E33303A333030302200000003000000000000
              00FFFFFFFFFFFFFFFF0000000000000000093130303030303130312200000003
              00000000000000FFFFFFFFFFFFFFFF0000000000000000093130303030303130
              32220000000400000000000000FFFFFFFFFFFFFFFF0000000000000000093130
              303030303230332A0000000200000000000000FFFFFFFFFFFFFFFF0000000001
              000000113139322E3136382E302E33313A333030302200000003000000000000
              00FFFFFFFFFFFFFFFF000000000000000009313030303030323031}
          end
          object Shader3: TShader
            Left = 2
            Top = 14
            Width = 203
            Height = 9
            Align = alTop
            Caption = 'Shader1'
            TabOrder = 1
            FromColor = 15591915
            ToColor = clSilver
            Direction = False
            Version = '1.1.0.0'
          end
        end
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 220
    Top = 0
    Width = 788
    Height = 616
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object PageControl2: TPageControl
      Left = 1
      Top = 1
      Width = 786
      Height = 614
      ActivePage = SensorTab
      Align = alClient
      TabOrder = 0
      OnChange = PageControl2Change
      object AccessTab: TTabSheet
        Caption = #52636#51077#44288#51228
        object Splitter2: TSplitter
          Left = 0
          Top = 273
          Width = 778
          Height = 2
          Cursor = crVSplit
          Align = alTop
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 778
          Height = 273
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          OnResize = Panel3Resize
          object Splitter3: TSplitter
            Left = 598
            Top = 0
            Width = 2
            Height = 273
            Align = alRight
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 598
            Height = 273
            Align = alClient
            TabOrder = 0
            object GroupBox1: TGroupBox
              Left = 1
              Top = 1
              Width = 596
              Height = 271
              Align = alClient
              Color = clBtnFace
              ParentColor = False
              TabOrder = 0
              object doorListView: TListView
                Left = 2
                Top = 23
                Width = 592
                Height = 246
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Columns = <
                  item
                    Width = 200
                  end
                  item
                    Width = 200
                  end
                  item
                    Width = 200
                  end
                  item
                    Width = 200
                  end>
                ColumnClick = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #44404#47548
                Font.Style = []
                GridLines = True
                HideSelection = False
                HotTrackStyles = [htHandPoint]
                Items.Data = {
                  D8000000070000000000000000000000FFFFFFFF000000000000000013C3E2C0
                  D4B9AE313233343536373839303132330100000001000000FFFFFFFF00000000
                  0000000007C3E2C0D4B9AE320100000001000000FFFFFFFF0000000000000000
                  07C3E2C0D4B9AE330100000001000000FFFFFFFF000000000000000007C3E2C0
                  D4B9AE340100000001000000FFFFFFFF000000000000000007C3E2C0D4B9AE35
                  0100000001000000FFFFFFFF000000000000000007C3E2C0D4B9AE3601000000
                  01000000FFFFFFFF000000000000000007C3E2C0D4B9AE37}
                LargeImages = LageDoorList
                ReadOnly = True
                RowSelect = True
                ParentFont = False
                PopupMenu = PopupMenu_Door
                SmallImages = SmallDoorList
                StateImages = stateList
                TabOrder = 0
                ViewStyle = vsList
              end
              object Shader1: TShader
                Left = 2
                Top = 14
                Width = 592
                Height = 9
                Align = alTop
                Caption = 'Shader1'
                TabOrder = 1
                FromColor = 15591915
                ToColor = clSilver
                Direction = False
                Version = '1.1.0.0'
              end
            end
          end
          object Panel6: TPanel
            Left = 600
            Top = 0
            Width = 178
            Height = 273
            Align = alRight
            TabOrder = 1
            OnResize = Panel6Resize
            object Label1: TLabel
              Left = 8
              Top = 164
              Width = 48
              Height = 12
              Caption = #52636#51077#51088#47749
            end
            object Label2: TLabel
              Left = 8
              Top = 188
              Width = 48
              Height = 12
              Caption = #54924' '#49324' '#47749
            end
            object Label3: TLabel
              Left = 8
              Top = 212
              Width = 48
              Height = 12
              Caption = #48512' '#49436' '#47749
            end
            object Label4: TLabel
              Left = 8
              Top = 236
              Width = 24
              Height = 12
              Caption = #49324#48264
            end
            object Panel7: TPanel
              Left = 8
              Top = 32
              Width = 161
              Height = 121
              BevelOuter = bvLowered
              TabOrder = 0
              object Image1: TImage
                Left = 1
                Top = 1
                Width = 159
                Height = 119
                Align = alClient
                Stretch = True
              end
            end
            object ed_Emname: TEdit
              Left = 72
              Top = 160
              Width = 97
              Height = 20
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 1
            end
            object ed_Companyname: TEdit
              Left = 72
              Top = 184
              Width = 97
              Height = 20
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 2
            end
            object ed_DepartName: TEdit
              Left = 72
              Top = 208
              Width = 97
              Height = 20
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 3
            end
            object ed_Emid: TEdit
              Left = 72
              Top = 232
              Width = 97
              Height = 20
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 4
            end
            object StaticText1: TStaticText
              Left = 8
              Top = 8
              Width = 64
              Height = 16
              BevelInner = bvNone
              Caption = #52636#51077#51088#51221#48372
              TabOrder = 5
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 275
          Width = 778
          Height = 312
          Align = alClient
          TabOrder = 1
          object sg_Access: TAdvStringGrid
            Left = 1
            Top = 1
            Width = 776
            Height = 310
            Cursor = crDefault
            Align = alClient
            ColCount = 10
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
            OnClick = sg_AccessClick
            OnKeyDown = sg_IntAccessKeyDown
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
            FixedColWidth = 90
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            ColumnHeaders.Strings = (
              #48156#49373#51068#51088
              #50948#52824
              #52636#51077#47928
              #49849#51064#53076#46300
              #49849#51064#49345#53468
              #52852#46300#48264#54840
              #52636#51077#51088#47749
              #54924#49324#47749
              #48512#49436#47749
              #49324#48264)
            Filter = <>
            Version = '3.3.0.1'
            ColWidths = (
              90
              100
              92
              2
              90
              90
              90
              90
              90
              303)
          end
        end
      end
      object AlarmTab: TTabSheet
        Caption = #48169#48276#44288#51228
        ImageIndex = 1
        object Splitter4: TSplitter
          Left = 0
          Top = 273
          Width = 778
          Height = 1
          Cursor = crVSplit
          Align = alTop
        end
        object Panel8: TPanel
          Left = 0
          Top = 274
          Width = 778
          Height = 313
          Align = alClient
          TabOrder = 0
          object sg_Alarm: TAdvStringGrid
            Left = 1
            Top = 1
            Width = 776
            Height = 311
            Cursor = crDefault
            Align = alClient
            ColCount = 8
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
            PopupMenu = PopupMenu_Zone
            ScrollBars = ssVertical
            TabOrder = 0
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
            FixedColWidth = 90
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            ColumnHeaders.Strings = (
              #48156#49373#51068#51088
              #50948#52824
              #44221#48708#44396#50669
              #51452#51109#52824#48264#54840
              #44592#44592#48264#54840
              #48156#49373#53076#46300
              #51060#48292#53944#45236#50857)
            Filter = <>
            Version = '3.3.0.1'
            ColWidths = (
              90
              100
              104
              106
              90
              90
              455
              90)
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 778
          Height = 273
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          OnResize = Panel9Resize
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 778
            Height = 273
            Align = alClient
            TabOrder = 0
            object GroupBox4: TGroupBox
              Left = 1
              Top = 1
              Width = 776
              Height = 271
              Align = alClient
              Color = clBtnFace
              ParentColor = False
              TabOrder = 0
              object AlarmListView: TListView
                Left = 2
                Top = 23
                Width = 772
                Height = 246
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Columns = <>
                ColumnClick = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #44404#47548
                Font.Style = []
                FlatScrollBars = True
                GridLines = True
                HideSelection = False
                HotTrackStyles = [htHandPoint]
                Items.Data = {
                  4C000000020000000000000000000000FFFFFFFF000000000000000013C3E2C0
                  D4B9AE313233343536373839303132330100000001000000FFFFFFFF00000000
                  0000000007C3E2C0D4B9AE32}
                LargeImages = LageDoorList
                ReadOnly = True
                RowSelect = True
                ParentFont = False
                PopupMenu = PopupMenu_Alarm
                SmallImages = SmallDoorList
                StateImages = stateList
                TabOrder = 0
                ViewStyle = vsList
                OnDblClick = AlarmListViewDblClick
              end
              object Shader4: TShader
                Left = 2
                Top = 14
                Width = 772
                Height = 9
                Align = alTop
                Caption = 'Shader1'
                TabOrder = 1
                FromColor = 15591915
                ToColor = clSilver
                Direction = False
                Version = '1.1.0.0'
              end
            end
          end
        end
      end
      object FoodTab: TTabSheet
        Caption = #49885#49688#44288#51228
        ImageIndex = 2
        object GroupBox7: TGroupBox
          Left = 0
          Top = 0
          Width = 778
          Height = 587
          Align = alClient
          TabOrder = 0
          object Shader7: TShader
            Left = 2
            Top = 14
            Width = 774
            Height = 9
            Align = alTop
            Caption = 'Shader1'
            TabOrder = 0
            FromColor = 15591915
            ToColor = clSilver
            Direction = False
            Version = '1.1.0.0'
          end
          object sg_Food: TAdvStringGrid
            Left = 2
            Top = 23
            Width = 774
            Height = 562
            Cursor = crDefault
            Align = alClient
            ColCount = 10
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
            FixedColWidth = 90
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            ColumnHeaders.Strings = (
              #48156#49373#51068#51088
              #50948#52824
              #49885#49688#44396#50669
              #49849#51064#53076#46300
              #49849#51064#49345#53468
              #52852#46300#48264#54840
              #52636#51077#51088#47749
              #54924#49324#47749
              #48512#49436#47749
              #49324#48264)
            Filter = <>
            Version = '3.3.0.1'
            ColWidths = (
              90
              100
              92
              2
              90
              90
              90
              90
              90
              299)
          end
        end
      end
      object SensorTab: TTabSheet
        Caption = #49468#49436#44288#51228
        ImageIndex = 4
        object Splitter8: TSplitter
          Left = 0
          Top = 281
          Width = 778
          Height = 1
          Cursor = crVSplit
          Align = alTop
        end
        object Panel17: TPanel
          Left = 0
          Top = 0
          Width = 778
          Height = 281
          Align = alTop
          TabOrder = 0
          object GroupBox8: TGroupBox
            Left = 1
            Top = 1
            Width = 776
            Height = 279
            Align = alClient
            Color = clBtnFace
            ParentColor = False
            TabOrder = 0
            object SensorListView: TListView
              Left = 2
              Top = 23
              Width = 772
              Height = 254
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              Columns = <>
              ColumnClick = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548
              Font.Style = []
              FlatScrollBars = True
              GridLines = True
              HideSelection = False
              HotTrackStyles = [htHandPoint]
              Items.Data = {
                4C000000020000000000000000000000FFFFFFFF000000000000000013C3E2C0
                D4B9AE313233343536373839303132330100000001000000FFFFFFFF00000000
                0000000007C3E2C0D4B9AE32}
              LargeImages = LageDoorList
              ReadOnly = True
              RowSelect = True
              ParentFont = False
              PopupMenu = PopupMenu_Sensor
              SmallImages = SmallDoorList
              StateImages = stateList
              TabOrder = 0
              ViewStyle = vsList
              OnDblClick = SensorListViewDblClick
            end
            object Shader8: TShader
              Left = 2
              Top = 14
              Width = 772
              Height = 9
              Align = alTop
              Caption = 'Shader1'
              TabOrder = 1
              FromColor = 15591915
              ToColor = clSilver
              Direction = False
              Version = '1.1.0.0'
            end
          end
        end
        object Panel18: TPanel
          Left = 0
          Top = 282
          Width = 778
          Height = 305
          Align = alClient
          TabOrder = 1
          object sg_Sensor: TAdvStringGrid
            Left = 1
            Top = 1
            Width = 776
            Height = 303
            Cursor = crDefault
            Align = alClient
            ColCount = 8
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
            PopupMenu = PopupMenu_Zone
            ScrollBars = ssVertical
            TabOrder = 0
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
            FixedColWidth = 90
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            ColumnHeaders.Strings = (
              #48156#49373#51068#51088
              #50948#52824
              #49468#49436#47749#52845
              #51452#51109#52824#48264#54840
              #44592#44592#48264#54840
              #48156#49373#53076#46300
              #51060#48292#53944#45236#50857)
            Filter = <>
            Version = '3.3.0.1'
            ColWidths = (
              90
              100
              104
              106
              90
              90
              455
              90)
          end
        end
      end
      object IntegrationTab: TTabSheet
        Caption = #53685#54633#44288#51228
        ImageIndex = 3
        object Splitter6: TSplitter
          Left = 0
          Top = 273
          Width = 778
          Height = 1
          Cursor = crVSplit
          Align = alTop
        end
        object Panel11: TPanel
          Left = 0
          Top = 274
          Width = 778
          Height = 313
          Align = alClient
          TabOrder = 0
          object Splitter7: TSplitter
            Left = 1
            Top = 145
            Width = 776
            Height = 1
            Cursor = crVSplit
            Align = alTop
          end
          object Panel15: TPanel
            Left = 1
            Top = 1
            Width = 776
            Height = 144
            Align = alTop
            TabOrder = 0
            OnResize = Panel15Resize
            object sg_IntAccess: TAdvStringGrid
              Left = 1
              Top = 1
              Width = 774
              Height = 142
              Cursor = crDefault
              Align = alClient
              ColCount = 10
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
              OnKeyDown = sg_IntAccessKeyDown
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
              FixedColWidth = 90
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clWindowText
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = [fsBold]
              FloatFormat = '%.2f'
              ColumnHeaders.Strings = (
                #48156#49373#51068#51088
                #50948#52824
                #52636#51077#47928
                #49849#51064#53076#46300
                #49849#51064#49345#53468
                #52852#46300#48264#54840
                #52636#51077#51088#47749
                #54924#49324#47749
                #48512#49436#47749
                #49324#48264)
              Filter = <>
              Version = '3.3.0.1'
              ColWidths = (
                90
                100
                92
                2
                90
                90
                90
                90
                90
                298)
            end
          end
          object Panel16: TPanel
            Left = 1
            Top = 146
            Width = 776
            Height = 166
            Align = alClient
            TabOrder = 1
            object sg_IntAlarm: TAdvStringGrid
              Left = 1
              Top = 1
              Width = 774
              Height = 164
              Cursor = crDefault
              Align = alClient
              ColCount = 8
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
              PopupMenu = PopupMenu_intZone
              ScrollBars = ssVertical
              TabOrder = 0
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
              FixedColWidth = 90
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clWindowText
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = [fsBold]
              FloatFormat = '%.2f'
              ColumnHeaders.Strings = (
                #48156#49373#51068#51088
                #50948#52824
                #44221#48708#44396#50669
                #51452#51109#52824#48264#54840
                #44592#44592#48264#54840
                #48156#49373#53076#46300
                #51060#48292#53944#45236#50857)
              Filter = <>
              Version = '3.3.0.1'
              ColWidths = (
                90
                100
                104
                106
                90
                90
                452
                90)
            end
          end
        end
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 778
          Height = 273
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          OnResize = Panel12Resize
          object Splitter5: TSplitter
            Left = 398
            Top = 0
            Width = 2
            Height = 273
            Align = alRight
          end
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 398
            Height = 273
            Align = alClient
            TabOrder = 0
            object GroupBox5: TGroupBox
              Left = 1
              Top = 1
              Width = 396
              Height = 271
              Align = alClient
              Color = clBtnFace
              ParentColor = False
              TabOrder = 0
              object IntDoorListView: TListView
                Left = 2
                Top = 23
                Width = 392
                Height = 246
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Columns = <
                  item
                    Width = 1000
                  end>
                ColumnClick = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #44404#47548
                Font.Style = []
                FlatScrollBars = True
                GridLines = True
                HideSelection = False
                HotTrackStyles = [htHandPoint]
                Items.Data = {
                  4C000000020000000000000000000000FFFFFFFF000000000000000013C3E2C0
                  D4B9AE313233343536373839303132330100000001000000FFFFFFFF00000000
                  0000000007C3E2C0D4B9AE32}
                LargeImages = LageDoorList
                ReadOnly = True
                RowSelect = True
                ParentFont = False
                PopupMenu = PopupMenu_IntiDoor
                SmallImages = SmallDoorList
                StateImages = stateList
                TabOrder = 0
                ViewStyle = vsList
              end
              object Shader5: TShader
                Left = 2
                Top = 14
                Width = 392
                Height = 9
                Align = alTop
                Caption = 'Shader1'
                TabOrder = 1
                FromColor = 15591915
                ToColor = clSilver
                Direction = False
                Version = '1.1.0.0'
              end
            end
          end
          object Panel14: TPanel
            Left = 400
            Top = 0
            Width = 378
            Height = 273
            Align = alRight
            TabOrder = 1
            OnResize = Panel14Resize
            object GroupBox6: TGroupBox
              Left = 1
              Top = 1
              Width = 376
              Height = 271
              Align = alClient
              Color = clBtnFace
              ParentColor = False
              TabOrder = 0
              object IntAlarmListView: TListView
                Left = 2
                Top = 23
                Width = 372
                Height = 246
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Columns = <
                  item
                    Width = 1000
                  end>
                ColumnClick = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #44404#47548
                Font.Style = []
                FlatScrollBars = True
                GridLines = True
                HideSelection = False
                HotTrackStyles = [htHandPoint]
                Items.Data = {
                  4C000000020000000000000000000000FFFFFFFF000000000000000013C3E2C0
                  D4B9AE313233343536373839303132330100000001000000FFFFFFFF00000000
                  0000000007C3E2C0D4B9AE32}
                LargeImages = LageDoorList
                ReadOnly = True
                RowSelect = True
                ParentFont = False
                PopupMenu = PopupMenu_IntAlarm
                SmallImages = SmallDoorList
                StateImages = stateList
                TabOrder = 0
                ViewStyle = vsList
                OnDblClick = IntAlarmListViewDblClick
              end
              object Shader6: TShader
                Left = 2
                Top = 14
                Width = 372
                Height = 9
                Align = alTop
                Caption = 'Shader1'
                TabOrder = 1
                FromColor = 15591915
                ToColor = clSilver
                Direction = False
                Version = '1.1.0.0'
              end
            end
          end
        end
      end
    end
  end
  inherited CommandArray: TCommandArray
    Commands = <
      item
        CommandName = 'Message'
        CommandKind = 0
        Name = 'TCommand0'
        OnExecute = CommandArrayCommandsTCommand0Execute
      end
      item
        CommandName = 'MODECHANGE'
        CommandKind = 0
        Name = 'TCommand1'
        OnExecute = CommandArrayCommandsTCommand1Execute
      end
      item
        CommandName = 'CLOSE'
        CommandKind = 0
        Name = 'TCommand2'
        OnExecute = CommandArrayCommandsTCommand2Execute
      end
      item
        CommandName = 'AlarmMode'
        CommandKind = 0
        Name = 'TCommand3'
        OnExecute = CommandArrayCommandsTCommand3Execute
      end
      item
        CommandName = 'REFRESH'
        CommandKind = 0
        Name = 'TCommand4'
        OnExecute = CommandArrayCommandsTCommand4Execute
      end
      item
        CommandName = 'COMMON'
        CommandKind = 0
        Name = 'TCommand5'
        OnExecute = CommandArrayCommandsTCommand5Execute
      end
      item
        CommandName = 'STATE'
        CommandKind = 0
        Name = 'TCommand6'
        OnExecute = CommandArrayCommandsTCommand6Execute
      end>
  end
  object SmallDoorList: TImageList
    Left = 264
    Top = 112
    Bitmap = {
      494C01010F001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFEFF00E0EFEB00C9EB
      E100D9EDE800D3E9E700D3E8EA00E2DAE500E6F3F100FDFFFF00000000000000
      00000000000000000000000000000000000000000000FFFEFF00E0EFEB00C9EB
      E100D9EDE800D3E9E700D3E8EA00E2DAE500E6F3F100FDFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000F2FAFA00FBF9F900F1FAF700ECF8
      F200ECE3E000DDD5D600DADBDF00FAEFF900DAE2E100FCFEFE00000000000000
      000000000000000000000000000000000000F2FAFA00FBF9F900F1FAF700ECF8
      F200ECE3E000DDD5D600DADBDF00FAEFF900DAE2E100FCFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000000800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FCFEFF00FFFFFF00F1EFEE00C0AB
      A900925F63007E454D0089646C00C2ABB300DEDEDE00F9FEFD00000000000000
      000000000000000000000000000000000000FCFEFF00FFFFFF00F1EFEE00C0AB
      A900925F63007E454D0089646C00C2ABB300DEDEDE00F9FEFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFEFF00FBFFFF00BFB0AE008B54
      5700923A40009D3A44008A3E49007E5A6000C4B9BB00EAEFEE00000000000000
      000000000000000000000000000000000000FFFEFF00FBFFFF00BFB0AE008B54
      57002C06AA002C06AA002C06AA002C06AA00C4B9BB00EAEFEE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFDFF00ECF2F1008A6E6E007C2A
      2F00C85B6300E66A7600C35A65006F393E0098838600DEE4E300000000000000
      000000000000000000000000000000000000FFFDFF00ECF2F1008A6E6E002C06
      AA003E09F7003E09F7003E09F7003E09F70098838600DEE4E300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFDFF00E7EFEE00896163009B3B
      4100E77D8300E86B7400F0737D009E54580094747900DCE2E100000000000000
      000000000000000000000000000000000000FFFDFF00E7EFEE00896163002C06
      AA003E09F7007853F9007853F9002C06AA0094747900DCE2E100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFF9FE00E1ECEA0092606200BC55
      5C00FFA9A900D7686C00F16C7600A85155009F767D00D8DEDD00000000000000
      000000000000000000000000000000000000FFF9FE00E1ECEA00926062003E09
      F700D2C6FD002C06AA007853F9002C06AA009F767D00D8DEDD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFDFF00EBF6F40098616400BC55
      5C00FFB8B600CC676900F26B7300B8595D009D717800D9E1E000000000000000
      000000000000000000000000000000000000FFFDFF00EBF6F400986164003E09
      F700D2C6FD002C06AA007853F9002C06AA009D717800D9E1E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFEFF00E3E4E20093626400B452
      5800FFB7B800D0757800F66E7A00B6535B009B717800CFDAD800000000000000
      000000000000000000000000000000000000FFFEFF00E3E4E200936264003E09
      F700D2C6FD007853F9007853F9002C06AA009B717800CFDAD800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFEFF00E3E8E600986E6F00A246
      4B00FFB8B800BB646700EA6A7500B1595F0092686F00D5DBDA00000000000000
      000000000000000000000000000000000000FFFEFF00E3E8E600986E6F002C06
      AA00D2C6FD002C06AA007853F9002C06AA0092686F00D5DBDA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFF9FC00F2F0F000AB7F8000AA4A
      5000F8A5A700BC5B5F00F1687600B6596000936A7100D5D7D700000000000000
      000000000000000000000000000000000000FFF9FC00F2F0F000AB7F80003E09
      F700D2C6FD002C06AA007853F9002C06AA00936A7100D5D7D700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFCFF00EFF4F30095707200B254
      5900FAA3A700E6798100FF718000AE4E5800916D7300D0CECE00000000000000
      000000000000000000000000000000000000FFFCFF00EFF4F300957072003E09
      F700D2C6FD007853F9007853F9002C06AA00916D7300D0CECE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FBFCFF00E4F6F500826E6D009E4A
      4F00FCA5A900F8889000FE6A7A00AD50590084666B00D3D1D100000000000000
      000000000000000000000000000000000000FBFCFF00E4F6F500826E6D002C06
      AA00D2C6FD007853F9007853F9002C06AA0084666B00D3D1D100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000FFFF0000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFF5FE00F7FCFD009D828500872A
      3100FE9AA000FF828E00EF506400A4404C008D787B00EBEBEB00000000000000
      000000000000000000000000000000000000FFF5FE00F7FCFD009D8285002C06
      AA007853F9007853F9002C06AA002C06AA008D787B00EBEBEB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFF9FF00FAFFFF00C6B0B2009641
      4900EA8D9400FF899400D84B5C009A4D5500C6B9BB00FDFFFF00000000000000
      000000000000000000000000000000000000FFF9FF00FAFFFF00C6B0B2002C06
      AA007853F9007853F9002C06AA002C06AA00C6B9BB00FDFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFAFF00E3FFFF00F6FFFE00CE9D
      9F00B57F7F00C5797D00B7576100B69E9E00FFF9FA00FBFFFF00000000000000
      000000000000000000000000000000000000FCFAFF00E3FFFF00F6FFFE00CE9D
      9F00B57F7F00C5797D002C06AA00B69E9E00FFF9FA00FBFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084B58400107310001873
      18001873180018731800187B1800187B1800107B1000107B1000087B0800087B
      0800007B0000007300007BB57B00FFFFFF000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0010841000218C21002994
      2900319431003194310029942900299C2900219C210018A5180018A5180010A5
      100008A5080000940000006B0000FFFFFF000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00188C180029942900399C
      3900399C3900399C390039A53900A5D6A500FFFFFF0021AD210018AD180010B5
      100008AD0800009C0000007B0000FFFFFF000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000080000000800000008000000080
      000000800000FFFFFF00FFFFFF00FFFFFF000080000000800000008000000080
      00000080000000800000008000000080000000000000FFFFFF007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000FFFFFF0021942100399C390042A5
      42004AA54A0042A5420042A54200FFFFFF00FFFFFF00FFFFFF0021B5210018B5
      180010AD100008A50800087B0800FFFFFF000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000080000000800000008000000080
      00000080000000800000008000000080000000000000FFFFFF000000FF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF0029942900429C42004AA5
      4A0052A552004AA54A0042A5420042AD4200FFFFFF00FFFFFF00FFFFFF0018B5
      180010AD100010A5100008840800FFFFFF000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000080000000800000008000000080
      00000080000000800000008000000080000000000000FFFFFF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00319C31004AA54A0052A5
      520052A552004AA54A004AA54A0042A5420039AD3900FFFFFF00FFFFFF00FFFF
      FF0018AD180018A5180010841000FFFFFF000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000080000000800000008000000080
      00000080000000800000008000000080000000000000FFFFFF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00429C420052A55200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00219C210018841800FFFFFF000000000000000000000000000000
      800000008000000080000000800000008000000080000000800000FFFF000000
      8000000000000000000000000000000000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      00000080000000800000008000000080000000000000FFFFFF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF007F7F7F0000000000FFFFFF0042A542005AAD5A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00219C2100217B2100FFFFFF000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000080000000800000FFFFFF00FFFF
      FF000080000000800000008000000080000000000000FFFFFF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF0052A5520063AD630063AD
      63005AAD5A0052A552004AA54A00429C4200399C3900FFFFFF00FFFFFF00FFFF
      FF00299C290029942900217B2100FFFFFF000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000080000000800000FFFFFF00FFFF
      FF000080000000800000008000000080000000000000FFFFFF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF0052A552006BB56B006BB5
      6B005AAD5A0052A552004AA54A00429C4200FFFFFF00FFFFFF00FFFFFF002994
      29002994290029942900217B2100FFFFFF000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      8000000000000000000000000000000000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000080000000800000FFFFFF00FFFF
      FF000080000000800000008000000080000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF005AAD5A007BBD7B0073BD
      730063AD63005AAD5A0052A55200FFFFFF00FFFFFF00FFFFFF00319C3100319C
      31003194310031943100217B2100FFFFFF000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      8000000000000000000000000000000000000080000000800000008000000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF006BB56B008CC68C007BBD
      7B006BB56B0063B5630063AD6300B5DEB500FFFFFF004AA54A004AA54A0042A5
      4200399C390031943100217B2100FFFFFF000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      8000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0073BD73009CCE9C008CC6
      8C007BBD7B0073BD73006BB56B0063B5630063AD63005AAD5A0052AD52004AA5
      4A0042A542003194310018731800FFFFFF000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00B5DEB50073BD730063B5
      63005AAD5A0052A5520052A552004AA54A004AA54A0042A54200429C4200399C
      390031943100218C21008CBD8C00FFFFFF000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018A5C60018A5
      C60018A5C60018A5C60018A5C60018A5C60018A5C60018A5C60018A5C60018A5
      C60018A5C60018A5C60000000000000000000080000000800000008000000080
      0000008000000080000000800000000000000000000000000000000000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000000000000000000000000000000000008000000080
      000000800000008000000080000000800000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009CDEEF0094F7FF0073DE
      F70073DEF70073DEF70073DEF7000000FF000000FF0073DEF70073DEF70073DE
      F70073DEF7004AC6E70018A5C600000000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000080
      0000008000000080000000800000008000000080000000800000008000000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008000000080
      000000800000008000000080000000800000000000000000000080808000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094F7FF0073DE
      F70073DEF70073DEF70073DEF7000000FF000000FF0073DEF70073DEF70073DE
      F70073DEF70018A5C60000000000000000000080000000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      000000000000FFFFFF000000FF000000FF00000000000000FF00000000000000
      00000000000000000000000000000000000000000000000000009CDEEF0094F7
      FF0073DEF70073DEF70073DEF70073DEF70073DEF70073DEF70073DEF70073DE
      F7004AC6E70018A5C60000000000000000000080000000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000000094F7
      FF0073DEF70073DEF70073DEF7000000FF000000FF0073DEF70073DEF70073DE
      F70018A5C6000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      00000080000000800000008000000080000000000000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00000000000000FF00000000000000
      FF000000FF000000000000000000000000000000000000000000000000009CDE
      EF0094F7FF0073DEF70073DEF7000000FF000000FF0073DEF70073DEF7004AC6
      E70018A5C6000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      00000080000000800000008000000080000080808000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00000000000000FF000000
      FF000000FF000000000080808000000000000000000000000000000000000000
      000094F7FF0073DEF70073DEF7000000FF000000FF0073DEF70073DEF70018A5
      C600000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      00000080000000800000008000000080000000000000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00000000000000FF00000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00009CDEEF0094F7FF0073DEF7000000FF000000FF0073DEF7004AC6E70018A5
      C600000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      00000080000000800000008000000080000000000000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000094F7FF0073DEF7000000FF000000FF0073DEF70018A5C6000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000FFFFFF000080000000800000FFFFFF00FFFFFF000000000000800000FFFF
      FF00008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      00000080000000800000008000000080000000000000000000000000FF000000
      FF0000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000009CDEEF0094F7FF000000FF000000FF004AC6E70018A5C6000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00008000000080000000800000008000000080000000800000008000000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000008000000080
      00000080000000800000008000000080000000000000000000000000FF000000
      0000000000008080800000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000094F7FF0073DEF70073DEF70018A5C600000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000009CDEEF0094F7FF004AC6E70018A5C600000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094F7FF0018A5C60000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000022222200222222002222
      2200222222002222220022222200222222000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFF000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000CCFFFF000000
      000000000000000000000000000000000000FF6600002222220033FFCC00A4A0
      A000A4A0A000A4A0A00000000000222222000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      00000000000000000000FFFFFF00FFFFFF00000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF00000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000066FFFF000000000000000000FF660000FF66000022222200222222002222
      2200222222002222220022222200222222000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      00000000000000000000FFFFFF00FFFFFF00000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF00000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000033FFFF0000000000FF66000022222200222222002222
      220022222200222222002222220022222200000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000033FFFF0033FFFF0000000000FF660000FF6600002222220000000000FFCC
      0000FFCC0000FFCC0000FFCC000022222200000000000000000080808000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000033FF
      FF0033FFFF0033FFFF0033FFFF0000000000000000002222220000000000FFCC
      0000FFCC0000FFCC0000FFCC0000222222000000000000000000000000000000
      000000000000FFFFFF00FFFF0000FFFF000000000000FFFF0000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000033FFFF0000FFFF0000FFFF0000FFFF002222220000000000FFCC
      0000FFCC0000FFCC0000FFCC000022222200000000000000000000000000FFFF
      0000FFFFFF00FFFFFF00FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FF660000FF66
      0000FF660000000000000000000000CCFF0000CCFF0022222200A4A0A000A4A0
      A000A4A0A000A4A0A000A4A0A000222222000000000000000000FFFF0000FFFF
      0000FFFFFF00FFFFFF00FFFF0000FFFF000000000000FFFF000000000000FFFF
      0000FFFF0000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002222220022222200222222002222
      22002222220022222200222222000000000000CCFF0000CCFF0000CCFF000000
      0000FF660000FF660000FF660000000000008080800000000000FFFF0000FFFF
      0000FFFFFF00FFFFFF00FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF
      0000FFFF0000000000008080800000000000FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002222220033FFCC00A4A0A000A4A0
      A000A4A0A000000000002222220000CCFF0000CCFF0000CCFF0000CCFF000000
      0000FF660000FF66000000000000000000000000000000000000FFFF0000FFFF
      0000FFFFFF00FFFFFF00FFFF0000FFFF000000000000FFFF000000000000FFFF
      0000FFFF0000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002222220022222200222222002222
      220022222200222222002222220000CCFF0000CCFF0000CCFF0000CCFF0000CC
      FF0000CCFF000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFFFF00FFFFFF00FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF
      0000FFFF0000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002222220022222200222222002222
      220022222200222222002222220000CCFF0000CCFF0000CCFF000099FF0000CC
      FF000099FF000099FF000099FF00000000000000000000000000FFFF0000FFFF
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000FFFF0000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002222220000000000FFCC0000FFCC
      0000FFCC0000FFCC0000222222000000000000CCFF000099FF000099FF000099
      FF000099FF000000000000000000000000000000000000000000FFFF00000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000FFFF0000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002222220000000000FFCC0000FFCC
      0000FFCC0000FFCC000022222200FF660000000000000099FF000099FF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      0000FFFF00000000000000FFFF0000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002222220000000000FFCC0000FFCC
      0000FFCC0000FFCC00002222220000000000FF66000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0022222200A4A0A000A4A0A000A4A0
      A000A4A0A000A4A0A00022222200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C007803F803F0000C007003F003F0000
      C007003F003F0000C007003F003F0000C007003F003F0000C007003F003F0000
      C007003F003F0000C007003F003F0000C007003F003F0000C007003F003F0000
      C007003F003F0000C007003F003F0000C007003F003F0000C007003F003F0000
      C007003F003F0000C007003F003F00000000FFFF8001C0070000FFFF0000C007
      0000FFFF0000C007000000000000C007000000000000C007000000000000C007
      000000000000C007000000000000C007000000000000C007000000000000C007
      000000000000C007000000000000C007000000000000C0070000FFFF0000C007
      0000FFFF0000C0070000FFFF8001C007FFFFFFFF00000000E01FFFFF00000000
      CC07C0030000000084038001000000000001C003000000000001C00300000000
      0001E007000000000001E007000000000001F00F000000008003F00F00000000
      8003F81F000000008003F81F000000008003FC3F000000008003FC3F00000000
      C007FE7F00000000E00FFFFF00000000FFFCFDFCBF00FFFFC01CF01CC600E01F
      C01CC01CE000CC07C01CC01CF800840300000000E000000100000000C0000001
      00000000C0000001000000008000000100000000000000010000000000018003
      00000000000180030000000000008003000000000003800300000000000F8003
      00000000001FC00700000000017FE00F00000000000000000000000000000000
      000000000000}
  end
  object stateList: TImageList
    Left = 296
    Top = 112
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000FF000000FF000000FF000000
      FF000000FF0000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000FF000000FF000000FF000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      00000000FF000000FF000000FF0000000000000000000000000018A5C60018A5
      C60018A5C60018A5C60018A5C60018A5C60018A5C60018A5C60018A5C60018A5
      C60018A5C60018A5C6000000000000000000FFFF0000FFFF0000000000008080
      800080808000C0C0C000808080000000000080808000C0C0C000808080008080
      800000000000FFFF0000FFFF00000000000000FFFF0000FFFF00000000008080
      800080808000C0C0C000808080000000000080808000C0C0C000808080008080
      80000000000000FFFF0000FFFF00000000000000FF000000FF00000000008080
      800080808000C0C0C000808080000000000080808000C0C0C000808080008080
      8000000000000000FF000000FF0000000000000000009CDEEF0094F7FF0073DE
      F70073DEF70073DEF70073DEF7000000FF000000FF0073DEF70073DEF70073DE
      F70073DEF7004AC6E70018A5C60000000000FFFF000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000808080000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000FFFF00000000000000FFFF0000000000C0C0C000C0C0
      C000C0C0C000C0C0C000808080000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000FFFF00000000000000FF0000000000C0C0C000C0C0
      C000C0C0C000C0C0C000808080000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000FF0000000000000000000000000094F7FF0073DE
      F70073DEF70073DEF70073DEF7000000FF000000FF0073DEF70073DEF70073DE
      F70073DEF70018A5C6000000000000000000FFFF000000000000808080008080
      800080808000C0C0C000C0C0C00000000000C0C0C000C0C0C000808080008080
      80008080800000000000FFFF00000000000000FFFF0000000000808080008080
      800080808000C0C0C000C0C0C00000000000C0C0C000C0C0C000808080008080
      8000808080000000000000FFFF00000000000000FF0000000000808080008080
      800080808000C0C0C000C0C0C00000000000C0C0C000C0C0C000808080008080
      800080808000000000000000FF000000000000000000000000009CDEEF0094F7
      FF0073DEF70073DEF70073DEF70073DEF70073DEF70073DEF70073DEF70073DE
      F7004AC6E70018A5C6000000000000000000FFFF000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000FFFF00000000000000FFFF0000000000C0C0C000C0C0
      C000C0C0C000C0C0C000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000FFFF00000000000000FF0000000000C0C0C000C0C0
      C000C0C0C000C0C0C000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000FF000000000000000000000000000000000094F7
      FF0073DEF70073DEF70073DEF7000000FF000000FF0073DEF70073DEF70073DE
      F70018A5C600000000000000000000000000FFFF000000000000808080008080
      8000808080008080800000000000000000000000000080808000808080008080
      80008080800000000000FFFF00000000000000FFFF0000000000808080008080
      8000808080008080800000000000000000000000000080808000808080008080
      8000808080000000000000FFFF00000000000000FF0000000000808080008080
      8000808080008080800000000000000000000000000080808000808080008080
      800080808000000000000000FF00000000000000000000000000000000009CDE
      EF0094F7FF0073DEF70073DEF7000000FF000000FF0073DEF70073DEF7004AC6
      E70018A5C600000000000000000000000000FFFF000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000FFFF00000000000000FFFF0000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000FFFF00000000000000FF0000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000FF00000000000000000000000000000000000000
      000094F7FF0073DEF70073DEF7000000FF000000FF0073DEF70073DEF70018A5
      C60000000000000000000000000000000000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF00000000000000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00009CDEEF0094F7FF0073DEF7000000FF000000FF0073DEF7004AC6E70018A5
      C60000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      0000C0C0C00000000000FFFF0000FFFF0000FFFF000000000000C0C0C0000000
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF000000
      0000C0C0C0000000000000FFFF0000FFFF0000FFFF0000000000C0C0C0000000
      000000FFFF0000FFFF0000FFFF00000000000000FF000000FF000000FF000000
      0000C0C0C000000000000000FF000000FF000000FF0000000000C0C0C0000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000094F7FF0073DEF7000000FF000000FF0073DEF70018A5C6000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      0000C0C0C00000000000FFFF0000FFFF0000FFFF000000000000C0C0C0000000
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF000000
      0000C0C0C0000000000000FFFF0000FFFF0000FFFF0000000000C0C0C0000000
      000000FFFF0000FFFF0000FFFF00000000000000FF000000FF000000FF000000
      0000C0C0C000000000000000FF000000FF000000FF0000000000C0C0C0000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000009CDEEF0094F7FF000000FF000000FF004AC6E70018A5C6000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      0000C0C0C00000000000FFFF0000FFFF0000FFFF000000000000C0C0C0000000
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF000000
      0000C0C0C0000000000000FFFF0000FFFF0000FFFF0000000000C0C0C0000000
      000000FFFF0000FFFF0000FFFF00000000000000FF000000FF000000FF000000
      0000C0C0C000000000000000FF000000FF000000FF0000000000C0C0C0000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000094F7FF0073DEF70073DEF70018A5C600000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      000080808000C0C0C000FFFF0000FFFF0000FFFF0000C0C0C000808080000000
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF000000
      000080808000C0C0C00000FFFF0000FFFF0000FFFF00C0C0C000808080000000
      000000FFFF0000FFFF0000FFFF00000000000000FF000000FF000000FF000000
      000080808000C0C0C0000000FF000000FF000000FF00C0C0C000808080000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000009CDEEF0094F7FF004AC6E70018A5C600000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      00000000000000000000C0C0C000C0C0C000C0C0C0000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000C0C0C000C0C0C000C0C0C000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000FF000000FF000000FF000000
      FF000000000000000000C0C0C000C0C0C000C0C0C00000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000094F7FF0018A5C60000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      000000000000C0030000000000008001000000000000C003000000000000C003
      000000000000E007000000000000E007000000000000F00F000000000000F00F
      000000000000F81F000000000000F81F000000000000FC3F000000000000FC3F
      000000000000FE7F000000000000FFFF00000000000000000000000000000000
      000000000000}
  end
  object LageDoorList: TImageList
    Height = 32
    Width = 32
    Left = 328
    Top = 112
    Bitmap = {
      494C010103000400040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000000000000000000000000000C0C0C000C0C0C0000000
      00000000000000000000C0C0C000C0C0C0000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000000000000000
      0000C6C6C600C6C6C600000000000000000000000000C6C6C600C6C6C6000000
      00000000000000000000C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      00000000000000000000C0C0C000C0C0C000000000000000000000000000C0C0
      C000C0C0C000000000000000000000000000C0C0C000C0C0C000000000000000
      0000FFFF0000FFFF000000000000000000000000000000000000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600000000000000000000000000C6C6C600C6C6C6000000
      00000000000000000000C6C6C600C6C6C600000000000000000000000000C6C6
      C600C6C6C600000000000000000000000000C6C6C600C6C6C600000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000000000000000000000000000C0C0C000C0C0C000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000C0C0C0000000
      0000FFFF0000FFFF00008080000000000000C0C0C00000000000000000000000
      0000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6000000
      00000000000000000000C6C6C600C6C6C600000000000000000000000000C6C6
      C600C6C6C600000000000000000000000000C6C6C600C6C6C600000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000C6C6C600C6C6
      C60000000000000000000000000000000000C0C0C000C0C0C000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000C0C0C000C0C0
      C000000000000000000000000000C0C0C000C0C0C00000000000000000000000
      0000FFFF0000FFFF0000808000008080000000000000C0C0C000C0C0C0000000
      00000000000000000000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600000000000000000000000000C6C6C600C6C6C600000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000C6C6C600C6C6
      C600000000000000000000000000C6C6C600C6C6C60000000000000000000000
      0000C6C6C600C6C6C60000000000000000000000000000000000C0C0C000C0C0
      C000000000000000000000000000C0C0C000C0C0C00000000000000000000000
      0000C0C0C000C0C0C000000000000000000000000000C0C0C000C0C0C0000000
      0000FFFF0000FFFF00008080000080800000808000000000000000000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000C6C6C600C6C6
      C600000000000000000000000000C6C6C600C6C6C60000000000000000000000
      0000C6C6C600C6C6C600000000000000000000000000C6C6C600C6C6C6000000
      00000000000000000000C6C6C600C6C6C600C0C0C00000000000000000000000
      0000C0C0C000C0C0C000000000000000000000000000C0C0C000C0C0C0000000
      00000000000000000000C0C0C000C0C0C0000000000000000000000000000000
      0000FFFF0000FFFF000080800000808000008080000080800000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000000000000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000C0C0C0000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C00000000000000000000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      00008484000084840000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      00008484000084840000C6C6C6000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      00008484000084840000C6C6C6000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      00008484000084840000C6C6C6000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000080800000000000000000000080800000808000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000000000000808080000000000080800000808000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000000000000000000000000000080800000808000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000000000008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000080800000000000000000000080800000808000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000262626002626260026262600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00000000
      000000FFFF000000000084840000848400008484000084840000848400008484
      0000848400008484000000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      000026262600C2C2C200C0C0C000262626000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000000000008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      00000000000026262600B6B6B600AAAAAA003E3E3E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      00000000000026262600B6B6B600AAAAAA00929292003E3E3E00262626003E3E
      3E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C000000000000000000000000000000000003E3E3E003E3E
      3E003E3E3E00A4A0A000A4A0A000AAAAAA00AAAAAA00AAAAAA00A4A0A0009292
      92003E3E3E003E3E3E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      00008484000084840000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C0000000000000000000000000003E3E3E00A4A0A000C2C2
      C200C0C0C000C0C0C000A4A0A0009662000096620000B6B6B600AAAAAA00AAAA
      AA00AAAAAA00929292003E3E3E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      00008484000084840000C6C6C6000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C00000000000000000003E3E3E00A4A0A000CECECE00CECE
      CE00C2C2C200C2C2C200B6B6B600FF8F6B00FF8F6B00C0C0C000B6B6B600B6B6
      B600AAAAAA00AAAAAA00929292003E3E3E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      00008484000084840000C6C6C6000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C000000000000000000026262600DADADA00DADADA00CECE
      CE00CECECE00CECECE00C0C0C000B97A000096620000AAAAAA00C2C2C200C0C0
      C000B6B6B600B6B6B600B6B6B600262626000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      00008484000084840000C6C6C6000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000FFFF0000FFFF000080800000808000008080000080800000808000000000
      000080808000C0C0C000000000000000000026262600E6E6E600E6E6E600DADA
      DA00DADADA00DADADA00DADADA00FF8F6B0096620000B97A0000B6B6B600CECE
      CE00C2C2C200C0C0C000C0C0C000262626000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080008080
      800000000000FFFF0000FFFF0000808000008080000080800000808000000000
      000080808000C0C0C000000000000000000026262600E6E6E600E6E6E600E6E6
      E600E6E6E600F0CAA600FFAB8E00DADADA00FFAB8E0096620000B97A0000DADA
      DA00CECECE00CECECE00C2C2C200262626000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080008080
      80008080800000000000FFFF0000FFFF00008080000080800000808000000000
      000080808000C0C0C00000000000000000003E3E3E00C2C2C200F2F2F200F2F2
      F200F2F2F200B97A0000B97A0000FF734800FF8F6B0096620000B97A0000E6E6
      E600DADADA00DADADA00A4A0A0003E3E3E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000FFFF0000FFFF000080800000808000000000
      000080808000C0C0C00000000000000000000000000026262600C2C2C200F2F2
      F200F2F2F200FFD4D400B97A00009662000096620000B97A0000F0CAA600E6E6
      E600E6E6E600A4A0A0003E3E3E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080008080
      800080808000808080008080800000000000FFFF0000FFFF0000808000000000
      000080808000C0C0C00000000000000000000000000000000000262626003E3E
      3E00C2C2C200DADADA00DADADA00F0CAA600F0CAA600E6E6E600E6E6E600AAAA
      AA00262626003E3E3E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080008080
      80008080800080808000808080008080800000000000FFFF0000FFFF00000000
      0000808080000000000000000000000000000000000000000000000000000000
      00003E3E3E002626260026262600262626002626260026262600262626003E3E
      3E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFF39CE33FFFFFFFFF00000000
      FE739CFFDCE721CFFFFFFFFF00000000F39CE73FE739C073FFFFFFFF00000000
      9CE739CF39CE601CFFFFFFFF00000000E739CE73CE738027FFFFFFFF00000000
      B9CE739C739CE019FFFFFFFF000000008000000000072000FFFFFFFF00000000
      FE80003FFFF1C003FFFFFFFF00000000FE80003FFFF66003FFFFFFFF00000000
      FE80003FFFF00003FFFFFFFF00000000FE80003FFFF00003FFFFFFFF00000000
      FE80003FFFF00003FFFFFFFF00000000FE80003FFFF00003FFFFFFFF00000000
      FE80003FFFF00003FFFFFFFF00000000FE80003FFFF00003FFFFFFFF00000000
      FE80003FFFF00103FFFFFFFF00000000FE80003FFFF00003F1FFFFFF00000000
      FE80003FFFF00003F0FFFFFF00000000FE80003FFFF00003F87FFFFF00000000
      FE80003FFFF00003F80FFFFF00000000FE80003FFFF00003C003FFFF00000000
      FE80003FFFF000038001FFFF00000000FE80003FFFF000030000FFFF00000000
      FE80003FFFF000030000FFFF00000000FE80003FFFF000030000FFFF00000000
      FE80003FFFF000030000FFFF00000000FE80003FFFF000030000FFFF00000000
      FE80003FFFF000038001FFFF00000000FE80013FFFF00003C003FFFF00000000
      FEFFFF3FFFF00007F00FFFFF00000000FE00007FFFF0000FFFFFFFFF00000000
      FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Left = 426
    Top = 81
    object Action_LoctionLoad: TAction
      Caption = 'Action_LoctionLoad'
      OnExecute = Action_LoctionLoadExecute
    end
    object Action_DeviceLoad: TAction
      Caption = 'Action_DeviceLoad'
      OnExecute = Action_DeviceLoadExecute
    end
    object Action_DoorLoad: TAction
      Caption = 'Action_DoorLoad'
      OnExecute = Action_DoorLoadExecute
    end
    object Action_AlarmLoad: TAction
      Caption = 'Action_AlarmLoad'
      OnExecute = Action_AlarmLoadExecute
    end
    object Action_FoodLoad: TAction
      Caption = 'Action_FoodLoad'
      OnExecute = Action_FoodLoadExecute
    end
    object Action_RecvData: TAction
      Caption = 'Action_RecvData'
    end
    object Action_Reload: TAction
      Caption = 'Action_Reload'
      OnExecute = Action_ReloadExecute
    end
    object Action_SensorLoad: TAction
      Caption = 'Action_SensorLoad'
      OnExecute = Action_SensorLoadExecute
    end
  end
  object toolslist: TImageList
    BkColor = clWhite
    Left = 72
    Top = 168
    Bitmap = {
      494C01010F001300040010001000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EAEAE10087878B007E7E84007E7E840087878C00EAEAE200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F3
      EC007F7F860013135B0000007400000076000000770000007200131357007F7F
      8700F3F3EE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000F0FBFF000000FF000000FF000000FF000000FF000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF8004E4E
      6F00000086000000B8000000B7000000B6000000B7000000AC0000009F000000
      6E004E4E6D00FFFFF900FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF00F0FBFF00A4A0A000666666000000FF000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00B8B8AC000000
      83000000E1000000E5000000E6000000E7000000E0000000CC000000AF000000
      AB0000005E00B8B8AF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00A4A0A0000000FF000000FF000000FF000000FF000000
      FF00A4A0A000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000FF000000FF00000000000000FF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFF800484875000000
      DF000000F4000101F8000202FF000202FF000000F5000202EC000000C5000000
      AF0000008E0048486500FFFFFB00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF000000FF000000FF0066666600666666000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00000000000000FF000000
      FF00000000000000000000000000FFFFFF00FFFFFF00F0F0DF000E0E82000404
      FF00302FFF003D3DFF003636FF002323FF000303FE003333FF003C3DF6000405
      C5000000A6000F0F5700F0F0E500FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00666666000000FF000000FF00666666006666660066666600666666000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00000000000000FF00000000000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00EFEFDF000D0D8100302F
      FF007A7DFF006D70FF004442FF002D2CFF001919FF004F4BFF00798DFF00292F
      DD000000A2000F0F5400F0F0E600FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF000000FF000000FF00666666006666660066666600666666000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00000000000000FF000000
      FF000000FF000000000080808000FFFFFF00FFFFFF00F1F1E20015157F004644
      FF00B4C4FF00A4BAFF005257EB001E1CE8001C1CFC002429EB004A49FF001112
      D8000000A00016165400F2F2E800FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF0096969600A4A0A000666666006666660042424200666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00000000000000FF00000000000000
      FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00818192001A1A
      D9006463FF007773FF002849BE00005648000C418500004759000000D0000000
      C7000000890080808B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009696
      9600F0FBFF006666660066666600666666006666660066666600666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00000000000000FF000000
      FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9DB002525
      8C002828FF001410FF00002DA700009E000000880000007E1600001E96000000
      B90014147700EBEBE800FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000006666
      6600F0FBFF00F0FBFF0066666600424242006666660066666600666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00000000000000FF000000
      FF0000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5
      BD0027258E001C1FD70017629300036073000189200000288E000000A3000D0D
      6100B2B2CD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF006666660000000000F0FBFF00A4A0A0006666660042424200666666006666
      660066666600FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00000000000000FF000000
      0000000000008080800000000000000000000000000000000000000000000000
      00000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FE00E8E8DB008484940030269D00251B9C00222F7E00151B62007F7E8C00ECEC
      E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00A4A0A000666666004242
      420066666600FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFD00EDEDE000EDECDE00EDEAE200F1EFE600FEFEFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00A4A0
      A00042424200FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FB
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FBFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00808080008080
      8000FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9F9F900F3F3
      F300EEEEEE00FDFDFD00EBEBEB00F9F9F900F4F4F400EEEEEE00FDFDFD00EBEB
      EB00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0004D30400624C3700C09263008870560088705600AD855F00DCA3
      6A00DCA36A00DCA36A00C09263009B795A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000080808000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4F400F0F0F000EBEBEB00EBEB
      EB00EBEBEB00EAEAEA00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EAEAEA00EBEB
      EB00EAEAEA00EDEDED00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0007B607007A5D4100DCA36A00DCA36A00C0926300AD855F00DCA3
      6A00B78B600088705600A5815D00C9966600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000808080008080800000000000000000008080800080808000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00DFDFDF00CACACA00C4C4C400CCCC
      CC00D2D2D400CCCCD700D5D5DE00CDCDD600D2D2DC00D2D2DC00CFCFD700D9D9
      D900CDCDCD00C9C9C900C7C7C700C4C4C400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000C8B0C00AB805500A5815D007E695400A5815D00C9966600DCA3
      6A00DCA36A00C09263009B795A00887056000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000808080000000
      000000000000000000000000000000000000FFFF0000FFFFFF00808080008080
      800080808000FFFFFF0000000000FFFFFF00C4C4C400919191008C8C8C007777
      7A0056564A005A5A0900525212004F4F0D004E4E0C0055551200414109003E3E
      39004E4E4F008C8C8C009292920088888800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0011611100B8895B00DCA36A00C9966600B78B6000AD855F00DCA3
      6A00B78B6000A5815D00C9966600DCA36A0000FF000000FF000000FF00000000
      0000FFFFFF0080808000FFFFFF00FFFFFF008080800080808000FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00808080008080800080808000808080000000
      0000808080000000000080808000FFFF0000FFFF0000FFFFFF0000000000FFFF
      FF008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E1E1
      E6008C8C7200AAAA00008585000089890000898900008B8B00007D7D00002E2E
      290075757700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0012521200D29D67007E6954009B795A00B78B6000D29D6700DCA3
      6A00DCA36A00AB8055006D543D003D33280000FF000000FF000000FF00000000
      0000FFFFFF0080808000FFFFFF00FFFFFF008080800080808000FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00808080008080800080808000808080000000
      0000808080008080800080808000FFFF000080808000FFFFFF0080808000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0087876F00A2A200008080000084840000848400008383000098981A004646
      3F0056565800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003D332800DCA36A00DCA36A00DCA36A00C4925F0093704C005643
      3200433E3A007070700036363600F1F1F10000FF000000FF000000FF00000000
      0000FFFFFF0080808000FFFFFF00FFFFFF008080800080808000FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00808080008080800080808000808080008080
      8000808080008080800080808000FFFF000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0087876F00A2A200008181000084840000848400008484000084840D005151
      49006C6C6E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0003E2030056433200AB8055006D543D003D332800272727009A9A9A004444
      4400D4D4D400FFFFFF0053535300C5C5C50000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      00008080800080808000FFFF00008080800080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0087876F00A4A20000807B00008586000084840000868600006F6F00005050
      480081818300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0004D30400153515000F6F0F0007B6070009A8090053535300F1F1F1004444
      44007E7E7E0044444400272727007E7E7E0000FF000000FF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008080
      800080808000FFFF0000FFFF00008080800080808000FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6
      DB008D8B6D007A89080027563100847F00008585000086860000727200005050
      48007E7E8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C8B0C0019191900535353003636
      3600C5C5C500FFFFFF0044444400FFFFFF0000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000008080
      800080808000FFFF0000808080008080800080808000FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0089896E009397020059670F00868400008484000086860000717100005454
      4C0080808200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C8B0C008C8C8C00FFFFFF005353
      5300C5C5C5008C8C8C00272727004442420000FF000000FF000000FF00000000
      000000808000008080000080800000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00000000008080
      800080808000FFFF000080808000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0087876F00A4A4000085830000848400008484000086860000797902002D2D
      280070707200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00116111003636360036363600453A
      3A00725C5C00AB888800D8AAAA00C99F9F0000FF000000FF000000FF00000000
      00000080800000808000008080000080800000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00000000000000
      00000000800000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      8000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0087876F00A2A200008080000084840000848400008383000098981A004646
      3F0056565800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0007B607000F6F0F0025332300725C
      5C00AB888800544545004A3B2D003D33280000FF000000FF000000FF000000FF
      00000000000000808000008080000080800000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00808080000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0088886F00A2A200007C7C000080800000808000008080000080800D005151
      49006C6C6E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0004D3
      04000A990A004A3B2D00C4925F0026221D0000FF000000FF000000FF000000FF
      000000FF00000000000000000000008080000080800000FFFF0000FFFF0000FF
      FF00000000000000000000FF000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000080808000FFFFFF0000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8D8
      DC007B7B6800A4A40000A0A00000A2A20000A2A20000A4A400008B8B00004E4E
      430081818400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0026221D00312923004444440000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000000000008080000080800000FFFF000000
      00000000000000FF000000FF000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CDCD
      CD009F9F9F0081816F0088886F0087876F0087876F0087876F00868670008F8F
      8E0077777700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0004D304000A990A001161110000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000000000008080000080800000FFFF000000
      000000FF000000FF000000FF000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0E0
      E000CDCDCD00D7D7DB00D6D6DB00D6D6DB00D6D6DB00D6D6DB00D8D8DC00C5C5
      C500C1C1C100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C4921008C49
      21008C4921008C4921008C4921008C4921008C4921008C4921008C4921008C49
      2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006666FF0033009900FFFFFF003300CC000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00007F7F7F007F7F7F00BFBFBF007F7F7F00000000007F7F7F00BFBFBF007F7F
      7F007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008C492100F7DB
      A500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA5008C4921008C49
      21008C492100FFFFFF00FFFFFF00FFFFFF00FFFFFF0004040400040404000404
      0400040404000404040000FFFF003399CC000404040004040400040404000404
      040004040400040404000404040004040400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006666FF00330099000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F7F7F00000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF008C492100F7DB
      A500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA5008C492100EFC7
      AD008C4921008C492100FFFFFF00FFFFFF00FFFFFF0086868600868686008686
      8600868686008686860000808000008080000404040086868600868686008686
      860086868600868686008686860086868600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF0033009900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F
      7F007F7F7F007F7F7F00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF007F7F
      7F007F7F7F007F7F7F0000000000FFFFFF0073756B0073756B008C492100F7DB
      A500FFFFFF008C492100F7DBA500FFFFFF008C492100F7DBA5008C492100EFC7
      AD00EFC7AD008C49210073756B0073756B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DDDDDD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C0000000FF000000FF0066CCCC006666FF0033009900C0C0C000C0C0
      C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000FFFFFF0000FF000000FF00008C492100F7DB
      A5008C4921008C492100F7DBA5008C4921008C492100F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF0000FFFFFF0004040400040404000404
      0400040404000404040004040400040404000404040004040400040404000404
      04000404040004040400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF00FFFFFF00D7D7D700FFFFFF006666FF0033009900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F
      7F007F7F7F007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000FFFFFF0000FF000000FF00008C492100F7DB
      A500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000086868600A4A0A000A4A0A000A4A0
      A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0
      A000A4A0A000B2B2B20004040400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0086868600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000FFFFFF0000FF000000FF00008C492100F7DB
      A500FFFFFF008C492100F7DBA500FFFFFF008C492100F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000086868600DDDDDD00777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      770099999900B2B2B20077777700FFFFFF007777770077777700777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      77007777770096969600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF0000FF000000FF00008C492100F7DB
      A5008C4921008C492100F7DBA5008C4921008C492100F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000086868600DDDDDD00777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      770099999900B2B2B20077777700FFFFFF0077777700DDDDDD00F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800A4A0A000969696005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF0000000000FFFFFF00FFFFFF00FFFFFF0000FF000000FF00008C492100F7DB
      A500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000086868600DDDDDD00D7D7D700CCCC
      CC00CCCCCC00C0C0C000C0C0C000B2B2B200B2B2B200B2B2B200A4A0A0000080
      000099999900B2B2B20077777700FFFFFF0077777700DDDDDD00F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800A4A0A000969696005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF0000000000FFFFFF00FFFFFF00FFFFFF0000FF000000FF00008C4921008C49
      21008C4921008C4921008C4921008C4921008C4921008C4921008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000086868600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B2B2B20077777700FFFFFF0077777700DDDDDD00D7D7D700CCCC
      CC00CCCCCC00C0C0C000C0C0C000B2B2B200B2B2B200A4A0A000A4A0A000A4A0
      A000A4A0A000969696005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF0000000000FFFFFF00FFFFFF00FFFFFF0000FF000000FF00008C492100D696
      1000D6961000D6961000D6961000D6961000D6961000D69610008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF0000FFFFFF0077777700969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960077777700FFFFFF0077777700E3E3E300DDDDDD00D7D7
      D700CCCCCC00C0C0C000C0C0C000B2B2B200B2B2B200A4A0A000A4A0A000FFFF
      FF00A4A0A000969696005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F00BFBFBF00000000000000000000000000BFBFBF007F7F
      7F007F7F7F00FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF00008C49
      2100D6961000D6961000D6961000D6961000D6961000D6961000D69610008C49
      2100EFC7AD008C49210000FF000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B2005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF
      00008C492100D6961000D6961000D6961000D6961000D6961000D6961000D696
      10008C4921008C49210000FF000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      7700777777007777770077777700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF
      000000FF00008C4921008C4921008C4921008C4921008C4921008C4921008C49
      21008C49210000FF000000FF000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000006666660066666600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000F0FBFF00F0FBFF00A4A0A0004242420066666600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF00F0FBFF00A4A0A00066666600666666004242420000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00A4A0A000666666006666660066666600666666006666
      6600A4A0A000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000080808000C0C0C000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000FFFFFF000000000000000000000000000000
      00000000FF000000FF000000000000FFFF0000FFFF0000FFFF000000FF000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00A4A0A000666666006666660066666600666666006666
      6600A4A0A000FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000080808000808080008080
      8000FFFFFF00000000000080800000808000FFFFFF0000800000008000000080
      000000800000C0C0C00000800000008000000080000000008000008000000080
      0000000080000080000000000000FFFFFF00FFFFFF0000800000008000000080
      0000008000000000FF000000FF0000800000008000000000FF000000FF000000
      FF00000080000080000000000000FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00A4A0A000666666006666660066666600666666004242
      420000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000808080000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000FFFFFF000000000000FFFF0000808000FFFFFF0000800000808080000000
      0000C0C0C0008080800000800000008000000080000000000000000000000000
      000000000000008000000000000000000000FFFFFF0000800000808080000000
      0000C0C0C0000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000008000000000000000000000FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF00F0FBFF00A4A0A000666666006666660066666600666666006666
      660000000000FFFFFF00FFFFFF00FFFFFF00808080000000000080808000C0C0
      C000808080000000000000000000C0C0C000C0C0C0008080800080808000C0C0
      C000FFFFFF000000000000FFFF0000808000FFFFFF0000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      000000800000008000000000000000000000FFFFFF0000800000008000000080
      000000800000008000000000FF000000FF000000FF000000FF00008000000080
      000000800000008000000000000000000000FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF0096969600A4A0A000666666006666660042424200666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF00000000000000000080808000C0C0
      C000C0C0C000C0C0C00000000000C0C0C000C0C0C0008080800080808000C0C0
      C000FFFFFF000000000000FFFF0000808000FFFFFF0000800000808080000000
      0000C0C0C0008080800000800000008000000080000000800000008000000080
      000000800000008000000000000000000000FFFFFF0000800000808080000000
      0000C0C0C00080808000008000000000FF000000FF000000FF00008000000080
      000000800000008000000000000000000000FFFFFF00FFFFFF00000000009696
      9600F0FBFF006666660066666600666666006666660066666600666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00000000008080
      8000FFFFFF00C0C0C00000000000C0C0C000C0C0C0008080800080808000C0C0
      C000FFFFFF000000000000FFFF0000808000FFFFFF0000800000008000000080
      0000008000000080000000800000C0C0C000C0C0C00000800000808080008080
      800000800000C0C0C0000000000000000000FFFFFF0000800000008000000080
      000000800000008000000000FF000000FF000000FF000000FF000000FF008080
      800000800000C0C0C0000000000000000000FFFFFF00FFFFFF00000000006666
      6600F0FBFF00F0FBFF0066666600424242006666660066666600666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF000000000080808000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000C0C0C0008080800080808000C0C0
      C000FFFFFF000000000000FFFF0000808000FFFFFF0000800000808080000000
      0000C0C0C000808080000080000000800000C0C0C00000800000808080008080
      800000800000008000000000000000000000FFFFFF0000800000808080000000
      0000C0C0C0000000FF000000FF000000FF00C0C0C0000000FF000000FF008080
      800000800000008000000000000000000000FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00F0FBFF00A4A0A0006666660042424200666666006666
      660066666600FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0C000C0C0
      C000FFFFFF000000000000808000FFFFFF00FFFFFF0000800000C0C0C0000080
      000000800000008000000080000000800000C0C0C00000800000C0C0C0000080
      0000008000000080000000000000FFFFFF00FFFFFF0000800000C0C0C0000080
      00000000FF000000FF000000FF0000800000C0C0C000008000000000FF000000
      FF00008000000080000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00A4A0A000666666004242
      420066666600FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000FFFFFF00FFFFFF00C0C0C000C0C0C0000000
      FF000000FF000000FF00C0C0C000C0C0C000C0C0C000C0C0C0000000FF000000
      FF000000FF00C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00A4A0
      A00042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FB
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FBFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF0000F9E70000E01F0000E0C70000
      CC070000C01F000084030000C01F000000010000C007000000010000C0070000
      00010000C007000000010000C007000000010000C007000080030000C0070000
      80030000C007000080030000C007000080030000E007000080030000F0070000
      C0070000FC070000E00F0000FF1F0000CE81FFFFC007F8000000F84F0001F800
      0000C0330000F800000080450000F8000B000053E007F8000B00005DE007F800
      0B00007FE007F0000000E07FE007F0001FFFC077E007FF000000C075E007FF00
      0000C03DE007FF000000C12DE007FF000000F001E007FFE00000F147E007FFF8
      0000F807E007FFF80000FC3FE007FFFFFFFFFFFFFC1FFFFFFFFFFFFFF007C00F
      FFFFF93FE003C0078000FC7FC001C0038000FC7FC0010000FEFF8003C0010000
      8003F29FC00100000001FEFFC001000000010003E003000000010001F1C70000
      00010001F1C7000000010001F1C7000080010011F0070000FFFF8001F80F0000
      FFFFC001FC1F0000FFFFFFFFFFFF0000F9FFFFFFFFFFFFFFE0FFFFFFFFFFCFF9
      C07FFFFFFFFFC7F1C01FFFFBFE07E203C0077F8300010001C0073F0880018001
      C0078E0880008000C007000880008000C007000880008000C007480880008000
      C0070E0880008000C0073F0980018001E0077FFB80018001F007FFFFFFFFC7E3
      FC07FFFFFFFFCFF3FF1FFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu_Door: TPopupMenu
    AutoHotkeys = maManual
    Left = 347
    Top = 149
    object pm_modechange: TMenuItem
      Caption = #47784#46300#48320#44221
      object pm_OpenMode: TMenuItem
        Caption = #44060#48169#47784#46300
        OnClick = pm_OpenModeClick
      end
      object pm_OperateMode: TMenuItem
        Caption = #50868#50689#47784#46300
        OnClick = pm_OperateModeClick
      end
    end
    object pm_StateCheck: TMenuItem
      Caption = #49345#53468#54869#51064
      OnClick = pm_StateCheckClick
    end
    object pm_DoorOpen: TMenuItem
      Caption = #52636#51077#49849#51064
      OnClick = pm_DoorOpenClick
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object N18: TMenuItem
      Caption = #54868#47732
      object N19: TMenuItem
        Caption = #53360#50500#51060#53080
        OnClick = N19Click
      end
      object N20: TMenuItem
        Caption = #51089#51008#50500#51060#53080
        OnClick = N20Click
      end
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #50948#52824#51221#48372
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #44592#44592#51221#48372
      OnClick = N4Click
    end
  end
  object PopupMenu_IntiDoor: TPopupMenu
    AutoHotkeys = maManual
    Left = 315
    Top = 149
    object pm_intiModeChange: TMenuItem
      Caption = #47784#46300#48320#44221
      object pm_intiOpenMode: TMenuItem
        Caption = #44060#48169#47784#46300
        OnClick = pm_intiOpenModeClick
      end
      object pm_intiOperateMode: TMenuItem
        Caption = #50868#50689#47784#46300
        OnClick = pm_intiOperateModeClick
      end
    end
    object pm_intiStateCheck: TMenuItem
      Caption = #49345#53468#54869#51064
      OnClick = pm_intiStateCheckClick
    end
    object pm_intiDoorOpen: TMenuItem
      Caption = #52636#51077#49849#51064
      OnClick = pm_intiDoorOpenClick
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N13: TMenuItem
      Caption = #54868#47732
      object N15: TMenuItem
        Caption = #53360#50500#51060#53080
        OnClick = N15Click
      end
      object N16: TMenuItem
        Caption = #51089#51008#50500#51060#53080
        OnClick = N16Click
      end
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #50948#52824#51221#48372
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #44592#44592#51221#48372
      OnClick = N2Click
    end
  end
  object Popup_Device: TPopupMenu
    AutoHotkeys = maManual
    Left = 115
    Top = 333
    object MenuItem7: TMenuItem
      Caption = #44428#54620' '#45796#50868#47196#46300
      object Menu_DeviceAllCardDown: TMenuItem
        Caption = #51204#52404#44428#54620#51116#51204#49569
        OnClick = Menu_DeviceAllCardDownClick
      end
      object Menu_DeviceCardDown: TMenuItem
        Caption = #48120#51204#49569#44428#54620#51204#49569
        OnClick = Menu_DeviceCardDownClick
      end
    end
    object Menu_DeviceTimeSync: TMenuItem
      Caption = #49884#44036#46041#44592#54868
      OnClick = Menu_DeviceTimeSyncClick
    end
    object Menu_DeviceReboot: TMenuItem
      Caption = #44208#54633#51109#52824#47532#49483
      OnClick = Menu_DeviceRebootClick
    end
  end
  object Popup_Locate: TPopupMenu
    AutoHotkeys = maManual
    Left = 51
    Top = 333
    object Menu_CurLocate: TMenuItem
      Caption = #54788#51116#50948#52824#44288#51228
      Visible = False
      OnClick = Menu_CurLocateClick
    end
    object mn_LocationMap: TMenuItem
      Caption = #50948#52824#51221#48372
      OnClick = mn_LocationMapClick
    end
  end
  object PopupMenu_AlarmSetting: TPopupMenu
    AutoHotkeys = maManual
    Left = 499
    Top = 5
    object menu_Alarm: TMenuItem
      Caption = #44221#44228#47784#46300
      OnClick = menu_AlarmClick
    end
    object menu_AlarmDisable: TMenuItem
      Caption = #54644#51228#47784#46300
      OnClick = menu_AlarmDisableClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #50948#52824#51221#48372
    end
    object N7: TMenuItem
      Caption = #44592#44592#51221#48372
    end
  end
  object PopupMenu_IntAlarm: TPopupMenu
    AutoHotkeys = maManual
    Left = 771
    Top = 149
    object Menu_IntAlarmSetting: TMenuItem
      Caption = #44221#44228#47784#46300
      OnClick = Menu_IntAlarmSettingClick
    end
    object Menu_IntAlarmDisable: TMenuItem
      Caption = #54644#51228#47784#46300
      OnClick = Menu_IntAlarmDisableClick
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object N11: TMenuItem
      Caption = #50948#52824#51221#48372
      OnClick = N11Click
    end
    object N12: TMenuItem
      Caption = #44592#44592#51221#48372
      OnClick = N12Click
    end
  end
  object PopupMenu_Alarm: TPopupMenu
    AutoHotkeys = maManual
    Left = 731
    Top = 149
    object MenuItem1: TMenuItem
      Caption = #44221#44228#47784#46300
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = #54644#51228#47784#46300
      OnClick = MenuItem2Click
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object MenuItem4: TMenuItem
      Caption = #50948#52824#51221#48372
      OnClick = MenuItem4Click
    end
    object MenuItem5: TMenuItem
      Caption = #44592#44592#51221#48372
      OnClick = MenuItem5Click
    end
  end
  object PopupMenu_Zone: TPopupMenu
    AutoHotkeys = maManual
    Left = 403
    Top = 405
    object MenuItem11: TMenuItem
      Caption = #44048#51648#51316#50948#52824#51221#48372
      OnClick = MenuItem11Click
    end
  end
  object PopupMenu_intZone: TPopupMenu
    AutoHotkeys = maManual
    Left = 595
    Top = 405
    object MenuItem6: TMenuItem
      Caption = #44048#51648#51316#50948#52824#51221#48372
      OnClick = MenuItem6Click
    end
  end
  object PopupMenu_Sensor: TPopupMenu
    AutoHotkeys = maManual
    Left = 619
    Top = 157
    object MenuItem12: TMenuItem
      Caption = #46041#51089
      OnClick = MenuItem12Click
    end
    object MenuItem13: TMenuItem
      Caption = #51221#51648
      OnClick = MenuItem13Click
    end
  end
end
