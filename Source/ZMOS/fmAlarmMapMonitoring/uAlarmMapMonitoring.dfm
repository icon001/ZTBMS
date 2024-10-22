inherited fmAlarmMapMonitoring: TfmAlarmMapMonitoring
  Left = 281
  Top = 216
  Width = 798
  Height = 568
  Caption = #44288#51228#49884#49828#53596
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
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
  object RzSplitter1: TRzSplitter [0]
    Left = 0
    Top = 0
    Width = 790
    Height = 534
    Position = 0
    Percent = 0
    UsePercent = True
    RealTimeDrag = True
    UpperLeft.BorderOuter = fsFlatRounded
    LowerRight.BorderOuter = fsFlatRounded
    SplitterWidth = 1
    Align = alClient
    TabOrder = 0
    UseGradients = True
    BarSize = (
      0
      0
      1
      534)
    UpperLeftControls = ()
    LowerRightControls = ()
    object RzPanel3: TRzPanel
      Left = 0
      Top = 0
      Width = 790
      Height = 534
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 0
      object sp_Location: TRzSplitter
        Left = 0
        Top = 0
        Width = 790
        Height = 534
        Position = 230
        Percent = 29
        RealTimeDrag = True
        UpperLeft.BorderOuter = fsFlatRounded
        LowerRight.BorderOuter = fsFlatRounded
        HotSpotVisible = True
        SplitterWidth = 7
        Align = alClient
        TabOrder = 0
        UseGradients = True
        BarSize = (
          230
          0
          237
          534)
        UpperLeftControls = (
          PageControl1)
        LowerRightControls = (
          RzPanel2)
        object PageControl1: TPageControl
          Left = 2
          Top = 2
          Width = 226
          Height = 530
          ActivePage = tbLOCATE
          Align = alClient
          TabOrder = 0
          object tbLOCATE: TTabSheet
            Caption = #50948#52824#48324#44396#49457
            object GroupBox2: TGroupBox
              Left = 0
              Top = 0
              Width = 218
              Height = 503
              Align = alClient
              TabOrder = 0
              object Shader2: TShader
                Left = 2
                Top = 14
                Width = 214
                Height = 9
                Align = alTop
                TabOrder = 1
                FromColor = 15591915
                ToColor = clSilver
                Direction = False
                Version = '1.4.0.0'
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
              object BuildingListView: TListView
                Left = 2
                Top = 23
                Width = 214
                Height = 478
                Align = alClient
                BevelOuter = bvNone
                BevelKind = bkTile
                BorderStyle = bsNone
                Columns = <
                  item
                    Caption = #50948#52824#51221#48372
                    Width = 200
                  end>
                Ctl3D = False
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
                  4B000000020000000800000000000000FFFFFFFF010000000000000007BABBB0
                  FC31C3FE08C0A7C4A1C1A4BAB808000000FFFFFFFFFFFFFFFF00000000000000
                  0007BABBB0FC32C3FEFFFF}
                ReadOnly = True
                RowSelect = True
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                SmallImages = toolslist
                SortType = stText
                TabOrder = 0
                ViewStyle = vsList
                OnClick = BuildingListViewDblClick
                OnDblClick = BuildingListViewDblClick
              end
            end
          end
          object tbDEVICE: TTabSheet
            Caption = #44592#44592#48324#44396#49457
            ImageIndex = 1
            object GroupBox3: TGroupBox
              Left = 0
              Top = 0
              Width = 218
              Height = 503
              Align = alClient
              TabOrder = 0
              object TreeView_Device: TTreeView
                Left = 2
                Top = 23
                Width = 214
                Height = 478
                Align = alClient
                BorderStyle = bsNone
                HotTrack = True
                Images = toolslist
                Indent = 19
                PopupMenu = Popup_Device
                TabOrder = 0
                OnClick = TreeView_DeviceClick
              end
              object Shader3: TShader
                Left = 2
                Top = 14
                Width = 214
                Height = 9
                Align = alTop
                TabOrder = 1
                FromColor = 15591915
                ToColor = clSilver
                Direction = False
                Version = '1.4.0.0'
              end
            end
          end
        end
        object RzPanel2: TRzPanel
          Left = 2
          Top = 2
          Width = 549
          Height = 530
          Align = alClient
          BorderOuter = fsNone
          BorderWidth = 1
          TabOrder = 0
          object sp_State: TRzSplitter
            Left = 1
            Top = 1
            Width = 547
            Height = 528
            Orientation = orVertical
            Position = 420
            Percent = 80
            UsePercent = True
            RealTimeDrag = True
            HotSpotVisible = True
            HotSpotDirection = hsdMax
            SplitterWidth = 7
            Align = alClient
            TabOrder = 0
            UseGradients = True
            BarSize = (
              0
              420
              547
              427)
            UpperLeftControls = (
              RzLabel1
              Label_CurentIp
              RzPanel4
              PageControl2)
            LowerRightControls = (
              RzPageControl1)
            object RzLabel1: TRzLabel
              Left = 15
              Top = 18
              Width = 6
              Height = 14
              Font.Charset = ANSI_CHARSET
              Font.Color = clYellow
              Font.Height = -12
              Font.Name = #44404#47548
              Font.Style = []
              ParentFont = False
              Transparent = True
              BlinkIntervalOff = 1500
              TextStyle = tsShadow
            end
            object Label_CurentIp: TRzLabel
              Left = 14
              Top = 3
              Width = 6
              Height = 14
              Font.Charset = ANSI_CHARSET
              Font.Color = clLime
              Font.Height = -12
              Font.Name = #44404#47548
              Font.Style = []
              ParentFont = False
              Transparent = True
              BlinkIntervalOff = 1500
              TextStyle = tsShadow
            end
            object RzPanel4: TRzPanel
              Left = 0
              Top = 0
              Width = 547
              Height = 5
              Align = alTop
              BorderOuter = fsNone
              TabOrder = 0
            end
            object PageControl2: TPageControl
              Left = 0
              Top = 5
              Width = 547
              Height = 415
              ActivePage = BuildingTab
              Align = alClient
              TabOrder = 1
              object BuildingTab: TTabSheet
                Caption = #48716#46377
                ImageIndex = 3
                object pan_Map: TPanel
                  Left = 0
                  Top = 0
                  Width = 539
                  Height = 388
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 0
                  object ImageMap: TImage
                    Left = 0
                    Top = 0
                    Width = 539
                    Height = 388
                    Align = alClient
                    PopupMenu = pm_mapsize
                    Stretch = True
                  end
                  object Image104: TImage
                    Left = 608
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image103: TImage
                    Left = 584
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image101: TImage
                    Left = 536
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image102: TImage
                    Left = 560
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image78: TImage
                    Left = 608
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image52: TImage
                    Left = 608
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image51: TImage
                    Left = 608
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image49: TImage
                    Left = 584
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image50: TImage
                    Left = 584
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image77: TImage
                    Left = 584
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image76: TImage
                    Left = 560
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image48: TImage
                    Left = 560
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image47: TImage
                    Left = 560
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image23: TImage
                    Left = 536
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image46: TImage
                    Left = 536
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image75: TImage
                    Left = 536
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image100: TImage
                    Left = 512
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image74: TImage
                    Left = 512
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image45: TImage
                    Left = 512
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image22: TImage
                    Left = 512
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image21: TImage
                    Left = 488
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image44: TImage
                    Left = 488
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image73: TImage
                    Left = 488
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image99: TImage
                    Left = 488
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image98: TImage
                    Left = 464
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image72: TImage
                    Left = 464
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image43: TImage
                    Left = 464
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image20: TImage
                    Left = 464
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image19: TImage
                    Left = 440
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image42: TImage
                    Left = 440
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image71: TImage
                    Left = 440
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image97: TImage
                    Left = 440
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image96: TImage
                    Left = 416
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image70: TImage
                    Left = 416
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image41: TImage
                    Left = 416
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image18: TImage
                    Left = 416
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image17: TImage
                    Left = 392
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image40: TImage
                    Left = 392
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image69: TImage
                    Left = 392
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image95: TImage
                    Left = 392
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image94: TImage
                    Left = 368
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image68: TImage
                    Left = 368
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image39: TImage
                    Left = 368
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image16: TImage
                    Left = 368
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image15: TImage
                    Left = 344
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image38: TImage
                    Left = 344
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image67: TImage
                    Left = 344
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image93: TImage
                    Left = 344
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image92: TImage
                    Left = 320
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image66: TImage
                    Left = 320
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image37: TImage
                    Left = 320
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image14: TImage
                    Left = 320
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image13: TImage
                    Left = 296
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image36: TImage
                    Left = 296
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image65: TImage
                    Left = 296
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image91: TImage
                    Left = 296
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image90: TImage
                    Left = 272
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image64: TImage
                    Left = 272
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image35: TImage
                    Left = 272
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image12: TImage
                    Left = 272
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image11: TImage
                    Left = 248
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image34: TImage
                    Left = 248
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image63: TImage
                    Left = 248
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image89: TImage
                    Left = 248
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image88: TImage
                    Left = 224
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image62: TImage
                    Left = 224
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image33: TImage
                    Left = 224
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image10: TImage
                    Left = 224
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image9: TImage
                    Left = 200
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image32: TImage
                    Left = 200
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image61: TImage
                    Left = 200
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image87: TImage
                    Left = 200
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image86: TImage
                    Left = 176
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image60: TImage
                    Left = 176
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image31: TImage
                    Left = 176
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image8: TImage
                    Left = 176
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image7: TImage
                    Left = 152
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image30: TImage
                    Left = 152
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image59: TImage
                    Left = 152
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image85: TImage
                    Left = 152
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image84: TImage
                    Left = 128
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image58: TImage
                    Left = 128
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image29: TImage
                    Left = 128
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image6: TImage
                    Left = 128
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image5: TImage
                    Left = 104
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image28: TImage
                    Left = 104
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image57: TImage
                    Left = 104
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image83: TImage
                    Left = 104
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image82: TImage
                    Left = 80
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image56: TImage
                    Left = 80
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image27: TImage
                    Left = 80
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image4: TImage
                    Left = 80
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image3: TImage
                    Left = 56
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image26: TImage
                    Left = 56
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image55: TImage
                    Left = 56
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image81: TImage
                    Left = 56
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image80: TImage
                    Left = 32
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image54: TImage
                    Left = 32
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image25: TImage
                    Left = 32
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image2: TImage
                    Left = 32
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image1: TImage
                    Left = 8
                    Top = 8
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image24: TImage
                    Left = 8
                    Top = 32
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image53: TImage
                    Left = 8
                    Top = 56
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                  object Image79: TImage
                    Left = 8
                    Top = 80
                    Width = 20
                    Height = 20
                    ParentShowHint = False
                    ShowHint = True
                    Stretch = True
                    Visible = False
                    OnDblClick = Image1DblClick
                    OnMouseMove = Image1MouseMove
                  end
                end
              end
            end
            object RzPageControl1: TRzPageControl
              Left = 0
              Top = 0
              Width = 547
              Height = 101
              ActivePage = TabSheet1
              Align = alClient
              TabIndex = 0
              TabOrder = 0
              FixedDimension = 19
              object TabSheet1: TRzTabSheet
                Caption = #51060#48292#53944#51312#54924
                object sg_Alarm: TAdvStringGrid
                  Left = 0
                  Top = 0
                  Width = 543
                  Height = 78
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
                  TabOrder = 0
                  OnColumnMoved = sg_AlarmColumnMoved
                  ActiveCellFont.Charset = DEFAULT_CHARSET
                  ActiveCellFont.Color = clWindowText
                  ActiveCellFont.Height = -11
                  ActiveCellFont.Name = 'Tahoma'
                  ActiveCellFont.Style = [fsBold]
                  ColumnHeaders.Strings = (
                    #48156#49373#51068#51088
                    #48169#48276#44396#50669
                    #53440#51077
                    #51060#48292#53944#45236#50857)
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
                  EnhRowColMove = False
                  Filter = <>
                  FilterDropDown.Font.Charset = DEFAULT_CHARSET
                  FilterDropDown.Font.Color = clWindowText
                  FilterDropDown.Font.Height = -11
                  FilterDropDown.Font.Name = 'MS Sans Serif'
                  FilterDropDown.Font.Style = []
                  FilterDropDownClear = '(All)'
                  FixedColWidth = 147
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
                  ShowSelection = False
                  Version = '6.0.4.4'
                  ColWidths = (
                    147
                    144
                    104
                    352)
                end
              end
            end
          end
        end
      end
    end
  end
  object pan_Message: TPanel [1]
    Left = 91
    Top = 230
    Width = 761
    Height = 105
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    ParentBackground = False
    TabOrder = 1
    Visible = False
    object btn_AlarmConfirm: TSpeedButton
      Left = 304
      Top = 64
      Width = 137
      Height = 25
      Caption = #47700#49464#51648' '#54869#51064
      OnClick = btn_AlarmConfirmClick
    end
    object st_Message: TStaticText
      Left = 1
      Top = 1
      Width = 759
      Height = 56
      Align = alTop
      AutoSize = False
      Caption = #44048#51648#51316#51060#49345#48156#49373' !!!'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clRed
      Font.Height = -48
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
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
        CommandName = 'Close'
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
      end
      item
        CommandName = 'GRADEREFRESH'
        CommandKind = 0
        Name = 'TCommand7'
      end
      item
        CommandName = 'FIRERECOVER'
        CommandKind = 0
        Name = 'TFIRERECOVER'
        OnExecute = CommandArrayCommandsTFIRERECOVERExecute
      end>
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
    end
    object Action_AlarmLoad: TAction
      Caption = 'Action_AlarmLoad'
    end
    object Action_FoodLoad: TAction
      Caption = 'Action_FoodLoad'
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
    end
    object Action_intAlarmHistory: TAction
      Caption = #48169#48276#44396#50669#51060#47141#51312#54924
    end
    object Action_AlarmHistory: TAction
      Caption = #48169#48276#44396#50669#51060#47141#51312#54924
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
      000000000000000000000000000000000000FFFFFF00FFFFFF00F9F9F900F3F3
      F300EEEEEE00FDFDFD00EBEBEB00F9F9F900F4F4F400EEEEEE00FDFDFD00EBEB
      EB00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4F4F400F0F0F000EBEBEB00EBEB
      EB00EBEBEB00EAEAEA00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EAEAEA00EBEB
      EB00EAEAEA00EDEDED00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EAEAE10087878B007E7E84007E7E840087878C00EAEAE200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFDFDF00CACACA00C4C4C400CCCC
      CC00D2D2D400CCCCD700D5D5DE00CDCDD600D2D2DC00D2D2DC00CFCFD700D9D9
      D900CDCDCD00C9C9C900C7C7C700C4C4C400FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F3
      EC007F7F860013135B0000007400000076000000770000007200131357007F7F
      8700F3F3EE00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C4C4C400919191008C8C8C007777
      7A0056564A005A5A0900525212004F4F0D004E4E0C0055551200414109003E3E
      39004E4E4F008C8C8C009292920088888800FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF8004E4E
      6F00000086000000B8000000B7000000B6000000B7000000AC0000009F000000
      6E004E4E6D00FFFFF900FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00E1E1
      E6008C8C7200AAAA00008585000089890000898900008B8B00007D7D00002E2E
      290075757700FFFFFF00FFFFFF00FFFFFF00000000000000000080808000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00B8B8AC000000
      83000000E1000000E5000000E6000000E7000000E0000000CC000000AF000000
      AB0000005E00B8B8AF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0087876F00A2A200008080000084840000848400008383000098981A004646
      3F0056565800FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF000000FF000000FF00000000000000FF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFF800484875000000
      DF000000F4000101F8000202FF000202FF000000F5000202EC000000C5000000
      AF0000008E0048486500FFFFFB00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0087876F00A2A200008181000084840000848400008484000084840D005151
      49006C6C6E00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00000000000000FF000000
      FF00000000000000000000000000FFFFFF00FFFFFF00F0F0DF000E0E82000404
      FF00302FFF003D3DFF003636FF002323FF000303FE003333FF003C3DF6000405
      C5000000A6000F0F5700F0F0E500FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0087876F00A4A20000807B00008586000084840000868600006F6F00005050
      480081818300FFFFFF00FFFFFF00FFFFFF0000000000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00000000000000FF00000000000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00EFEFDF000D0D8100302F
      FF007A7DFF006D70FF004442FF002D2CFF001919FF004F4BFF00798DFF00292F
      DD000000A2000F0F5400F0F0E600FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00D6D6
      DB008D8B6D007A89080027563100847F00008585000086860000727200005050
      48007E7E8000FFFFFF00FFFFFF00FFFFFF0080808000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00000000000000FF000000
      FF000000FF000000000080808000FFFFFF00FFFFFF00F1F1E20015157F004644
      FF00B4C4FF00A4BAFF005257EB001E1CE8001C1CFC002429EB004A49FF001112
      D8000000A00016165400F2F2E800FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0089896E009397020059670F00868400008484000086860000717100005454
      4C0080808200FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00000000000000FF00000000000000
      FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00818192001A1A
      D9006463FF007773FF002849BE00005648000C418500004759000000D0000000
      C7000000890080808B00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0087876F00A4A4000085830000848400008484000086860000797902002D2D
      280070707200FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00000000000000FF000000
      FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9DB002525
      8C002828FF001410FF00002DA700009E000000880000007E1600001E96000000
      B90014147700EBEBE800FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0087876F00A2A200008080000084840000848400008383000098981A004646
      3F0056565800FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF0000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5
      BD0027258E001C1FD70017629300036073000189200000288E000000A3000D0D
      6100B2B2CD00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00D6D6
      DB0088886F00A2A200007C7C000080800000808000008080000080800D005151
      49006C6C6E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      0000000000008080800000000000000000000000000000000000000000000000
      00000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FE00E8E8DB008484940030269D00251B9C00222F7E00151B62007F7E8C00ECEC
      E100FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00D8D8
      DC007B7B6800A4A40000A0A00000A2A20000A2A20000A4A400008B8B00004E4E
      430081818400FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFD00EDEDE000EDECDE00EDEAE200F1EFE600FEFEFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00CDCD
      CD009F9F9F0081816F0088886F0087876F0087876F0087876F00868670008F8F
      8E0077777700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00E0E0
      E000CDCDCD00D7D7DB00D6D6DB00D6D6DB00D6D6DB00D6D6DB00D8D8DC00C5C5
      C500C1C1C100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      8000FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0004D30400624C3700C09263008870560088705600AD855F00DCA3
      6A00DCA36A00DCA36A00C09263009B795A00FFFFFF00FFFFFF008C4921008C49
      21008C4921008C4921008C4921008C4921008C4921008C4921008C4921008C49
      2100FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000080808000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0007B607007A5D4100DCA36A00DCA36A00C0926300AD855F00DCA3
      6A00B78B600088705600A5815D00C9966600FFFFFF00FFFFFF008C492100F7DB
      A500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA5008C4921008C49
      21008C492100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000808080008080800000000000000000008080800080808000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000C8B0C00AB805500A5815D007E695400A5815D00C9966600DCA3
      6A00DCA36A00C09263009B795A0088705600FFFFFF00FFFFFF008C492100F7DB
      A500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA5008C492100EFC7
      AD008C4921008C492100FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000808080000000
      000000000000000000000000000000000000FFFF0000FFFFFF00808080008080
      800080808000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0011611100B8895B00DCA36A00C9966600B78B6000AD855F00DCA3
      6A00B78B6000A5815D00C9966600DCA36A0073756B0073756B008C492100F7DB
      A500FFFFFF008C492100F7DBA500FFFFFF008C492100F7DBA5008C492100EFC7
      AD00EFC7AD008C49210073756B0073756B0000FF000000FF000000FF00000000
      0000FFFFFF0080808000FFFFFF00FFFFFF008080800080808000FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00808080008080800080808000808080000000
      0000808080000000000080808000FFFF0000FFFF0000FFFFFF0000000000FFFF
      FF008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0012521200D29D67007E6954009B795A00B78B6000D29D6700DCA3
      6A00DCA36A00AB8055006D543D003D33280000FF000000FF00008C492100F7DB
      A5008C4921008C492100F7DBA5008C4921008C492100F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF000000FF00000000
      0000FFFFFF0080808000FFFFFF00FFFFFF008080800080808000FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00808080008080800080808000808080000000
      0000808080008080800080808000FFFF000080808000FFFFFF0080808000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003D332800DCA36A00DCA36A00DCA36A00C4925F0093704C005643
      3200433E3A007070700036363600F1F1F10000FF000000FF00008C492100F7DB
      A500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF000000FF00000000
      0000FFFFFF0080808000FFFFFF00FFFFFF008080800080808000FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00808080008080800080808000808080008080
      8000808080008080800080808000FFFF000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0003E2030056433200AB8055006D543D003D332800272727009A9A9A004444
      4400D4D4D400FFFFFF0053535300C5C5C50000FF000000FF00008C492100F7DB
      A500FFFFFF008C492100F7DBA500FFFFFF008C492100F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      00008080800080808000FFFF00008080800080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0004D30400153515000F6F0F0007B6070009A8090053535300F1F1F1004444
      44007E7E7E0044444400272727007E7E7E0000FF000000FF00008C492100F7DB
      A5008C4921008C492100F7DBA5008C4921008C492100F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008080
      800080808000FFFF0000FFFF00008080800080808000FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C8B0C0019191900535353003636
      3600C5C5C500FFFFFF0044444400FFFFFF0000FF000000FF00008C492100F7DB
      A500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000008080
      800080808000FFFF0000808080008080800080808000FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C8B0C008C8C8C00FFFFFF005353
      5300C5C5C5008C8C8C00272727004442420000FF000000FF00008C4921008C49
      21008C4921008C4921008C4921008C4921008C4921008C4921008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF000000FF00000000
      000000808000008080000080800000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00000000008080
      800080808000FFFF000080808000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00116111003636360036363600453A
      3A00725C5C00AB888800D8AAAA00C99F9F0000FF000000FF00008C492100D696
      1000D6961000D6961000D6961000D6961000D6961000D69610008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF000000FF00000000
      00000080800000808000008080000080800000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00000000000000
      00000000800000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      8000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0007B607000F6F0F0025332300725C
      5C00AB888800544545004A3B2D003D33280000FF000000FF000000FF00008C49
      2100D6961000D6961000D6961000D6961000D6961000D6961000D69610008C49
      2100EFC7AD008C49210000FF000000FF000000FF000000FF000000FF000000FF
      00000000000000808000008080000080800000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00808080000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0004D3
      04000A990A004A3B2D00C4925F0026221D0000FF000000FF000000FF000000FF
      00008C492100D6961000D6961000D6961000D6961000D6961000D6961000D696
      10008C4921008C49210000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000000000000000000008080000080800000FFFF0000FFFF0000FF
      FF00000000000000000000FF000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000080808000FFFFFF0000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0026221D00312923004444440000FF000000FF000000FF000000FF
      000000FF00008C4921008C4921008C4921008C4921008C4921008C4921008C49
      21008C49210000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000000000008080000080800000FFFF000000
      00000000000000FF000000FF000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0004D304000A990A001161110000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000000000008080000080800000FFFF000000
      000000FF000000FF000000FF000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006666FF0033009900FFFFFF003300CC000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00007F7F7F007F7F7F00BFBFBF007F7F7F00000000007F7F7F00BFBFBF007F7F
      7F007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF0004040400040404000404
      0400040404000404040000FFFF003399CC000404040004040400040404000404
      040004040400040404000404040004040400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006666FF00330099000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F7F7F00000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000FFFFFF000000000000000000000000000000
      00000000FF000000FF000000000000FFFF0000FFFF0000FFFF000000FF000000
      FF000000FF000000000000000000FFFFFF00FFFFFF0086868600868686008686
      8600868686008686860000808000008080000404040086868600868686008686
      860086868600868686008686860086868600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF0033009900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F
      7F007F7F7F007F7F7F00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF007F7F
      7F007F7F7F007F7F7F0000000000FFFFFF00FFFFFF0000800000008000000080
      0000008000000000FF000000FF0000800000008000000000FF000000FF000000
      FF00000080000080000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DDDDDD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C0000000FF000000FF0066CCCC006666FF0033009900C0C0C000C0C0
      C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000FFFFFF00FFFFFF0000800000808080000000
      0000C0C0C0000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000008000000000000000000000FFFFFF0004040400040404000404
      0400040404000404040004040400040404000404040004040400040404000404
      04000404040004040400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF00FFFFFF00D7D7D700FFFFFF006666FF0033009900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F
      7F007F7F7F007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000FFFFFF00FFFFFF0000800000008000000080
      000000800000008000000000FF000000FF000000FF000000FF00008000000080
      00000080000000800000000000000000000086868600A4A0A000A4A0A000A4A0
      A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0
      A000A4A0A000B2B2B20004040400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0086868600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000FFFFFF00FFFFFF0000800000808080000000
      0000C0C0C00080808000008000000000FF000000FF000000FF00008000000080
      00000080000000800000000000000000000086868600DDDDDD00777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      770099999900B2B2B20077777700FFFFFF007777770077777700777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      77007777770096969600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000800000008000000080
      000000800000008000000000FF000000FF000000FF000000FF000000FF008080
      800000800000C0C0C000000000000000000086868600DDDDDD00777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      770099999900B2B2B20077777700FFFFFF0077777700DDDDDD00F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800A4A0A000969696005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000808080000000
      0000C0C0C0000000FF000000FF000000FF00C0C0C0000000FF000000FF008080
      80000080000000800000000000000000000086868600DDDDDD00D7D7D700CCCC
      CC00CCCCCC00C0C0C000C0C0C000B2B2B200B2B2B200B2B2B200A4A0A0000080
      000099999900B2B2B20077777700FFFFFF0077777700DDDDDD00F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800A4A0A000969696005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000C0C0C0000080
      00000000FF000000FF000000FF0000800000C0C0C000008000000000FF000000
      FF00008000000080000000000000FFFFFF0086868600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B2B2B20077777700FFFFFF0077777700DDDDDD00D7D7D700CCCC
      CC00CCCCCC00C0C0C000C0C0C000B2B2B200B2B2B200A4A0A000A4A0A000A4A0
      A000A4A0A000969696005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C0000000
      FF000000FF000000FF00C0C0C000C0C0C000C0C0C000C0C0C0000000FF000000
      FF000000FF00C0C0C00000000000FFFFFF00FFFFFF0077777700969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960077777700FFFFFF0077777700E3E3E300DDDDDD00D7D7
      D700CCCCCC00C0C0C000C0C0C000B2B2B200B2B2B200A4A0A000A4A0A000FFFF
      FF00A4A0A000969696005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F00BFBFBF00000000000000000000000000BFBFBF007F7F
      7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B2005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      7700777777007777770077777700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000006666660066666600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000F0FBFF00F0FBFF00A4A0A0004242420066666600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000F0FBFF000000FF000000FF000000FF000000FF000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0018A5C60018A5
      C60018A5C60018A5C60018A5C60018A5C60018A5C60018A5C60018A5C60018A5
      C60018A5C60018A5C600FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF00F0FBFF00A4A0A00066666600666666004242420000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF00F0FBFF00A4A0A000666666000000FF000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF009CDEEF0094F7FF0073DE
      F70073DEF70073DEF70073DEF7000000FF000000FF0073DEF70073DEF70073DE
      F70073DEF7004AC6E70018A5C600FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00A4A0A000666666006666660066666600666666006666
      6600A4A0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00A4A0A0000000FF000000FF000000FF000000FF000000
      FF00A4A0A000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF0094F7FF0073DE
      F70073DEF70073DEF70073DEF7000000FF000000FF0073DEF70073DEF70073DE
      F70073DEF70018A5C600FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00A4A0A000666666006666660066666600666666006666
      6600A4A0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF000000FF000000FF0066666600666666000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000008000000080
      000000800000C0C0C00000800000008000000080000000008000008000000080
      0000000080000080000000000000FFFFFF00FFFFFF00FFFFFF009CDEEF0094F7
      FF0073DEF70073DEF70073DEF70073DEF70073DEF70073DEF70073DEF70073DE
      F7004AC6E70018A5C600FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00A4A0A000666666006666660066666600666666004242
      420000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00666666000000FF000000FF00666666006666660066666600666666000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000808080000000
      0000C0C0C0008080800000800000008000000080000000000000000000000000
      000000000000008000000000000000000000FFFFFF00FFFFFF00FFFFFF0094F7
      FF0073DEF70073DEF70073DEF7000000FF000000FF0073DEF70073DEF70073DE
      F70018A5C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF00F0FBFF00A4A0A000666666006666660066666600666666006666
      660000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF000000FF000000FF00666666006666660066666600666666000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      000000800000008000000000000000000000FFFFFF00FFFFFF00FFFFFF009CDE
      EF0094F7FF0073DEF70073DEF7000000FF000000FF0073DEF70073DEF7004AC6
      E70018A5C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF0096969600A4A0A000666666006666660042424200666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF0096969600A4A0A000666666006666660042424200666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000808080000000
      0000C0C0C0008080800000800000008000000080000000800000008000000080
      000000800000008000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0094F7FF0073DEF70073DEF7000000FF000000FF0073DEF70073DEF70018A5
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009696
      9600F0FBFF006666660066666600666666006666660066666600666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009696
      9600F0FBFF006666660066666600666666006666660066666600666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000008000000080
      0000008000000080000000800000C0C0C000C0C0C00000800000808080008080
      800000800000C0C0C0000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009CDEEF0094F7FF0073DEF7000000FF000000FF0073DEF7004AC6E70018A5
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000006666
      6600F0FBFF00F0FBFF0066666600424242006666660066666600666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000006666
      6600F0FBFF00F0FBFF0066666600424242006666660066666600666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000808080000000
      0000C0C0C000808080000080000000800000C0C0C00000800000808080008080
      800000800000008000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0094F7FF0073DEF7000000FF000000FF0073DEF70018A5C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00F0FBFF00A4A0A0006666660042424200666666006666
      660066666600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF006666660000000000F0FBFF00A4A0A0006666660042424200666666006666
      660066666600FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000C0C0C0000080
      000000800000008000000080000000800000C0C0C00000800000C0C0C0000080
      0000008000000080000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009CDEEF0094F7FF000000FF000000FF004AC6E70018A5C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00A4A0A000666666004242
      420066666600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00A4A0A000666666004242
      420066666600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094F7FF0073DEF70073DEF70018A5C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00A4A0
      A00042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00A4A0
      A00042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009CDEEF0094F7FF004AC6E70018A5C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FB
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FB
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0094F7FF0018A5C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FBFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FBFF0000000000FFFF
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
      00000000000000000000000000000000C007FFFF000000000001E01F00000000
      0000CC07000000000000840300000000E007000100000000E007000100000000
      E007000100000000E007000100000000E007000100000000E007800300000000
      E007800300000000E007800300000000E007800300000000E007800300000000
      E007C00700000000E007E00F00000000FFFFCE81FFFFF800C00F0000F84FF800
      C0070000C033F800C00300008045F80000000B000053F80000000B00005DF800
      00000B00007FF00000000000E07FF00000001FFFC077FF0000000000C075FF00
      00000000C03DFF0000000000C12DFF0000000000F001FFE000000000F147FFF8
      00000000F807FFF800000000FC3FFFFFFFFFFFFFFFFFFC1FCFF9FFFFFFFFF007
      C7F1FFFFF93FE003E2038000FC7FC00100018000FC7FC0018001FEFF8003C001
      80008003F29FC00180000001FEFFC001800000010003E003800000010001F1C7
      800000010001F1C7800100010001F1C7800180010011F007C7E3FFFF8001F80F
      CFF3FFFFC001FC1FFFFFFFFFFFFFFFFFF9FFF9E7FFFFFFFFE0FFE0C7FFFFFFFF
      C07FC01FFFFFC003C01FC01FFE078001C007C0070001C003C007C0078001C003
      C007C0078000E007C007C0078000E007C007C0078000F00FC007C0078000F00F
      C007C0078000F81FC007C0078001F81FE007E0078001FC3FF007F007FFFFFC3F
      FC07FC07FFFFFE7FFF1FFF1FFFFFFFFF00000000000000000000000000000000
      000000000000}
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
    object N1: TMenuItem
      Caption = '-'
    end
    object mn_DeviceChange: TMenuItem
      Caption = #52968#53944#47204#47084#44368#52404
      OnClick = mn_DeviceChangeClick
    end
  end
  object Popup_Locate: TPopupMenu
    AutoHotkeys = maManual
    Left = 51
    Top = 333
    object Menu_CurLocate: TMenuItem
      Caption = #54788#51116#50948#52824#44288#51228
      OnClick = Menu_CurLocateClick
    end
    object mn_LocationMap: TMenuItem
      Caption = #50948#52824#51221#48372
    end
  end
  object ADOAlarmQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 400
    Top = 192
  end
  object MessageTimer: TTimer
    Enabled = False
    OnTimer = MessageTimerTimer
    Left = 648
    Top = 568
  end
  object PopupMenu_Alarm: TPopupMenu
    AutoHotkeys = maManual
    Left = 555
    Top = 149
    object mn_AlarmConfirm: TMenuItem
      Caption = #50508#46988#54869#51064
      OnClick = mn_AlarmConfirmClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mn_ArmModeChange: TMenuItem
      Caption = #44221#44228#47784#46300
      OnClick = mn_ArmModeChangeClick
    end
    object mn_DisArmModeChange: TMenuItem
      Caption = #54644#51228#47784#46300
      OnClick = mn_DisArmModeChangeClick
    end
    object mn_FireRecovery: TMenuItem
      Caption = #54868#51116#48373#44396
      OnClick = mn_FireRecoveryClick
    end
  end
  object PopupMenu_Door: TPopupMenu
    AutoHotkeys = maManual
    Left = 523
    Top = 149
    object pm_modechange: TMenuItem
      Caption = #47784#46300#48320#44221
      object pm_OpenMode: TMenuItem
        Caption = #44060#48169#47784#46300
      end
      object pm_OperateMode: TMenuItem
        Caption = #50868#50689#47784#46300
      end
    end
    object pm_StateCheck: TMenuItem
      Caption = #49345#53468#54869#51064
    end
    object pm_DoorOpen: TMenuItem
      Caption = #52636#51077#49849#51064
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 448
    Top = 184
  end
  object pm_mapsize: TPopupMenu
    AutoHotkeys = maManual
    Left = 555
    Top = 221
    object mn_FullMap: TMenuItem
      Caption = #51204#52404#54868#47732
      OnClick = mn_FullMapClick
    end
    object mn_BasicMap: TMenuItem
      Caption = #44592#48376#54868#47732
      OnClick = mn_BasicMapClick
    end
  end
end
