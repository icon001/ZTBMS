object MainForm: TMainForm
  Left = -2
  Top = 109
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = #51228#47200' '#49884#49828#53596' '#51109#48708' '#46321#47197' '#54532#47196#44536#47016' [Ver 0.2]'
  ClientHeight = 726
  ClientWidth = 1284
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label99: TLabel
    Left = 22
    Top = 104
    Width = 30
    Height = 12
    Caption = #44396#44036'1'
  end
  object Label100: TLabel
    Left = 22
    Top = 120
    Width = 30
    Height = 12
    Caption = #44396#44036'1'
  end
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 697
    Width = 1284
    Height = 29
    AutoStyle = False
    BorderInner = fsBump
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 0
    object Panel_ActiveClinetCount: TRzStatusPane
      Left = 2
      Top = 2
      Width = 287
      Height = 25
      Align = alLeft
      BlinkIntervalOff = 1500
    end
    object RzClockStatus1: TRzClockStatus
      Left = 1132
      Top = 2
      Height = 25
      Align = alRight
      Interval = 2000
      Alignment = taRightJustify
      BlinkIntervalOff = 1500
    end
    object RXLight: TApdStatusLight
      Left = 242
      Top = 8
      Width = 13
      Height = 13
      Lit = False
      LitColor = clLime
    end
    object TXLight: TApdStatusLight
      Left = 262
      Top = 8
      Width = 13
      Height = 13
      Lit = False
      NotLitColor = clMaroon
    end
    object RzFieldStatus1: TRzFieldStatus
      Left = 289
      Top = 2
      Width = 832
      Height = 25
      Align = alLeft
      BlinkIntervalOff = 1500
    end
  end
  object RzSplitter1: TRzSplitter
    Left = 0
    Top = 0
    Width = 1284
    Height = 697
    Position = 270
    Percent = 21
    UsePercent = True
    RealTimeDrag = True
    UpperLeft.BorderOuter = fsFlatRounded
    LowerRight.BorderOuter = fsFlatRounded
    SplitterWidth = 1
    Align = alClient
    TabOrder = 1
    UseGradients = True
    BarSize = (
      270
      0
      271
      697)
    UpperLeftControls = ()
    LowerRightControls = ()
    object RzPanel3: TRzPanel
      Left = 0
      Top = 0
      Width = 1284
      Height = 697
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 0
      object RzSplitter2: TRzSplitter
        Left = 0
        Top = 29
        Width = 1284
        Height = 668
        Position = 306
        Percent = 24
        RealTimeDrag = True
        UpperLeft.BorderOuter = fsFlatRounded
        LowerRight.BorderOuter = fsFlatRounded
        HotSpotVisible = True
        SplitterWidth = 7
        Align = alClient
        TabOrder = 0
        UseGradients = True
        BarSize = (
          306
          0
          313
          668)
        UpperLeftControls = (
          RzGroupBar1)
        LowerRightControls = (
          RzPanel2)
        object RzGroupBar1: TRzGroupBar
          Left = 2
          Top = 2
          Width = 302
          Height = 664
          GroupBorderSize = 8
          UseGradients = True
          Align = alClient
          Color = clBtnShadow
          ParentColor = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          object RzGroup1: TRzGroup
            Items = <>
            Opened = True
            OpenedHeight = 217
            UseGradients = True
            OnOpen = RzGroup1Open
            Caption = #51109#48708' '#50672#44208' '#49444#51221
            ParentColor = False
            object RzRadioGroup1: TRzRadioGroup
              Left = 8
              Top = 32
              Width = 126
              Height = 41
              Caption = ' '#50672#44208#48169#49885' '
              Columns = 2
              ItemFrameColor = 8409372
              ItemHotTrack = True
              ItemHighlightColor = 2203937
              ItemHotTrackColor = 3983359
              ItemHotTrackColorType = htctActual
              ItemIndex = 0
              Items.Strings = (
                'LAN'
                'RS-232')
              TabOrder = 0
              OnChanging = RzRadioGroup1Changing
            end
            object CB_SerialComm: TLMDLabeledListComboBox
              Left = 144
              Top = 50
              Width = 100
              Height = 21
              Bevel.Mode = bmWindows
              Caret.BlinkRate = 530
              ImeName = 'Microsoft IME 2003'
              TabOrder = 1
              Items.Strings = (
                'com1'
                'com2'
                'com3'
                'com4'
                'com5'
                'com6'
                'com7'
                'com8'
                'com9')
              LabelSpacing = 1
              EditLabel.Width = 97
              EditLabel.Height = 14
              EditLabel.Caption = 'Serial Commport'
              DateTime = 0.000000000000000000
            end
            object Edit2: TLMDLabeledEdit
              Left = 144
              Top = 139
              Width = 40
              Height = 18
              Bevel.Mode = bmWindows
              Caret.BlinkRate = 530
              ImeName = 'Microsoft IME 2003'
              TabOrder = 2
              CustomButtons = <>
              PasswordChar = #0
              Text = '3000'
              LabelSpacing = 1
              EditLabel.Width = 24
              EditLabel.Height = 14
              EditLabel.Caption = 'Port'
            end
            object RzButton1: TRzButton
              Left = 144
              Top = 79
              Width = 101
              Height = 36
              Caption = #47004#47784#46280' '#49444#51221
              Color = 15791348
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 3
              OnClick = RzButton1Click
            end
            object RadioGroup_Mode: TRzRadioGroup
              Left = 8
              Top = 77
              Width = 128
              Height = 38
              Caption = 'Mode '
              Columns = 2
              ItemFrameColor = 8409372
              ItemHotTrack = True
              ItemHighlightColor = 2203937
              ItemHotTrackColor = 3983359
              ItemHotTrackColorType = htctActual
              ItemIndex = 0
              Items.Strings = (
                'Client'
                'Server')
              TabOrder = 4
            end
            object CB_IPList: TLMDLabeledListComboBox
              Left = 8
              Top = 138
              Width = 122
              Height = 21
              Bevel.Mode = bmWindows
              Caret.BlinkRate = 530
              ImeName = 'Microsoft IME 2003'
              TabOrder = 5
              DropDownCount = 20
              LabelSpacing = 1
              EditLabel.Width = 79
              EditLabel.Height = 14
              EditLabel.Caption = 'Destination IP'
              DateTime = 0.000000000000000000
            end
            object RzButton2: TRzButton
              Left = 182
              Top = 172
              Width = 81
              Height = 28
              Caption = #54156#50920#50612
              Color = 15791348
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 6
              OnClick = RzButton2Click
            end
            object RzButton3: TRzButton
              Left = 94
              Top = 172
              Width = 81
              Height = 28
              Caption = #45936#51060#53552' '#51204#49569
              Color = 15791348
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 7
              OnClick = RzButton3Click
            end
            object RzButton4: TRzButton
              Left = 6
              Top = 172
              Width = 81
              Height = 28
              Caption = #50896#44201#51228#50612
              Color = 15791348
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 8
              OnClick = RzButton4Click
            end
          end
          object RzGroup4: TRzGroup
            Items = <>
            Opened = True
            OpenedHeight = 147
            UseGradients = True
            OnOpen = RzGroup1Open
            Caption = #54788#51116' '#49444#51221#51473#51064' '#51109#48708
            ParentColor = False
            object Label3: TLabel
              Left = 62
              Top = 43
              Width = 6
              Height = 12
              Caption = '-'
            end
            object Label4: TLabel
              Left = 11
              Top = 27
              Width = 35
              Height = 12
              Caption = #44592#44592'ID'
            end
            object Label40: TLabel
              Left = 75
              Top = 25
              Width = 48
              Height = 12
              Caption = #44592#44592#48264#54840
            end
            object Bevel1: TBevel
              Left = 5
              Top = 65
              Width = 116
              Height = 9
              Shape = bsTopLine
            end
            object Label22: TLabel
              Left = 76
              Top = 97
              Width = 40
              Height = 12
              Caption = #52488' '#44036#44201
            end
            object Edit_CurrentID: TRzEdit
              Left = 8
              Top = 40
              Width = 52
              Height = 20
              Text = '0000000'
              Color = clSilver
              ImeName = 'Microsoft IME 2003'
              ReadOnly = True
              TabOrder = 0
            end
            object ComboBox_IDNO: TRzComboBox
              Left = 72
              Top = 40
              Width = 47
              Height = 20
              DropDownCount = 33
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 1
              OnChange = ComboBox_IDNOChange
            end
            object cbPolling: TRzCheckBox
              Left = 8
              Top = 72
              Width = 49
              Height = 17
              Caption = 'ENQ'
              FrameColor = 8409372
              HighlightColor = 2203937
              HotTrack = True
              HotTrackColor = 3983359
              HotTrackColorType = htctActual
              State = cbUnchecked
              TabOrder = 2
              Transparent = True
              OnClick = cbPollingClick
            end
            object RzSpinner1: TRzSpinner
              Left = 8
              Top = 92
              Width = 61
              Value = 5
              OnChange = RzSpinner1Change
              ParentColor = False
              TabOrder = 3
            end
            object RzCheckBox2: TRzCheckBox
              Left = 59
              Top = 72
              Width = 78
              Height = 17
              Caption = 'ACK '#51025#45813
              Checked = True
              FrameColor = 8409372
              HighlightColor = 2203937
              HotTrack = True
              HotTrackColor = 3983359
              HotTrackColorType = htctActual
              State = cbChecked
              TabOrder = 4
              Transparent = True
            end
            object rgDeviceNo: TRzRadioGroup
              Left = 138
              Top = 29
              Width = 111
              Height = 100
              Caption = #44592#44592#48264#54840
              Columns = 2
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = #44404#47548
              Font.Style = [fsBold]
              ItemFrameColor = 8409372
              ItemHotTrack = True
              ItemHighlightColor = 2203937
              ItemHotTrackColor = 3983359
              ItemHotTrackColorType = htctActual
              ItemIndex = 0
              Items.Strings = (
                '00'
                '01'
                '02'
                '03'
                '04'
                '05')
              LightTextStyle = True
              ParentFont = False
              TextShadowDepth = 1
              SpaceEvenly = True
              StartXPos = 10
              StartYPos = 4
              TabOrder = 5
              VerticalSpacing = 8
              OnChanging = rgDeviceNoChanging
            end
          end
          object RzGroup2: TRzGroup
            Items = <
              item
                Caption = 'F1. ID '#46321#47197
                OnClick = RzGroup2Items0Click
              end
              item
                Caption = 'F2. '#49884#49828#53596#51221#48372' '#46321#47197'(I)/'#52852#46300#47532#45908#46321#47197
                OnClick = RzGroup2Items1Click
              end
              item
                Caption = 'F3. '#54252#53944#51221#48372' '#46321#47197
                OnClick = RzGroup2Items2Click
              end
              item
                Caption = 'F4. '#47540#47112#51060#51221#48372' '#46321#47197
                OnClick = RzGroup2Items3Click
              end
              item
                Caption = 'F5. '#50896#44201' '#51228#50612
                OnClick = RzGroup2Items4Click
              end
              item
                Caption = 'F6. '#47924#51064#44397#49324#50857' '#46321#47197
                OnClick = RzGroup2Items5Click
              end
              item
                Caption = 'F7. '#45936#51060#53552' '#51204#49569
                OnClick = RzGroup2Items6Click
              end
              item
                Caption = 'F8. '#54156#50920#50612' '#45796#50868#47196#46300
                OnClick = RzGroup2Items7Click
              end
              item
                Caption = 'F9. '#52852#46300#45936#51060#53552' '#48652#47196#46300#52880#49828#54021' '
                OnClick = RzGroup2Items8Click
              end>
            Opened = True
            OpenedHeight = 208
            DividerVisible = True
            UseGradients = True
            OnOpen = RzGroup1Open
            Caption = #48169#48276' '#46321#47197'/'#51228#50612
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object RzGroup3: TRzGroup
            Items = <
              item
                Caption = 'F10. '#52636#51077#51228#50612#46321#47197'/DOOR'#51228#50612
                OnClick = RzGroup3Items0Click
              end
              item
                Caption = 'F11. DOOR '#51228#50612
                Visible = False
                OnClick = RzGroup3Items1Click
              end
              item
                Caption = 'F12. '#52852#46300#45936#51060#53552' '#46321#47197
                OnClick = RzGroup3Items2Click
              end
              item
                Caption = #49828#52992#51460' '#45936#51060#53552' '#46321#47197
                OnClick = RzGroup3Items3Click
              end
              item
                Caption = #55092#51068' '#45936#51060#53552' '#46321#47197
              end>
            Opened = True
            OpenedHeight = 108
            UseGradients = True
            OnOpen = RzGroup1Open
            Caption = #52636#51077#53685#51228' '#46321#47197'/'#51228#50612
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object RzGroup5: TRzGroup
            Items = <>
            Opened = True
            OpenedHeight = 305
            UseGradients = True
            OnOpen = RzGroup1Open
            Caption = #47784#45768#53552#47553' '#51221#48372
            ParentColor = False
            object Label92: TLabel
              Left = 17
              Top = 184
              Width = 233
              Height = 12
              AutoSize = False
              Caption = #49324#50857#50696': 01 02 03'
              Font.Charset = ANSI_CHARSET
              Font.Color = clPurple
              Font.Height = -11
              Font.Name = #44404#47548
              Font.Style = []
              ParentFont = False
            end
            object RzBitBtn25: TRzBitBtn
              Left = 17
              Top = 31
              Width = 63
              Height = 23
              GroupIndex = 1
              Caption = #49884#51089
              TabOrder = 0
              OnClick = RzBitBtn25Click
              Glyph.Data = {
                36060000424D3606000000000000360400002800000020000000100000000100
                08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8121212
                12121212121212E8E8E8E8E8E881818181818181818181E8E8E8E8E812181818
                1818121812121212E8E8E8E881E2E2E2E2E281E281818181E8E8E8E8121E1818
                1818181218121212E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E812181E18
                1818181812181212E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E8121E181E
                1818181818121812E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E8121E1E18
                1E18181818181212E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8128D1E1E
                181E181818181812E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8128D8D1E
                1E181E1818181812E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8121212
                12121212121212E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
              NumGlyphs = 2
            end
            object RzBitBtn26: TRzBitBtn
              Left = 89
              Top = 31
              Width = 63
              Height = 23
              GroupIndex = 1
              Caption = #51221#51648
              TabOrder = 1
              OnClick = RzBitBtn26Click
              Glyph.Data = {
                36060000424D3606000000000000360400002800000020000000100000000100
                08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
              NumGlyphs = 2
            end
            object RzBitBtn28: TRzBitBtn
              Left = 161
              Top = 31
              Width = 63
              Height = 23
              Caption = #44277#48177
              TabOrder = 2
              OnClick = RzBitBtn28Click
              Glyph.Data = {
                36060000424D3606000000000000360400002800000020000000100000000100
                08000000000000020000420B0000420B00000001000000000000000000003300
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
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8895E5E5E5EAC
                E8E8E8E8E8E8E8E8E8E88181818181ACE8E8E8E8E8E8E8E8E8E889E6E6D0E35E
                5EACE8E8E8E8E8E8E8E881ACACACE38181ACE8E8E8E8E8E8E8E889D7D7D0D7D7
                E35EE8E8E8E8E8E8E8E881D7D7ACD7D7E381E8E8E8E8E8E8E8E889E6E6D0E6E6
                E65EACE8E8E8E8E8E8E881ACACACACACAC81ACE8E8E8E8E8E8E889D7ACD0D7D7
                D7E35EACE8E8E8E8E8E881D7ACACD7D7D7E381ACE8E8E8E8E8E889E6E6D0E6E6
                E6E6E35E5E5EACE8E8E881ACACACACACACACE3818181ACE8E8E889D7D7D0D7D7
                D7D7D7D7D7E35E5E5EAC81D7D7ACD7D7D7D7D7D7D7E3818181AC89E6E6D0E6E6
                E6E6E6E6E6E6E6E6E35E81ACACACACACACACACACACACACACE38189D7D7D0D7D7
                D7D7D7D7D7D7D7D7D75E81D7D7ACD7D7D7D7D7D7D7D7D7D7D78189E6E6D0E6E6
                E6E6E6E6E6E6E6E6E65E81ACACACACACACACACACACACACACAC8189D7ACD0D7D7
                D7D7D7D7D7D7D7D7D75E81D7ACACD7D7D7D7D7D7D7D7D7D7D78189D7D7D0D7D7
                D7D7D7D7D7D7D7D7D75E81D7D7ACD7D7D7D7D7D7D7D7D7D7D78189D7D7D0D7D7
                D7D7D7D7D7D7D7D7D75E81D7D7ACD7D7D7D7D7D7D7D7D7D7D781898989898989
                8989898989898989898981818181818181818181818181818181E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
              NumGlyphs = 2
            end
            object cbDisplayPolling: TRzCheckBox
              Left = 15
              Top = 138
              Width = 120
              Height = 17
              Caption = #54260#47553' '#45936#51060#53552' '#54364#49884
              FrameColor = 8409372
              HighlightColor = 2203937
              HotTrack = True
              HotTrackColor = 3983359
              HotTrackColorType = htctActual
              State = cbUnchecked
              TabOrder = 3
              Transparent = True
            end
            object edFfNo: TEdit
              Left = 113
              Top = 159
              Width = 144
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #44404#47548
              Font.Style = [fsBold]
              ImeName = 'Microsoft IME 2003'
              ParentFont = False
              TabOrder = 4
            end
            object rgCmdFilter: TRzRadioGroup
              Left = 16
              Top = 64
              Width = 236
              Height = 67
              Caption = #52964#47592#46300' '#54596#53552
              Columns = 3
              ItemIndex = 0
              Items.Strings = (
                #48120#51201#50857
                #54252#54632
                #51228#50808)
              TabOrder = 5
              object edFilter: TEdit
                Left = 8
                Top = 38
                Width = 220
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 0
              end
            end
            object cbFinterNo: TRzCheckBox
              Left = 15
              Top = 162
              Width = 97
              Height = 17
              Caption = #44592#44592#48264#54840' '#54596#53552
              FrameColor = 8409372
              HighlightColor = 2203937
              HotTrack = True
              HotTrackColor = 3983359
              HotTrackColorType = htctActual
              State = cbUnchecked
              TabOrder = 6
              Transparent = True
            end
            object rgNoAckFilter: TRzRadioGroup
              Left = 16
              Top = 200
              Width = 236
              Height = 67
              Caption = ' '#51025#45813#52376#47532#50504#54632' '
              Columns = 3
              ItemIndex = 0
              Items.Strings = (
                #48120#51201#50857
                #54252#54632)
              TabOrder = 7
              object Edit1: TEdit
                Left = 8
                Top = 38
                Width = 220
                Height = 20
                ImeName = 'Microsoft IME 2003'
                TabOrder = 0
              end
            end
            object chk_Hex: TRzCheckBox
              Left = 135
              Top = 138
              Width = 90
              Height = 17
              Caption = 'HEX '#54364#49884
              FrameColor = 8409372
              HighlightColor = 2203937
              HotTrack = True
              HotTrackColor = 3983359
              HotTrackColorType = htctActual
              State = cbUnchecked
              TabOrder = 8
              Transparent = True
            end
          end
        end
        object RzPanel2: TRzPanel
          Left = 2
          Top = 2
          Width = 967
          Height = 664
          Align = alClient
          BorderOuter = fsNone
          BorderWidth = 1
          TabOrder = 0
          object RzSplitter3: TRzSplitter
            Left = 1
            Top = 1
            Width = 965
            Height = 662
            Orientation = orVertical
            Position = 478
            Percent = 73
            RealTimeDrag = True
            HotSpotVisible = True
            SplitterWidth = 7
            Align = alClient
            TabOrder = 0
            UseGradients = True
            BarSize = (
              0
              478
              965
              485)
            UpperLeftControls = (
              RzLabel3
              RzLabel1
              Label_CurentIp
              RzPanel4
              Notebook1)
            LowerRightControls = (
              RzLabel2
              RzPageControl1
              RzBitBtn27
              pn_Gauge)
            object RzLabel3: TRzLabel
              Left = 0
              Top = 0
              Width = 965
              Height = 31
              Align = alTop
              Alignment = taCenter
              AutoSize = False
              Caption = #49464#48512' '#46321#47197
              Color = clBtnShadow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clHighlightText
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
              BlinkIntervalOff = 1500
              BorderOuter = fsFlatRounded
            end
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
              Top = 31
              Width = 965
              Height = 5
              Align = alTop
              BorderOuter = fsNone
              TabOrder = 0
            end
            object Notebook1: TNotebook
              Left = 0
              Top = 36
              Width = 965
              Height = 442
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548
              Font.Style = []
              PageIndex = 9
              ParentFont = False
              TabOrder = 1
              OnPageChanged = Notebook1PageChanged
              object TPage
                Left = 0
                Top = 0
                Caption = #48169#48276'_ID'#46321#47197
                object Label300: TLabel
                  Left = 29
                  Top = 30
                  Width = 11
                  Height = 12
                  Caption = 'ID'
                end
                object Label73: TLabel
                  Left = 346
                  Top = 30
                  Width = 35
                  Height = 12
                  Caption = #44288#51228'ID'
                end
                object Edit_DeviceID: TEdit
                  Left = 50
                  Top = 27
                  Width = 121
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 7
                  TabOrder = 0
                  Text = '0000000'
                end
                object RzBitBtn1: TRzBitBtn
                  Left = 178
                  Top = 26
                  Caption = #46321#47197
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 1
                  OnClick = RegClick
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                    90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                    9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                    909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                    90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                    B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                    90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                    B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object RzBitBtn2: TRzBitBtn
                  Left = 258
                  Top = 26
                  Caption = #51312#54924
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 2
                  OnClick = btnCheck
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000430C0000430C00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                    0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                    0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                    0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                    0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                    0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                    0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                    0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object Group_Device: TRzCheckGroup
                  Left = 19
                  Top = 64
                  Width = 582
                  Height = 217
                  Caption = #49324#50857' '#52968#53944#47204#47084' '#51648#51221
                  Columns = 11
                  Items.Strings = (
                    '00'
                    '01'
                    '02'
                    '03'
                    '04'
                    '05'
                    '06'
                    '07'
                    '08'
                    '09'
                    '10')
                  TabOrder = 3
                  TextStyle = tsRecessed
                  CheckStates = (
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0)
                  object RzBitBtn3: TRzBitBtn
                    Left = 496
                    Top = 16
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = RzBitBtn3Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object RzBitBtn4: TRzBitBtn
                    Left = 496
                    Top = 49
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = RzBitBtn4Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                end
                object Group_AlarmDisplay: TRzCheckGroup
                  Left = 19
                  Top = 336
                  Width = 582
                  Height = 73
                  Caption = ' '#50508#46988' '#54364#49884#44592' '#51648#51221' '
                  Columns = 11
                  Items.Strings = (
                    '01'
                    '02'
                    '03'
                    '04')
                  TabOrder = 4
                  TextStyle = tsRecessed
                  CheckStates = (
                    0
                    0
                    0
                    0)
                  object RzBitBtn22: TRzBitBtn
                    Left = 496
                    Top = 16
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = RzBitBtn22Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object RzBitBtn23: TRzBitBtn
                    Left = 496
                    Top = 41
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = RzBitBtn23Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                end
                object Edit_LinkusID: TEdit
                  Left = 387
                  Top = 27
                  Width = 94
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 4
                  TabOrder = 5
                  Text = '0000'
                end
                object btmRegLinkusID: TRzBitBtn
                  Left = 495
                  Top = 26
                  Caption = #46321#47197
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 6
                  OnClick = btmRegLinkusIDClick
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                    90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                    9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                    909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                    90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                    B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                    90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                    B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object btmCheckLinkusID: TRzBitBtn
                  Left = 575
                  Top = 26
                  Caption = #51312#54924
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 7
                  OnClick = btmCheckLinkusIDClick
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000430C0000430C00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                    0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                    0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                    0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                    0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                    0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                    0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                    0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object Group_DeviceBase: TRzCheckGroup
                  Left = 19
                  Top = 281
                  Width = 585
                  Height = 40
                  Columns = 11
                  Items.Strings = (
                    '00'
                    '10'
                    '20'
                    '30'
                    '40'
                    '50'
                    '60'
                    '70'
                    '80'
                    '90'
                    #51204#52404)
                  StartYPos = 15
                  TabOrder = 8
                  OnChange = Group_DeviceBaseChange
                  CheckStates = (
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0)
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #48169#48276'_'#49884#49828#53596#51221#48372#46321#47197
                object GroupBox16: TGroupBox
                  Left = 9
                  Top = 9
                  Width = 250
                  Height = 417
                  Caption = #49884#49828#53596' '#51221#48372#46321#47197'(I)'
                  TabOrder = 0
                  object Label13: TLabel
                    Left = 13
                    Top = 23
                    Width = 80
                    Height = 12
                    Caption = #51221#51204' '#44048#49884' '#50668#48512
                  end
                  object Label14: TLabel
                    Left = 13
                    Top = 79
                    Width = 72
                    Height = 12
                    Caption = #53748#49892#51648#50672#49884#44036
                  end
                  object Label15: TLabel
                    Left = 165
                    Top = 82
                    Width = 12
                    Height = 12
                    Caption = #52488
                  end
                  object Label16: TLabel
                    Left = 13
                    Top = 129
                    Width = 24
                    Height = 12
                    Caption = #50696#48708
                  end
                  object Label36: TLabel
                    Left = 13
                    Top = 153
                    Width = 60
                    Height = 12
                    Caption = 'Door1 '#50857#46020
                  end
                  object Label37: TLabel
                    Left = 13
                    Top = 177
                    Width = 60
                    Height = 12
                    Caption = 'Door2 '#50857#46020
                  end
                  object Label2: TLabel
                    Left = 13
                    Top = 202
                    Width = 36
                    Height = 12
                    Caption = #50948#52824#47749
                  end
                  object Label76: TLabel
                    Left = 13
                    Top = 103
                    Width = 72
                    Height = 12
                    Caption = #51077#49892#51648#50672#49884#44036
                  end
                  object Label87: TLabel
                    Left = 16
                    Top = 47
                    Width = 72
                    Height = 12
                    Caption = #44288#51228#53685#49888#48169#49885
                  end
                  object ComboBox_WatchPowerOff: TRzComboBox
                    Left = 108
                    Top = 17
                    Width = 131
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 0
                    OnEnter = Edit_Combo_Enter
                  end
                  object SpinEdit_OutDelay: TRzSpinEdit
                    Left = 110
                    Top = 73
                    Width = 51
                    Height = 20
                    AllowKeyEdit = True
                    Max = 999.000000000000000000
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 1
                  end
                  object ComboBox_DeviceType: TRzComboBox
                    Left = 108
                    Top = 123
                    Width = 133
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 2
                  end
                  object RzBitBtn7: TRzBitBtn
                    Left = 10
                    Top = 251
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 3
                    OnClick = RegClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object RzBitBtn8: TRzBitBtn
                    Left = 90
                    Top = 251
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 4
                    OnClick = btnCheck
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object ComboBox_DoorType1: TRzComboBox
                    Left = 108
                    Top = 147
                    Width = 133
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 5
                  end
                  object ComboBox_DoorType2: TRzComboBox
                    Left = 108
                    Top = 171
                    Width = 133
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 6
                  end
                  object Edit_Locate: TEdit
                    Left = 106
                    Top = 196
                    Width = 135
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 16
                    TabOrder = 7
                  end
                  object SpinEdit_InDelay: TRzSpinEdit
                    Left = 110
                    Top = 97
                    Width = 51
                    Height = 20
                    AllowKeyEdit = True
                    Max = 999.000000000000000000
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 8
                  end
                  object ComboBox_ComLikus: TRzComboBox
                    Left = 108
                    Top = 41
                    Width = 131
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 9
                    OnEnter = Edit_Combo_Enter
                    Items.Strings = (
                      '1.'#51204#50857#49440
                      '2.'#44277#51473#54924#49440)
                  end
                end
                object GroupBox17: TGroupBox
                  Left = 262
                  Top = 9
                  Width = 441
                  Height = 417
                  Caption = #52852#46300#47532#45908' '#46321#47197
                  TabOrder = 1
                  object Label8: TLabel
                    Left = 17
                    Top = 89
                    Width = 104
                    Height = 12
                    Caption = #52852#46300#47532#45908' '#49324#50857' '#50976#47924
                  end
                  object Label9: TLabel
                    Left = 17
                    Top = 163
                    Width = 54
                    Height = 12
                    Caption = 'Door '#48264#54840
                  end
                  object Label10: TLabel
                    Left = 17
                    Top = 249
                    Width = 40
                    Height = 12
                    Caption = #51316' '#48264#54840
                    Visible = False
                  end
                  object Label11: TLabel
                    Left = 17
                    Top = 191
                    Width = 36
                    Height = 12
                    Caption = #50948#52824#47749
                  end
                  object Label35: TLabel
                    Left = 17
                    Top = 119
                    Width = 60
                    Height = 12
                    Caption = #47928#49444#52824#50948#52824
                  end
                  object Label17: TLabel
                    Left = 24
                    Top = 349
                    Width = 71
                    Height = 12
                    Caption = 'Reader ver'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = #44404#47548
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label135: TLabel
                    Left = 17
                    Top = 143
                    Width = 72
                    Height = 12
                    Caption = #44148#47932#49444#52824#50948#52824
                  end
                  object Label56: TLabel
                    Left = 16
                    Top = 216
                    Width = 72
                    Height = 12
                    Caption = #52852#46300#47532#45908#51333#47448
                  end
                  object ComBoBox_UseCardReader: TRzComboBox
                    Left = 128
                    Top = 85
                    Width = 105
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 0
                  end
                  object ComBoBox_DoorNo: TRzComboBox
                    Left = 128
                    Top = 163
                    Width = 47
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 1
                  end
                  object Edit_CRLocatge: TEdit
                    Left = 128
                    Top = 190
                    Width = 183
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 16
                    TabOrder = 2
                  end
                  object RzBitBtn5: TRzBitBtn
                    Left = 21
                    Top = 276
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 3
                    OnClick = RegClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object RzBitBtn6: TRzBitBtn
                    Left = 109
                    Top = 276
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 4
                    OnClick = btnCheck
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object ComBoBox_InOutCR: TRzComboBox
                    Left = 128
                    Top = 112
                    Width = 103
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 5
                  end
                  object ComboBox_Zone1: TRzComboBox
                    Left = 128
                    Top = 242
                    Width = 108
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 6
                    Text = '00. '#51204#52404
                    Visible = False
                    Items.Strings = (
                      '00. '#51204#52404
                      '01'
                      '02'
                      '03'
                      '04'
                      '05'
                      '06'
                      '07'
                      '08')
                  end
                  object Group_CardReader: TRzRadioGroup
                    Left = 9
                    Top = 22
                    Width = 429
                    Height = 46
                    Caption = ' '#52852#46300#47532#45908' '
                    Columns = 9
                    ItemFrameColor = 8409372
                    ItemHotTrack = True
                    ItemHighlightColor = 2203937
                    ItemHotTrackColor = 3983359
                    ItemHotTrackColorType = htctActual
                    ItemIndex = 1
                    Items.Strings = (
                      #51204#52404
                      '#01'
                      '#02'
                      '#03'
                      '#04'
                      '#05'
                      '#06'
                      '#07'
                      '#08')
                    SpaceEvenly = True
                    TabOrder = 7
                  end
                  object btnCheckCdVer: TRzBitBtn
                    Left = 21
                    Top = 308
                    Width = 164
                    Caption = #52852#46300' '#47532#45908' '#48260#51260#54869#51064
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 8
                    OnClick = btnCheckCdVerClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object rd_UseCardReader: TRadioGroup
                    Left = 128
                    Top = 72
                    Width = 161
                    Height = 33
                    Columns = 2
                    ItemIndex = 0
                    Items.Strings = (
                      #48120#49324#50857
                      #49324#50857)
                    TabOrder = 9
                    Visible = False
                  end
                  object rd_InOutCR: TRadioGroup
                    Left = 264
                    Top = 104
                    Width = 161
                    Height = 33
                    Columns = 2
                    ItemIndex = 0
                    Items.Strings = (
                      #45236#48512
                      #50808#48512)
                    TabOrder = 10
                    Visible = False
                  end
                  object rd_DoorNo: TRadioGroup
                    Left = 264
                    Top = 136
                    Width = 161
                    Height = 33
                    Columns = 3
                    ItemIndex = 0
                    Items.Strings = (
                      #50630#51020
                      '1'
                      '2')
                    TabOrder = 11
                    Visible = False
                  end
                  object ComBoBox_Building: TRzComboBox
                    Left = 128
                    Top = 136
                    Width = 103
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 12
                  end
                  object cb_CardType: TRzComboBox
                    Left = 128
                    Top = 213
                    Width = 185
                    Height = 20
                    Ctl3D = False
                    FlatButtons = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    ParentCtl3D = False
                    TabOrder = 13
                    Text = '0.'#51068#48152#47532#45908'(CRO-811)'
                    Items.Strings = (
                      '                                  '
                      '0.'#51068#48152#47532#45908'(CRO-811)'
                      '1.'#51648#47928#47532#46300'(CRO-801)')
                  end
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #48169#48276'_'#54252#53944#51221#48372#46321#47197
                object Label28: TLabel
                  Left = 29
                  Top = 59
                  Width = 48
                  Height = 12
                  Caption = 'STATUS'
                end
                object Label29: TLabel
                  Left = 29
                  Top = 83
                  Width = 48
                  Height = 12
                  Caption = #44048#49884#54805#53468
                end
                object Label30: TLabel
                  Left = 29
                  Top = 115
                  Width = 76
                  Height = 12
                  Caption = #50508#46988#48156#49373' '#48169#49885
                end
                object Label31: TLabel
                  Left = 29
                  Top = 147
                  Width = 100
                  Height = 12
                  Caption = #48373#44396#49888#54840' '#51204#49569#50976#47924
                end
                object Label32: TLabel
                  Left = 29
                  Top = 173
                  Width = 76
                  Height = 12
                  Caption = #51648#50672#49884#44036' '#51201#50857
                end
                object Label33: TLabel
                  Left = 29
                  Top = 224
                  Width = 40
                  Height = 12
                  Caption = #51316' '#48264#54840
                  Visible = False
                end
                object Label34: TLabel
                  Left = 28
                  Top = 196
                  Width = 36
                  Height = 12
                  Caption = #50948#52824#47749
                end
                object Label5: TLabel
                  Left = 301
                  Top = 51
                  Width = 97
                  Height = 16
                  Caption = #48376' '#51109#48708' '#50672#46041
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlue
                  Font.Height = -16
                  Font.Name = #44404#47548
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label6: TLabel
                  Left = 466
                  Top = 51
                  Width = 108
                  Height = 16
                  Caption = #47700#51064#51109#48708' '#50672#46041
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlue
                  Font.Height = -16
                  Font.Name = #44404#47548
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label77: TLabel
                  Left = 29
                  Top = 251
                  Width = 48
                  Height = 12
                  Caption = #44048#51648#49884#44036
                end
                object Edit_PTStatus: TEdit
                  Left = 137
                  Top = 55
                  Width = 47
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 2
                  TabOrder = 0
                  Text = 'AA'
                end
                object ComboBox_WatchType: TRzComboBox
                  Left = 137
                  Top = 82
                  Width = 103
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 1
                end
                object ComboBox_AlarmType: TRzComboBox
                  Left = 137
                  Top = 112
                  Width = 103
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 2
                end
                object ComboBox_recover: TRzComboBox
                  Left = 137
                  Top = 140
                  Width = 103
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 3
                end
                object ComboBox_Delay: TRzComboBox
                  Left = 137
                  Top = 166
                  Width = 103
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 4
                end
                object Port_Out1: TRzCheckGroup
                  Left = 304
                  Top = 71
                  Width = 128
                  Height = 41
                  Caption = ' '#52636#47141'1('#47016#54532') '
                  Columns = 3
                  Items.Strings = (
                    'Close'
                    'Open')
                  TabOrder = 5
                  CheckStates = (
                    0
                    0)
                end
                object Port_Out2: TRzCheckGroup
                  Left = 304
                  Top = 117
                  Width = 128
                  Height = 41
                  Caption = ' '#52636#47141'2('#49912#51060#47116') '
                  Columns = 3
                  Items.Strings = (
                    'Close'
                    'Open')
                  TabOrder = 6
                  CheckStates = (
                    0
                    0)
                end
                object Port_Out3: TRzCheckGroup
                  Left = 304
                  Top = 164
                  Width = 131
                  Height = 41
                  Caption = ' '#52636#47141'3('#47540#47112#51060'1) '
                  Columns = 3
                  Items.Strings = (
                    'Close'
                    'Open')
                  TabOrder = 7
                  CheckStates = (
                    0
                    0)
                end
                object Port_Out4: TRzCheckGroup
                  Left = 304
                  Top = 212
                  Width = 131
                  Height = 41
                  Caption = ' '#52636#47141'4('#47540#47112#51060'2) '
                  Columns = 3
                  Items.Strings = (
                    'Close'
                    'Open')
                  TabOrder = 8
                  CheckStates = (
                    0
                    0)
                end
                object Edit_PTZoneNo: TEdit
                  Left = 137
                  Top = 220
                  Width = 47
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 2
                  TabOrder = 9
                  Text = '0'
                  Visible = False
                end
                object Edit_PTLocate: TEdit
                  Left = 137
                  Top = 192
                  Width = 102
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 16
                  TabOrder = 10
                  Text = '01'
                end
                object Port_Door1: TRzCheckGroup
                  Left = 304
                  Top = 256
                  Width = 281
                  Height = 41
                  Caption = #52636#51077#47928'1 '#51228#50612
                  Columns = 3
                  Items.Strings = (
                    'Close'#51217#51216' '#44060#48169' '
                    'Open '#51217#51216' '#44060#48169)
                  TabOrder = 11
                  CheckStates = (
                    0
                    0)
                end
                object Port_Door2: TRzCheckGroup
                  Left = 304
                  Top = 305
                  Width = 281
                  Height = 41
                  Caption = #52636#51077#47928'2 '#51228#50612
                  Columns = 3
                  Items.Strings = (
                    'Close'#51217#51216' '#44060#48169' '
                    'Open '#51217#51216' '#44060#48169)
                  TabOrder = 12
                  CheckStates = (
                    0
                    0)
                end
                object RzBitBtn11: TRzBitBtn
                  Left = 26
                  Top = 306
                  Caption = #46321#47197
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 13
                  OnClick = RegClick
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                    90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                    9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                    909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                    90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                    B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                    90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                    B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object RzBitBtn12: TRzBitBtn
                  Left = 106
                  Top = 306
                  Caption = #51312#54924
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 14
                  OnClick = btnCheck
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000430C0000430C00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                    0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                    0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                    0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                    0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                    0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                    0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                    0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object M_Port_Out1: TRzCheckGroup
                  Left = 457
                  Top = 72
                  Width = 128
                  Height = 41
                  Caption = ' '#52636#47141'1('#47016#54532') '
                  Columns = 3
                  Items.Strings = (
                    'Close'
                    'Open')
                  TabOrder = 15
                  CheckStates = (
                    0
                    0)
                end
                object M_Port_Out2: TRzCheckGroup
                  Left = 457
                  Top = 118
                  Width = 128
                  Height = 41
                  Caption = ' '#52636#47141'2('#49912#51060#47116') '
                  Columns = 3
                  Items.Strings = (
                    'Close'
                    'Open')
                  TabOrder = 16
                  CheckStates = (
                    0
                    0)
                end
                object M_Port_Out3: TRzCheckGroup
                  Left = 454
                  Top = 165
                  Width = 131
                  Height = 41
                  Caption = ' '#52636#47141'3('#47540#47112#51060'1) '
                  Columns = 3
                  Items.Strings = (
                    'Close'
                    'Open')
                  TabOrder = 17
                  CheckStates = (
                    0
                    0)
                end
                object M_Port_Out4: TRzCheckGroup
                  Left = 454
                  Top = 212
                  Width = 131
                  Height = 41
                  Caption = ' '#52636#47141'4('#47540#47112#51060'2) '
                  Columns = 3
                  Items.Strings = (
                    'Close'
                    'Open')
                  TabOrder = 18
                  CheckStates = (
                    0
                    0)
                end
                object Group_Port: TRzRadioGroup
                  Left = 24
                  Top = 8
                  Width = 560
                  Height = 36
                  Caption = #49324#50857' '#54252#53944#48264#54840
                  Columns = 9
                  ItemFrameColor = 8409372
                  ItemHotTrack = True
                  ItemHighlightColor = 2203937
                  ItemHotTrackColor = 3983359
                  ItemHotTrackColorType = htctActual
                  ItemIndex = 1
                  Items.Strings = (
                    #51204#52404
                    '#01'
                    '#02'
                    '#03'
                    '#04'
                    '#05'
                    '#06'
                    '#07'
                    '#08')
                  SpaceEvenly = True
                  TabOrder = 19
                end
                object ComboBox_DetectTime: TRzComboBox
                  Left = 137
                  Top = 250
                  Width = 103
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 20
                  Items.Strings = (
                    '0400'
                    '0600'
                    '0800'
                    '1000')
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #52636#51077#53685#51228'_'#49828#52992#51572#51648#51221
                object Label95: TLabel
                  Left = 14
                  Top = 32
                  Width = 80
                  Height = 12
                  Caption = #44592#44592#45236' '#47928' '#48264#54840
                end
                object Label96: TLabel
                  Left = 46
                  Top = 72
                  Width = 48
                  Height = 12
                  Caption = #50836#51068#53076#46300
                end
                object Label97: TLabel
                  Left = 64
                  Top = 104
                  Width = 30
                  Height = 12
                  Caption = #44396#44036'1'
                end
                object Label98: TLabel
                  Left = 64
                  Top = 130
                  Width = 30
                  Height = 12
                  Caption = #44396#44036'2'
                end
                object Label101: TLabel
                  Left = 64
                  Top = 156
                  Width = 30
                  Height = 12
                  Caption = #44396#44036'3'
                end
                object Label102: TLabel
                  Left = 64
                  Top = 182
                  Width = 30
                  Height = 12
                  Caption = #44396#44036'4'
                end
                object Label103: TLabel
                  Left = 64
                  Top = 208
                  Width = 30
                  Height = 12
                  Caption = #44396#44036'5'
                end
                object Label104: TLabel
                  Left = 200
                  Top = 104
                  Width = 202
                  Height = 12
                  Caption = '0.'#50868#50689#47784#46300' 1.'#44060#48169#47784#46300' 2.'#54224#49604#47784#46300
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -12
                  Font.Name = #44404#47548
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label105: TLabel
                  Left = 416
                  Top = 100
                  Width = 72
                  Height = 12
                  Caption = #51312#49885#49884#51089#49884#44036
                end
                object Label106: TLabel
                  Left = 416
                  Top = 126
                  Width = 72
                  Height = 12
                  Caption = #51473#49885#49884#51089#49884#44036
                end
                object Label107: TLabel
                  Left = 416
                  Top = 152
                  Width = 72
                  Height = 12
                  Caption = #49437#49885#49884#51089#49884#44036
                end
                object Label108: TLabel
                  Left = 416
                  Top = 178
                  Width = 72
                  Height = 12
                  Caption = #50556#49885#49884#51089#49884#44036
                end
                object RzBitBtn24: TRzBitBtn
                  Left = 42
                  Top = 242
                  Caption = #46321#47197
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 0
                  OnClick = RegClick
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                    90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                    9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                    909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                    90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                    B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                    90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                    B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object RzBitBtn42: TRzBitBtn
                  Left = 122
                  Top = 242
                  Caption = #51312#54924
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 1
                  OnClick = btnCheck
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000430C0000430C00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                    0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                    0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                    0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                    0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                    0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                    0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                    0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object rgSchDoorNo: TRadioGroup
                  Left = 103
                  Top = 19
                  Width = 290
                  Height = 31
                  Columns = 8
                  ItemIndex = 0
                  Items.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8')
                  TabOrder = 2
                end
                object rgSchCode: TRadioGroup
                  Left = 103
                  Top = 59
                  Width = 290
                  Height = 31
                  Columns = 4
                  ItemIndex = 0
                  Items.Strings = (
                    '0.'#54217#51068
                    '1.'#48152#55092#51068
                    '2.'#55092#51068
                    '3.'#53945#51221#51068)
                  TabOrder = 3
                end
                object edSch1: TEdit
                  Left = 104
                  Top = 102
                  Width = 89
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 6
                  TabOrder = 4
                  Text = '0001 0'
                end
                object edSch2: TEdit
                  Left = 104
                  Top = 126
                  Width = 89
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 6
                  TabOrder = 5
                  Text = '0630 0'
                end
                object edSch3: TEdit
                  Left = 104
                  Top = 150
                  Width = 89
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 6
                  TabOrder = 6
                  Text = '1030 1'
                end
                object edSch4: TEdit
                  Left = 104
                  Top = 174
                  Width = 89
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 6
                  TabOrder = 7
                  Text = '1500 2'
                end
                object edSch5: TEdit
                  Left = 104
                  Top = 198
                  Width = 89
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 6
                  TabOrder = 8
                  Text = '1800 0'
                end
                object edFood1: TEdit
                  Left = 496
                  Top = 99
                  Width = 89
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 4
                  TabOrder = 9
                  Text = '0830'
                end
                object edFood2: TEdit
                  Left = 496
                  Top = 123
                  Width = 89
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 4
                  TabOrder = 10
                  Text = '1130'
                end
                object edFood3: TEdit
                  Left = 496
                  Top = 147
                  Width = 89
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 4
                  TabOrder = 11
                  Text = '1730'
                end
                object edFood4: TEdit
                  Left = 496
                  Top = 171
                  Width = 89
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 4
                  TabOrder = 12
                  Text = '2230'
                end
                object RzBitBtn43: TRzBitBtn
                  Left = 422
                  Top = 242
                  Caption = #46321#47197
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 13
                  OnClick = RzBitBtn43Click
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                    90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                    9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                    909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                    90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                    B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                    90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                    B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object RzBitBtn44: TRzBitBtn
                  Left = 502
                  Top = 242
                  Caption = #51312#54924
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 14
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000430C0000430C00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                    0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                    0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                    0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                    0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                    0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                    0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                    0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #48169#48276'_'#47540#47112#51060#51221#48372#46321#47197
                object Label19: TLabel
                  Left = 29
                  Top = 81
                  Width = 88
                  Height = 12
                  Caption = #47540#47112#51060' '#50672#46041#48169#49885
                end
                object Label20: TLabel
                  Left = 29
                  Top = 113
                  Width = 88
                  Height = 12
                  Caption = #47540#47112#51060' '#52636#47141#48169#49885
                end
                object Label21: TLabel
                  Left = 29
                  Top = 148
                  Width = 36
                  Height = 12
                  Caption = #53440#51060#47672
                end
                object Label25: TLabel
                  Left = 29
                  Top = 180
                  Width = 64
                  Height = 12
                  Caption = #47540#47112#51060' '#50857#46020
                end
                object Label38: TLabel
                  Left = 32
                  Top = 205
                  Width = 48
                  Height = 12
                  Caption = #46041#51089#49884#44036
                end
                object Label39: TLabel
                  Left = 203
                  Top = 208
                  Width = 12
                  Height = 12
                  Caption = #48516
                end
                object RzBitBtn9: TRzBitBtn
                  Left = 26
                  Top = 249
                  Caption = #46321#47197
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 0
                  OnClick = RegClick
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                    90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                    9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                    909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                    90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                    B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                    90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                    B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object RzBitBtn10: TRzBitBtn
                  Left = 106
                  Top = 249
                  Caption = #51312#54924
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 1
                  OnClick = btnCheck
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000430C0000430C00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                    0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                    0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                    0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                    0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                    0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                    0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                    0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object COmBoBox_Linktype1: TRzComboBox
                  Left = 135
                  Top = 75
                  Width = 126
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 2
                end
                object ComboBox_OutType1: TRzComboBox
                  Left = 135
                  Top = 107
                  Width = 126
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 3
                end
                object ComboBox_RenewTimer1: TRzComboBox
                  Left = 135
                  Top = 139
                  Width = 126
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 4
                end
                object ComboBox_UseType1: TRzComboBox
                  Left = 135
                  Top = 171
                  Width = 126
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 5
                end
                object RzSpinEdit2: TRzSpinEdit
                  Left = 134
                  Top = 199
                  Width = 67
                  Height = 20
                  AllowKeyEdit = True
                  Max = 65535.000000000000000000
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 6
                end
                object CheckBox1: TCheckBox
                  Left = 220
                  Top = 204
                  Width = 49
                  Height = 17
                  Caption = #50672#49549
                  TabOrder = 7
                end
                object Group_Relay: TRzRadioGroup
                  Left = 26
                  Top = 16
                  Width = 543
                  Height = 44
                  Caption = ' '#47540#47112#51060' '
                  Columns = 7
                  ItemFrameColor = 8409372
                  ItemHotTrack = True
                  ItemHighlightColor = 2203937
                  ItemHotTrackColor = 3983359
                  ItemHotTrackColorType = htctActual
                  ItemIndex = 1
                  Items.Strings = (
                    #51204#52404
                    '#01'
                    '#02'
                    '#03'
                    '#04'
                    '#05'
                    '#06')
                  SpaceEvenly = True
                  TabOrder = 8
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #50896#44201' '#51228#50612
                object Label43: TLabel
                  Left = 285
                  Top = 138
                  Width = 36
                  Height = 12
                  Caption = #51316#48264#54840
                  Visible = False
                end
                object Label44: TLabel
                  Left = 107
                  Top = 140
                  Width = 48
                  Height = 12
                  Caption = #49444#51221#47784#46300
                end
                object Label45: TLabel
                  Left = 282
                  Top = 172
                  Width = 12
                  Height = 12
                  Caption = #48516
                end
                object Label65: TLabel
                  Left = 110
                  Top = 261
                  Width = 60
                  Height = 12
                  Caption = #47540#47112#51060#48264#54840
                end
                object Label89: TLabel
                  Left = 33
                  Top = 332
                  Width = 48
                  Height = 12
                  Caption = #53685#54868#49884#44036
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548
                  Font.Style = []
                  ParentFont = False
                end
                object Label90: TLabel
                  Left = 33
                  Top = 356
                  Width = 72
                  Height = 12
                  Caption = #50672#44208#51204#54868#48264#54840
                end
                object Label91: TLabel
                  Left = 164
                  Top = 332
                  Width = 120
                  Height = 12
                  Caption = #52488' '#54980' '#51204#54868#50672#44208' '#45130#50612#51664
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -12
                  Font.Name = #44404#47548
                  Font.Style = []
                  ParentFont = False
                end
                object Btn_SyncTime: TRzBitBtn
                  Left = 26
                  Top = 54
                  Caption = #49884#44036#46041#44592#54868
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 0
                  OnClick = Btn_SyncTimeClick
                end
                object RzBitBtn13: TRzBitBtn
                  Left = 26
                  Top = 80
                  Caption = #48260#51260' '#54869#51064
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 1
                  OnClick = RzBitBtn13Click
                end
                object RzBitBtn14: TRzBitBtn
                  Left = 26
                  Top = 107
                  Caption = #51109#48708' '#47532#49483
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 2
                  OnClick = RzBitBtn14Click
                end
                object RzBitBtn15: TRzBitBtn
                  Left = 26
                  Top = 133
                  Caption = #47784#46300' '#48320#44221
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 3
                  OnClick = RzBitBtn15Click
                end
                object RzBitBtn16: TRzBitBtn
                  Left = 26
                  Top = 160
                  Caption = #50516#54840#54868
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 4
                  OnClick = RzBitBtn16Click
                end
                object Edit_TimeSync: TRzEdit
                  Left = 106
                  Top = 58
                  Width = 275
                  Height = 20
                  Color = clSilver
                  ImeName = 'Microsoft IME 2003'
                  ReadOnly = True
                  TabOrder = 5
                end
                object Edit_Ver: TRzEdit
                  Left = 106
                  Top = 82
                  Width = 275
                  Height = 20
                  Color = clSilver
                  ImeName = 'Microsoft IME 2003'
                  ReadOnly = True
                  TabOrder = 6
                end
                object Edit_Reset: TRzEdit
                  Left = 106
                  Top = 109
                  Width = 275
                  Height = 20
                  Color = clSilver
                  ImeName = 'Microsoft IME 2003'
                  ReadOnly = True
                  TabOrder = 7
                end
                object RzComboBox1: TRzComboBox
                  Left = 160
                  Top = 134
                  Width = 116
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 8
                  Items.Strings = (
                    #44221#48708#47784#46300
                    #54644#51228#47784#46300
                    #49692#54924#47784#46300)
                end
                object RzComboBox2: TRzComboBox
                  Left = 106
                  Top = 164
                  Width = 103
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 9
                  Text = 'OFF'
                  Items.Strings = (
                    'OFF'
                    'ON')
                  ItemIndex = 0
                end
                object RzSpinEdit3: TRzSpinEdit
                  Left = 228
                  Top = 164
                  Width = 51
                  Height = 20
                  AllowKeyEdit = True
                  Max = 999.000000000000000000
                  Value = 100.000000000000000000
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 10
                end
                object Edit_Random: TRzEdit
                  Left = 106
                  Top = 188
                  Width = 223
                  Height = 20
                  Color = clSilver
                  ImeName = 'Microsoft IME 2003'
                  ReadOnly = True
                  TabOrder = 11
                end
                object RzBitBtn17: TRzBitBtn
                  Left = 312
                  Top = 410
                  Caption = #49324#50857#51088#51221#51032
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 12
                  Visible = False
                  OnClick = RzBitBtn17Click
                end
                object Edit_CMD1: TEdit
                  Left = 390
                  Top = 412
                  Width = 359
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 13
                  Visible = False
                end
                object ComboBox_Zone: TRzComboBox
                  Left = 333
                  Top = 134
                  Width = 108
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 14
                  Text = '0. '#51204#52404
                  Visible = False
                  Items.Strings = (
                    '0. '#51204#52404
                    '1. Zone 1'
                    '2. Zone 2'
                    '3. Zone 3'
                    '4. Zone 4'
                    '5. Zone 5'
                    '6. Zone 6'
                    '7. Zone 7'
                    '8. Zone 8')
                  ItemIndex = 0
                end
                object RzBitBtn29: TRzBitBtn
                  Left = 29
                  Top = 216
                  Caption = #49912#51060#47116' ON'
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 15
                end
                object RzBitBtn34: TRzBitBtn
                  Left = 133
                  Top = 216
                  Caption = #49912#51060#47116' OFF'
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 16
                end
                object RzBitBtn35: TRzBitBtn
                  Left = 237
                  Top = 216
                  Caption = #44221#44305#46321' ON'
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 17
                end
                object RzBitBtn36: TRzBitBtn
                  Left = 341
                  Top = 216
                  Caption = #44221#44305#46321' OFF'
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 18
                end
                object RzBitBtn37: TRzBitBtn
                  Left = 29
                  Top = 254
                  Caption = #47540#47112#51060' '#51228#50612
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 19
                end
                object cb_RelayNo: TRzComboBox
                  Left = 176
                  Top = 257
                  Width = 44
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 20
                  Text = '06'
                  Items.Strings = (
                    '00'
                    '01'
                    '02'
                    '03'
                    '04'
                    '05'
                    '06')
                end
                object cb_RelayOnOff: TRzComboBox
                  Left = 224
                  Top = 257
                  Width = 81
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 21
                  Text = 'OFF'
                  Items.Strings = (
                    'OFF'
                    'ON'
                    'OFF->ON'
                    'ON->OFF')
                end
                object RzBitBtn38: TRzBitBtn
                  Left = 360
                  Top = 255
                  Width = 57
                  Caption = #51228#50612
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 22
                  OnClick = RzBitBtn38Click
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                    90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                    9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                    909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                    90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                    B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                    90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                    B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object cb_RelayTIme: TRzComboBox
                  Left = 310
                  Top = 257
                  Width = 44
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 23
                  Text = '06'
                  Items.Strings = (
                    '01'
                    '02'
                    '03'
                    '04'
                    '05'
                    '06'
                    '07'
                    '08'
                    '09'
                    '10')
                end
                object RzBitBtn33: TRzBitBtn
                  Left = 29
                  Top = 294
                  Width = 156
                  Caption = #51109#48708#50640#49436' '#51204#54868#44152#44592' '#50836#52397
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 24
                  OnClick = RzBitBtn33Click
                end
                object RzSpinEdit1: TRzSpinEdit
                  Left = 110
                  Top = 324
                  Width = 51
                  Height = 20
                  AllowKeyEdit = True
                  Max = 999.000000000000000000
                  Value = 60.000000000000000000
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 25
                end
                object edPhoneNo: TEdit
                  Left = 111
                  Top = 352
                  Width = 121
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 26
                  Text = '0220574981'
                end
                object CheckBox2: TCheckBox
                  Left = 33
                  Top = 381
                  Width = 97
                  Height = 17
                  Caption = #49828#54588#52964' ON'
                  TabOrder = 27
                end
                object btnRegisterClear: TRzBitBtn
                  Left = 26
                  Top = 16
                  Width = 140
                  Caption = 'Register Clear'
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 28
                  OnClick = btnRegisterClearClick
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000530D0000530D00000001000000000000000000003300
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
                    0000000000000000000000000000000000000000000000000000E8D7E8D7D7E8
                    E8E8E8E8E8E8E8E8E8E8E8D7E8D7D7E8E8E8E8E8E8E8E8E8E8E8D7D7D7D7D7D7
                    D7E8E8E8E8E8E8E8E8E8D7D7D7D7D7D7D7E8E8E8E8E8E8E8E8E8D7D7D7D7D7DF
                    6C6C6CE8E8E8E8E8E8E8D7D7D7D7D7DF565656E8E8E8E8E8E8E8D7D7D7D7DF90
                    6C6C6C6CE8E8E8E8E8E8D7D7D7D7DF8156565656E8E8E8E8E8E8D7D7D7D79090
                    906C6C6C6CE8E8E8E8E8D7D7D7D781818156565656E8E8E8E8E8D7E8D7E8B490
                    90906C6C6C7EE8E8E8E8D7E8D7E8AC81818156565656E8E8E8E8E8E8E8E8B4B4
                    9090906C7EA87EE8E8E8E8E8E8E8ACAC81818156568156E8E8E8E8E8E8E8E8B4
                    B490907EA8A8A87EE8E8E8E8E8E8E8ACAC81815681818156E8E8E8E8E8E8E8E8
                    B4D8A8D2D2A8A8A87EE8E8E8E8E8E8E8AC5681ACAC81818156E8E8E8E8E8E8E8
                    E8A8D2D7DED2A8A8A87EE8E8E8E8E8E8E881ACD7DEAC81818156E8E8E8E8E8E8
                    E8E8A8D2D7DED2A87E09E8E8E8E8E8E8E8E881ACD7DEAC815656E8E8E8E8E8E8
                    E8E8E8A8D2D7D27E1009E8E8E8E8E8E8E8E8E881ACD7AC568156E8E8E8E8E8E8
                    E8E8E8E8A8D2A8101010E8E8E8E8E8E8E8E8E8E881AC81818181E8E8E8E8E8E8
                    E8E8E8E8E8A817171010E8E8E8E8E8E8E8E8E8E8E881ACAC8181E8E8E8E8E8E8
                    E8E8E8E8E8E809171710E8E8E8E8E8E8E8E8E8E8E8E856ACAC81E8E8E8E8E8E8
                    E8E8E8E8E8E8E8091717E8E8E8E8E8E8E8E8E8E8E8E8E856ACAC}
                  NumGlyphs = 2
                end
                object GroupBox18: TGroupBox
                  Left = 456
                  Top = 16
                  Width = 241
                  Height = 169
                  Caption = 'DOOR '#51228#50612
                  TabOrder = 29
                  object gbDoorNo3: TRadioGroup
                    Left = 13
                    Top = 24
                    Width = 212
                    Height = 52
                    Caption = #44592#44592#45236' '#47928' '#48264#54840
                    Columns = 8
                    ItemIndex = 0
                    Items.Strings = (
                      '1'
                      '2'
                      '3'
                      '4'
                      '5'
                      '6'
                      '7'
                      '8')
                    TabOrder = 0
                  end
                  object RzGroupBox3: TRzGroupBox
                    Left = 13
                    Top = 92
                    Width = 212
                    Height = 69
                    Caption = ' '#52636#51077#47928' '#50896#44201' '#51228#50612
                    TabOrder = 1
                    object Btn_RDoorOPen: TRzBitBtn
                      Left = 14
                      Top = 29
                      Caption = #49884#51221
                      Color = 15791348
                      HighlightColor = 16026986
                      HotTrack = True
                      HotTrackColor = 3983359
                      TabOrder = 0
                      OnClick = Btn_RDoorOPenClick
                    end
                    object Btn_RDoorClose: TRzBitBtn
                      Left = 126
                      Top = 29
                      Caption = #54644#51221
                      Color = 15791348
                      HighlightColor = 16026986
                      HotTrack = True
                      HotTrackColor = 3983359
                      TabOrder = 1
                      OnClick = Btn_RDoorCloseClick
                    end
                  end
                end
                object btn_Timecheck: TRzBitBtn
                  Left = 386
                  Top = 54
                  Width = 63
                  Caption = #49884#44036#54869#51064
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 30
                  OnClick = btn_TimecheckClick
                end
                object btn_Cuerrent: TRzBitBtn
                  Left = 32
                  Top = 408
                  Width = 145
                  Caption = #54788#49345#53468' '#51204#49569
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 31
                  OnClick = btn_CuerrentClick
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #54156#50920#50612' '#45796#50868#47196#46300
                object RzLabel41: TRzLabel
                  Left = 19
                  Top = 22
                  Width = 64
                  Height = 12
                  Caption = #49444#51221' '#54028#51068#47749
                  Transparent = True
                  BlinkIntervalOff = 1500
                end
                object Bevel6: TBevel
                  Left = 21
                  Top = 131
                  Width = 548
                  Height = 2
                end
                object RzLabel42: TRzLabel
                  Left = 19
                  Top = 53
                  Width = 100
                  Height = 12
                  Caption = #50629#45936#51060#53944' '#50696#50557#49884#44036
                  Transparent = True
                  BlinkIntervalOff = 1500
                end
                object RzRadioGroup2: TRzRadioGroup
                  Left = 23
                  Top = 77
                  Width = 338
                  Height = 44
                  BorderInner = fsPopup
                  BorderOuter = fsPopup
                  Caption = #54184#50920#50612' '#50629#45936#51060#53944' '#48169#48277
                  Columns = 2
                  ItemFrameColor = 8409372
                  ItemHotTrack = True
                  ItemHighlightColor = 2203937
                  ItemHotTrackColor = 3983359
                  ItemHotTrackColorType = htctActual
                  ItemIndex = 0
                  Items.Strings = (
                    #45796#50868#47196#46300#54980' '#51593#49884' '
                    #50696#50557#49884#44036)
                  ParentColor = True
                  SpaceEvenly = True
                  TabOrder = 0
                end
                object RzDateTimePicker1: TRzDateTimePicker
                  Left = 135
                  Top = 48
                  Width = 113
                  Height = 20
                  Date = 38405.815270011580000000
                  Time = 38405.815270011580000000
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 1
                  ShowToday = True
                end
                object RzDateTimePicker2: TRzDateTimePicker
                  Left = 247
                  Top = 48
                  Width = 113
                  Height = 20
                  Date = 38405.815270011580000000
                  Time = 38405.815270011580000000
                  ImeName = 'Microsoft IME 2003'
                  Kind = dtkTime
                  TabOrder = 2
                  ShowToday = True
                end
                object ListBox_DownLoadInfo: TRzListBox
                  Left = 584
                  Top = 48
                  Width = 233
                  Height = 385
                  FrameHotTrack = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  TabOrder = 3
                end
                object cb_Download: TCheckBox
                  Left = 309
                  Top = 19
                  Width = 113
                  Height = 17
                  Caption = #50629#44536#47112#51060#46300' '#49892#54665
                  TabOrder = 4
                  Visible = False
                end
                object DLRadioGroup: TLMDRadioGroup
                  Left = 440
                  Top = 48
                  Width = 137
                  Height = 73
                  Bevel.Mode = bmWindows
                  BtnAlignment.Alignment = agCenterLeft
                  CaptionFont.Charset = DEFAULT_CHARSET
                  CaptionFont.Color = clWindowText
                  CaptionFont.Height = -12
                  CaptionFont.Name = #44404#47548
                  CaptionFont.Style = []
                  Enabled = False
                  Items.Strings = (
                    '00'
                    'not '#39'00'#39)
                  TabOrder = 5
                  Visible = False
                  OnChange = DLRadioGroupChange
                end
                object DLCodeEdit: TLMDEdit
                  Left = 501
                  Top = 88
                  Width = 37
                  Height = 21
                  Bevel.Mode = bmWindows
                  Caret.BlinkRate = 530
                  Enabled = False
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 6
                  Visible = False
                  MaxLength = 2
                  CustomButtons = <>
                  PasswordChar = #0
                end
                object DLCheckBox: TLMDCheckBox
                  Left = 426
                  Top = 26
                  Width = 167
                  Height = 17
                  Caption = 'INI'#49324#50857' '#50504#54632
                  Alignment.Alignment = agTopLeft
                  Alignment.Spacing = 4
                  TabOrder = 7
                  Visible = False
                  OnChange = DLCheckBoxChange
                end
                object rdMode: TRadioGroup
                  Left = 304
                  Top = 8
                  Width = 513
                  Height = 33
                  Columns = 4
                  ItemIndex = 0
                  Items.Strings = (
                    #50629#44536#47112#51060#46300'(Main)'
                    #50629#44536#47112#51060#46300'(Server)'
                    #48652#47196#46300'(Main)'
                    #48652#47196#46300'(Server)')
                  TabOrder = 8
                end
                object Group_BroadDownLoad: TRzCheckGroup
                  Left = 16
                  Top = 168
                  Width = 561
                  Height = 217
                  Caption = #48652#47196#46300#52880#49828#54021' '#52968#53944#47204#47084' '#51648#51221
                  Columns = 10
                  Items.Strings = (
                    '01 '
                    '02 '
                    '03 '
                    '04 '
                    '05 '
                    '06 '
                    '07 '
                    '08 '
                    '09 '
                    '10 ')
                  TabOrder = 9
                  CheckStates = (
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0)
                  object Label145: TLabel
                    Left = 424
                    Top = 60
                    Width = 54
                    Height = 12
                    Caption = #44592#44592'Code'
                  end
                  object Label146: TLabel
                    Left = 424
                    Top = 92
                    Width = 49
                    Height = 12
                    Caption = #51204#49569'Size'
                  end
                  object RzBitBtn46: TRzBitBtn
                    Left = 440
                    Top = 17
                    Width = 105
                    Caption = #52968#53944#47204#47084#51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = RzBitBtn4Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object ed_DeviceCode: TEdit
                    Left = 480
                    Top = 56
                    Width = 73
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 1
                    Text = 'ACC-104'
                  end
                  object ed_SendSize: TEdit
                    Left = 480
                    Top = 88
                    Width = 73
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 2
                    Text = '200'
                  end
                end
                object GroupBox23: TGroupBox
                  Left = 16
                  Top = 64
                  Width = 561
                  Height = 49
                  TabOrder = 10
                  Visible = False
                  object Label1: TLabel
                    Left = 527
                    Top = 37
                    Width = 18
                    Height = 12
                    Alignment = taRightJustify
                    Caption = '0/0'
                  end
                  object ProgressBar1: TProgressBar
                    Left = 7
                    Top = 16
                    Width = 546
                    Height = 17
                    BorderWidth = 1
                    Smooth = True
                    Step = 1
                    TabOrder = 0
                  end
                end
                object Group_BroadDownLoadBase: TRzCheckGroup
                  Left = 16
                  Top = 392
                  Width = 561
                  Height = 41
                  Columns = 11
                  Items.Strings = (
                    '00'
                    '10'
                    '20'
                    '30'
                    '40'
                    '50'
                    '60'
                    '70'
                    '80'
                    '90'
                    #51204#52404)
                  StartYPos = 15
                  TabOrder = 11
                  OnChange = Group_BroadDownLoadBaseChange
                  CheckStates = (
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0)
                end
                object GroupBox24: TGroupBox
                  Left = 16
                  Top = 112
                  Width = 561
                  Height = 49
                  TabOrder = 12
                  object RzBitBtn20: TRzBitBtn
                    Left = 13
                    Top = 16
                    Width = 116
                    Caption = #45796#50868#47196#46300' '#49884#51089
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = RzBitBtn20Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object RzBitBtn21: TRzBitBtn
                    Left = 437
                    Top = 16
                    Width = 116
                    Caption = #45796#50868#47196#46300' '#52712#49548
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = RzBitBtn21Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btBroadFileRetry: TRzBitBtn
                    Left = 141
                    Top = 16
                    Width = 132
                    Caption = #45796#50868#47196#46300' '#51116#51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = btBroadFileRetryClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                end
                object RzButtonEdit1: TEdit
                  Left = 96
                  Top = 16
                  Width = 185
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 13
                end
                object BitBtn1: TBitBtn
                  Left = 280
                  Top = 16
                  Width = 17
                  Height = 17
                  TabOrder = 14
                  OnClick = BitBtn1Click
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
                object chk_Notupgrade: TCheckBox
                  Left = 384
                  Top = 48
                  Width = 113
                  Height = 17
                  Caption = #50629#44536#47112#51060#46300' '#50504#54632
                  Checked = True
                  State = cbChecked
                  TabOrder = 15
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #52636#51077#51228#50612#46321#47197'/DOOR'#51228#50612
                object GroupBox14: TGroupBox
                  Left = 11
                  Top = 11
                  Width = 358
                  Height = 433
                  Caption = #49884#49828#53596' '#46321#47197' '#51221#48372
                  TabOrder = 0
                  object Label18: TLabel
                    Left = 11
                    Top = 51
                    Width = 76
                    Height = 12
                    Caption = #52852#46300' '#50868#50689#47784#46300
                  end
                  object Label23: TLabel
                    Left = 11
                    Top = 77
                    Width = 88
                    Height = 12
                    Caption = #52636#51077#47928' '#50868#50689#47784#46300
                  end
                  object Label24: TLabel
                    Left = 11
                    Top = 103
                    Width = 78
                    Height = 12
                    Caption = 'Door '#51228#50612#49884#44036
                  end
                  object Label41: TLabel
                    Left = 218
                    Top = 109
                    Width = 12
                    Height = 12
                    Caption = #52488
                  end
                  object Label42: TLabel
                    Left = 11
                    Top = 129
                    Width = 92
                    Height = 12
                    Caption = #51109#49884#44036' '#50676#47548' '#44221#48372
                  end
                  object Label46: TLabel
                    Left = 242
                    Top = 134
                    Width = 28
                    Height = 12
                    Caption = #48516' '#54980
                  end
                  object Label47: TLabel
                    Left = 11
                    Top = 155
                    Width = 92
                    Height = 12
                    Caption = #49828#52992#51460' '#51201#50857' '#50976#47924
                  end
                  object Label48: TLabel
                    Left = 11
                    Top = 182
                    Width = 84
                    Height = 12
                    Caption = #52636#51077#47928#49345#53468#51204#49569
                  end
                  object Label49: TLabel
                    Left = 10
                    Top = 239
                    Width = 151
                    Height = 12
                    Caption = #52852#46300' Event Full '#49884' '#44592#44592#50868#50689
                  end
                  object Label51: TLabel
                    Left = 10
                    Top = 291
                    Width = 112
                    Height = 12
                    Caption = #51109#49884#44036#50676#47548' '#48512#51200#52636#47141
                  end
                  object Label52: TLabel
                    Left = 10
                    Top = 262
                    Width = 151
                    Height = 12
                    Caption = #52852#46300' Event Full '#49884' '#44221#48372#52636#47141
                  end
                  object Label53: TLabel
                    Left = 10
                    Top = 315
                    Width = 64
                    Height = 12
                    Caption = #51204#44592#51221' '#53440#51077
                  end
                  object Label54: TLabel
                    Left = 10
                    Top = 342
                    Width = 104
                    Height = 12
                    Caption = #54868#51116' '#48156#49373#49884' '#47928#51228#50612
                  end
                  object Label55: TLabel
                    Left = 14
                    Top = 32
                    Width = 80
                    Height = 12
                    Caption = #44592#44592#45236' '#47928' '#48264#54840
                  end
                  object Label66: TLabel
                    Left = 10
                    Top = 215
                    Width = 78
                    Height = 12
                    Caption = 'AntiPassBack'
                  end
                  object Label93: TLabel
                    Left = 10
                    Top = 368
                    Width = 73
                    Height = 12
                    Caption = 'DS / LS '#44160#49324
                  end
                  object ComboBox_CardModeType: TRzComboBox
                    Left = 167
                    Top = 51
                    Width = 163
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 0
                  end
                  object ComboBox_DoorModeType: TRzComboBox
                    Left = 167
                    Top = 77
                    Width = 163
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 1
                  end
                  object RzSpinEdit4: TRzSpinEdit
                    Left = 167
                    Top = 103
                    Width = 67
                    Height = 20
                    AllowKeyEdit = True
                    Max = 9.000000000000000000
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 2
                  end
                  object RzSpinEdit5: TRzSpinEdit
                    Left = 167
                    Top = 129
                    Width = 67
                    Height = 20
                    AllowKeyEdit = True
                    Max = 9.000000000000000000
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 3
                  end
                  object ComboBox_UseSch: TRzComboBox
                    Left = 167
                    Top = 155
                    Width = 163
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 4
                  end
                  object ComboBox_SendDoorStatus: TRzComboBox
                    Left = 167
                    Top = 182
                    Width = 163
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 5
                  end
                  object ComboBox_UseCommOff: TRzComboBox
                    Left = 167
                    Top = 236
                    Width = 162
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 6
                  end
                  object ComboBox_AlarmLongOpen: TRzComboBox
                    Left = 167
                    Top = 284
                    Width = 162
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 7
                  end
                  object ComboBox_AlramCommoff: TRzComboBox
                    Left = 167
                    Top = 260
                    Width = 162
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 8
                  end
                  object ComboBox_LockType: TRzComboBox
                    Left = 167
                    Top = 308
                    Width = 162
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 9
                  end
                  object ComboBox_ControlFire: TRzComboBox
                    Left = 167
                    Top = 333
                    Width = 162
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 10
                  end
                  object RzBitBtn18: TRzBitBtn
                    Left = 167
                    Top = 394
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 11
                    OnClick = RzBitBtn18Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object RzBitBtn19: TRzBitBtn
                    Left = 247
                    Top = 394
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 12
                    OnClick = RzBitBtn19Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object ComboBox_AntiPass: TRzComboBox
                    Left = 167
                    Top = 212
                    Width = 162
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 13
                  end
                  object gbDoorNo: TRadioGroup
                    Left = 127
                    Top = 18
                    Width = 223
                    Height = 31
                    Columns = 8
                    ItemIndex = 0
                    Items.Strings = (
                      '1'
                      '2'
                      '3'
                      '4'
                      '5'
                      '6'
                      '7'
                      '8')
                    TabOrder = 14
                  end
                  object ComboBox_CheckDSLS: TRzComboBox
                    Left = 167
                    Top = 359
                    Width = 162
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    TabOrder = 15
                  end
                end
                object GroupBox15: TGroupBox
                  Left = 375
                  Top = 11
                  Width = 325
                  Height = 432
                  Caption = 'DOOR '#51228#50612
                  TabOrder = 1
                  object lbDoorControl: TLabel
                    Left = 13
                    Top = 351
                    Width = 52
                    Height = 12
                    Caption = #51228#50612#44208#44284
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -12
                    Font.Name = #44404#47548
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label94: TLabel
                    Left = 14
                    Top = 32
                    Width = 80
                    Height = 12
                    Caption = #44592#44592#45236' '#47928' '#48264#54840
                  end
                  object RzGroupBox1: TRzGroupBox
                    Left = 16
                    Top = 57
                    Width = 297
                    Height = 73
                    Caption = ' '#52852#46300' '#50868#50689#47784#46300' '#51228#50612' '
                    TabOrder = 0
                    object Btn_Positive: TRzBitBtn
                      Left = 22
                      Top = 29
                      Caption = 'Positive'
                      Color = 15791348
                      HighlightColor = 16026986
                      HotTrack = True
                      HotTrackColor = 3983359
                      TabOrder = 0
                      OnClick = Btn_PositiveClick
                    end
                    object Btn_Negative: TRzBitBtn
                      Left = 126
                      Top = 29
                      Caption = 'Negative'
                      Color = 15791348
                      HighlightColor = 16026986
                      HotTrack = True
                      HotTrackColor = 3983359
                      TabOrder = 1
                      OnClick = Btn_NegativeClick
                    end
                  end
                  object RzGroupBox2: TRzGroupBox
                    Left = 16
                    Top = 137
                    Width = 297
                    Height = 73
                    Caption = ' '#52636#51077#47928' '#50868#50689' '#47784#46300' '#51228#50612
                    TabOrder = 1
                    object Btn_Nomal: TRzBitBtn
                      Left = 22
                      Top = 29
                      Caption = #50868#50689' '#47784#46300
                      Color = 15791348
                      HighlightColor = 16026986
                      HotTrack = True
                      HotTrackColor = 3983359
                      TabOrder = 0
                      OnClick = Btn_NomalClick
                    end
                    object Btn_Open: TRzBitBtn
                      Left = 118
                      Top = 29
                      Caption = #44060#48169' '#47784#46300
                      Color = 15791348
                      HighlightColor = 16026986
                      HotTrack = True
                      HotTrackColor = 3983359
                      TabOrder = 1
                      OnClick = Btn_OpenClick
                    end
                    object btn_Close: TRzBitBtn
                      Left = 214
                      Top = 29
                      Caption = #54224#49604' '#47784#46300
                      Color = 15791348
                      HighlightColor = 16026986
                      HotTrack = True
                      HotTrackColor = 3983359
                      TabOrder = 2
                      OnClick = btn_CloseClick
                    end
                  end
                  object RzGroupBox6: TRzGroupBox
                    Left = 16
                    Top = 220
                    Width = 297
                    Height = 73
                    Caption = ' '#52636#51077#47928' '#50896#44201' '#51228#50612
                    TabOrder = 2
                    object Btn_DoorOPen: TRzBitBtn
                      Left = 22
                      Top = 29
                      Caption = #49884#51221
                      Color = 15791348
                      HighlightColor = 16026986
                      HotTrack = True
                      HotTrackColor = 3983359
                      TabOrder = 0
                      OnClick = Btn_DoorOPenClick
                    end
                    object Btn_DoorClose: TRzBitBtn
                      Left = 126
                      Top = 29
                      Caption = #54644#51221
                      Color = 15791348
                      HighlightColor = 16026986
                      HotTrack = True
                      HotTrackColor = 3983359
                      TabOrder = 1
                      OnClick = Btn_DoorCloseClick
                    end
                  end
                  object gbDoorNo2: TRadioGroup
                    Left = 101
                    Top = 21
                    Width = 212
                    Height = 31
                    Columns = 8
                    ItemIndex = 0
                    Items.Strings = (
                      '1'
                      '2'
                      '3'
                      '4'
                      '5'
                      '6'
                      '7'
                      '8')
                    TabOrder = 3
                  end
                  object Btn_CheckStatus: TRzBitBtn
                    Left = 35
                    Top = 310
                    Caption = #49345#53468#54869#51064
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 4
                    OnClick = Btn_CheckStatusClick
                  end
                end
                object GroupBox27: TGroupBox
                  Left = 704
                  Top = 8
                  Width = 153
                  Height = 57
                  TabOrder = 2
                  object RzBitBtn54: TRzBitBtn
                    Left = 11
                    Top = 16
                    Caption = #52852#46300#46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = RzBitBtn54Click
                  end
                end
                object Button4: TButton
                  Left = 720
                  Top = 96
                  Width = 73
                  Height = 41
                  Caption = 'TEST'
                  TabOrder = 3
                  Visible = False
                  OnClick = Button4Click
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = 'DOOR '#51228#50612
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #52852#46300#45936#51060#53552' '#46321#47197
                object GroupBox1: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 303
                  Height = 442
                  Align = alLeft
                  Caption = #46321#47197#54624' '#52852#46300' '#48264#54840
                  TabOrder = 0
                  object Label64: TLabel
                    Left = 8
                    Top = 251
                    Width = 212
                    Height = 60
                    Caption = 
                      '10'#51088#47532#52852#46300#48264#54840' OR 10'#51088#47532' '#52636#51077#48264#54840#13#10#13#10'+ 6'#51088#47532#50976#54952#44592#44036'(yymmdd)'#13#10#13#10#9733' '#50976#54952#44592#44036':000000  '#50976#54952#44592 +
                      #44036' '#49324#50857#50504#54632
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clPurple
                    Font.Height = -12
                    Font.Name = #44404#47548
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label74: TLabel
                    Left = 16
                    Top = 152
                    Width = 24
                    Height = 12
                    Caption = #44208#44284
                  end
                  object Label143: TLabel
                    Left = 88
                    Top = 432
                    Width = 32
                    Height = 12
                    Caption = 'msec'
                  end
                  object Memo_CardNo: TMemo
                    Left = 16
                    Top = 16
                    Width = 273
                    Height = 121
                    ImeName = 'Microsoft IME 2003'
                    Lines.Strings = (
                      '0000001234')
                    PopupMenu = CardNoPopupMenu
                    TabOrder = 0
                    OnChange = Memo_CardNoChange
                  end
                  object Btn_RegCardNo: TRzBitBtn
                    Left = 8
                    Top = 341
                    Width = 90
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = Btn_RegCardNoClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object Btn_DelCardNo: TRzBitBtn
                    Left = 9
                    Top = 373
                    Width = 90
                    Caption = #49325#51228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = Btn_DelCardNoClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object Memo2: TMemo
                    Left = 16
                    Top = 168
                    Width = 273
                    Height = 73
                    ImeName = 'Microsoft IME 2003'
                    Lines.Strings = (
                      '0000001234')
                    TabOrder = 3
                  end
                  object Btn_CheckCardNo: TRzBitBtn
                    Left = 107
                    Top = 341
                    Width = 90
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 4
                    OnClick = Btn_CheckCardNoClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8121212
                      12121212121212E8E8E8E8E8E881818181818181818181E8E8E8E8E812181818
                      1818121812121212E8E8E8E881E2E2E2E2E281E281818181E8E8E8E8121E1818
                      1818181218121212E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E812181E18
                      1818181812181212E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E8121E181E
                      1818181818121812E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E8121E1E18
                      1E18181818181212E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8128D1E1E
                      181E181818181812E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8128D8D1E
                      1E181E1818181812E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8121212
                      12121212121212E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object cbAutoReg: TRzCheckBox
                    Left = 8
                    Top = 320
                    Width = 153
                    Height = 22
                    Caption = #51088#46041' '#46321#47197' '#47784#46300
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clRed
                    Font.Height = -15
                    Font.Name = #44404#47548
                    Font.Style = [fsBold]
                    HotTrack = True
                    ParentFont = False
                    State = cbUnchecked
                    TabOrder = 5
                  end
                  object Btn_DelCardNoBtn_DelAllCardNo: TRzBitBtn
                    Left = 109
                    Top = 373
                    Width = 90
                    Caption = #51204#52404#49325#51228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 6
                    OnClick = Btn_DelCardNoBtn_DelAllCardNoClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object chk_FastSave: TCheckBox
                    Left = 8
                    Top = 408
                    Width = 161
                    Height = 17
                    Caption = 'Fast Save'
                    TabOrder = 7
                  end
                  object chk_SendTime: TCheckBox
                    Left = 8
                    Top = 432
                    Width = 17
                    Height = 17
                    Caption = 'chk_SendTime'
                    TabOrder = 8
                    OnClick = chk_SendTimeClick
                  end
                  object ed_SendTime: TEdit
                    Left = 24
                    Top = 432
                    Width = 57
                    Height = 20
                    Enabled = False
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 9
                    Text = '100'
                  end
                  object btn_CardDownLoadStop: TRzBitBtn
                    Left = 123
                    Top = 429
                    Width = 90
                    Caption = #46321#47197#51473#51648
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 10
                    OnClick = btn_CardDownLoadStopClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000530C0000530C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E84B4B4B
                      4B4B4B4B4B4B4BE8E8E8E8E8E881818181818181818181E8E8E8E8E84B515151
                      51514B514B4B4B4BE8E8E8E881E2E2E2E2E281E281818181E8E8E8E84B7C5151
                      5151514B514B4B4BE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E84B517C51
                      515151514B514B4BE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E84B7C517C
                      51515151514B514BE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E84B7C7C51
                      7C51515151514B4BE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E84BA77C7C
                      517C51515151514BE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E84BA7A77C
                      7C517C515151514BE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E84B4B4B
                      4B4B4B4B4B4B4BE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object chk_CmdX: TCheckBox
                    Left = 152
                    Top = 323
                    Width = 73
                    Height = 17
                    Caption = 'Hex(X)'
                    TabOrder = 11
                    OnClick = ck_YYMMDDClick
                  end
                end
                object GroupBox6: TGroupBox
                  Left = 303
                  Top = 0
                  Width = 662
                  Height = 442
                  Align = alClient
                  Caption = #52636#51077' '#51060#48292#53944
                  TabOrder = 1
                  object Label141: TLabel
                    Left = 648
                    Top = 284
                    Width = 4
                    Height = 12
                  end
                  object Label142: TLabel
                    Left = 648
                    Top = 308
                    Width = 4
                    Height = 12
                  end
                  object LMDListBox1: TLMDListBox
                    Left = 2
                    Top = 14
                    Width = 658
                    Height = 177
                    HorzScrollBar.Range = 940
                    HorzScrollBar.Style = ssFlat
                    HorzScrollBar.Tracking = True
                    Align = alTop
                    Color = clWindow
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = #44404#47548
                    Font.Style = []
                    TabOrder = 0
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -12
                    HeaderFont.Name = #44404#47548
                    HeaderFont.Style = []
                    HeaderHeight = 17
                    HeaderSections = <
                      item
                        Alignment = taRightJustify
                        ImageIndex = -1
                        Text = #49692#48264
                        Width = 40
                      end
                      item
                        AllowClick = False
                        ImageIndex = -1
                        Text = #51060#48292#53944#49884#44036
                        Width = 120
                      end
                      item
                        ImageIndex = -1
                        Text = #47928#48264#54840
                        Width = 50
                      end
                      item
                        AllowClick = False
                        ImageIndex = -1
                        Text = #52852#46300#47784#46300
                        Width = 60
                      end
                      item
                        AllowClick = False
                        ImageIndex = -1
                        Text = #52636#51077#47784#46300
                        Width = 60
                      end
                      item
                        AllowClick = False
                        ImageIndex = -1
                        Text = #48320#44221#49324#50976
                        Width = 60
                      end
                      item
                        AllowClick = False
                        ImageIndex = -1
                        Text = #49849#51064#44208#44284
                        Width = 120
                      end
                      item
                        AllowClick = False
                        ImageIndex = -1
                        Text = #47928#49345#53468
                        Width = 60
                      end
                      item
                        AllowClick = False
                        ImageIndex = -1
                        Text = #52636#51077#48264#54840
                        Width = 70
                      end
                      item
                        ImageIndex = -1
                        Text = 'HEX'
                        Width = 300
                      end>
                    HeaderFlat = True
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 16
                    MultiSelect = True
                    VirtualWidth = 940
                    VirtualAutoWidth = True
                    OnKeyDown = LMDListBox1KeyDown
                  end
                  object GroupBox7: TGroupBox
                    Left = -14
                    Top = 473
                    Width = 518
                    Height = 66
                    Align = alCustom
                    Caption = #51204#54868' '#44592#47197
                    TabOrder = 1
                    Visible = False
                    object LMDListBox2: TLMDListBox
                      Left = 12
                      Top = 23
                      Width = 476
                      Height = 43
                      Color = clWindow
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = #44404#47548
                      Font.Style = []
                      TabOrder = 0
                      HeaderFont.Charset = DEFAULT_CHARSET
                      HeaderFont.Color = clWindowText
                      HeaderFont.Height = -12
                      HeaderFont.Name = #44404#47548
                      HeaderFont.Style = []
                      HeaderHeight = 17
                      HeaderSections = <
                        item
                          ImageIndex = -1
                          Text = #49884#44036
                          Width = 108
                        end
                        item
                          ImageIndex = -1
                          Text = #51204#54868#48264#54840
                          Width = 188
                        end
                        item
                          ImageIndex = -1
                          Text = #52636#51077#48264#54840
                          Width = 139
                        end>
                      HeaderFlat = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 16
                    end
                    object Memo1: TMemo
                      Left = 13
                      Top = 72
                      Width = 474
                      Height = 49
                      ImeName = 'Microsoft IME 2003'
                      Lines.Strings = (
                        'Memo1')
                      TabOrder = 1
                    end
                  end
                  object Panel1: TPanel
                    Left = 2
                    Top = 191
                    Width = 658
                    Height = 41
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 2
                    object Label12: TLabel
                      Left = 16
                      Top = 13
                      Width = 266
                      Height = 12
                      Caption = #8251' Ctrl + C '#45716'  '#53364#47549#48372#46300#47196' '#52852#46300#48264#54840' '#48373#49324' '#54633#45768#45796'.'
                    end
                    object Btn_DelEventLog: TRzBitBtn
                      Left = 350
                      Top = 8
                      Width = 83
                      Caption = #54868#47732#51648#50880
                      Color = 15791348
                      HighlightColor = 16026986
                      HotTrack = True
                      HotTrackColor = 3983359
                      TabOrder = 0
                      OnClick = Btn_DelEventLogClick
                      Glyph.Data = {
                        36060000424D3606000000000000360400002800000020000000100000000100
                        08000000000000020000530C0000530C00000001000000000000000000003300
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
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E84B4B4B
                        4B4B4B4B4B4B4BE8E8E8E8E8E881818181818181818181E8E8E8E8E84B515151
                        51514B514B4B4B4BE8E8E8E881E2E2E2E2E281E281818181E8E8E8E84B7C5151
                        5151514B514B4B4BE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E84B517C51
                        515151514B514B4BE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E84B7C517C
                        51515151514B514BE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E84B7C7C51
                        7C51515151514B4BE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E84BA77C7C
                        517C51515151514BE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E84BA7A77C
                        7C517C515151514BE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E84B4B4B
                        4B4B4B4B4B4B4BE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                      NumGlyphs = 2
                    end
                    object btCardReg: TRzBitBtn
                      Left = 440
                      Top = 8
                      Width = 81
                      Caption = #46321#47197
                      Color = 15791348
                      HighlightColor = 16026986
                      HotTrack = True
                      HotTrackColor = 3983359
                      TabOrder = 1
                      OnClick = btCardRegClick
                      Glyph.Data = {
                        36060000424D3606000000000000360400002800000020000000100000000100
                        08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                        6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                        90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                        9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                        909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                        90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                        B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                        90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                        B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                        6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                      NumGlyphs = 2
                    end
                    object RzBitBtn47: TRzBitBtn
                      Left = 529
                      Top = 8
                      Width = 88
                      Caption = #49325#51228
                      Color = 15791348
                      HighlightColor = 16026986
                      HotTrack = True
                      HotTrackColor = 3983359
                      TabOrder = 2
                      OnClick = RzBitBtn47Click
                      Glyph.Data = {
                        36060000424D3606000000000000360400002800000020000000100000000100
                        08000000000000020000430C0000430C00000001000000000000000000003300
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
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                        03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                        0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                        0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                        0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                        0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                        0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                        0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                        0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                        03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                      NumGlyphs = 2
                    end
                    object RzBitBtn53: TRzBitBtn
                      Left = 622
                      Top = 8
                      Width = 83
                      Caption = #52636#51077#51228#50612#46321#47197
                      Color = 15791348
                      HighlightColor = 16026986
                      HotTrack = True
                      HotTrackColor = 3983359
                      TabOrder = 3
                      OnClick = RzBitBtn53Click
                      Glyph.Data = {
                        36060000424D3606000000000000360400002800000020000000100000000100
                        08000000000000020000530C0000530C00000001000000000000000000003300
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
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E84B4B4B
                        4B4B4B4B4B4B4BE8E8E8E8E8E881818181818181818181E8E8E8E8E84B515151
                        51514B514B4B4B4BE8E8E8E881E2E2E2E2E281E281818181E8E8E8E84B7C5151
                        5151514B514B4B4BE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E84B517C51
                        515151514B514B4BE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E84B7C517C
                        51515151514B514BE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E84B7C7C51
                        7C51515151514B4BE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E84BA77C7C
                        517C51515151514BE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E84BA7A77C
                        7C517C515151514BE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E84B4B4B
                        4B4B4B4B4B4B4BE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                      NumGlyphs = 2
                    end
                  end
                  object GroupBox22: TGroupBox
                    Left = 2
                    Top = 232
                    Width = 658
                    Height = 41
                    Align = alTop
                    TabOrder = 3
                    object Label132: TLabel
                      Left = 128
                      Top = 16
                      Width = 12
                      Height = 12
                      Caption = #45380
                    end
                    object Label133: TLabel
                      Left = 168
                      Top = 16
                      Width = 12
                      Height = 12
                      Caption = #50900
                    end
                    object Label134: TLabel
                      Left = 208
                      Top = 16
                      Width = 12
                      Height = 12
                      Caption = #51068
                    end
                    object Label131: TLabel
                      Left = 88
                      Top = 16
                      Width = 12
                      Height = 12
                      Caption = '20'
                    end
                    object Label136: TLabel
                      Left = 296
                      Top = 16
                      Width = 49
                      Height = 12
                      Caption = 'Label136'
                      Visible = False
                    end
                    object edYYYY: TEdit
                      Left = 104
                      Top = 12
                      Width = 20
                      Height = 20
                      ImeName = 'Microsoft IME 2003'
                      MaxLength = 2
                      TabOrder = 0
                    end
                    object edMM: TEdit
                      Left = 144
                      Top = 12
                      Width = 20
                      Height = 20
                      ImeName = 'Microsoft IME 2003'
                      MaxLength = 2
                      TabOrder = 1
                    end
                    object edDD: TEdit
                      Left = 184
                      Top = 12
                      Width = 20
                      Height = 20
                      ImeName = 'Microsoft IME 2003'
                      MaxLength = 2
                      TabOrder = 2
                    end
                    object ck_YYMMDD: TCheckBox
                      Left = 8
                      Top = 14
                      Width = 73
                      Height = 17
                      Caption = #50976#54952#44592#44036':'
                      TabOrder = 3
                      OnClick = ck_YYMMDDClick
                    end
                  end
                  object rdInOutMode: TRadioGroup
                    Left = 2
                    Top = 355
                    Width = 518
                    Height = 41
                    Align = alCustom
                    Caption = #52636#51077#49884#44036#47784#46300
                    Columns = 4
                    ItemIndex = 0
                    Items.Strings = (
                      #54644#45817#49324#54637#50630#51020
                      '1'#47784#46300
                      '2'#47784#46300
                      '3'#47784#46300)
                    TabOrder = 4
                  end
                  object rdCardAuth: TRadioGroup
                    Left = 2
                    Top = 314
                    Width = 518
                    Height = 41
                    Align = alCustom
                    Caption = #52852#46300#44428#54620
                    Columns = 4
                    ItemIndex = 0
                    Items.Strings = (
                      #48169#48276'/'#52636#51077
                      #52636#51077#51204#50857
                      #48169#48276#51204#50857)
                    TabOrder = 5
                  end
                  object rdRegCode: TRadioGroup
                    Left = 2
                    Top = 273
                    Width = 518
                    Height = 41
                    Align = alCustom
                    Caption = #46321#47197'Code'
                    Columns = 4
                    ItemIndex = 0
                    Items.Strings = (
                      #47784#46160#46321#47197
                      #52395#48264#51704#52636#51077#47928
                      #46160#48264#51704#52636#51077#47928
                      #48169#48276#52852#46300#51204#50857)
                    TabOrder = 6
                  end
                  object RzBitBtn48: TRzBitBtn
                    Left = 545
                    Top = 280
                    Width = 100
                    Caption = #48120#46321#47197#49688#47049
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 7
                    OnClick = RzBitBtn48Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object RzBitBtn49: TRzBitBtn
                    Left = 545
                    Top = 304
                    Width = 100
                    Caption = #46321#47197#49688#47049
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 8
                    OnClick = RzBitBtn49Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object RzBitBtn50: TRzBitBtn
                    Left = 545
                    Top = 352
                    Width = 100
                    Caption = #46321#47197'LIST'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 9
                    OnClick = RzBitBtn50Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object RzBitBtn51: TRzBitBtn
                    Left = 545
                    Top = 376
                    Width = 100
                    Caption = #51204#52404'LIST'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 10
                    OnClick = RzBitBtn51Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object RzBitBtn52: TRzBitBtn
                    Left = 649
                    Top = 376
                    Width = 100
                    Caption = 'LIST'#51221#51648
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 11
                    OnClick = RzBitBtn52Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object GroupBox26: TGroupBox
                    Left = 0
                    Top = 400
                    Width = 521
                    Height = 49
                    Caption = #52852#46300#45936#51060#53552' Sort'
                    TabOrder = 12
                    object Label144: TLabel
                      Left = 56
                      Top = 22
                      Width = 28
                      Height = 12
                      Caption = #48516' '#54980
                    end
                    object ed_SortMin: TEdit
                      Left = 16
                      Top = 18
                      Width = 33
                      Height = 20
                      ImeName = 'Microsoft IME 2003'
                      TabOrder = 0
                      Text = '00'
                    end
                    object btn_Sort: TButton
                      Left = 88
                      Top = 16
                      Width = 49
                      Height = 25
                      Caption = 'Sort'
                      TabOrder = 1
                      OnClick = btn_SortClick
                    end
                    object btn_SortDisp: TButton
                      Left = 168
                      Top = 16
                      Width = 57
                      Height = 25
                      Caption = 'Sort '#54869#51064
                      TabOrder = 2
                      OnClick = btn_SortDispClick
                    end
                    object ed_SortDisp: TEdit
                      Left = 232
                      Top = 18
                      Width = 257
                      Height = 20
                      ImeName = 'Microsoft IME 2003'
                      TabOrder = 3
                    end
                  end
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #47004' '#47784#46280' '#49444#51221
                object RzLabel19: TRzLabel
                  Left = 20
                  Top = 19
                  Width = 43
                  Height = 12
                  Caption = 'Version'
                  Transparent = True
                  BlinkIntervalOff = 1500
                end
                object RzLabel20: TRzLabel
                  Left = 284
                  Top = 19
                  Width = 60
                  Height = 12
                  Caption = #47589#50612#46300#47112#49828
                  Transparent = True
                  BlinkIntervalOff = 1500
                end
                object RzGroupBox7: TRzGroupBox
                  Left = 16
                  Top = 72
                  Width = 281
                  Height = 129
                  Caption = 'network Setting '
                  TabOrder = 0
                  Transparent = True
                  object RzLabel4: TRzLabel
                    Left = 11
                    Top = 21
                    Width = 97
                    Height = 12
                    Caption = 'Local IP Address'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object RzLabel5: TRzLabel
                    Left = 34
                    Top = 45
                    Width = 74
                    Height = 12
                    Caption = 'Subnet Mask'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object RzLabel6: TRzLabel
                    Left = 58
                    Top = 71
                    Width = 50
                    Height = 12
                    Caption = 'Gateway'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object RzLabel7: TRzLabel
                    Left = 52
                    Top = 97
                    Width = 56
                    Height = 12
                    Caption = 'Local port'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object Edit_LocalIP: TRzEdit
                    Left = 115
                    Top = 17
                    Width = 141
                    Height = 20
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    TabOnEnter = True
                    TabOrder = 0
                  end
                  object Edit_Sunnet: TRzEdit
                    Left = 115
                    Top = 41
                    Width = 141
                    Height = 20
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    TabOnEnter = True
                    TabOrder = 1
                  end
                  object Edit_Gateway: TRzEdit
                    Left = 115
                    Top = 66
                    Width = 141
                    Height = 20
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    TabOnEnter = True
                    TabOrder = 2
                  end
                  object Edit_LocalPort: TRzEdit
                    Left = 115
                    Top = 91
                    Width = 141
                    Height = 20
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    TabOnEnter = True
                    TabOrder = 3
                  end
                end
                object RzGroupBox8: TRzGroupBox
                  Left = 16
                  Top = 212
                  Width = 477
                  Height = 124
                  Caption = 'Client mode Setting '
                  TabOrder = 1
                  Transparent = True
                  object RzLabel8: TRzLabel
                    Left = 17
                    Top = 57
                    Width = 102
                    Height = 12
                    Caption = 'Server IP Address'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object RzLabel10: TRzLabel
                    Left = 284
                    Top = 57
                    Width = 61
                    Height = 12
                    Caption = 'Server port'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object Edit_ServerIp: TRzEdit
                    Left = 147
                    Top = 54
                    Width = 114
                    Height = 20
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    TabOnEnter = True
                    TabOrder = 0
                  end
                  object Edit_Serverport: TRzEdit
                    Left = 358
                    Top = 54
                    Width = 64
                    Height = 20
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    TabOnEnter = True
                    TabOrder = 1
                  end
                  object Checkbox_Client: TRzCheckBox
                    Left = 17
                    Top = 93
                    Width = 177
                    Height = 17
                    Caption = 'Use client mode only'
                    HotTrack = True
                    State = cbUnchecked
                    TabOnEnter = True
                    TabOrder = 2
                    Transparent = True
                  end
                  object RadioModeClient: TRadioButton
                    Left = 16
                    Top = 24
                    Width = 113
                    Height = 17
                    Caption = 'Client Mode'
                    Checked = True
                    TabOrder = 3
                    TabStop = True
                  end
                  object RadioModeServer: TRadioButton
                    Left = 148
                    Top = 24
                    Width = 113
                    Height = 17
                    Caption = 'Server Mode'
                    TabOrder = 4
                  end
                  object RadioModeMixed: TRadioButton
                    Left = 280
                    Top = 24
                    Width = 113
                    Height = 17
                    Caption = 'Mixed Mode'
                    TabOrder = 5
                  end
                end
                object RzGroupBox9: TRzGroupBox
                  Left = 312
                  Top = 47
                  Width = 180
                  Height = 154
                  Caption = 'Setting Serial'
                  TabOrder = 2
                  Transparent = True
                  object RzLabel9: TRzLabel
                    Left = 16
                    Top = 19
                    Width = 36
                    Height = 12
                    Caption = 'Speed'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object RzLabel11: TRzLabel
                    Left = 14
                    Top = 46
                    Width = 38
                    Height = 12
                    Caption = 'Databit'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object RzLabel12: TRzLabel
                    Left = 20
                    Top = 71
                    Width = 32
                    Height = 12
                    Caption = 'Parity'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object RzLabel13: TRzLabel
                    Left = 10
                    Top = 98
                    Width = 42
                    Height = 12
                    Caption = 'Stop bit'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object RzLabel14: TRzLabel
                    Left = 25
                    Top = 124
                    Width = 27
                    Height = 12
                    Caption = 'Flow'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object ComboBox_Boad: TRzComboBox
                    Left = 61
                    Top = 16
                    Width = 90
                    Height = 20
                    Ctl3D = False
                    FlatButtons = True
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    ItemHeight = 0
                    ParentCtl3D = False
                    TabOnEnter = True
                    TabOrder = 0
                    Text = '38400'
                    Items.Strings = (
                      '1200'
                      '2400'
                      '4800'
                      '9600'
                      '19200'
                      '38400'
                      '57600'
                      '115200'
                      '230400')
                  end
                  object ComboBox_Databit: TRzComboBox
                    Left = 61
                    Top = 42
                    Width = 90
                    Height = 20
                    Ctl3D = False
                    FlatButtons = True
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    ItemHeight = 0
                    ParentCtl3D = False
                    TabOnEnter = True
                    TabOrder = 1
                    Text = '8'
                    Items.Strings = (
                      '7'
                      '8')
                    ItemIndex = 1
                  end
                  object ComboBox_Parity: TRzComboBox
                    Left = 61
                    Top = 68
                    Width = 90
                    Height = 20
                    Ctl3D = False
                    FlatButtons = True
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    ItemHeight = 0
                    ParentCtl3D = False
                    TabOnEnter = True
                    TabOrder = 2
                    Text = 'None'
                    Items.Strings = (
                      'None'
                      'Odd'
                      'Even')
                  end
                  object ComboBox_Stopbit: TRzComboBox
                    Left = 61
                    Top = 94
                    Width = 90
                    Height = 20
                    Ctl3D = False
                    FlatButtons = True
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    ItemHeight = 0
                    ParentCtl3D = False
                    TabOnEnter = True
                    TabOrder = 3
                    Text = '1'
                    Items.Strings = (
                      '1')
                  end
                  object ComboBox_Flow: TRzComboBox
                    Left = 61
                    Top = 120
                    Width = 90
                    Height = 20
                    Ctl3D = False
                    FlatButtons = True
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    ItemHeight = 0
                    ParentCtl3D = False
                    TabOnEnter = True
                    TabOrder = 4
                    Text = 'None'
                    Items.Strings = (
                      'None'
                      'Xon/Xoff'
                      'CTS/RTS')
                  end
                end
                object RzGroupBox10: TRzGroupBox
                  Left = 506
                  Top = 46
                  Width = 199
                  Height = 154
                  Caption = 'Setting Delimeter'
                  TabOrder = 3
                  Transparent = True
                  object RzLabel15: TRzLabel
                    Left = 31
                    Top = 19
                    Width = 75
                    Height = 12
                    Caption = 'Time(*10ms)'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object RzLabel16: TRzLabel
                    Left = 32
                    Top = 54
                    Width = 74
                    Height = 12
                    Caption = 'Size(1~1024)'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object RzLabel17: TRzLabel
                    Left = 45
                    Top = 88
                    Width = 61
                    Height = 12
                    Caption = 'Char(HEX)'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object RzLabel18: TRzLabel
                    Left = 6
                    Top = 124
                    Width = 99
                    Height = 12
                    Caption = 'Idle Time(*10ms)'
                    Transparent = True
                    BlinkIntervalOff = 1500
                  end
                  object Edit_Time: TRzEdit
                    Left = 122
                    Top = 16
                    Width = 60
                    Height = 20
                    Alignment = taRightJustify
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    TabOnEnter = True
                    TabOrder = 0
                  end
                  object Edit_Size: TRzEdit
                    Left = 122
                    Top = 50
                    Width = 60
                    Height = 20
                    Alignment = taRightJustify
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    TabOnEnter = True
                    TabOrder = 1
                  end
                  object Edit_Char: TRzEdit
                    Left = 122
                    Top = 85
                    Width = 60
                    Height = 20
                    Alignment = taRightJustify
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    MaxLength = 2
                    TabOnEnter = True
                    TabOrder = 2
                  end
                  object Edit_Idle: TRzEdit
                    Left = 122
                    Top = 120
                    Width = 60
                    Height = 20
                    Alignment = taRightJustify
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    TabOnEnter = True
                    TabOrder = 3
                  end
                end
                object RzBitBtn30: TRzBitBtn
                  Left = 507
                  Top = 311
                  Width = 135
                  Caption = #44592#48376#44050#51004#47196' '#51200#51109
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 4
                  OnClick = RzBitBtn30Click
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E89C9C9C
                    9C9C9C9C9C9C9CE8E8E8E8E8E881818181818181818181E8E8E8E8E89CC6C6C6
                    C6C69CC69C9C9C9CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E89CCCC6C6
                    C6C6C69CC69C9C9CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E89CC6CCC6
                    C6C6C6C69CC69C9CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E89CCCC6CC
                    C6C6C6C6C69CC69CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E89CCCCCC6
                    CCC6C6C6C6C69C9CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E89CCFCCCC
                    C6CCC6C6C6C6C69CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E89CCFCFCC
                    CCC6CCC6C6C6C69CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E89C9C9C
                    9C9C9C9C9C9C9CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object RzBitBtn31: TRzBitBtn
                  Left = 507
                  Top = 279
                  Width = 135
                  Caption = #44592#48376#44050' '#48520#47084#50724#44592
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 5
                  OnClick = RzBitBtn31Click
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8121212
                    12121212121212E8E8E8E8E8E881818181818181818181E8E8E8E8E812181818
                    1818121812121212E8E8E8E881E2E2E2E2E281E281818181E8E8E8E8121E1818
                    1818181218121212E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E812181E18
                    1818181812181212E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E8121E181E
                    1818181818121812E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E8121E1E18
                    1E18181818181212E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8128D1E1E
                    181E181818181812E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8128D8D1E
                    1E181E1818181812E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8121212
                    12121212121212E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object Checkbox_Debugmode: TRzCheckBox
                  Left = 21
                  Top = 46
                  Width = 124
                  Height = 17
                  Caption = 'debug mode'
                  HotTrack = True
                  State = cbUnchecked
                  TabOnEnter = True
                  TabOrder = 6
                  Transparent = True
                end
                object RzEdit1: TRzEdit
                  Left = 73
                  Top = 16
                  Width = 154
                  Height = 20
                  Color = 8454143
                  FrameVisible = True
                  ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                  ReadOnly = True
                  TabOrder = 7
                end
                object Checkbox_DHCP: TRzCheckBox
                  Left = 205
                  Top = 46
                  Width = 98
                  Height = 17
                  Caption = 'DHCP mode'
                  HotTrack = True
                  State = cbUnchecked
                  TabOnEnter = True
                  TabOrder = 8
                  Transparent = True
                end
                object RzBitBtn32: TRzBitBtn
                  Left = 507
                  Top = 248
                  Width = 135
                  Caption = #47004#47784#46280' '#51221#48372' '#49444#51221
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 9
                  OnClick = RzBitBtn32Click
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                    90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                    9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                    909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                    90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                    B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                    90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                    B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                    6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object btnCheckLan: TRzBitBtn
                  Left = 507
                  Top = 217
                  Width = 135
                  Caption = #47004#47784#46280' '#51221#48372' '#51069#44592
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 10
                  OnClick = btnCheckLanClick
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000430C0000430C00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                    0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                    0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                    0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                    0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                    0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                    0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                    0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                    03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object RzEdit2: TRzEdit
                  Left = 360
                  Top = 16
                  Width = 154
                  Height = 20
                  Color = 8454143
                  FrameVisible = True
                  ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                  ReadOnly = True
                  TabOrder = 11
                end
                object LMDCaptionPanel1: TLMDCaptionPanel
                  Left = 104
                  Top = 112
                  Width = 393
                  Height = 105
                  Caption = ' '#44592#44592' '#49444#51221'/'#51312#54924#51473'...'
                  CaptionSettings.CaptionGap = 1
                  CaptionSettings.FontSize = 9
                  OnCloseBtnClick = LMDCaptionPanel1CloseBtnClick
                  Bevel.Mode = bmStandard
                  Bevel.StandardStyle = lsDoubleRaised
                  TabOrder = 12
                  Visible = False
                  object TLMDCaptionPanelClient
                    object LMDSimpleLabel1: TLMDSimpleLabel
                      Left = 12
                      Top = 44
                      Width = 256
                      Height = 16
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -12
                      Font.Name = #44404#47548
                      Font.Style = []
                      Font3D.Style = tdRaisedShadow
                      ParentFont = False
                      UseGlobalTimer = True
                      Caption = #47004' '#47784#46280#44284' '#53685#49888#51473' '#51077#45768#45796'.'#51104#49884#47564' '#44592#45796#47140' '#51452#49464#50836
                      Options = []
                    end
                    object ProgressBar3: TProgressBar
                      Left = 8
                      Top = 16
                      Width = 358
                      Height = 22
                      Max = 16
                      Position = 9
                      Step = 1
                      TabOrder = 0
                    end
                  end
                end
                object GroupMAc: TRzGroupBox
                  Left = 16
                  Top = 348
                  Width = 393
                  Height = 124
                  Caption = #47589#50612#46300#47112#49828' '#46321#47197
                  TabOrder = 13
                  Transparent = True
                  object editMAC1: TRzEdit
                    Left = 24
                    Top = 50
                    Width = 29
                    Height = 24
                    Text = '00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = #44404#47548
                    Font.Style = [fsBold]
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    MaxLength = 2
                    ParentFont = False
                    TabOnEnter = True
                    TabOrder = 0
                    OnClick = editMAC1Click
                  end
                  object editMAC2: TRzEdit
                    Left = 54
                    Top = 50
                    Width = 29
                    Height = 24
                    Text = '00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = #44404#47548
                    Font.Style = [fsBold]
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    MaxLength = 2
                    ParentFont = False
                    TabOnEnter = True
                    TabOrder = 1
                    OnClick = editMAC1Click
                  end
                  object editMAC3: TRzEdit
                    Left = 84
                    Top = 50
                    Width = 29
                    Height = 24
                    Text = '00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = #44404#47548
                    Font.Style = [fsBold]
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    MaxLength = 2
                    ParentFont = False
                    TabOnEnter = True
                    TabOrder = 2
                    OnClick = editMAC1Click
                  end
                  object editMAC4: TRzEdit
                    Left = 114
                    Top = 50
                    Width = 29
                    Height = 24
                    Text = '00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = #44404#47548
                    Font.Style = [fsBold]
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    MaxLength = 2
                    ParentFont = False
                    TabOnEnter = True
                    TabOrder = 3
                    OnClick = editMAC1Click
                  end
                  object editMAC5: TRzEdit
                    Left = 144
                    Top = 50
                    Width = 29
                    Height = 24
                    Text = '00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = #44404#47548
                    Font.Style = [fsBold]
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    MaxLength = 2
                    ParentFont = False
                    TabOnEnter = True
                    TabOrder = 4
                    OnClick = editMAC1Click
                  end
                  object editMAC6: TRzEdit
                    Left = 175
                    Top = 50
                    Width = 29
                    Height = 24
                    Text = '00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = #44404#47548
                    Font.Style = [fsBold]
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
                    MaxLength = 2
                    ParentFont = False
                    TabOnEnter = True
                    TabOrder = 5
                    OnClick = editMAC1Click
                  end
                  object btnRegMAC: TRzBitBtn
                    Left = 219
                    Top = 65
                    Width = 135
                    Height = 30
                    Caption = #47589#50612#46300#47112#49828' '#46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 6
                    OnClick = btnRegMACClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object RzBitBtn40: TRzBitBtn
                    Left = 219
                    Top = 28
                    Width = 135
                    Height = 30
                    Caption = #47589' '#50612#46300#47112#49828' '#54869#51064
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 7
                    OnClick = btnCheckLanClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #55092#51068' '#45936#51060#53552' '#46321#47197
                object Button1: TButton
                  Left = 104
                  Top = 16
                  Width = 75
                  Height = 25
                  Caption = 'Button1'
                  TabOrder = 0
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #51204#54868#48264#54840#46321#47197
                object Label88: TLabel
                  Left = 21
                  Top = 24
                  Width = 64
                  Height = 12
                  Caption = #47532#45908#44592' '#48264#54840
                end
                object GroupBox2: TGroupBox
                  Left = 16
                  Top = 49
                  Width = 166
                  Height = 323
                  Caption = #44592#44592#50640' '#46321#47197#54624' '#51204#54868' '#48264#54840
                  TabOrder = 0
                  object RzLabel21: TRzLabel
                    Left = 8
                    Top = 44
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '01'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel22: TRzLabel
                    Left = 8
                    Top = 74
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '02'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel23: TRzLabel
                    Left = 8
                    Top = 104
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '03'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel24: TRzLabel
                    Left = 8
                    Top = 135
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '04'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel25: TRzLabel
                    Left = 8
                    Top = 165
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '05'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel26: TRzLabel
                    Left = 8
                    Top = 195
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '06'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel27: TRzLabel
                    Left = 8
                    Top = 226
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '07'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel28: TRzLabel
                    Left = 8
                    Top = 256
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '08'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel29: TRzLabel
                    Left = 8
                    Top = 287
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '09'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel39: TRzLabel
                    Left = 8
                    Top = 17
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '00'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object edRegTelNo1: TRzButtonEdit
                    Tag = 1
                    Left = 40
                    Top = 44
                    Width = 118
                    Height = 20
                    Color = clMoneyGreen
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 0
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edRegTelNoButtonClick
                  end
                  object edRegTelNo2: TRzButtonEdit
                    Tag = 2
                    Left = 40
                    Top = 74
                    Width = 118
                    Height = 20
                    Color = clMoneyGreen
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 1
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edRegTelNoButtonClick
                  end
                  object edRegTelNo3: TRzButtonEdit
                    Tag = 3
                    Left = 40
                    Top = 104
                    Width = 118
                    Height = 20
                    Color = clMoneyGreen
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 2
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edRegTelNoButtonClick
                  end
                  object edRegTelNo4: TRzButtonEdit
                    Tag = 4
                    Left = 40
                    Top = 135
                    Width = 118
                    Height = 20
                    Color = clMoneyGreen
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 3
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edRegTelNoButtonClick
                  end
                  object edRegTelNo5: TRzButtonEdit
                    Tag = 5
                    Left = 40
                    Top = 165
                    Width = 118
                    Height = 20
                    Color = clMoneyGreen
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 4
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edRegTelNoButtonClick
                  end
                  object edRegTelNo6: TRzButtonEdit
                    Tag = 6
                    Left = 40
                    Top = 195
                    Width = 118
                    Height = 20
                    Color = clMoneyGreen
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 5
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edRegTelNoButtonClick
                  end
                  object edRegTelNo7: TRzButtonEdit
                    Tag = 7
                    Left = 40
                    Top = 226
                    Width = 118
                    Height = 20
                    Color = clMoneyGreen
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 6
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edRegTelNoButtonClick
                  end
                  object edRegTelNo8: TRzButtonEdit
                    Tag = 8
                    Left = 40
                    Top = 256
                    Width = 118
                    Height = 20
                    Color = clMoneyGreen
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 7
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edRegTelNoButtonClick
                  end
                  object edRegTelNo9: TRzButtonEdit
                    Tag = 9
                    Left = 40
                    Top = 287
                    Width = 118
                    Height = 20
                    Color = clMoneyGreen
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 8
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edRegTelNoButtonClick
                  end
                  object edRegTelNo0: TRzButtonEdit
                    Left = 40
                    Top = 17
                    Width = 118
                    Height = 20
                    Color = clMoneyGreen
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 9
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edRegTelNoButtonClick
                  end
                end
                object GroupBox3: TGroupBox
                  Left = 190
                  Top = 49
                  Width = 166
                  Height = 323
                  Caption = #44592#44592#50640' '#46321#47197#46108' '#51204#54868#48264#54840
                  TabOrder = 1
                  object RzLabel30: TRzLabel
                    Left = 8
                    Top = 45
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '01'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel31: TRzLabel
                    Left = 8
                    Top = 75
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '02'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel32: TRzLabel
                    Left = 8
                    Top = 105
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '03'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel33: TRzLabel
                    Left = 8
                    Top = 135
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '04'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel34: TRzLabel
                    Left = 8
                    Top = 166
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '05'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel35: TRzLabel
                    Left = 8
                    Top = 196
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '06'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel36: TRzLabel
                    Left = 8
                    Top = 226
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '07'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel37: TRzLabel
                    Left = 8
                    Top = 256
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '08'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel38: TRzLabel
                    Left = 8
                    Top = 287
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '09'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel40: TRzLabel
                    Left = 8
                    Top = 18
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '00'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object edTelNo1: TRzButtonEdit
                    Tag = 1
                    Left = 40
                    Top = 45
                    Width = 118
                    Height = 20
                    Color = 10930928
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 0
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edTelNoButtonClick
                  end
                  object edTelNo2: TRzButtonEdit
                    Tag = 2
                    Left = 40
                    Top = 75
                    Width = 118
                    Height = 20
                    Color = 10930928
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 1
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edTelNoButtonClick
                  end
                  object edTelNo3: TRzButtonEdit
                    Tag = 3
                    Left = 40
                    Top = 105
                    Width = 118
                    Height = 20
                    Color = 10930928
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 2
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edTelNoButtonClick
                  end
                  object edTelNo4: TRzButtonEdit
                    Tag = 4
                    Left = 40
                    Top = 136
                    Width = 118
                    Height = 20
                    Color = 10930928
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 3
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edTelNoButtonClick
                  end
                  object edTelNo5: TRzButtonEdit
                    Tag = 5
                    Left = 40
                    Top = 166
                    Width = 118
                    Height = 20
                    Color = 10930928
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 4
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edTelNoButtonClick
                  end
                  object edTelNo6: TRzButtonEdit
                    Tag = 6
                    Left = 40
                    Top = 196
                    Width = 118
                    Height = 20
                    Color = 10930928
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 5
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edTelNoButtonClick
                  end
                  object edTelNo7: TRzButtonEdit
                    Tag = 7
                    Left = 40
                    Top = 227
                    Width = 118
                    Height = 20
                    Color = 10930928
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 6
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edTelNoButtonClick
                  end
                  object edTelNo8: TRzButtonEdit
                    Tag = 8
                    Left = 40
                    Top = 257
                    Width = 118
                    Height = 20
                    Color = 10930928
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 7
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edTelNoButtonClick
                  end
                  object edTelNo9: TRzButtonEdit
                    Tag = 9
                    Left = 40
                    Top = 288
                    Width = 118
                    Height = 20
                    Color = 10930928
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 8
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edTelNoButtonClick
                  end
                  object edTelNo0: TRzButtonEdit
                    Left = 40
                    Top = 18
                    Width = 118
                    Height = 20
                    Color = 10930928
                    FocusColor = clInfoBk
                    FrameHotTrack = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 9
                    ButtonKind = bkAccept
                    FlatButtons = True
                    OnButtonClick = edTelNoButtonClick
                  end
                end
                object GroupBox4: TGroupBox
                  Left = 364
                  Top = 50
                  Width = 333
                  Height = 107
                  Caption = #48516#44592#44397#49324#52852#46300#47532#45908' Dial Time'
                  TabOrder = 2
                  object Label57: TLabel
                    Left = 21
                    Top = 24
                    Width = 112
                    Height = 12
                    Caption = 'DTMF Dial On Time'
                  end
                  object Label58: TLabel
                    Left = 21
                    Top = 48
                    Width = 111
                    Height = 12
                    Caption = 'DTMF Dial Off Time'
                  end
                  object Label59: TLabel
                    Left = 192
                    Top = 24
                    Width = 33
                    Height = 12
                    Caption = 'mSec'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -12
                    Font.Name = #44404#47548
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label62: TLabel
                    Left = 192
                    Top = 48
                    Width = 33
                    Height = 12
                    Caption = 'mSec'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -12
                    Font.Name = #44404#47548
                    Font.Style = []
                    ParentFont = False
                  end
                  object Bevel2: TBevel
                    Left = 8
                    Top = 64
                    Width = 219
                    Height = 2
                  end
                  object ComboBox1: TComboBox
                    Left = 141
                    Top = 16
                    Width = 49
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 0
                    TabOrder = 0
                    Text = '500'
                    OnClick = ComboBox1Click
                    Items.Strings = (
                      '60'
                      '100'
                      '200'
                      '300'
                      '400'
                      '500'
                      '1000')
                  end
                  object ComboBox2: TComboBox
                    Left = 141
                    Top = 40
                    Width = 50
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 0
                    ItemIndex = 5
                    TabOrder = 1
                    Text = '500'
                    OnClick = ComboBox1Click
                    Items.Strings = (
                      '60'
                      '100'
                      '200'
                      '300'
                      '400'
                      '500'
                      '1000')
                  end
                  object Btn_RegDialInfo: TRzBitBtn
                    Left = 70
                    Top = 74
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = Btn_RegDialInfoClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object Btn_CheckDialInfo: TRzBitBtn
                    Left = 150
                    Top = 74
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 3
                    OnClick = Btn_CheckDialInfoClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                end
                object GroupBox5: TGroupBox
                  Left = 364
                  Top = 160
                  Width = 147
                  Height = 83
                  Caption = #53685#54868#49884#44036' '#46321#47197
                  TabOrder = 3
                  object Label63: TLabel
                    Left = 8
                    Top = 24
                    Width = 52
                    Height = 12
                    Caption = #53685#54868' '#49884#44036
                  end
                  object Bevel3: TBevel
                    Left = 7
                    Top = 47
                    Width = 133
                    Height = 2
                  end
                  object RzSpinner2: TRzSpinner
                    Left = 73
                    Top = 20
                    Width = 64
                    Increment = 10
                    Max = 9999
                    Min = 30
                    Value = 40
                    ParentColor = False
                    TabOrder = 0
                    OnClick = ComboBox1Click
                  end
                  object Btn_RegCalltime: TRzBitBtn
                    Left = 5
                    Top = 52
                    Width = 66
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = Btn_RegCalltimeClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object Btn_CheckCalltime: TRzBitBtn
                    Left = 76
                    Top = 52
                    Width = 66
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = Btn_CheckCalltimeClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                end
                object GroupBox8: TGroupBox
                  Left = 779
                  Top = 35
                  Width = 181
                  Height = 114
                  Caption = #51020#49457' '#44048#49884
                  TabOrder = 4
                  Visible = False
                  object Label7: TLabel
                    Left = 16
                    Top = 51
                    Width = 76
                    Height = 12
                    Caption = #51020#49457#44048#49884' '#49884#44036
                  end
                  object Bevel4: TBevel
                    Left = 15
                    Top = 73
                    Width = 154
                    Height = 2
                  end
                  object btnRegVoicetime: TRzBitBtn
                    Left = 16
                    Top = 81
                    Width = 72
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btnRegVoicetimeClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btnCheckVoicetime: TRzBitBtn
                    Left = 96
                    Top = 81
                    Width = 72
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btnCheckVoicetimeClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object RzSpinner3: TRzSpinner
                    Left = 105
                    Top = 47
                    Width = 65
                    Max = 99
                    Min = 5
                    Value = 10
                    ParentColor = False
                    TabOrder = 2
                    OnClick = ComboBox1Click
                  end
                  object cbVoiceDetect: TRzCheckBox
                    Left = 16
                    Top = 24
                    Width = 130
                    Height = 17
                    Caption = #51020#49457' '#44048#49884' '#49324#50857
                    Checked = True
                    Color = clBtnFace
                    HotTrack = True
                    HotTrackColor = clBtnHighlight
                    ParentColor = False
                    State = cbChecked
                    TabOrder = 3
                    OnClick = cbVoiceDetectClick
                  end
                end
                object GroupBox9: TGroupBox
                  Left = 796
                  Top = 153
                  Width = 165
                  Height = 86
                  Caption = #48169#49569#49884#44036' '#46321#47197
                  TabOrder = 5
                  Visible = False
                  object Label50: TLabel
                    Left = 16
                    Top = 24
                    Width = 48
                    Height = 12
                    Caption = #48169#49569#49884#44036
                  end
                  object Bevel5: TBevel
                    Left = 15
                    Top = 48
                    Width = 133
                    Height = 2
                  end
                  object RzSpinner4: TRzSpinner
                    Left = 81
                    Top = 20
                    Width = 64
                    Increment = 10
                    Max = 9999
                    Min = 30
                    Value = 80
                    ParentColor = False
                    TabOrder = 0
                    OnClick = ComboBox1Click
                  end
                  object Btn_Regbroadcasttime: TRzBitBtn
                    Left = 13
                    Top = 56
                    Width = 66
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = Btn_RegbroadcasttimeClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object Btn_Checkbroadcasttime: TRzBitBtn
                    Left = 84
                    Top = 56
                    Width = 66
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = Btn_CheckbroadcasttimeClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                end
                object Button2: TButton
                  Left = 32
                  Top = 377
                  Width = 75
                  Height = 25
                  Caption = #51204#52404' '#46321#47197
                  TabOrder = 6
                  Visible = False
                  OnClick = Button2Click
                end
                object GroupBox10: TGroupBox
                  Left = 372
                  Top = 334
                  Width = 327
                  Height = 68
                  Caption = #44288#51228' '#51204#54868#48264#54840
                  TabOrder = 7
                  object RzLabel43: TRzLabel
                    Left = 10
                    Top = 41
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '01'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel44: TRzLabel
                    Left = 10
                    Top = 16
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '00'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel45: TRzLabel
                    Left = 10
                    Top = 69
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '02'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel46: TRzLabel
                    Left = 10
                    Top = 92
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '03'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object RzLabel47: TRzLabel
                    Left = 10
                    Top = 116
                    Width = 30
                    Height = 20
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '04'
                    Layout = tlCenter
                    BlinkIntervalOff = 1500
                    BorderInner = fsFlat
                  end
                  object edLinkusTel0: TEdit
                    Left = 47
                    Top = 17
                    Width = 84
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 0
                  end
                  object edLinkusTel1: TEdit
                    Left = 47
                    Top = 41
                    Width = 84
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 1
                  end
                  object edLinkusTel2: TEdit
                    Left = 47
                    Top = 68
                    Width = 84
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 2
                  end
                  object edLinkusTel3: TEdit
                    Left = 47
                    Top = 92
                    Width = 84
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 3
                  end
                  object edLinkusTel4: TEdit
                    Left = 47
                    Top = 116
                    Width = 84
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 4
                  end
                  object btnRegLinkusTel0: TRzBitBtn
                    Left = 141
                    Top = 18
                    Width = 66
                    Height = 20
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 5
                    OnClick = btnRegLinkusTel0Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btnCheckLinkusTel0: TRzBitBtn
                    Left = 212
                    Top = 18
                    Width = 66
                    Height = 20
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 6
                    OnClick = btnCheckLinkusTel0Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btnRegLinkusTel1: TRzBitBtn
                    Left = 141
                    Top = 42
                    Width = 66
                    Height = 20
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 7
                    OnClick = btnRegLinkusTel0Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btnCheckLinkusTel1: TRzBitBtn
                    Left = 212
                    Top = 42
                    Width = 66
                    Height = 20
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 8
                    OnClick = btnCheckLinkusTel0Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btnRegLinkusTel2: TRzBitBtn
                    Left = 141
                    Top = 69
                    Width = 66
                    Height = 20
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 9
                    OnClick = btnRegLinkusTel0Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btnCheckLinkusTel2: TRzBitBtn
                    Left = 212
                    Top = 69
                    Width = 66
                    Height = 20
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 10
                    OnClick = btnCheckLinkusTel0Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btnRegLinkusTel3: TRzBitBtn
                    Left = 141
                    Top = 93
                    Width = 66
                    Height = 20
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 11
                    OnClick = btnRegLinkusTel0Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btnCheckLinkusTel3: TRzBitBtn
                    Left = 212
                    Top = 93
                    Width = 66
                    Height = 20
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 12
                    OnClick = btnCheckLinkusTel0Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btnRegLinkusTel4: TRzBitBtn
                    Left = 141
                    Top = 117
                    Width = 66
                    Height = 20
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 13
                    OnClick = btnRegLinkusTel0Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btnCheckLinkusTel4: TRzBitBtn
                    Left = 212
                    Top = 117
                    Width = 66
                    Height = 20
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 14
                    OnClick = btnCheckLinkusTel0Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                end
                object GroupBox11: TGroupBox
                  Left = 368
                  Top = 249
                  Width = 148
                  Height = 81
                  Caption = #44397#49440#52404#53356#49884#44036'(00~24)'
                  TabOrder = 8
                  object Label75: TLabel
                    Left = 8
                    Top = 24
                    Width = 52
                    Height = 12
                    Caption = #52404#53356' '#49884#44036
                  end
                  object Bevel7: TBevel
                    Left = 7
                    Top = 47
                    Width = 133
                    Height = 2
                  end
                  object btnRegPtTime: TRzBitBtn
                    Left = 5
                    Top = 52
                    Width = 66
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btnRegPtTimeClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btnCheckPtTime: TRzBitBtn
                    Left = 76
                    Top = 52
                    Width = 66
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btnCheckPtTimeClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object edPtTime: TEdit
                    Left = 71
                    Top = 20
                    Width = 42
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 2
                    TabOrder = 2
                    Text = '01'
                  end
                end
                object GroupBox12: TGroupBox
                  Left = 522
                  Top = 249
                  Width = 175
                  Height = 81
                  Caption = #44397#49440#52404#53356' '#49884#51089#49884#44036'(00~24)'
                  TabOrder = 9
                  object Label78: TLabel
                    Left = 8
                    Top = 24
                    Width = 52
                    Height = 12
                    Caption = #49884#51089' '#49884#44036
                  end
                  object Bevel8: TBevel
                    Left = 7
                    Top = 47
                    Width = 133
                    Height = 2
                  end
                  object Label80: TLabel
                    Left = 118
                    Top = 26
                    Width = 40
                    Height = 12
                    Caption = #49884#44036' '#54980
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -12
                    Font.Name = #44404#47548
                    Font.Style = []
                    ParentFont = False
                  end
                  object btnRegPtDelayTime: TRzBitBtn
                    Left = 5
                    Top = 52
                    Width = 66
                    Caption = #49884#51089
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btnRegPtDelayTimeClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btnCheckPtDelayTime: TRzBitBtn
                    Left = 76
                    Top = 52
                    Width = 66
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    Visible = False
                    OnClick = btnCheckPtTimeClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object edPtDelayTime: TEdit
                    Left = 71
                    Top = 20
                    Width = 42
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 2
                    TabOrder = 2
                    Text = '01'
                  end
                end
                object GroupBox13: TGroupBox
                  Left = 524
                  Top = 160
                  Width = 173
                  Height = 83
                  Caption = #50896#44201#51228#50612' '#47553#52852#50868#53944
                  TabOrder = 10
                  object Label79: TLabel
                    Left = 8
                    Top = 24
                    Width = 40
                    Height = 12
                    Caption = #47553' '#54943#49688
                  end
                  object Bevel9: TBevel
                    Left = 7
                    Top = 47
                    Width = 133
                    Height = 2
                  end
                  object Spinner_Ring: TRzSpinner
                    Left = 73
                    Top = 20
                    Width = 64
                    Max = 50
                    Min = 1
                    Value = 1
                    ParentColor = False
                    TabOrder = 0
                    OnClick = ComboBox1Click
                  end
                  object Btn_RegRingCount: TRzBitBtn
                    Left = 5
                    Top = 52
                    Width = 66
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = Btn_RegRingCountClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object Btn_CheckRingCount: TRzBitBtn
                    Left = 76
                    Top = 52
                    Width = 66
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = Btn_CheckRingCountClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                end
                object cb_Reader: TComboBox
                  Left = 101
                  Top = 20
                  Width = 76
                  Height = 20
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 0
                  ItemIndex = 0
                  TabOrder = 11
                  Text = '01'
                  OnClick = ComboBox1Click
                  Items.Strings = (
                    '01'
                    '02'
                    '03'
                    '04'
                    '05'
                    '06'
                    '07'
                    '08')
                end
                object GroupBox25: TGroupBox
                  Left = 704
                  Top = 50
                  Width = 321
                  Height = 107
                  Caption = #44288#51228#49468#53552' Dial Time'
                  TabOrder = 12
                  object Label137: TLabel
                    Left = 21
                    Top = 24
                    Width = 112
                    Height = 12
                    Caption = 'DTMF Dial On Time'
                  end
                  object Label138: TLabel
                    Left = 21
                    Top = 48
                    Width = 111
                    Height = 12
                    Caption = 'DTMF Dial Off Time'
                  end
                  object Label139: TLabel
                    Left = 192
                    Top = 24
                    Width = 33
                    Height = 12
                    Caption = 'mSec'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -12
                    Font.Name = #44404#47548
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label140: TLabel
                    Left = 192
                    Top = 48
                    Width = 33
                    Height = 12
                    Caption = 'mSec'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -12
                    Font.Name = #44404#47548
                    Font.Style = []
                    ParentFont = False
                  end
                  object Bevel10: TBevel
                    Left = 8
                    Top = 64
                    Width = 219
                    Height = 2
                  end
                  object cmb_ControlOnTime: TComboBox
                    Left = 141
                    Top = 16
                    Width = 49
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 0
                    TabOrder = 0
                    Text = '500'
                    OnClick = ComboBox1Click
                    Items.Strings = (
                      '60'
                      '100'
                      '200'
                      '300'
                      '400'
                      '500'
                      '1000')
                  end
                  object cmb_ControlOffTime: TComboBox
                    Left = 141
                    Top = 40
                    Width = 50
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 0
                    ItemIndex = 5
                    TabOrder = 1
                    Text = '500'
                    OnClick = ComboBox1Click
                    Items.Strings = (
                      '60'
                      '100'
                      '200'
                      '300'
                      '400'
                      '500'
                      '1000')
                  end
                  object btn_ControlReg: TRzBitBtn
                    Left = 70
                    Top = 74
                    Caption = #46321#47197
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = btn_ControlRegClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btn_ControlSearch: TRzBitBtn
                    Left = 150
                    Top = 74
                    Caption = #51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 3
                    OnClick = btn_ControlSearchClick
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #45936#51060#53552#51204#49569
                object Button3: TButton
                  Left = 56
                  Top = 24
                  Width = 75
                  Height = 25
                  Caption = 'Button3'
                  TabOrder = 0
                end
                object RzGroupBox5: TRzGroupBox
                  Left = 16
                  Top = 8
                  Width = 688
                  Height = 489
                  Caption = ' '#51076#51032' '#45936#51060#53552' '#51204#49569' '
                  TabOrder = 1
                  object Label26: TLabel
                    Left = 8
                    Top = 44
                    Width = 10
                    Height = 12
                    Caption = '1.'
                  end
                  object Label27: TLabel
                    Left = 8
                    Top = 67
                    Width = 10
                    Height = 12
                    Caption = '2.'
                  end
                  object Label60: TLabel
                    Left = 8
                    Top = 91
                    Width = 10
                    Height = 12
                    Caption = '3.'
                  end
                  object Label61: TLabel
                    Left = 8
                    Top = 115
                    Width = 10
                    Height = 12
                    Caption = '4.'
                  end
                  object Label67: TLabel
                    Left = 8
                    Top = 141
                    Width = 10
                    Height = 12
                    Caption = '5.'
                  end
                  object Label68: TLabel
                    Left = 8
                    Top = 164
                    Width = 10
                    Height = 12
                    Caption = '6.'
                  end
                  object Label69: TLabel
                    Left = 8
                    Top = 188
                    Width = 10
                    Height = 12
                    Caption = '7.'
                  end
                  object Label70: TLabel
                    Left = 8
                    Top = 212
                    Width = 10
                    Height = 12
                    Caption = '8.'
                  end
                  object Label71: TLabel
                    Left = 8
                    Top = 237
                    Width = 10
                    Height = 12
                    Caption = '9.'
                  end
                  object Label72: TLabel
                    Left = 8
                    Top = 261
                    Width = 10
                    Height = 12
                    Caption = '0.'
                  end
                  object Label81: TLabel
                    Left = 7
                    Top = 290
                    Width = 12
                    Height = 12
                    Caption = 'A.'
                  end
                  object Label82: TLabel
                    Left = 7
                    Top = 313
                    Width = 12
                    Height = 12
                    Caption = 'B.'
                  end
                  object Label83: TLabel
                    Left = 7
                    Top = 337
                    Width = 13
                    Height = 12
                    Caption = 'C.'
                  end
                  object Label84: TLabel
                    Left = 7
                    Top = 361
                    Width = 12
                    Height = 12
                    Caption = 'D.'
                  end
                  object Label85: TLabel
                    Left = 7
                    Top = 386
                    Width = 12
                    Height = 12
                    Caption = 'E.'
                  end
                  object Label86: TLabel
                    Left = 7
                    Top = 410
                    Width = 11
                    Height = 12
                    Caption = 'F.'
                  end
                  object Edit_Send1: TRzEdit
                    Left = 63
                    Top = 39
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 0
                  end
                  object Edit_Send2: TRzEdit
                    Left = 63
                    Top = 63
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object Edit_Send3: TRzEdit
                    Left = 63
                    Top = 87
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 2
                  end
                  object Edit_Send4: TRzEdit
                    Left = 63
                    Top = 111
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 3
                  end
                  object Btn_Send1: TRzBitBtn
                    Left = 505
                    Top = 39
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 4
                    OnClick = Btn_Send1Click
                  end
                  object Btn_Send2: TRzBitBtn
                    Left = 505
                    Top = 63
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 5
                    OnClick = Btn_Send1Click
                  end
                  object Btn_Send3: TRzBitBtn
                    Left = 505
                    Top = 87
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 6
                    OnClick = Btn_Send1Click
                  end
                  object Btn_Send4: TRzBitBtn
                    Left = 505
                    Top = 111
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 7
                    OnClick = Btn_Send1Click
                  end
                  object Btn_Clear1: TRzBitBtn
                    Left = 581
                    Top = 39
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 8
                    OnClick = Btn_Clear1Click
                  end
                  object Btn_Clear2: TRzBitBtn
                    Left = 581
                    Top = 63
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 9
                    OnClick = Btn_Clear1Click
                  end
                  object Btn_Clear3: TRzBitBtn
                    Left = 581
                    Top = 87
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 10
                    OnClick = Btn_Clear1Click
                  end
                  object Btn_Clear4: TRzBitBtn
                    Left = 581
                    Top = 111
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 11
                    OnClick = Btn_Clear1Click
                  end
                  object cb_SendFullData: TCheckBox
                    Left = 32
                    Top = 16
                    Width = 161
                    Height = 17
                    Caption = #51204#52404' '#45936#51060#53552' '#51204#49569
                    TabOrder = 12
                  end
                  object Edit_Func1: TRzEdit
                    Left = 31
                    Top = 39
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 13
                  end
                  object Edit_Func2: TRzEdit
                    Left = 31
                    Top = 63
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 14
                  end
                  object Edit_Func3: TRzEdit
                    Left = 31
                    Top = 87
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 15
                  end
                  object Edit_Func4: TRzEdit
                    Left = 31
                    Top = 111
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 16
                  end
                  object Edit_Send5: TRzEdit
                    Left = 63
                    Top = 136
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 17
                  end
                  object Edit_Send6: TRzEdit
                    Left = 63
                    Top = 160
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 18
                  end
                  object Edit_Send7: TRzEdit
                    Left = 63
                    Top = 184
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 19
                  end
                  object Edit_Send8: TRzEdit
                    Left = 63
                    Top = 208
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 20
                  end
                  object Btn_Send5: TRzBitBtn
                    Left = 505
                    Top = 136
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 21
                    OnClick = Btn_Send1Click
                  end
                  object Btn_Send6: TRzBitBtn
                    Left = 505
                    Top = 160
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 22
                    OnClick = Btn_Send1Click
                  end
                  object Btn_Send7: TRzBitBtn
                    Left = 505
                    Top = 184
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 23
                    OnClick = Btn_Send1Click
                  end
                  object Btn_Send8: TRzBitBtn
                    Left = 505
                    Top = 208
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 24
                    OnClick = Btn_Send1Click
                  end
                  object Btn_Clear5: TRzBitBtn
                    Left = 581
                    Top = 136
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 25
                    OnClick = Btn_Clear1Click
                  end
                  object Btn_Clear6: TRzBitBtn
                    Left = 581
                    Top = 160
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 26
                    OnClick = Btn_Clear1Click
                  end
                  object Btn_Clear7: TRzBitBtn
                    Left = 581
                    Top = 184
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 27
                    OnClick = Btn_Clear1Click
                  end
                  object Btn_Clear8: TRzBitBtn
                    Left = 581
                    Top = 208
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 28
                    OnClick = Btn_Clear1Click
                  end
                  object Edit_Func5: TRzEdit
                    Left = 31
                    Top = 136
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 29
                  end
                  object Edit_Func6: TRzEdit
                    Left = 31
                    Top = 160
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 30
                  end
                  object Edit_Func7: TRzEdit
                    Left = 31
                    Top = 184
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 31
                  end
                  object Edit_Func8: TRzEdit
                    Left = 31
                    Top = 208
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 32
                  end
                  object Edit_Send9: TRzEdit
                    Left = 63
                    Top = 233
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 33
                  end
                  object Edit_Send0: TRzEdit
                    Left = 63
                    Top = 257
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 34
                  end
                  object Btn_Send9: TRzBitBtn
                    Left = 505
                    Top = 233
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 35
                    OnClick = Btn_Send1Click
                  end
                  object Btn_Send0: TRzBitBtn
                    Left = 505
                    Top = 257
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 36
                    OnClick = Btn_Send1Click
                  end
                  object Btn_Clear9: TRzBitBtn
                    Left = 581
                    Top = 233
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 37
                    OnClick = Btn_Clear1Click
                  end
                  object Btn_Clear0: TRzBitBtn
                    Left = 581
                    Top = 257
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 38
                    OnClick = Btn_Clear1Click
                  end
                  object Edit_Func9: TRzEdit
                    Left = 31
                    Top = 233
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 39
                  end
                  object Edit_Func0: TRzEdit
                    Left = 31
                    Top = 257
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 40
                  end
                  object Edit_SendA: TRzEdit
                    Left = 62
                    Top = 285
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 41
                  end
                  object Edit_SendB: TRzEdit
                    Left = 62
                    Top = 309
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 42
                  end
                  object Edit_SendC: TRzEdit
                    Left = 62
                    Top = 333
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 43
                  end
                  object Edit_SendD: TRzEdit
                    Left = 62
                    Top = 357
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 44
                  end
                  object Btn_SendA: TRzBitBtn
                    Left = 504
                    Top = 285
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 45
                    OnClick = Btn_Send1Click
                  end
                  object Btn_SendB: TRzBitBtn
                    Left = 504
                    Top = 309
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 46
                    OnClick = Btn_Send1Click
                  end
                  object Btn_SendC: TRzBitBtn
                    Left = 504
                    Top = 333
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 47
                    OnClick = Btn_Send1Click
                  end
                  object Btn_SendD: TRzBitBtn
                    Left = 504
                    Top = 357
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 48
                    OnClick = Btn_Send1Click
                  end
                  object Btn_ClearA: TRzBitBtn
                    Left = 580
                    Top = 285
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 49
                    OnClick = Btn_Clear1Click
                  end
                  object Btn_ClearB: TRzBitBtn
                    Left = 580
                    Top = 309
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 50
                    OnClick = Btn_Clear1Click
                  end
                  object Btn_ClearC: TRzBitBtn
                    Left = 580
                    Top = 333
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 51
                    OnClick = Btn_Clear1Click
                  end
                  object Btn_ClearD: TRzBitBtn
                    Left = 580
                    Top = 357
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 52
                    OnClick = Btn_Clear1Click
                  end
                  object Edit_FuncA: TRzEdit
                    Left = 30
                    Top = 285
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 53
                  end
                  object Edit_FuncB: TRzEdit
                    Left = 30
                    Top = 309
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 54
                  end
                  object Edit_FuncC: TRzEdit
                    Left = 30
                    Top = 333
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 55
                  end
                  object Edit_FuncD: TRzEdit
                    Left = 30
                    Top = 357
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 56
                  end
                  object Edit_SendE: TRzEdit
                    Left = 62
                    Top = 382
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 57
                  end
                  object Edit_SendF: TRzEdit
                    Left = 62
                    Top = 406
                    Width = 435
                    Height = 21
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 58
                  end
                  object Btn_SendE: TRzBitBtn
                    Left = 504
                    Top = 382
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 59
                    OnClick = Btn_Send1Click
                  end
                  object Btn_SendF: TRzBitBtn
                    Left = 504
                    Top = 406
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 60
                    OnClick = Btn_Send1Click
                  end
                  object Btn_ClearE: TRzBitBtn
                    Left = 580
                    Top = 382
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 61
                    OnClick = Btn_Clear1Click
                  end
                  object Btn_ClearF: TRzBitBtn
                    Left = 580
                    Top = 406
                    Caption = 'CLEAR'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 62
                    OnClick = Btn_Clear1Click
                  end
                  object Edit_FuncE: TRzEdit
                    Left = 30
                    Top = 382
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 63
                  end
                  object Edit_FuncF: TRzEdit
                    Left = 30
                    Top = 406
                    Width = 26
                    Height = 20
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 64
                  end
                  object RzBitBtn39: TRzBitBtn
                    Left = 505
                    Top = 11
                    Caption = 'Open'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 65
                    OnClick = RzBitBtn39Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430B0000430B00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8A378787878
                      787878787878AAE8E8E8E88181818181818181818181ACE8E8E8A3A3D5CECECE
                      CECECECECEA378E8E8E88181E3ACACACACACACACAC8181E8E8E8A3A3CED5D5D5
                      D5D5D5D5D5CE78A3E8E88181ACE3E3E3E3E3E3E3E3AC8181E8E8A3A3CED5D5D5
                      D5D5D5D5D5CEAA78E8E88181ACE3E3E3E3E3E3E3E3ACAC81E8E8A3CEA3D5D5D5
                      D5D5D5D5D5CED578A3E881AC81E3E3E3E3E3E3E3E3ACE38181E8A3CEAAAAD5D5
                      D5D5D5D5D5CED5AA78E881ACACACE3E3E3E3E3E3E3ACE3AC81E8A3D5CEA3D6D6
                      D6D6D6D6D6D5D6D678E881E3AC81E3E3E3E3E3E3E3E3E3E381E8A3D5D5CEA3A3
                      A3A3A3A3A3A3A3A3CEE881E3E3AC81818181818181818181ACE8A3D6D5D5D5D5
                      D6D6D6D6D678E8E8E8E881E3E3E3E3E3E3E3E3E3E381E8E8E8E8E8A3D6D6D6D6
                      A3A3A3A3A3E8E8E8E8E8E881E3E3E3E38181818181E8E8E8E8E8E8E8A3A3A3A3
                      E8E8E8E8E8E8E8090909E8E881818181E8E8E8E8E8E8E8818181E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E80909E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8
                      E8E8E809E8E8E809E809E8E8E8E8E8E8E8E8E881E8E8E881E881E8E8E8E8E8E8
                      E8E8E8E8090909E8E8E8E8E8E8E8E8E8E8E8E8E8818181E8E8E8}
                    NumGlyphs = 2
                  end
                  object RzBitBtn41: TRzBitBtn
                    Left = 583
                    Top = 10
                    Caption = 'Save'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 66
                    OnClick = RzBitBtn41Click
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
                      090909090909090909E8E8E881818181818181818181818181E8E809101009E3
                      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
                      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
                      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
                      E3E3E3E3E309101009E8E881ACAC81E3E3E3E3E3E381ACAC81E8E80910101009
                      090909090910101009E8E881ACACAC818181818181ACACAC81E8E80910101010
                      101010101010101009E8E881ACACACACACACACACACACACAC81E8E80910100909
                      090909090909101009E8E881ACAC8181818181818181ACAC81E8E8091009D7D7
                      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E8091009D709
                      0909090909D7091009E8E881AC81D7818181818181D781AC81E8E8091009D7D7
                      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E809E309D709
                      0909090909D7090909E8E881E381D7818181818181D7818181E8E8091009D7D7
                      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E80909090909
                      090909090909090909E8E88181818181818181818181818181E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #49548#47532' '#46321#47197
                object GroupBox19: TGroupBox
                  Left = 8
                  Top = 8
                  Width = 721
                  Height = 465
                  TabOrder = 0
                  object Label109: TLabel
                    Left = 16
                    Top = 28
                    Width = 10
                    Height = 12
                    Caption = '1.'
                  end
                  object Label110: TLabel
                    Left = 16
                    Top = 51
                    Width = 10
                    Height = 12
                    Caption = '2.'
                  end
                  object Label111: TLabel
                    Left = 16
                    Top = 75
                    Width = 10
                    Height = 12
                    Caption = '3.'
                  end
                  object Label112: TLabel
                    Left = 16
                    Top = 99
                    Width = 10
                    Height = 12
                    Caption = '4.'
                  end
                  object Label113: TLabel
                    Left = 16
                    Top = 123
                    Width = 10
                    Height = 12
                    Caption = '5.'
                  end
                  object Label114: TLabel
                    Left = 16
                    Top = 147
                    Width = 10
                    Height = 12
                    Caption = '6.'
                  end
                  object Label115: TLabel
                    Left = 16
                    Top = 171
                    Width = 10
                    Height = 12
                    Caption = '7.'
                  end
                  object Label116: TLabel
                    Left = 16
                    Top = 195
                    Width = 10
                    Height = 12
                    Caption = '8.'
                  end
                  object Label117: TLabel
                    Left = 16
                    Top = 219
                    Width = 10
                    Height = 12
                    Caption = '9.'
                  end
                  object Label118: TLabel
                    Left = 10
                    Top = 243
                    Width = 16
                    Height = 12
                    Caption = '10.'
                  end
                  object Label119: TLabel
                    Left = 10
                    Top = 267
                    Width = 16
                    Height = 12
                    Caption = '11.'
                  end
                  object Label120: TLabel
                    Left = 10
                    Top = 291
                    Width = 16
                    Height = 12
                    Caption = '12.'
                  end
                  object Label121: TLabel
                    Left = 10
                    Top = 315
                    Width = 16
                    Height = 12
                    Caption = '13.'
                  end
                  object Label122: TLabel
                    Left = 10
                    Top = 339
                    Width = 16
                    Height = 12
                    Caption = '14.'
                  end
                  object Label123: TLabel
                    Left = 10
                    Top = 363
                    Width = 16
                    Height = 12
                    Caption = '15.'
                  end
                  object Label126: TLabel
                    Left = 11
                    Top = 433
                    Width = 16
                    Height = 12
                    Caption = '16.'
                  end
                  object edComp1: TRzEdit
                    Left = 47
                    Top = 22
                    Width = 435
                    Height = 21
                    Hint = '1'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 0
                  end
                  object edComp2: TRzEdit
                    Left = 47
                    Top = 46
                    Width = 435
                    Height = 21
                    Hint = '2'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object edComp3: TRzEdit
                    Left = 47
                    Top = 70
                    Width = 435
                    Height = 21
                    Hint = '3'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 2
                  end
                  object edComp4: TRzEdit
                    Left = 47
                    Top = 94
                    Width = 435
                    Height = 21
                    Hint = '4'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 3
                  end
                  object edComp5: TRzEdit
                    Left = 47
                    Top = 118
                    Width = 435
                    Height = 21
                    Hint = '5'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 4
                  end
                  object edComp6: TRzEdit
                    Left = 47
                    Top = 142
                    Width = 435
                    Height = 21
                    Hint = '6'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 5
                  end
                  object edComp7: TRzEdit
                    Left = 47
                    Top = 166
                    Width = 435
                    Height = 21
                    Hint = '7'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 6
                  end
                  object edComp8: TRzEdit
                    Left = 47
                    Top = 190
                    Width = 435
                    Height = 21
                    Hint = '8'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 7
                  end
                  object edComp9: TRzEdit
                    Left = 47
                    Top = 214
                    Width = 435
                    Height = 21
                    Hint = '9'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 8
                  end
                  object check1: TCheckBox
                    Left = 30
                    Top = 24
                    Width = 17
                    Height = 17
                    Hint = '1'
                    Caption = 'check1'
                    TabOrder = 9
                  end
                  object check2: TCheckBox
                    Left = 30
                    Top = 48
                    Width = 17
                    Height = 17
                    Hint = '2'
                    Caption = 'check2'
                    TabOrder = 10
                  end
                  object check3: TCheckBox
                    Left = 30
                    Top = 72
                    Width = 17
                    Height = 17
                    Hint = '3'
                    Caption = 'check3'
                    TabOrder = 11
                  end
                  object check4: TCheckBox
                    Left = 30
                    Top = 96
                    Width = 17
                    Height = 17
                    Hint = '4'
                    Caption = 'check4'
                    TabOrder = 12
                  end
                  object check5: TCheckBox
                    Left = 30
                    Top = 120
                    Width = 17
                    Height = 17
                    Hint = '5'
                    Caption = 'check5'
                    TabOrder = 13
                  end
                  object check6: TCheckBox
                    Left = 30
                    Top = 144
                    Width = 17
                    Height = 17
                    Hint = '6'
                    Caption = 'check6'
                    TabOrder = 14
                  end
                  object check7: TCheckBox
                    Left = 30
                    Top = 168
                    Width = 17
                    Height = 17
                    Hint = '7'
                    Caption = 'check7'
                    TabOrder = 15
                  end
                  object check8: TCheckBox
                    Left = 30
                    Top = 192
                    Width = 17
                    Height = 17
                    Hint = '8'
                    Caption = 'check8'
                    TabOrder = 16
                  end
                  object check9: TCheckBox
                    Left = 30
                    Top = 216
                    Width = 17
                    Height = 17
                    Hint = '9'
                    Caption = 'check9'
                    TabOrder = 17
                  end
                  object check10: TCheckBox
                    Left = 30
                    Top = 240
                    Width = 17
                    Height = 17
                    Hint = '10'
                    Caption = 'CheckBox3'
                    TabOrder = 18
                  end
                  object edComp10: TRzEdit
                    Left = 47
                    Top = 238
                    Width = 435
                    Height = 21
                    Hint = '10'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 19
                  end
                  object check11: TCheckBox
                    Left = 30
                    Top = 264
                    Width = 17
                    Height = 17
                    Hint = '11'
                    Caption = 'CheckBox4'
                    TabOrder = 20
                  end
                  object edComp11: TRzEdit
                    Left = 47
                    Top = 262
                    Width = 435
                    Height = 21
                    Hint = '11'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 21
                  end
                  object check12: TCheckBox
                    Left = 30
                    Top = 288
                    Width = 17
                    Height = 17
                    Hint = '12'
                    Caption = 'CheckBox5'
                    TabOrder = 22
                  end
                  object edComp12: TRzEdit
                    Left = 47
                    Top = 286
                    Width = 435
                    Height = 21
                    Hint = '12'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 23
                  end
                  object check13: TCheckBox
                    Left = 30
                    Top = 312
                    Width = 17
                    Height = 17
                    Hint = '13'
                    Caption = 'CheckBox6'
                    TabOrder = 24
                  end
                  object edComp13: TRzEdit
                    Left = 47
                    Top = 310
                    Width = 435
                    Height = 21
                    Hint = '13'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 25
                  end
                  object check14: TCheckBox
                    Left = 30
                    Top = 336
                    Width = 17
                    Height = 17
                    Hint = '14'
                    Caption = 'CheckBox7'
                    TabOrder = 26
                  end
                  object edComp14: TRzEdit
                    Left = 47
                    Top = 334
                    Width = 435
                    Height = 21
                    Hint = '14'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 27
                  end
                  object check15: TCheckBox
                    Left = 30
                    Top = 360
                    Width = 17
                    Height = 17
                    Hint = '15'
                    Caption = 'CheckBox8'
                    TabOrder = 28
                  end
                  object edComp15: TRzEdit
                    Left = 47
                    Top = 358
                    Width = 435
                    Height = 21
                    Hint = '15'
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #46027#50880#52404
                    Font.Style = []
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 29
                  end
                  object check16: TCheckBox
                    Left = 30
                    Top = 428
                    Width = 17
                    Height = 17
                    Hint = '16'
                    Caption = 'CheckBox11'
                    TabOrder = 30
                  end
                  object edComp16: TRzEdit
                    Left = 47
                    Top = 429
                    Width = 435
                    Height = 20
                    Hint = '16'
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 31
                  end
                  object btWav1: TRzBitBtn
                    Left = 489
                    Top = 19
                    Hint = '1'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 32
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav2: TRzBitBtn
                    Left = 489
                    Top = 43
                    Hint = '2'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 33
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav4: TRzBitBtn
                    Left = 489
                    Top = 91
                    Hint = '4'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 34
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav3: TRzBitBtn
                    Left = 489
                    Top = 67
                    Hint = '3'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 35
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav5: TRzBitBtn
                    Left = 489
                    Top = 115
                    Hint = '5'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 36
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav6: TRzBitBtn
                    Left = 489
                    Top = 139
                    Hint = '6'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 37
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav7: TRzBitBtn
                    Left = 489
                    Top = 163
                    Hint = '7'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 38
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav8: TRzBitBtn
                    Left = 489
                    Top = 187
                    Hint = '8'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 39
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav9: TRzBitBtn
                    Left = 489
                    Top = 211
                    Hint = '9'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 40
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav10: TRzBitBtn
                    Left = 489
                    Top = 235
                    Hint = '10'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 41
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav11: TRzBitBtn
                    Left = 489
                    Top = 259
                    Hint = '11'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 42
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav12: TRzBitBtn
                    Left = 489
                    Top = 283
                    Hint = '12'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 43
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav13: TRzBitBtn
                    Left = 489
                    Top = 307
                    Hint = '13'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 44
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav14: TRzBitBtn
                    Left = 489
                    Top = 331
                    Hint = '14'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 45
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btWav15: TRzBitBtn
                    Left = 489
                    Top = 355
                    Hint = '15'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 46
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btPlay1: TRzBitBtn
                    Left = 569
                    Top = 19
                    Width = 80
                    Hint = '1'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 47
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay2: TRzBitBtn
                    Left = 569
                    Top = 43
                    Width = 80
                    Hint = '2'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 48
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay3: TRzBitBtn
                    Left = 569
                    Top = 67
                    Width = 80
                    Hint = '3'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 49
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay4: TRzBitBtn
                    Left = 569
                    Top = 91
                    Width = 80
                    Hint = '4'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 50
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay5: TRzBitBtn
                    Left = 569
                    Top = 115
                    Width = 80
                    Hint = '5'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 51
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay6: TRzBitBtn
                    Left = 569
                    Top = 139
                    Width = 80
                    Hint = '6'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 52
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay7: TRzBitBtn
                    Left = 569
                    Top = 163
                    Width = 80
                    Hint = '7'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 53
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay8: TRzBitBtn
                    Left = 569
                    Top = 187
                    Width = 80
                    Hint = '8'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 54
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay9: TRzBitBtn
                    Left = 569
                    Top = 211
                    Width = 80
                    Hint = '9'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 55
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay10: TRzBitBtn
                    Left = 569
                    Top = 235
                    Width = 80
                    Hint = '10'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 56
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay11: TRzBitBtn
                    Left = 569
                    Top = 259
                    Width = 80
                    Hint = '11'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 57
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay12: TRzBitBtn
                    Left = 569
                    Top = 283
                    Width = 80
                    Hint = '12'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 58
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay13: TRzBitBtn
                    Left = 569
                    Top = 307
                    Width = 80
                    Hint = '13'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 59
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay14: TRzBitBtn
                    Left = 569
                    Top = 331
                    Width = 80
                    Hint = '14'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 60
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btPlay15: TRzBitBtn
                    Left = 569
                    Top = 355
                    Width = 80
                    Hint = '15'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 61
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object edFile1: TEdit
                    Left = 648
                    Top = 24
                    Width = 41
                    Height = 20
                    Hint = '1'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 62
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile2: TEdit
                    Left = 648
                    Top = 48
                    Width = 41
                    Height = 20
                    Hint = '2'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 63
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile3: TEdit
                    Left = 648
                    Top = 72
                    Width = 41
                    Height = 20
                    Hint = '3'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 64
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile4: TEdit
                    Left = 648
                    Top = 96
                    Width = 41
                    Height = 20
                    Hint = '4'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 65
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile5: TEdit
                    Left = 648
                    Top = 120
                    Width = 41
                    Height = 20
                    Hint = '5'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 66
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile6: TEdit
                    Left = 648
                    Top = 144
                    Width = 41
                    Height = 20
                    Hint = '6'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 67
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile7: TEdit
                    Left = 648
                    Top = 168
                    Width = 41
                    Height = 20
                    Hint = '7'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 68
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile8: TEdit
                    Left = 648
                    Top = 192
                    Width = 41
                    Height = 20
                    Hint = '8'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 69
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile9: TEdit
                    Left = 648
                    Top = 216
                    Width = 41
                    Height = 20
                    Hint = '9'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 70
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile10: TEdit
                    Left = 648
                    Top = 240
                    Width = 41
                    Height = 20
                    Hint = '10'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 71
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile11: TEdit
                    Left = 648
                    Top = 264
                    Width = 41
                    Height = 20
                    Hint = '11'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 72
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile12: TEdit
                    Left = 648
                    Top = 288
                    Width = 41
                    Height = 20
                    Hint = '12'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 73
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile13: TEdit
                    Left = 648
                    Top = 312
                    Width = 41
                    Height = 20
                    Hint = '13'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 74
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile14: TEdit
                    Left = 648
                    Top = 336
                    Width = 41
                    Height = 20
                    Hint = '14'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 75
                    Visible = False
                    OnChange = edFileChange
                  end
                  object edFile15: TEdit
                    Left = 648
                    Top = 360
                    Width = 41
                    Height = 20
                    Hint = '15'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 76
                    Visible = False
                    OnChange = edFileChange
                  end
                  object btAllClear: TBitBtn
                    Left = 184
                    Top = 392
                    Width = 121
                    Height = 25
                    Caption = #51204#52404' '#51648#50864#44592
                    TabOrder = 77
                    OnClick = btAllClearClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
                      3333333777777777F3333330F77777703333333733F3F3F73F33330FF0808077
                      0333337F37F7F7F37F33330FF0807077033333733737F73F73F330FF77808707
                      703337F37F37F37F37F330FF08807807703037F37F37F37F37F700FF08808707
                      700377F37337F37F377330FF778078077033373F73F7F3733733330FF0808077
                      0333337F37F7F7F37F33330FF08070770333337FF7F7F7FF7F33330000000000
                      03333377777777777F33330F888777770333337FFFFFFFFF7F33330000000000
                      033333777777777773333333307770333333333337FFF7F33333333330000033
                      3333333337777733333333333333333333333333333333333333}
                    NumGlyphs = 2
                  end
                  object btSelectClear: TBitBtn
                    Left = 344
                    Top = 392
                    Width = 121
                    Height = 25
                    Caption = #49440#53469' '#51648#50864#44592
                    TabOrder = 78
                    OnClick = btSelectClearClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
                      3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
                      33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
                      33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
                      333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
                      03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
                      33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
                      0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
                      3333333337FFF7F3333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object MediaPlayer1: TMediaPlayer
                    Left = 48
                    Top = 128
                    Width = 253
                    Height = 41
                    Visible = False
                    TabOrder = 79
                  end
                  object btExe1: TRzBitBtn
                    Left = 649
                    Top = 19
                    Width = 56
                    Hint = '1'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 80
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object edExe1: TEdit
                    Left = 680
                    Top = 24
                    Width = 49
                    Height = 20
                    Hint = '1'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = #44404#47548
                    Font.Style = []
                    ImeName = 'Microsoft IME 2003'
                    ParentFont = False
                    TabOrder = 81
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object btExe2: TRzBitBtn
                    Left = 649
                    Top = 43
                    Width = 56
                    Hint = '2'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 82
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object btExe3: TRzBitBtn
                    Left = 649
                    Top = 67
                    Width = 56
                    Hint = '3'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 83
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object btExe4: TRzBitBtn
                    Left = 649
                    Top = 91
                    Width = 56
                    Hint = '4'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 84
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object btExe5: TRzBitBtn
                    Left = 649
                    Top = 115
                    Width = 56
                    Hint = '5'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 85
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object btExe6: TRzBitBtn
                    Left = 649
                    Top = 139
                    Width = 56
                    Hint = '6'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 86
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object btExe7: TRzBitBtn
                    Left = 649
                    Top = 163
                    Width = 56
                    Hint = '7'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 87
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object btExe8: TRzBitBtn
                    Left = 649
                    Top = 187
                    Width = 56
                    Hint = '8'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 88
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object btExe9: TRzBitBtn
                    Left = 649
                    Top = 211
                    Width = 56
                    Hint = '9'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 89
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object btExe10: TRzBitBtn
                    Left = 649
                    Top = 235
                    Width = 56
                    Hint = '10'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 90
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object btExe11: TRzBitBtn
                    Left = 649
                    Top = 259
                    Width = 56
                    Hint = '11'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 91
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object btExe12: TRzBitBtn
                    Left = 649
                    Top = 283
                    Width = 56
                    Hint = '12'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 92
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object btExe13: TRzBitBtn
                    Left = 649
                    Top = 307
                    Width = 56
                    Hint = '13'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 93
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object btExe14: TRzBitBtn
                    Left = 649
                    Top = 331
                    Width = 56
                    Hint = '14'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 94
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object btExe15: TRzBitBtn
                    Left = 649
                    Top = 355
                    Width = 56
                    Hint = '15'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 95
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object edExe2: TEdit
                    Left = 680
                    Top = 48
                    Width = 49
                    Height = 20
                    Hint = '2'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 96
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edExe3: TEdit
                    Left = 680
                    Top = 72
                    Width = 49
                    Height = 20
                    Hint = '3'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 97
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edExe4: TEdit
                    Left = 680
                    Top = 96
                    Width = 49
                    Height = 20
                    Hint = '4'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 98
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edExe5: TEdit
                    Left = 680
                    Top = 120
                    Width = 49
                    Height = 20
                    Hint = '5'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 99
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edExe6: TEdit
                    Left = 680
                    Top = 144
                    Width = 49
                    Height = 20
                    Hint = '6'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 100
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edExe7: TEdit
                    Left = 680
                    Top = 168
                    Width = 49
                    Height = 20
                    Hint = '7'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 101
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edExe8: TEdit
                    Left = 680
                    Top = 192
                    Width = 49
                    Height = 20
                    Hint = '8'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 102
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edExe9: TEdit
                    Left = 680
                    Top = 216
                    Width = 49
                    Height = 20
                    Hint = '9'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 103
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edExe10: TEdit
                    Left = 680
                    Top = 240
                    Width = 49
                    Height = 20
                    Hint = '10'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 104
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edExe11: TEdit
                    Left = 680
                    Top = 264
                    Width = 49
                    Height = 20
                    Hint = '11'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 105
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edExe12: TEdit
                    Left = 680
                    Top = 288
                    Width = 49
                    Height = 20
                    Hint = '12'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 106
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edExe13: TEdit
                    Left = 680
                    Top = 312
                    Width = 49
                    Height = 20
                    Hint = '13'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 107
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edExe14: TEdit
                    Left = 680
                    Top = 336
                    Width = 49
                    Height = 20
                    Hint = '14'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 108
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edExe15: TEdit
                    Left = 680
                    Top = 360
                    Width = 49
                    Height = 20
                    Hint = '15'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 109
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object btWav16: TRzBitBtn
                    Left = 489
                    Top = 430
                    Hint = '16'
                    Caption = #49548#47532
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 110
                    OnClick = btWavClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333FFF3333F333333300033339333333337773F33733333330008033
                      933333333737F7F37333333307078733333933337337373F3337333077088803
                      33933337F37F337F3373333077088803393333F7337FF37F3733300777008803
                      9333377F33773F7F733307088808087333337F7F337F7F7F3FFF070777080873
                      99997F7F337F7F7F77770808880808733333737F337F737F3F33300888008803
                      93333773F377337F73F333308807880339333337F37F337F373F333088077803
                      339333373F73F37333733333087777333339333373F7F7F33F37333330807033
                      933333333737F73373F333333300033339333333337773333733}
                    NumGlyphs = 2
                  end
                  object btPlay16: TRzBitBtn
                    Left = 569
                    Top = 430
                    Width = 80
                    Hint = '16'
                    Caption = #48120#47532#46307#44592
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 111
                    OnClick = btPlayClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
                      33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
                      D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
                      BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
                      EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
                      BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
                      D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
                      3333333773FFFF77333333333000003333333333377777333333}
                    NumGlyphs = 2
                  end
                  object btExe16: TRzBitBtn
                    Left = 649
                    Top = 430
                    Width = 56
                    Hint = '16'
                    Caption = #54028#51068
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 112
                    OnClick = btExe1Click
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
                      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
                      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
                      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
                      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                    NumGlyphs = 2
                  end
                  object edExe16: TEdit
                    Left = 680
                    Top = 434
                    Width = 49
                    Height = 20
                    Hint = '16'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 113
                    Visible = False
                    OnChange = edExe1Change
                  end
                  object edFile16: TEdit
                    Left = 648
                    Top = 432
                    Width = 41
                    Height = 20
                    Hint = '16'
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 114
                    Visible = False
                    OnChange = edFileChange
                  end
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = #48652#47196#46300#52880#49828#54021
                object GroupBox20: TGroupBox
                  Left = 8
                  Top = 8
                  Width = 689
                  Height = 185
                  TabOrder = 0
                  object lblCard: TLabel
                    Left = 337
                    Top = 20
                    Width = 96
                    Height = 12
                    Alignment = taRightJustify
                    Caption = #52852#46300#48264#54840#49373#49457#44079#49688
                  end
                  object lb_start: TLabel
                    Left = 568
                    Top = 144
                    Width = 113
                    Height = 17
                    AutoSize = False
                    Caption = #49884#51089':'
                  end
                  object lb_end: TLabel
                    Left = 568
                    Top = 168
                    Width = 113
                    Height = 12
                    AutoSize = False
                    Caption = #51333#47308':'
                  end
                  object rdSelectCardNo: TRadioGroup
                    Left = 8
                    Top = 8
                    Width = 177
                    Height = 65
                    BiDiMode = bdRightToLeft
                    Caption = #52852#46300#48264#54840' '#49373#49457' '#44508#52825
                    Columns = 2
                    ItemIndex = 0
                    Items.Strings = (
                      #45212#49688
                      #49692#52264
                      #54028#51068
                      #44256#51221)
                    ParentBiDiMode = False
                    TabOrder = 0
                    OnClick = rdSelectCardNoClick
                  end
                  object bt_Broad: TBitBtn
                    Left = 568
                    Top = 12
                    Width = 113
                    Height = 37
                    Caption = #48652#47196#46300#52880#49828#54021
                    TabOrder = 1
                    OnClick = bt_BroadClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000333300
                      0000377777FFFF7777770FFFF099990FFFF07FFFF777777FFFF7000000333300
                      00007777773333777777307703333330770337FF7F333337FF7F300003333330
                      0003377773333337777333993333333399333F7FFFF3333FF7FF000000333300
                      0000777777F3337777770FFFF033330FFFF07FFFF7F3337FFFF7000000333300
                      00007777773333777777307703333330770337FF7F333337FF7F300003333330
                      0003377773FFFFF777733393300000033933337F3777777F37F3339990FFFF09
                      99333373F7FFFF7FF73333399000000993333337777777777333333333077033
                      33333333337FF7F3333333333300003333333333337777333333}
                    NumGlyphs = 2
                  end
                  object edCard: TRzEdit
                    Left = 359
                    Top = 47
                    Width = 138
                    Height = 19
                    Hint = '1'
                    AutoSize = False
                    BiDiMode = bdLeftToRight
                    Ctl3D = True
                    FrameHotStyle = fsFlat
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ParentBiDiMode = False
                    ParentCtl3D = False
                    TabOrder = 2
                    OnChange = edCardChange
                  end
                  object btBroadFile: TBitBtn
                    Left = 336
                    Top = 12
                    Width = 89
                    Height = 25
                    Caption = #54028#51068#52286#44592
                    TabOrder = 3
                    Visible = False
                    OnClick = btBroadFileClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                      07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                      07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                      0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                      33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                      3BB33773333773333773B333333B3333333B7333333733333337}
                    NumGlyphs = 2
                  end
                  object edBRFileLoad: TEdit
                    Left = 416
                    Top = 64
                    Width = 137
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 4
                    Visible = False
                  end
                  object GroupBox21: TGroupBox
                    Left = 8
                    Top = 80
                    Width = 553
                    Height = 97
                    Caption = #52852#46300' '#45936#51060#53552' '
                    TabOrder = 5
                    object Label125: TLabel
                      Left = 27
                      Top = 64
                      Width = 48
                      Height = 12
                      Caption = #46321#47197#53076#46300
                    end
                    object Label127: TLabel
                      Left = 16
                      Top = 20
                      Width = 59
                      Height = 12
                      Caption = 'Msg Code'
                    end
                    object Label128: TLabel
                      Left = 367
                      Top = 19
                      Width = 48
                      Height = 12
                      Caption = #52852#46300#44428#54620
                    end
                    object Label129: TLabel
                      Left = 380
                      Top = 76
                      Width = 36
                      Height = 12
                      Caption = #47560#49828#53552
                    end
                    object Label130: TLabel
                      Left = 344
                      Top = 48
                      Width = 72
                      Height = 12
                      Caption = #52636#51077#49884#44036#47784#46300
                    end
                    object cbRegCode: TComboBox
                      Left = 88
                      Top = 62
                      Width = 169
                      Height = 20
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 0
                      ItemIndex = 0
                      TabOrder = 0
                      Text = '[30]'#52395#48264#51704#46160#48264#51704
                      Items.Strings = (
                        '[30]'#52395#48264#51704#46160#48264#51704
                        '[31]'#52395#48264#51704#52636#51077#47928
                        '[32]'#46160#48264#51704#52636#51077#47928
                        '[33]'#48169#48276#52852#46300#51204#50857)
                    end
                    object rdMsgCode: TRadioGroup
                      Left = 88
                      Top = 10
                      Width = 273
                      Height = 33
                      BiDiMode = bdLeftToRight
                      Columns = 4
                      ItemIndex = 0
                      Items.Strings = (
                        #46321#47197
                        #51312#54924
                        #49325#51228
                        #51204#52404#49325#51228)
                      ParentBiDiMode = False
                      TabOrder = 1
                    end
                    object cbCardAdmin: TComboBox
                      Left = 432
                      Top = 16
                      Width = 113
                      Height = 20
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 0
                      ItemIndex = 0
                      TabOrder = 2
                      Text = '[30]'#52636#51077#51204#50857
                      Items.Strings = (
                        '[30]'#52636#51077#51204#50857
                        '[31]'#48169#48276#51204#50857
                        '[32]'#48169#48276'/'#52636#51077)
                    end
                    object cbMasterMode: TComboBox
                      Left = 432
                      Top = 72
                      Width = 113
                      Height = 20
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 0
                      ItemIndex = 0
                      TabOrder = 3
                      Text = '[30]'#51068#48152
                      Items.Strings = (
                        '[30]'#51068#48152
                        '[31]'#47560#49828#53552)
                    end
                    object cbInOut: TComboBox
                      Left = 432
                      Top = 44
                      Width = 113
                      Height = 20
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 0
                      ItemIndex = 0
                      TabOrder = 4
                      Text = '[30]'#54644#45817#50630#51020
                      Items.Strings = (
                        '[30]'#54644#45817#50630#51020
                        '[31]1'#47784#46300
                        '[32]2'#47784#46300
                        '[33]3'#47784#46300)
                    end
                  end
                  object btBroadStop: TBitBtn
                    Left = 568
                    Top = 52
                    Width = 113
                    Height = 37
                    Caption = #48652#47196#46300' '#51473#51648
                    Enabled = False
                    TabOrder = 6
                    OnClick = btBroadStopClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000333300
                      0000377777FFFF7777770FFFF099990FFFF07FFFF777777FFFF7000000333300
                      00007777773333777777307703333330770337FF7F333337FF7F300003333330
                      0003377773333337777333993333333399333F7FFFF3333FF7FF000000333300
                      0000777777F3337777770FFFF033330FFFF07FFFF7F3337FFFF7000000333300
                      00007777773333777777307703333330770337FF7F333337FF7F300003333330
                      0003377773FFFFF777733393300000033933337F3777777F37F3339990FFFF09
                      99333373F7FFFF7FF73333399000000993333337777777777333333333077033
                      33333333337FF7F3333333333300003333333333337777333333}
                    NumGlyphs = 2
                  end
                  object rdMaster: TRadioGroup
                    Left = 192
                    Top = 8
                    Width = 137
                    Height = 65
                    BiDiMode = bdRightToLeft
                    Caption = #52852#46300#48264#54840' '#49373#49457' '#44508#52825
                    ItemIndex = 1
                    Items.Strings = (
                      'Server '#47784#46300
                      'Main   '#47784#46300)
                    ParentBiDiMode = False
                    TabOrder = 7
                  end
                  object btBroadRetry: TBitBtn
                    Left = 568
                    Top = 96
                    Width = 113
                    Height = 37
                    Caption = '  '#51116' '#51204' '#49569'  '
                    Enabled = False
                    TabOrder = 8
                    OnClick = btBroadRetryClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
                      3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
                      700077337F3333373777887007333337007733F773F333337733700070333333
                      077037773733333F7F37703707333300080737F373333377737F003333333307
                      78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
                      078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
                      70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
                      3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
                      33337F73FF737773333307800077033333337337773373333333}
                    NumGlyphs = 2
                  end
                end
                object Group_BroadDevice: TRzCheckGroup
                  Left = 8
                  Top = 200
                  Width = 689
                  Height = 209
                  Caption = #48652#47196#46300#52880#49828#54021' '#52968#53944#47204#47084' '#51648#51221
                  Columns = 10
                  Items.Strings = (
                    '01 '
                    '02 '
                    '03 '
                    '04 '
                    '05 '
                    '06 '
                    '07 '
                    '08 '
                    '09 '
                    '10 ')
                  TabOrder = 1
                  CheckStates = (
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0)
                  object lbState: TLabel
                    Left = 568
                    Top = 112
                    Width = 113
                    Height = 17
                    Alignment = taCenter
                    AutoSize = False
                    Caption = '0/0'
                  end
                  object Label124: TLabel
                    Left = 568
                    Top = 96
                    Width = 48
                    Height = 12
                    Caption = #51204#49569#54788#54889
                  end
                  object lb_Timestat: TLabel
                    Left = 568
                    Top = 136
                    Width = 113
                    Height = 17
                    AutoSize = False
                    Caption = #51652#54665':'
                  end
                  object RzBitBtn45: TRzBitBtn
                    Left = 568
                    Top = 17
                    Width = 113
                    Caption = #52968#53944#47204#47084' '#51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = RzBitBtn4Click
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      08000000000000020000430C0000430C00000001000000000000000000003300
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
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                    NumGlyphs = 2
                  end
                  object btBroadFileSet: TRzBitBtn
                    Left = 624
                    Top = 41
                    Width = 57
                    Caption = #48320#44221
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btBroadFileSetClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000130B0000130B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                      07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                      07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
                      0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
                      33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
                      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                      3BB33773333773333773B333333B3333333B7333333733333337}
                    NumGlyphs = 2
                  end
                  object chk_BroadFile: TCheckBox
                    Left = 568
                    Top = 48
                    Width = 49
                    Height = 17
                    Caption = #52897#52432
                    TabOrder = 2
                    OnClick = chk_BroadFileClick
                  end
                  object btCaptureSave: TRzBitBtn
                    Left = 568
                    Top = 65
                    Width = 113
                    Caption = #52897#52432#54028#51068' '#51200#51109
                    Color = 15791348
                    Enabled = False
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 3
                    OnClick = btCaptureSaveClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      3333333333333333333333333333333333333333333333333333333333333333
                      33333FFFFFFFFFFFFFFF000000000000000077777777777777770F7777777777
                      77707F3F3333333333370F988888888888707F733FFFFFFFF3370F8800000000
                      88707F337777777733370F888888888888707F333FFFFFFFF3370F8800000000
                      88707F337777777733370F888888888888707F333333333333370F8888888888
                      88707F333333333333370FFFFFFFFFFFFFF07FFFFFFFFFFFFFF7000000000000
                      0000777777777777777733333333333333333333333333333333333333333333
                      3333333333333333333333333333333333333333333333333333}
                    NumGlyphs = 2
                  end
                  object edBroadFileSave: TEdit
                    Left = 552
                    Top = 160
                    Width = 137
                    Height = 20
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 4
                    Visible = False
                  end
                end
                object Group_BroadDeviceBase: TRzCheckGroup
                  Left = 8
                  Top = 416
                  Width = 689
                  Height = 33
                  BiDiMode = bdLeftToRight
                  Columns = 11
                  Items.Strings = (
                    '00  '
                    '10  '
                    '20  '
                    '30  '
                    '40  '
                    '50  '
                    '60  '
                    '70  '
                    '80  '
                    '90  '
                    #51204#52404)
                  ParentBiDiMode = False
                  StartYPos = 10
                  TabOrder = 2
                  OnChange = Group_BroadDeviceBaseChange
                  CheckStates = (
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0
                    0)
                end
              end
            end
            object RzLabel2: TRzLabel
              Left = 0
              Top = 0
              Width = 965
              Height = 23
              Align = alTop
              Alignment = taCenter
              AutoSize = False
              Caption = #47784#45768#53552#47553' '#45936#51060#53440
              Color = clBtnShadow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clHighlightText
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
              BlinkIntervalOff = 1500
              BorderOuter = fsFlatRounded
            end
            object RzPageControl1: TRzPageControl
              Left = 0
              Top = 23
              Width = 965
              Height = 154
              ActivePage = TabSheet1
              Align = alClient
              TabIndex = 0
              TabOrder = 0
              FixedDimension = 18
              object TabSheet1: TRzTabSheet
                Caption = #54532#47196#53664#53084' '#47784#45768#53552#47553
                object RxDBGrid1: TRxDBGrid
                  Left = 0
                  Top = 0
                  Width = 961
                  Height = 132
                  Align = alClient
                  DataSource = DataSource1
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = #46027#50880#52404
                  Font.Style = []
                  ImeName = 'Microsoft IME 2003'
                  ParentFont = False
                  TabOrder = 0
                  TitleFont.Charset = ANSI_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = #44404#47548
                  TitleFont.Style = []
                  OnGetCellParams = RxDBGrid1GetCellParams
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'SeqNo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'way'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'EventTime'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DeviceID'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DeviceNo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Cmd'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Data'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'FullData'
                      Title.Caption = '    R  I      E CmD'
                      Title.Font.Charset = ANSI_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -13
                      Title.Font.Name = #46027#50880#52404
                      Title.Font.Style = []
                      Width = 380
                      Visible = True
                    end>
                end
              end
              object TabSheet2: TRzTabSheet
                Caption = #53080#49556' '#47784#45768#53552#47553
                object RichEdit1: TRichEdit
                  Left = 0
                  Top = 0
                  Width = 961
                  Height = 132
                  Align = alClient
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #46027#50880#52404
                  Font.Style = []
                  HideSelection = False
                  HideScrollBars = False
                  ImeName = 'Microsoft IME 2003'
                  ParentFont = False
                  ScrollBars = ssBoth
                  TabOrder = 0
                  WantTabs = True
                end
              end
            end
            object RzBitBtn27: TRzBitBtn
              Left = 6
              Top = 3
              Width = 92
              Height = 18
              Caption = 'LOG'#51200#51109
              TabOrder = 1
              OnClick = RzBitBtn27Click
              Glyph.Data = {
                36060000424D3606000000000000360400002800000020000000100000000100
                08000000000000020000430C0000430C00000001000000000000000000003300
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
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
              NumGlyphs = 2
            end
            object pn_Gauge: TPanel
              Left = 0
              Top = -1
              Width = 481
              Height = 26
              Align = alCustom
              TabOrder = 2
              Visible = False
              object btn_Play: TSpeedButton
                Left = 8
                Top = 4
                Width = 17
                Height = 17
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                  00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                  70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
                  70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
                  70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
                  70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
                  70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                  00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                NumGlyphs = 2
                OnClick = btn_PlayClick
              end
              object btn_Moment: TSpeedButton
                Left = 24
                Top = 4
                Width = 17
                Height = 17
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                  00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                  70E337F33333333337F3E0F33333333370E337F333FF3FF337F3E0F330030033
                  70E337F3377F77F337F3E0F33003003370E337F3377F77F337F3E0F330030033
                  70E337F3377F77F337F3E0F33003003370E337F3377F77F337F3E0F330030033
                  70E337F33773773337F3E0F33333333370E337F33333333337F3E0F333333333
                  70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                  00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                NumGlyphs = 2
                OnClick = btn_MomentClick
              end
              object btn_Stop: TSpeedButton
                Left = 40
                Top = 4
                Width = 17
                Height = 17
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
                  00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
                  70E337F33333333337F3E0F33333333370E337F333FFFFF337F3E0F330000033
                  70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
                  70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
                  70E337F33777773337F3E0F33333333370E337F33333333337F3E0F333333333
                  70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
                  00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
                NumGlyphs = 2
                OnClick = btn_StopClick
              end
              object Gauge1: TGauge
                Left = 120
                Top = 4
                Width = 353
                Height = 17
                Progress = 0
              end
              object cmb_Multi: TComboBox
                Left = 64
                Top = 2
                Width = 49
                Height = 20
                ImeName = 'Microsoft IME 2003'
                ItemHeight = 12
                ItemIndex = 0
                TabOrder = 0
                Text = '1X'
                Items.Strings = (
                  '1X'
                  '2X'
                  '4X'
                  '8X'
                  '10X'
                  '32X')
              end
            end
          end
        end
      end
      object RzToolbar1: TRzToolbar
        Left = 0
        Top = 0
        Width = 1284
        Height = 29
        Images = ImageList1
        ShowButtonCaptions = True
        TextOptions = ttoCustom
        BorderInner = fsNone
        BorderOuter = fsGroove
        BorderSides = [sdTop]
        BorderWidth = 0
        TabOrder = 1
        ToolbarControls = (
          RzToolButton1
          RzToolButton2
          RzSpacer1
          ed_DeviceNO
          RzToolButton3
          Edit_TopRomVer)
        object RzToolButton1: TRzToolButton
          Left = 4
          Top = 3
          Width = 61
          Height = 23
          ImageIndex = 0
          Images = ImageList1
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = #50672#44208
          OnClick = btn_ConnectClick
        end
        object RzToolButton2: TRzToolButton
          Left = 65
          Top = 3
          Width = 61
          Height = 23
          ImageIndex = 2
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = #54644#51228
          OnClick = Btn_DisConnectClick
        end
        object RzSpacer1: TRzSpacer
          Left = 126
          Top = 2
          Width = 163
        end
        object RzToolButton3: TRzToolButton
          Left = 318
          Top = 2
          Width = 76
          ImageIndex = 6
          Caption = #48260#51260#54869#51064
          OnClick = RzToolButton3Click
        end
        object Edit_TopRomVer: TRzEdit
          Left = 394
          Top = 4
          Width = 481
          Height = 21
          Color = clSilver
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #44404#47548
          Font.Style = [fsBold]
          FrameHotStyle = fsButtonDown
          ImeName = 'Microsoft IME 2003'
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object ed_DeviceNO: TRzEdit
          Left = 289
          Top = 2
          Width = 29
          Height = 25
          Text = '00'
          Alignment = taRightJustify
          Color = clYellow
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = #44404#47548
          Font.Style = [fsBold]
          FrameColor = clSilver
          FrameHotStyle = fsButtonDown
          ImeName = 'Microsoft IME 2003'
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    Left = 752
    Top = 344
    object N1: TMenuItem
      Caption = #46321#47197
      object N2: TMenuItem
        Caption = #48520#47084#50724#44592
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #51200#51109#54616#44592
      end
    end
    object N6: TMenuItem
      Caption = #46020#50880#47568
    end
    object miSound: TMenuItem
      Caption = #49548#47532
      OnClick = miSoundClick
    end
    object M_Close: TMenuItem
      Caption = #51333#47308
      OnClick = M_CloseClick
    end
  end
  object LMDIniCtrl1: TLMDIniCtrl
    IniFile = 'zReg.INI'
    IniPrefix = ppProgram
    Target = itIniFile
    Left = 911
    Top = 124
  end
  object WinsockPort: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.0.201')
    WsLocalAddressIndex = 0
    WsPort = 'telnet'
    WsSocksServerInfo.Port = 0
    AutoOpen = False
    Baud = 38400
    BufferFull = 3072
    BufferResume = 1024
    DeviceLayer = dlWinsock
    TraceAllHex = True
    TraceName = 'APRO.TRC'
    LogAllHex = True
    LogName = 'APRO.LOG'
    PromptForPort = False
    RTS = False
    TapiMode = tmOff
    UseMSRShadow = False
    OnWsAccept = WinsockPortWsAccept
    OnWsConnect = WinsockPortWsConnect
    OnWsDisconnect = WinsockPortWsDisconnect
    OnWsError = WinsockPortWsError
    OnTriggerAvail = WinsockPortTriggerAvail
    Left = 615
    Top = 28
  end
  object ApdSLController1: TApdSLController
    ComPort = WinsockPort
    Lights.TXDLight = TXLight
    Lights.RXDLight = RXLight
    Left = 616
    Top = 240
  end
  object Polling_Timer: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Polling_TimerTimer
    Left = 536
    Top = 24
  end
  object Off_Timer: TTimer
    Enabled = False
    OnTimer = Off_TimerTimer
    Left = 472
    Top = 33
  end
  object ImageList1: TImageList
    Left = 943
    Top = 272
    Bitmap = {
      494C010108000A00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009900
      6600990066009900660099006600990066009900660099006600990066009900
      6600990066000000000000000000000000000000000000000000000000009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000FFFFFF008080800080808000FFFFFF008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000990066009933
      6600993366009933660099336600993366009900660099336600990066009900
      660099006600990066000000000000000000000000000000000099999900B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B20099999900B2B2B200999999009999
      9900999999009999990000000000000000000000000080808000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000666699000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000000000000000
      000000000000000000000000000099999900000000000000000099006600CC66
      9900993366009933660099336600993366009933660099006600993366009900
      660099006600990066000000000000000000000000000000000099999900CCCC
      CC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2B20099999900B2B2B2009999
      99009999990099999900000000000000000080808000FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000C0C0C0000000000000000000000000000000
      00000000000000000000666699003399CC0080808000FFFFFF00FFFFFF008080
      8000FFFFFF008080800080808000C0C0C0008080800080808000808080000000
      0000000000000000000099999900CCCCCC000000000000000000990066009933
      6600CC6699009933660099336600993366009933660099336600990066009933
      660099006600990066000000000000000000000000000000000099999900B2B2
      B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2B20099999900B2B2
      B2009999990099999900000000000000000080808000FFFFFF00000000000000
      0000FFFFFF0080808000C0C0C000FFFFFF008080800000000000FFFFFF008080
      800000000000666699003399CC0066CCFF0080808000FFFFFF00808080008080
      8000FFFFFF0080808000C0C0C000FFFFFF008080800080808000FFFFFF008080
      80000000000099999900CCCCCC00FFFFFF00000000000000000099006600CC66
      990099336600CC66990099336600993366009933660099336600993366009900
      660099336600990066000000000000000000000000000000000099999900CCCC
      CC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2B2009999
      9900B2B2B2009999990000000000000000008080800000000000000000000000
      0000808080000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00666699003399CC0066CCFF00000000008080800080808000808080008080
      8000808080008080800080808000FFFFFF0080808000FFFFFF00FFFFFF00FFFF
      FF0099999900CCCCCC00FFFFFF0000000000000000000000000099006600CC66
      9900CC66990099336600CC669900993366009933660099336600993366009933
      660099006600990066000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2
      B200999999009999990000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000FFFFFF006666
      99003399CC0066CCFF0000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000FFFFFF009999
      9900CCCCCC00FFFFFF000000000000000000000000000000000099006600FF99
      CC00CC669900CC66990099336600CC6699009933660099336600993366009933
      660099336600990066000000000000000000000000000000000099999900E5E5
      E500CCCCCC00CCCCCC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B2009999990000000000000000000000000000000000C0C0C000C0C0
      C0000000000000000000FFFFFF00000000000000000000000000666699003399
      CC0066CCFF000000000000000000000000000000000080808000C0C0C000C0C0
      C0008080800080808000FFFFFF0080808000808080008080800099999900CCCC
      CC00FFFFFF00000000000000000000000000000000000000000099006600FF99
      CC00FF99CC00CC669900CC66990099336600CC66990099336600993366009933
      660099336600990066000000000000000000000000000000000099999900E5E5
      E500E5E5E500CCCCCC00CCCCCC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2
      B200B2B2B2009999990000000000000000000000000080808000C0C0C000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000666699003399CC0066CC
      FF00000000000000000000000000000000000000000080808000C0C0C000FFFF
      FF0080808000FFFFFF00FFFFFF00FFFFFF008080800099999900CCCCCC00FFFF
      FF00000000000000000000000000000000000000000000000000000000009900
      6600990066009900660099006600990066009900660099006600990066009900
      6600990066000000000000000000000000000000000000000000000000009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999000000000000000000000000000000000000000000808080008080
      80000000000000000000FFFFFF00FFFFFF00666699003399CC0066CCFF000000
      0000000000000000000000000000000000000000000000000000808080008080
      80008080800080808000FFFFFF00FFFFFF0099999900CCCCCC00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000666699003399CC0066CCFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800080808000808080008080800099999900CCCCCC00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000666699003399CC0066CCFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800099999900CCCCCC00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000666699003399CC0066CCFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000099
      0000009900000099000000990000009900000099000000990000009900000099
      0000009900000000000000000000000000000000000000000000000000009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999000000000000000000000000000000000000000000000000000000
      9900000099000000990000009900000099000000990000009900000099000000
      9900000099000000000000000000000000000000000000000000000000009999
      9900999999009999990099999900999999009999990099999900999999009999
      99009999990000000000000000000000000000000000000000000099000000CC
      000000CC000000CC000000CC000000CC00000099000000CC0000009900000099
      000000990000009900000000000000000000000000000000000099999900B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B20099999900B2B2B200999999009999
      9900999999009999990000000000000000000000000000000000000099000000
      CC000000CC000000CC000000CC000000CC00000099000000CC00000099000000
      990000009900000099000000000000000000000000000000000099999900B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B20099999900B2B2B200999999009999
      99009999990099999900000000000000000000000000000000000099000000FF
      000000CC000000CC000000CC000000CC000000CC00000099000000CC00000099
      000000990000009900000000000000000000000000000000000099999900CCCC
      CC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2B20099999900B2B2B2009999
      9900999999009999990000000000000000000000000000000000000099000000
      FF000000CC000000CC000000CC000000CC000000CC00000099000000CC000000
      990000009900000099000000000000000000000000000000000099999900CCCC
      CC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2B20099999900B2B2B2009999
      99009999990099999900000000000000000000000000000000000099000000CC
      000000FF000000CC000000CC000000CC000000CC000000CC00000099000000CC
      000000990000009900000000000000000000000000000000000099999900B2B2
      B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2B20099999900B2B2
      B200999999009999990000000000000000000000000000000000000099000000
      CC000000FF000000CC000000CC000000CC000000CC000000CC00000099000000
      CC0000009900000099000000000000000000000000000000000099999900B2B2
      B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2B20099999900B2B2
      B2009999990099999900000000000000000000000000000000000099000000FF
      000000CC000000FF000000CC000000CC000000CC000000CC000000CC00000099
      000000CC0000009900000000000000000000000000000000000099999900CCCC
      CC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2B2009999
      9900B2B2B2009999990000000000000000000000000000000000000099000000
      FF000000CC000000FF000000CC000000CC000000CC000000CC000000CC000000
      99000000CC00000099000000000000000000000000000000000099999900CCCC
      CC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2B2009999
      9900B2B2B20099999900000000000000000000000000000000000099000000FF
      000000FF000000CC000000FF000000CC000000CC000000CC000000CC000000CC
      000000990000009900000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2
      B200999999009999990000000000000000000000000000000000000099000000
      FF000000FF000000CC000000FF000000CC000000CC000000CC000000CC000000
      CC0000009900000099000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2
      B2009999990099999900000000000000000000000000000000000099000099FF
      990000FF000000FF000000CC000000FF000000CC000000CC000000CC000000CC
      000000CC0000009900000000000000000000000000000000000099999900E5E5
      E500CCCCCC00CCCCCC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B2009999990000000000000000000000000000000000000099009999
      FF000000FF000000FF000000CC000000FF000000CC000000CC000000CC000000
      CC000000CC00000099000000000000000000000000000000000099999900E5E5
      E500CCCCCC00CCCCCC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B20099999900000000000000000000000000000000000099000099FF
      990099FF990000FF000000FF000000CC000000FF000000CC000000CC000000CC
      000000CC0000009900000000000000000000000000000000000099999900E5E5
      E500E5E5E500CCCCCC00CCCCCC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2
      B200B2B2B2009999990000000000000000000000000000000000000099009999
      FF009999FF000000FF000000FF000000CC000000FF000000CC000000CC000000
      CC000000CC00000099000000000000000000000000000000000099999900E5E5
      E500E5E5E500CCCCCC00CCCCCC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2
      B200B2B2B2009999990000000000000000000000000000000000000000000099
      0000009900000099000000990000009900000099000000990000009900000099
      0000009900000000000000000000000000000000000000000000000000009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999000000000000000000000000000000000000000000000000000000
      9900000099000000990000009900000099000000990000009900000099000000
      9900000099000000000000000000000000000000000000000000000000009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFCFFFCFFFFFFFFFFF87FF87F
      FFFFFFFFF07FF07FFFFFFFFFE07FE07FE007E007C03FC03FC003C003803E803E
      C003C003001C001CC003C00300080008C003C00300010001C003C00380038003
      C003C00380078007C003C003800F800FE007E007C01FC01FFFFFFFFFE03FE03F
      FFFFFFFFF07FF07FFFFFFFFFF8FFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE007E007E007E007C003C003C003C003
      C003C003C003C003C003C003C003C003C003C003C003C003C003C003C003C003
      C003C003C003C003C003C003C003C003E007E007E007E007FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object DBISAMTable1: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'SeqNo'
        DataType = ftAutoInc
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'way'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'EventTime'
        DataType = ftDateTime
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IP'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DeviceID'
        DataType = ftString
        Size = 10
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DeviceNo'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Cmd'
        DataType = ftString
        Size = 3
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Data'
        DataType = ftString
        Size = 200
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FullData'
        DataType = ftString
        Size = 200
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DBISAMTable1DBISA10'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'DBISAMTable1DBISA1'
        Fields = 'SeqNo'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'db_log'
    StoreDefs = True
    Left = 703
    Top = 28
    object DBISAMTable1SeqNo: TAutoIncField
      DisplayLabel = #49692#48264
      DisplayWidth = 8
      FieldName = 'SeqNo'
      Origin = 'db_log.SeqNo'
    end
    object DBISAMTable1way: TStringField
      DisplayLabel = #48169#54693
      DisplayWidth = 5
      FieldName = 'way'
      Origin = 'db_log.way'
    end
    object DBISAMTable1EventTime: TDateTimeField
      DisplayLabel = #49884#44036
      DisplayWidth = 14
      FieldName = 'EventTime'
      Origin = 'db_log.EventTime'
      OnGetText = DBISAMTable1EventTimeGetText
    end
    object DBISAMTable1IP: TStringField
      DisplayWidth = 15
      FieldName = 'IP'
      Origin = 'db_log.IP'
    end
    object DBISAMTable1DeviceID: TStringField
      DisplayLabel = #44592#44592'ID'
      DisplayWidth = 10
      FieldName = 'DeviceID'
      Origin = 'db_log.DeviceID'
      Size = 10
    end
    object DBISAMTable1DeviceNo: TStringField
      DisplayLabel = 'No'
      DisplayWidth = 3
      FieldName = 'DeviceNo'
      Origin = 'db_log.DeviceNo'
    end
    object DBISAMTable1Cmd: TStringField
      DisplayLabel = #52964#47592#46300
      DisplayWidth = 6
      FieldName = 'Cmd'
      Origin = 'db_log.Cmd'
      Size = 3
    end
    object DBISAMTable1Data: TStringField
      DisplayLabel = #45936#51060#53440
      DisplayWidth = 30
      FieldName = 'Data'
      Origin = 'db_log.Data'
      Size = 200
    end
    object DBISAMTable1FullData: TStringField
      DisplayLabel = #51204#52404#45936#51060#53440
      DisplayWidth = 100
      FieldName = 'FullData'
      Origin = 'db_log.FullData'
      Size = 200
    end
  end
  object DataSource1: TDataSource
    DataSet = DBISAMTable1
    Left = 671
    Top = 28
  end
  object LMDIniCtrl2: TLMDIniCtrl
    IniFile = 'zReg.INI'
    IniPrefix = ppFixed
    Target = itIniFile
    Left = 959
    Top = 380
  end
  object RzOpenDialog1: TOpenDialog
    Left = 924
    Top = 140
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 1461
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    OnError = ClientSocket1Error
    Left = 816
    Top = 128
  end
  object WiznetTimer: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = WiznetTimerTimer
    Left = 924
    Top = 272
  end
  object ReconnectSocketTimer: TTimer
    Enabled = False
    OnTimer = ReconnectSocketTimerTimer
    Left = 900
    Top = 268
  end
  object LMDStopWatch1: TLMDStopWatch
    Digits = 2
    Caption = 'Time: '
    Left = 756
    Top = 420
  end
  object RzSaveDialog1: TSaveDialog
    DefaultExt = 'CSV'
    Filter = 'CSV File|*.CSV'
    Left = 948
    Top = 336
  end
  object AdVT100Emulator1: TAdVT100Emulator
    Answerback = 'APROterm'
    DisplayUpperASCII = False
    OnProcessChar = AdVT100Emulator1ProcessChar
    Left = 757
    Top = 378
  end
  object CardNoPopupMenu: TPopupMenu
    Left = 1012
    Top = 308
    object N4: TMenuItem
      Caption = #52852#46300#48264#54840' '#48520#47084#50724#44592
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #52852#46300#48264#54840' '#51200#51109#54616#44592
      OnClick = N5Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 924
    Top = 172
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'TXT'
    Left = 588
    Top = 236
  end
  object PopupMenu1: TPopupMenu
    Left = 178
    Top = 459
    object ID1: TMenuItem
      Caption = 'ID'#46321#47197
      ShortCut = 112
      OnClick = RzGroup2Items0Click
    end
    object N7: TMenuItem
      Caption = #49884#49828#53596#51221#48372#46321#47197
      ShortCut = 113
      OnClick = RzGroup2Items1Click
    end
    object N8: TMenuItem
      Caption = #54252#53944#51221#48372#46321#47197
      ShortCut = 114
      OnClick = RzGroup2Items2Click
    end
    object N9: TMenuItem
      Caption = #52852#46300#47532#45908#46321#47197
      ShortCut = 115
      OnClick = RzGroup2Items3Click
    end
    object N10: TMenuItem
      Caption = #47540#47112#51060#51221#48372#46321#47197
      ShortCut = 116
      OnClick = RzGroup2Items4Click
    end
    object N11: TMenuItem
      Caption = #50896#44201#51200#50612
      ShortCut = 117
      OnClick = RzGroup2Items5Click
    end
    object N12: TMenuItem
      Caption = #47924#51064#44397#49324#46321#47197
      ShortCut = 118
      OnClick = RzGroup2Items6Click
    end
    object N13: TMenuItem
      Caption = #45936#51060#53552#51204#49569
      ShortCut = 119
      OnClick = RzGroup2Items8Click
    end
    object N14: TMenuItem
      Caption = #54156#50920#50612
      ShortCut = 120
      OnClick = RzGroup2Items7Click
    end
    object N15: TMenuItem
      Caption = #52636#51077'/'#49884#49828#53596#46321#47197#51221#48372
      ShortCut = 121
      OnClick = RzGroup3Items0Click
    end
    object DOOR1: TMenuItem
      Caption = 'DOOR'#51228#50612
      ShortCut = 122
      OnClick = RzGroup3Items1Click
    end
    object N16: TMenuItem
      Caption = #52852#46300#45936#51060#53552#46321#47197
      ShortCut = 123
      OnClick = RzGroup3Items2Click
    end
  end
  object BroadTimer: TTimer
    Enabled = False
    OnTimer = BroadTimerTimer
    Left = 356
    Top = 340
  end
  object broadStopTimer: TTimer
    Enabled = False
    Interval = 120000
    OnTimer = broadStopTimerTimer
    Left = 388
    Top = 340
  end
  object BroadSleep_Timer: TTimer
    Interval = 3000
    OnTimer = BroadSleep_TimerTimer
    Left = 420
    Top = 340
  end
end
