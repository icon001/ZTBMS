inherited DoorscheduleRegForm: TDoorscheduleRegForm
  Left = 446
  Top = 123
  Width = 1248
  Height = 858
  Caption = #52636#51077#47928' '#49828#52992#51572' '#44288#47532
  Color = clWhite
  Font.Height = -12
  Font.Name = #44404#47548
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter [0]
    Left = 478
    Top = 33
    Width = 2
    Height = 798
    Align = alRight
  end
  object Panel57: TPanel [1]
    Left = 0
    Top = 0
    Width = 1240
    Height = 33
    Align = alTop
    Caption = #52636#51077#47928' '#49828#52992#51572' '#44288#47532
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel58: TPanel [2]
    Left = 0
    Top = 33
    Width = 478
    Height = 798
    Align = alClient
    Color = clWhite
    TabOrder = 1
    object RzGroupBox4: TRzGroupBox
      Left = 1
      Top = 129
      Width = 476
      Height = 668
      Align = alClient
      Caption = #46321#47197#46108' '#52636#51077#47928
      Color = clWhite
      TabOrder = 0
      object sg_DoorList: TAdvStringGrid
        Left = 1
        Top = 13
        Width = 474
        Height = 654
        Cursor = crDefault
        Align = alClient
        ColCount = 15
        DefaultColWidth = 200
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
        OnClick = sg_DoorListClick
        OnCheckBoxClick = sg_DoorListCheckBoxClick
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          ''
          #52636#51077#47928
          #54217#51068#49828#52992#51460
          #51452#47568#49828#52992#51460
          #51068#50836#51068#49828#52992#51460
          #53945#51221#51068'1'#49828#52992#51460
          #53945#51221#51068'2'#49828#52992#51460
          #53945#51221#51068'3'#49828#52992#51460)
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
        FixedColWidth = 20
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
        Version = '6.0.4.4'
        ColWidths = (
          20
          200
          200
          200
          200
          200
          200
          200
          200
          200
          200
          200
          200
          200
          200)
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 476
      Height = 128
      Align = alTop
      TabOrder = 1
      object lb_Building1: TLabel
        Left = 16
        Top = 24
        Width = 48
        Height = 12
        Caption = #48716#46377#53076#46300
      end
      object lb_FloorCode1: TLabel
        Left = 16
        Top = 48
        Width = 36
        Height = 12
        Caption = #52789#53076#46300
      end
      object lb_AreaCode1: TLabel
        Left = 16
        Top = 72
        Width = 48
        Height = 12
        Caption = #44396#50669#53076#46300
      end
      object Label31: TLabel
        Left = 16
        Top = 96
        Width = 24
        Height = 12
        Caption = #44396#48516
      end
      object cmb_BuildingCode1: TComboBox
        Left = 80
        Top = 20
        Width = 127
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 0
        OnChange = cmb_BuildingCode1Change
      end
      object cmb_FloorCode1: TComboBox
        Left = 80
        Top = 44
        Width = 127
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 1
        OnChange = cmb_FloorCode1Change
      end
      object cmb_AreaCode1: TComboBox
        Left = 80
        Top = 68
        Width = 127
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 2
        OnChange = cmb_AreaCode1Change
      end
      object cmb_Type: TComboBox
        Left = 80
        Top = 92
        Width = 127
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 3
        OnChange = cmb_TypeChange
      end
      object btnClose: TRzBitBtn
        Left = 224
        Top = 82
        Width = 87
        Height = 30
        Caption = #45803#44592
        Color = 15791348
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        TabOrder = 4
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
  end
  object Panel8: TPanel [3]
    Left = 480
    Top = 33
    Width = 760
    Height = 798
    Align = alRight
    Color = clWhite
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 1
      Top = 33
      Width = 758
      Height = 764
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #44536#47000#54532#53440#51077' '#49828#52992#51460#44288#47532
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 750
          Height = 737
          Align = alClient
          Color = clWhite
          TabOrder = 0
          DesignSize = (
            750
            737)
          object RzGroupBox1: TRzGroupBox
            Left = 1
            Top = 1
            Width = 748
            Height = 110
            Align = alTop
            Caption = #54217#51068' '#49828#52992#51572
            Color = clWhite
            TabOrder = 0
            object PaintBox1: TPaintBox
              Left = 9
              Top = 45
              Width = 720
              Height = 15
              Color = 15198183
              ParentColor = False
              OnPaint = PaintBox1Paint
            end
            object Label1: TLabel
              Left = 78
              Top = 45
              Width = 51
              Height = 16
              Caption = 'Label1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label2: TLabel
              Left = 136
              Top = 88
              Width = 51
              Height = 16
              Caption = 'Label2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label3: TLabel
              Left = 197
              Top = 45
              Width = 42
              Height = 16
              Caption = '12:23'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label4: TLabel
              Left = 258
              Top = 88
              Width = 51
              Height = 16
              Caption = 'Label4'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label6: TLabel
              Left = 8
              Top = 19
              Width = 30
              Height = 13
              Caption = #54217#51068
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #44404#47548#52404
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object pan_Week: TPanel
              Left = 8
              Top = 65
              Width = 720
              Height = 25
              TabOrder = 0
              object pan_W1: TPanel
                Tag = 1
                Left = 1
                Top = 1
                Width = 89
                Height = 23
                Hint = '1'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel2DragDrop
                OnDragOver = Panel2DragOver
                OnResize = Panel2Resize
                object Panel4: TPanel
                  Tag = 2
                  Left = 84
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_W4: TPanel
                Tag = 1
                Left = 210
                Top = 1
                Width = 60
                Height = 23
                Hint = '4'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel2DragDrop
                OnDragOver = Panel2DragOver
                OnResize = Panel2Resize
                object Panel5: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_W5: TPanel
                Tag = 1
                Left = 270
                Top = 1
                Width = 443
                Height = 23
                Hint = '5'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel2DragDrop
                OnDragOver = Panel2DragOver
                OnResize = Panel2Resize
              end
              object pan_W3: TPanel
                Tag = 1
                Left = 150
                Top = 1
                Width = 60
                Height = 23
                Hint = '3'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel2DragDrop
                OnDragOver = Panel2DragOver
                OnResize = Panel2Resize
                object Panel13: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_W2: TPanel
                Tag = 1
                Left = 90
                Top = 1
                Width = 60
                Height = 23
                Hint = '2'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel2DragDrop
                OnDragOver = Panel2DragOver
                OnResize = Panel2Resize
                object Panel15: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
            end
            object Panel31: TPanel
              Left = 444
              Top = 15
              Width = 57
              Height = 20
              Caption = #52488#44592#54868
              TabOrder = 1
              OnClick = Panel31Click
            end
            object Panel32: TPanel
              Tag = 1
              Left = 503
              Top = 15
              Width = 57
              Height = 20
              Caption = #44060#48169
              Color = clGreen
              DragMode = dmAutomatic
              TabOrder = 2
            end
            object Panel33: TPanel
              Tag = 1
              Left = 561
              Top = 15
              Width = 57
              Height = 20
              Caption = #50868#50689
              Color = clAqua
              DragMode = dmAutomatic
              TabOrder = 3
            end
            object Panel34: TPanel
              Tag = 1
              Left = 619
              Top = 15
              Width = 57
              Height = 20
              Caption = #54224#49604
              Color = clRed
              DragMode = dmAutomatic
              TabOrder = 4
            end
            object Panel2: TPanel
              Tag = 1
              Left = 675
              Top = 15
              Width = 57
              Height = 20
              Caption = #47560#49828#53552
              Color = clPurple
              DragMode = dmAutomatic
              TabOrder = 5
            end
          end
          object RzGroupBox2: TRzGroupBox
            Left = 1
            Top = 111
            Width = 748
            Height = 110
            Align = alTop
            Caption = ' '#48152#55092#51068' '#49828#52992#51572' '
            Color = clWhite
            TabOrder = 1
            object PaintBox2: TPaintBox
              Left = 9
              Top = 45
              Width = 720
              Height = 15
              Color = 15198183
              ParentColor = False
              OnPaint = PaintBox2Paint
            end
            object Label5: TLabel
              Left = 78
              Top = 45
              Width = 51
              Height = 16
              Caption = 'Label1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label7: TLabel
              Left = 136
              Top = 88
              Width = 51
              Height = 16
              Caption = 'Label2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label8: TLabel
              Left = 197
              Top = 45
              Width = 42
              Height = 16
              Caption = '12:23'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label9: TLabel
              Left = 258
              Top = 88
              Width = 51
              Height = 16
              Caption = 'Label4'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label10: TLabel
              Left = 8
              Top = 19
              Width = 45
              Height = 13
              Caption = #53664#50836#51068
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = #44404#47548#52404
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object pan_saturday: TPanel
              Left = 8
              Top = 65
              Width = 720
              Height = 25
              TabOrder = 0
              object pan_sa1: TPanel
                Tag = 1
                Left = 1
                Top = 1
                Width = 89
                Height = 23
                Hint = '1'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel8DragDrop
                OnDragOver = Panel8DragOver
                OnResize = Panel8Resize
                object Panel10: TPanel
                  Tag = 2
                  Left = 84
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_sa4: TPanel
                Tag = 1
                Left = 210
                Top = 1
                Width = 60
                Height = 23
                Hint = '4'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel8DragDrop
                OnDragOver = Panel8DragOver
                OnResize = Panel8Resize
                object Panel16: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_sa5: TPanel
                Tag = 1
                Left = 270
                Top = 1
                Width = 443
                Height = 23
                Hint = '5'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel8DragDrop
                OnDragOver = Panel8DragOver
                OnResize = Panel8Resize
              end
              object pan_sa3: TPanel
                Tag = 1
                Left = 150
                Top = 1
                Width = 60
                Height = 23
                Hint = '3'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel8DragDrop
                OnDragOver = Panel8DragOver
                OnResize = Panel8Resize
                object Panel19: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_sa2: TPanel
                Tag = 1
                Left = 90
                Top = 1
                Width = 60
                Height = 23
                Hint = '2'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel8DragDrop
                OnDragOver = Panel8DragOver
                OnResize = Panel8Resize
                object Panel21: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
            end
            object Panel35: TPanel
              Left = 444
              Top = 15
              Width = 57
              Height = 20
              Caption = #52488#44592#54868
              TabOrder = 1
              OnClick = Panel35Click
            end
            object Panel36: TPanel
              Tag = 1
              Left = 503
              Top = 15
              Width = 57
              Height = 20
              Caption = #44060#48169
              Color = clGreen
              DragMode = dmAutomatic
              TabOrder = 2
            end
            object Panel37: TPanel
              Tag = 1
              Left = 561
              Top = 15
              Width = 57
              Height = 20
              Caption = #50868#50689
              Color = clAqua
              DragMode = dmAutomatic
              TabOrder = 3
            end
            object Panel38: TPanel
              Tag = 1
              Left = 619
              Top = 15
              Width = 57
              Height = 20
              Caption = #54224#49604
              Color = clRed
              DragMode = dmAutomatic
              TabOrder = 4
            end
            object Panel3: TPanel
              Tag = 1
              Left = 675
              Top = 15
              Width = 57
              Height = 20
              Caption = #47560#49828#53552
              Color = clPurple
              DragMode = dmAutomatic
              TabOrder = 5
            end
          end
          object RzGroupBox3: TRzGroupBox
            Left = 1
            Top = 221
            Width = 748
            Height = 110
            Align = alTop
            Caption = ' '#51068#50836#51068' '#49828#52992#51572' '
            Color = clWhite
            TabOrder = 2
            object PaintBox3: TPaintBox
              Left = 9
              Top = 45
              Width = 720
              Height = 15
              Color = 15198183
              ParentColor = False
              OnPaint = PaintBox3Paint
            end
            object Label11: TLabel
              Left = 78
              Top = 45
              Width = 51
              Height = 16
              Caption = 'Label1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label12: TLabel
              Left = 136
              Top = 88
              Width = 51
              Height = 16
              Caption = 'Label2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label13: TLabel
              Left = 197
              Top = 45
              Width = 42
              Height = 16
              Caption = '12:23'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label14: TLabel
              Left = 258
              Top = 88
              Width = 51
              Height = 16
              Caption = 'Label4'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label15: TLabel
              Left = 8
              Top = 19
              Width = 45
              Height = 13
              Caption = #51068#50836#51068
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = #44404#47548#52404
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object pan_sunday: TPanel
              Left = 8
              Top = 65
              Width = 720
              Height = 25
              TabOrder = 0
              object pan_su1: TPanel
                Tag = 1
                Left = 1
                Top = 1
                Width = 89
                Height = 23
                Hint = '1'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel22DragDrop
                OnDragOver = Panel22DragOver
                OnResize = Panel22Resize
                object Panel24: TPanel
                  Tag = 2
                  Left = 84
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_su4: TPanel
                Tag = 1
                Left = 210
                Top = 1
                Width = 60
                Height = 23
                Hint = '4'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel22DragDrop
                OnDragOver = Panel22DragOver
                OnResize = Panel22Resize
                object Panel26: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_su5: TPanel
                Tag = 1
                Left = 270
                Top = 1
                Width = 443
                Height = 23
                Hint = '5'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel22DragDrop
                OnDragOver = Panel22DragOver
                OnResize = Panel22Resize
              end
              object pan_su3: TPanel
                Tag = 1
                Left = 150
                Top = 1
                Width = 60
                Height = 23
                Hint = '3'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel22DragDrop
                OnDragOver = Panel22DragOver
                OnResize = Panel22Resize
                object Panel29: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_su2: TPanel
                Tag = 1
                Left = 90
                Top = 1
                Width = 60
                Height = 23
                Hint = '2'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel22DragDrop
                OnDragOver = Panel22DragOver
                OnResize = Panel22Resize
                object Panel39: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
            end
            object Panel40: TPanel
              Left = 444
              Top = 15
              Width = 57
              Height = 20
              Caption = #52488#44592#54868
              TabOrder = 1
              OnClick = Panel39Click
            end
            object Panel41: TPanel
              Tag = 1
              Left = 503
              Top = 15
              Width = 57
              Height = 20
              Caption = #44060#48169
              Color = clGreen
              DragMode = dmAutomatic
              TabOrder = 2
            end
            object Panel42: TPanel
              Tag = 1
              Left = 561
              Top = 15
              Width = 57
              Height = 20
              Caption = #50868#50689
              Color = clAqua
              DragMode = dmAutomatic
              TabOrder = 3
            end
            object Panel43: TPanel
              Tag = 1
              Left = 619
              Top = 15
              Width = 57
              Height = 20
              Caption = #54224#49604
              Color = clRed
              DragMode = dmAutomatic
              TabOrder = 4
            end
            object Panel6: TPanel
              Tag = 1
              Left = 675
              Top = 15
              Width = 57
              Height = 20
              Caption = #47560#49828#53552
              Color = clPurple
              DragMode = dmAutomatic
              TabOrder = 5
            end
          end
          object RzDBRadioGroup1: TRzDBRadioGroup
            Left = 1
            Top = 331
            Width = 748
            Height = 110
            Align = alTop
            Caption = #53945#51221#51068'1 '#49828#52992#51572
            Color = clWhite
            TabOrder = 3
            object PaintBox4: TPaintBox
              Left = 9
              Top = 45
              Width = 720
              Height = 15
              Color = 15198183
              ParentColor = False
              OnPaint = PaintBox4Paint
            end
            object Label16: TLabel
              Left = 78
              Top = 45
              Width = 51
              Height = 16
              Caption = 'Label1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label17: TLabel
              Left = 136
              Top = 88
              Width = 51
              Height = 16
              Caption = 'Label2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label18: TLabel
              Left = 197
              Top = 45
              Width = 42
              Height = 16
              Caption = '12:23'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label19: TLabel
              Left = 258
              Top = 88
              Width = 60
              Height = 16
              Caption = 'Label19'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label20: TLabel
              Left = 8
              Top = 19
              Width = 53
              Height = 13
              Caption = #53945#51221#51068'1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = #44404#47548#52404
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object pan_Holiday: TPanel
              Left = 8
              Top = 65
              Width = 720
              Height = 25
              TabOrder = 0
              object pan_h1: TPanel
                Tag = 1
                Left = 1
                Top = 1
                Width = 89
                Height = 23
                Hint = '1'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel44DragDrop
                OnDragOver = Panel44DragOver
                OnResize = Panel44Resize
                object Panel46: TPanel
                  Tag = 2
                  Left = 84
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_h4: TPanel
                Tag = 1
                Left = 210
                Top = 1
                Width = 60
                Height = 23
                Hint = '4'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel44DragDrop
                OnDragOver = Panel44DragOver
                OnResize = Panel44Resize
                object Panel48: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_h5: TPanel
                Tag = 1
                Left = 270
                Top = 1
                Width = 443
                Height = 23
                Hint = '5'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel44DragDrop
                OnDragOver = Panel44DragOver
                OnResize = Panel44Resize
              end
              object pan_h3: TPanel
                Tag = 1
                Left = 150
                Top = 1
                Width = 60
                Height = 23
                Hint = '3'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel44DragDrop
                OnDragOver = Panel44DragOver
                OnResize = Panel44Resize
                object Panel51: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_h2: TPanel
                Tag = 1
                Left = 90
                Top = 1
                Width = 60
                Height = 23
                Hint = '2'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnDblClick = Panel2DblClick
                OnDragDrop = Panel44DragDrop
                OnDragOver = Panel44DragOver
                OnResize = Panel44Resize
                object Panel53: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
            end
            object Panel54: TPanel
              Left = 444
              Top = 15
              Width = 57
              Height = 20
              Caption = #52488#44592#54868
              TabOrder = 1
              OnClick = Panel53Click
            end
            object Panel55: TPanel
              Tag = 1
              Left = 503
              Top = 15
              Width = 57
              Height = 20
              Caption = #44060#48169
              Color = clGreen
              DragMode = dmAutomatic
              TabOrder = 2
            end
            object Panel56: TPanel
              Tag = 1
              Left = 561
              Top = 15
              Width = 57
              Height = 20
              Caption = #50868#50689
              Color = clAqua
              DragMode = dmAutomatic
              TabOrder = 3
            end
            object Panel59: TPanel
              Tag = 1
              Left = 619
              Top = 15
              Width = 57
              Height = 20
              Caption = #54224#49604
              Color = clRed
              DragMode = dmAutomatic
              TabOrder = 4
            end
            object Panel7: TPanel
              Tag = 1
              Left = 675
              Top = 15
              Width = 57
              Height = 20
              Caption = #47560#49828#53552
              Color = clPurple
              DragMode = dmAutomatic
              TabOrder = 5
            end
          end
          object btnSave: TRzBitBtn
            Left = 11
            Top = 665
            Width = 87
            Height = 30
            Anchors = [akLeft, akBottom]
            Caption = #51201#50857
            Color = 15791348
            HighlightColor = 16026986
            HotTrack = True
            HotTrackColor = 3983359
            TabOrder = 4
            OnClick = btnSaveClick
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
          object RzDBRadioGroup2: TRzDBRadioGroup
            Left = 1
            Top = 441
            Width = 748
            Height = 110
            Align = alTop
            Caption = #53945#51221#51068'2 '#49828#52992#51572
            Color = clWhite
            TabOrder = 5
            object PaintBox5: TPaintBox
              Left = 9
              Top = 45
              Width = 720
              Height = 15
              Color = 15198183
              ParentColor = False
              OnPaint = PaintBox5Paint
            end
            object Label21: TLabel
              Left = 78
              Top = 45
              Width = 51
              Height = 16
              Caption = 'Label1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label22: TLabel
              Left = 136
              Top = 88
              Width = 51
              Height = 16
              Caption = 'Label2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label23: TLabel
              Left = 197
              Top = 45
              Width = 42
              Height = 16
              Caption = '12:23'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label24: TLabel
              Left = 258
              Top = 88
              Width = 60
              Height = 16
              Caption = 'Label19'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label25: TLabel
              Left = 8
              Top = 19
              Width = 53
              Height = 13
              Caption = #53945#51221#51068'2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = #44404#47548#52404
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object pan_Holiday2: TPanel
              Left = 8
              Top = 65
              Width = 720
              Height = 25
              TabOrder = 0
              object pan_h21: TPanel
                Tag = 1
                Left = 1
                Top = 1
                Width = 89
                Height = 23
                Hint = '1'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnDblClick = Panel2DblClick
                OnDragDrop = pan_h21DragDrop
                OnDragOver = pan_h21DragOver
                OnResize = pan_h21Resize
                object Panel11: TPanel
                  Tag = 2
                  Left = 84
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_h24: TPanel
                Tag = 1
                Left = 210
                Top = 1
                Width = 60
                Height = 23
                Hint = '4'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnDblClick = Panel2DblClick
                OnDragDrop = pan_h21DragDrop
                OnDragOver = pan_h21DragOver
                OnResize = pan_h21Resize
                object Panel14: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_h25: TPanel
                Tag = 1
                Left = 270
                Top = 1
                Width = 443
                Height = 23
                Hint = '5'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnDblClick = Panel2DblClick
                OnDragDrop = pan_h21DragDrop
                OnDragOver = pan_h21DragOver
                OnResize = pan_h21Resize
              end
              object pan_h23: TPanel
                Tag = 1
                Left = 150
                Top = 1
                Width = 60
                Height = 23
                Hint = '3'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnDblClick = Panel2DblClick
                OnDragDrop = pan_h21DragDrop
                OnDragOver = pan_h21DragOver
                OnResize = pan_h21Resize
                object Panel20: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_h22: TPanel
                Tag = 1
                Left = 90
                Top = 1
                Width = 60
                Height = 23
                Hint = '2'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnDblClick = Panel2DblClick
                OnDragDrop = pan_h21DragDrop
                OnDragOver = pan_h21DragOver
                OnResize = pan_h21Resize
                object Panel23: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
            end
            object Panel25: TPanel
              Left = 444
              Top = 15
              Width = 57
              Height = 20
              Caption = #52488#44592#54868
              TabOrder = 1
              OnClick = Panel25Click
            end
            object Panel27: TPanel
              Tag = 1
              Left = 503
              Top = 15
              Width = 57
              Height = 20
              Caption = #44060#48169
              Color = clGreen
              DragMode = dmAutomatic
              TabOrder = 2
            end
            object Panel28: TPanel
              Tag = 1
              Left = 561
              Top = 15
              Width = 57
              Height = 20
              Caption = #50868#50689
              Color = clAqua
              DragMode = dmAutomatic
              TabOrder = 3
            end
            object Panel30: TPanel
              Tag = 1
              Left = 619
              Top = 15
              Width = 57
              Height = 20
              Caption = #54224#49604
              Color = clRed
              DragMode = dmAutomatic
              TabOrder = 4
            end
            object Panel44: TPanel
              Tag = 1
              Left = 675
              Top = 15
              Width = 57
              Height = 20
              Caption = #47560#49828#53552
              Color = clPurple
              DragMode = dmAutomatic
              TabOrder = 5
            end
          end
          object RzDBRadioGroup3: TRzDBRadioGroup
            Left = 1
            Top = 551
            Width = 748
            Height = 110
            Align = alTop
            Caption = #53945#51221#51068'3 '#49828#52992#51572
            Color = clWhite
            TabOrder = 6
            object PaintBox6: TPaintBox
              Left = 9
              Top = 45
              Width = 720
              Height = 15
              Color = 15198183
              ParentColor = False
              OnPaint = PaintBox6Paint
            end
            object Label26: TLabel
              Left = 78
              Top = 45
              Width = 51
              Height = 16
              Caption = 'Label1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label27: TLabel
              Left = 136
              Top = 88
              Width = 51
              Height = 16
              Caption = 'Label2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label28: TLabel
              Left = 197
              Top = 45
              Width = 42
              Height = 16
              Caption = '12:23'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label29: TLabel
              Left = 258
              Top = 88
              Width = 60
              Height = 16
              Caption = 'Label19'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label30: TLabel
              Left = 8
              Top = 19
              Width = 53
              Height = 13
              Caption = #53945#51221#51068'3'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = #44404#47548#52404
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object pan_Holiday3: TPanel
              Left = 8
              Top = 65
              Width = 720
              Height = 25
              TabOrder = 0
              object pan_h31: TPanel
                Tag = 1
                Left = 1
                Top = 1
                Width = 89
                Height = 23
                Hint = '1'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnDblClick = Panel2DblClick
                OnDragDrop = pan_h31DragDrop
                OnDragOver = pan_h31DragOver
                OnResize = pan_h31Resize
                object Panel49: TPanel
                  Tag = 2
                  Left = 84
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_h34: TPanel
                Tag = 1
                Left = 210
                Top = 1
                Width = 60
                Height = 23
                Hint = '4'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnDblClick = Panel2DblClick
                OnDragDrop = pan_h31DragDrop
                OnDragOver = pan_h31DragOver
                OnResize = pan_h31Resize
                object Panel52: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_h35: TPanel
                Tag = 1
                Left = 270
                Top = 1
                Width = 443
                Height = 23
                Hint = '5'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnDblClick = Panel2DblClick
                OnDragDrop = pan_h31DragDrop
                OnDragOver = pan_h31DragOver
                OnResize = pan_h31Resize
              end
              object pan_h33: TPanel
                Tag = 1
                Left = 150
                Top = 1
                Width = 60
                Height = 23
                Hint = '3'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnDblClick = Panel2DblClick
                OnDragDrop = pan_h31DragDrop
                OnDragOver = pan_h31DragOver
                OnResize = pan_h31Resize
                object Panel62: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
              object pan_h32: TPanel
                Tag = 1
                Left = 90
                Top = 1
                Width = 60
                Height = 23
                Hint = '2'
                Align = alLeft
                BevelOuter = bvLowered
                Color = clAqua
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnDblClick = Panel2DblClick
                OnDragDrop = pan_h31DragDrop
                OnDragOver = pan_h31DragOver
                OnResize = pan_h31Resize
                object Panel64: TPanel
                  Tag = 2
                  Left = 55
                  Top = 1
                  Width = 4
                  Height = 21
                  Cursor = crSizeWE
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnMouseMove = Panel3MouseMove
                end
              end
            end
            object Panel65: TPanel
              Left = 444
              Top = 15
              Width = 57
              Height = 20
              Caption = #52488#44592#54868
              TabOrder = 1
              OnClick = Panel65Click
            end
            object Panel66: TPanel
              Tag = 1
              Left = 503
              Top = 15
              Width = 57
              Height = 20
              Caption = #44060#48169
              Color = clGreen
              DragMode = dmAutomatic
              TabOrder = 2
            end
            object Panel67: TPanel
              Tag = 1
              Left = 561
              Top = 15
              Width = 57
              Height = 20
              Caption = #50868#50689
              Color = clAqua
              DragMode = dmAutomatic
              TabOrder = 3
            end
            object Panel68: TPanel
              Tag = 1
              Left = 619
              Top = 15
              Width = 57
              Height = 20
              Caption = #54224#49604
              Color = clRed
              DragMode = dmAutomatic
              TabOrder = 4
            end
            object Panel69: TPanel
              Tag = 1
              Left = 675
              Top = 15
              Width = 57
              Height = 20
              Caption = #47560#49828#53552
              Color = clPurple
              DragMode = dmAutomatic
              TabOrder = 5
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #53581#49828#53944' '#53440#51077' '#49828#52992#51460#44288#47532
        ImageIndex = 1
        object PageControl2: TPageControl
          Left = 0
          Top = 0
          Width = 750
          Height = 193
          ActivePage = tb_holiday3
          Align = alTop
          TabOrder = 0
          object tb_week: TTabSheet
            Caption = #54217#51068#49828#52992#51460
            object gb_Week: TAdvGroupBox
              Left = 0
              Top = 0
              Width = 742
              Height = 153
              Align = alTop
              TabOrder = 0
              object Label166: TLabel
                Left = 16
                Top = 24
                Width = 30
                Height = 12
                Caption = '1'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label167: TLabel
                Left = 103
                Top = 25
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label168: TLabel
                Left = 164
                Top = 25
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label169: TLabel
                Left = 196
                Top = 25
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label170: TLabel
                Left = 332
                Top = 25
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label171: TLabel
                Left = 271
                Top = 25
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label172: TLabel
                Left = 387
                Top = 24
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label173: TLabel
                Left = 16
                Top = 48
                Width = 30
                Height = 12
                Caption = '2'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label174: TLabel
                Left = 103
                Top = 49
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label175: TLabel
                Left = 164
                Top = 49
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label176: TLabel
                Left = 196
                Top = 49
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label177: TLabel
                Left = 271
                Top = 49
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label178: TLabel
                Left = 332
                Top = 49
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label179: TLabel
                Left = 387
                Top = 48
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label180: TLabel
                Left = 16
                Top = 72
                Width = 30
                Height = 12
                Caption = '3'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label181: TLabel
                Left = 103
                Top = 73
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label182: TLabel
                Left = 164
                Top = 73
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label183: TLabel
                Left = 196
                Top = 73
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label184: TLabel
                Left = 271
                Top = 73
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label185: TLabel
                Left = 332
                Top = 73
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label186: TLabel
                Left = 387
                Top = 72
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label187: TLabel
                Left = 16
                Top = 96
                Width = 30
                Height = 12
                Caption = '4'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label188: TLabel
                Left = 103
                Top = 97
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label189: TLabel
                Left = 164
                Top = 97
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label190: TLabel
                Left = 196
                Top = 97
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label191: TLabel
                Left = 271
                Top = 97
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label192: TLabel
                Left = 332
                Top = 97
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label193: TLabel
                Left = 387
                Top = 96
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label194: TLabel
                Left = 16
                Top = 120
                Width = 30
                Height = 12
                Caption = '5'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label195: TLabel
                Left = 103
                Top = 121
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label196: TLabel
                Left = 164
                Top = 121
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label197: TLabel
                Left = 196
                Top = 121
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label198: TLabel
                Left = 271
                Top = 121
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label199: TLabel
                Left = 332
                Top = 121
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label200: TLabel
                Left = 387
                Top = 120
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object ed_week1shh: TAdvEdit
                Left = 72
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 0
                Text = '00'
                Visible = True
                Version = '2.9.3.1'
              end
              object ed_week1smm: TAdvEdit
                Left = 128
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 1
                Text = '00'
                Visible = True
                Version = '2.9.3.1'
              end
              object ed_week1ehh: TAdvEdit
                Tag = 1
                Left = 240
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 2
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_week1emm: TAdvEdit
                Tag = 1
                Left = 304
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 3
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_week1mode: TAdvComboBox
                Left = 464
                Top = 20
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 4
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_week2shh: TAdvEdit
                Tag = 2
                Left = 72
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 5
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_week2smm: TAdvEdit
                Tag = 2
                Left = 128
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 6
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_week2ehh: TAdvEdit
                Tag = 2
                Left = 240
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 7
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_week2emm: TAdvEdit
                Tag = 2
                Left = 304
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 8
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_week2mode: TAdvComboBox
                Left = 464
                Top = 44
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 9
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_week3shh: TAdvEdit
                Tag = 3
                Left = 72
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 10
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_week3smm: TAdvEdit
                Tag = 3
                Left = 128
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 11
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_week3ehh: TAdvEdit
                Tag = 3
                Left = 240
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 12
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_week3emm: TAdvEdit
                Tag = 3
                Left = 304
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 13
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_week3mode: TAdvComboBox
                Left = 464
                Top = 68
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 14
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_week4shh: TAdvEdit
                Tag = 4
                Left = 72
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 15
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_week4smm: TAdvEdit
                Tag = 4
                Left = 128
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 16
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_week4ehh: TAdvEdit
                Tag = 4
                Left = 240
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 17
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_week4emm: TAdvEdit
                Tag = 4
                Left = 304
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 18
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_week4mode: TAdvComboBox
                Left = 464
                Top = 92
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 19
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_week5shh: TAdvEdit
                Tag = 5
                Left = 72
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 20
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_week5smm: TAdvEdit
                Tag = 5
                Left = 128
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 21
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_week5ehh: TAdvEdit
                Left = 240
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 22
                Text = '24'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_week5emm: TAdvEdit
                Left = 304
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 23
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_week5mode: TAdvComboBox
                Left = 464
                Top = 116
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 24
                Text = '0.'#50868#50689#47784#46300
              end
            end
          end
          object tb_weekend: TTabSheet
            Caption = #53664#50836#51068#49828#52992#51460
            ImageIndex = 1
            object gb_Weekend: TAdvGroupBox
              Left = 0
              Top = 0
              Width = 742
              Height = 153
              Align = alTop
              TabOrder = 0
              object Label131: TLabel
                Left = 16
                Top = 24
                Width = 30
                Height = 12
                Caption = '1'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label132: TLabel
                Left = 103
                Top = 25
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label133: TLabel
                Left = 164
                Top = 25
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label134: TLabel
                Left = 196
                Top = 25
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label135: TLabel
                Left = 332
                Top = 25
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label136: TLabel
                Left = 271
                Top = 25
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label137: TLabel
                Left = 387
                Top = 24
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label138: TLabel
                Left = 16
                Top = 48
                Width = 30
                Height = 12
                Caption = '2'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label139: TLabel
                Left = 103
                Top = 49
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label140: TLabel
                Left = 164
                Top = 49
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label141: TLabel
                Left = 196
                Top = 49
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label142: TLabel
                Left = 271
                Top = 49
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label143: TLabel
                Left = 332
                Top = 49
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label144: TLabel
                Left = 387
                Top = 48
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label145: TLabel
                Left = 16
                Top = 72
                Width = 30
                Height = 12
                Caption = '3'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label146: TLabel
                Left = 103
                Top = 73
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label147: TLabel
                Left = 164
                Top = 73
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label148: TLabel
                Left = 196
                Top = 73
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label149: TLabel
                Left = 271
                Top = 73
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label150: TLabel
                Left = 332
                Top = 73
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label151: TLabel
                Left = 387
                Top = 72
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label152: TLabel
                Left = 16
                Top = 96
                Width = 30
                Height = 12
                Caption = '4'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label153: TLabel
                Left = 103
                Top = 97
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label154: TLabel
                Left = 164
                Top = 97
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label155: TLabel
                Left = 196
                Top = 97
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label156: TLabel
                Left = 271
                Top = 97
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label157: TLabel
                Left = 332
                Top = 97
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label158: TLabel
                Left = 387
                Top = 96
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label159: TLabel
                Left = 16
                Top = 120
                Width = 30
                Height = 12
                Caption = '5'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label160: TLabel
                Left = 103
                Top = 121
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label161: TLabel
                Left = 164
                Top = 121
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label162: TLabel
                Left = 196
                Top = 121
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label163: TLabel
                Left = 271
                Top = 121
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label164: TLabel
                Left = 332
                Top = 121
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label165: TLabel
                Left = 387
                Top = 120
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object ed_weekend1shh: TAdvEdit
                Left = 72
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 0
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend1smm: TAdvEdit
                Left = 128
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 1
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend1ehh: TAdvEdit
                Tag = 1
                Left = 240
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 2
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend1emm: TAdvEdit
                Tag = 1
                Left = 304
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 3
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_weekend1mode: TAdvComboBox
                Left = 464
                Top = 20
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 4
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_weekend2shh: TAdvEdit
                Tag = 2
                Left = 72
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 5
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend2smm: TAdvEdit
                Tag = 2
                Left = 128
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 6
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend2ehh: TAdvEdit
                Tag = 2
                Left = 240
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 7
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend2emm: TAdvEdit
                Tag = 2
                Left = 304
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 8
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_weekend2mode: TAdvComboBox
                Left = 464
                Top = 44
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 9
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_weekend3shh: TAdvEdit
                Tag = 3
                Left = 72
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 10
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend3smm: TAdvEdit
                Tag = 3
                Left = 128
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 11
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend3ehh: TAdvEdit
                Tag = 3
                Left = 240
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 12
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend3emm: TAdvEdit
                Tag = 3
                Left = 304
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 13
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_weekend3mode: TAdvComboBox
                Left = 464
                Top = 68
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 14
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_weekend4shh: TAdvEdit
                Tag = 4
                Left = 72
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 15
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend4smm: TAdvEdit
                Tag = 4
                Left = 128
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 16
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend4ehh: TAdvEdit
                Tag = 4
                Left = 240
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 17
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend4emm: TAdvEdit
                Tag = 4
                Left = 304
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 18
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_weekend4mode: TAdvComboBox
                Left = 464
                Top = 92
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 19
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_weekend5shh: TAdvEdit
                Tag = 5
                Left = 72
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 20
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend5smm: TAdvEdit
                Tag = 5
                Left = 128
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 21
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend5ehh: TAdvEdit
                Left = 240
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 22
                Text = '24'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_weekend5emm: TAdvEdit
                Left = 304
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 23
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_weekend5mode: TAdvComboBox
                Left = 464
                Top = 116
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 24
                Text = '0.'#50868#50689#47784#46300
              end
            end
          end
          object tb_sunday: TTabSheet
            Caption = #51068#50836#51068#49828#52992#51460
            ImageIndex = 2
            object gb_sunday: TAdvGroupBox
              Left = 0
              Top = 0
              Width = 742
              Height = 153
              Align = alTop
              TabOrder = 0
              object Label96: TLabel
                Left = 16
                Top = 24
                Width = 30
                Height = 12
                Caption = '1'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label97: TLabel
                Left = 103
                Top = 25
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label98: TLabel
                Left = 164
                Top = 25
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label99: TLabel
                Left = 196
                Top = 25
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label100: TLabel
                Left = 332
                Top = 25
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label101: TLabel
                Left = 271
                Top = 25
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label102: TLabel
                Left = 387
                Top = 24
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label103: TLabel
                Left = 16
                Top = 48
                Width = 30
                Height = 12
                Caption = '2'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label104: TLabel
                Left = 103
                Top = 49
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label105: TLabel
                Left = 164
                Top = 49
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label106: TLabel
                Left = 196
                Top = 49
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label107: TLabel
                Left = 271
                Top = 49
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label108: TLabel
                Left = 332
                Top = 49
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label109: TLabel
                Left = 387
                Top = 48
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label110: TLabel
                Left = 16
                Top = 72
                Width = 30
                Height = 12
                Caption = '3'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label111: TLabel
                Left = 103
                Top = 73
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label112: TLabel
                Left = 164
                Top = 73
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label113: TLabel
                Left = 196
                Top = 73
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label114: TLabel
                Left = 271
                Top = 73
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label115: TLabel
                Left = 332
                Top = 73
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label116: TLabel
                Left = 387
                Top = 72
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label117: TLabel
                Left = 16
                Top = 96
                Width = 30
                Height = 12
                Caption = '4'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label118: TLabel
                Left = 103
                Top = 97
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label119: TLabel
                Left = 164
                Top = 97
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label120: TLabel
                Left = 196
                Top = 97
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label121: TLabel
                Left = 271
                Top = 97
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label122: TLabel
                Left = 332
                Top = 97
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label123: TLabel
                Left = 387
                Top = 96
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label124: TLabel
                Left = 16
                Top = 120
                Width = 30
                Height = 12
                Caption = '5'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label125: TLabel
                Left = 103
                Top = 121
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label126: TLabel
                Left = 164
                Top = 121
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label127: TLabel
                Left = 196
                Top = 121
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label128: TLabel
                Left = 271
                Top = 121
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label129: TLabel
                Left = 332
                Top = 121
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label130: TLabel
                Left = 387
                Top = 120
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object ed_sun1shh: TAdvEdit
                Left = 72
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 0
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun1smm: TAdvEdit
                Left = 128
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 1
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun1ehh: TAdvEdit
                Tag = 1
                Left = 240
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 2
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun1emm: TAdvEdit
                Tag = 1
                Left = 304
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 3
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_sun1mode: TAdvComboBox
                Left = 464
                Top = 20
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 4
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_sun2shh: TAdvEdit
                Tag = 2
                Left = 72
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 5
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun2smm: TAdvEdit
                Tag = 2
                Left = 128
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 6
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun2ehh: TAdvEdit
                Tag = 2
                Left = 240
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 7
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun2emm: TAdvEdit
                Tag = 2
                Left = 304
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 8
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_sun2mode: TAdvComboBox
                Left = 464
                Top = 44
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 9
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_sun3shh: TAdvEdit
                Tag = 3
                Left = 72
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 10
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun3smm: TAdvEdit
                Tag = 3
                Left = 128
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 11
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun3ehh: TAdvEdit
                Tag = 3
                Left = 240
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 12
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun3emm: TAdvEdit
                Tag = 3
                Left = 304
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 13
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_sun3mode: TAdvComboBox
                Left = 464
                Top = 68
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 14
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_sun4shh: TAdvEdit
                Tag = 4
                Left = 72
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 15
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun4smm: TAdvEdit
                Tag = 4
                Left = 128
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 16
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun4ehh: TAdvEdit
                Tag = 4
                Left = 240
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 17
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun4emm: TAdvEdit
                Tag = 4
                Left = 304
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 18
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_sun4mode: TAdvComboBox
                Left = 464
                Top = 92
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 19
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_sun5shh: TAdvEdit
                Tag = 5
                Left = 72
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 20
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun5smm: TAdvEdit
                Tag = 5
                Left = 128
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 21
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun5ehh: TAdvEdit
                Left = 240
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 22
                Text = '24'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_sun5emm: TAdvEdit
                Left = 304
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 23
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_sun5mode: TAdvComboBox
                Left = 464
                Top = 116
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 24
                Text = '0.'#50868#50689#47784#46300
              end
            end
          end
          object tb_holiday1: TTabSheet
            Caption = #53945#51221#51068'1'#49828#52992#51460
            ImageIndex = 3
            object gb_Holiday1: TAdvGroupBox
              Left = 0
              Top = 0
              Width = 742
              Height = 153
              Align = alTop
              TabOrder = 0
              object Label60: TLabel
                Left = 16
                Top = 24
                Width = 30
                Height = 12
                Caption = '1'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label61: TLabel
                Left = 103
                Top = 25
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label62: TLabel
                Left = 164
                Top = 25
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label63: TLabel
                Left = 196
                Top = 25
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label64: TLabel
                Left = 332
                Top = 25
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label65: TLabel
                Left = 271
                Top = 25
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label66: TLabel
                Left = 387
                Top = 24
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label67: TLabel
                Left = 16
                Top = 48
                Width = 30
                Height = 12
                Caption = '2'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label68: TLabel
                Left = 103
                Top = 49
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label69: TLabel
                Left = 164
                Top = 49
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label70: TLabel
                Left = 196
                Top = 49
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label71: TLabel
                Left = 271
                Top = 49
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label72: TLabel
                Left = 332
                Top = 49
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label73: TLabel
                Left = 387
                Top = 48
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label74: TLabel
                Left = 16
                Top = 72
                Width = 30
                Height = 12
                Caption = '3'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label75: TLabel
                Left = 103
                Top = 73
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label76: TLabel
                Left = 164
                Top = 73
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label77: TLabel
                Left = 196
                Top = 73
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label78: TLabel
                Left = 271
                Top = 73
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label79: TLabel
                Left = 332
                Top = 73
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label80: TLabel
                Left = 387
                Top = 72
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label81: TLabel
                Left = 16
                Top = 96
                Width = 30
                Height = 12
                Caption = '4'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label82: TLabel
                Left = 103
                Top = 97
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label83: TLabel
                Left = 164
                Top = 97
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label84: TLabel
                Left = 196
                Top = 97
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label85: TLabel
                Left = 271
                Top = 97
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label86: TLabel
                Left = 332
                Top = 97
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label88: TLabel
                Left = 387
                Top = 96
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label89: TLabel
                Left = 16
                Top = 120
                Width = 30
                Height = 12
                Caption = '5'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label90: TLabel
                Left = 103
                Top = 121
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label91: TLabel
                Left = 164
                Top = 121
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label92: TLabel
                Left = 196
                Top = 121
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label93: TLabel
                Left = 271
                Top = 121
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label94: TLabel
                Left = 332
                Top = 121
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label95: TLabel
                Left = 387
                Top = 120
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object ed_holiday11shh: TAdvEdit
                Left = 72
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 0
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday11smm: TAdvEdit
                Left = 128
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 1
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday11ehh: TAdvEdit
                Tag = 1
                Left = 240
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 2
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday11emm: TAdvEdit
                Tag = 1
                Left = 304
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 3
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday11mode: TAdvComboBox
                Left = 464
                Top = 20
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 4
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_holiday12shh: TAdvEdit
                Tag = 2
                Left = 72
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 5
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday12smm: TAdvEdit
                Tag = 2
                Left = 128
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 6
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday12ehh: TAdvEdit
                Tag = 2
                Left = 240
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 7
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday12emm: TAdvEdit
                Tag = 2
                Left = 304
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 8
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday12mode: TAdvComboBox
                Left = 464
                Top = 44
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 9
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_holiday13shh: TAdvEdit
                Tag = 3
                Left = 72
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 10
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday13smm: TAdvEdit
                Tag = 3
                Left = 128
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 11
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday13ehh: TAdvEdit
                Tag = 3
                Left = 240
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 12
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday13emm: TAdvEdit
                Tag = 3
                Left = 304
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 13
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday13mode: TAdvComboBox
                Left = 464
                Top = 68
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 14
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_holiday14shh: TAdvEdit
                Tag = 4
                Left = 72
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 15
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday14smm: TAdvEdit
                Tag = 4
                Left = 128
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 16
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday14ehh: TAdvEdit
                Tag = 4
                Left = 240
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 17
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday14emm: TAdvEdit
                Tag = 4
                Left = 304
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 18
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday14mode: TAdvComboBox
                Left = 464
                Top = 92
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 19
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_holiday15shh: TAdvEdit
                Tag = 5
                Left = 72
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 20
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday15smm: TAdvEdit
                Tag = 5
                Left = 128
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 21
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday15ehh: TAdvEdit
                Left = 240
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 22
                Text = '24'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday15emm: TAdvEdit
                Left = 304
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 23
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday15mode: TAdvComboBox
                Left = 464
                Top = 116
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 24
                Text = '0.'#50868#50689#47784#46300
              end
            end
          end
          object tb_holiday2: TTabSheet
            Caption = #53945#51221#51068'2'#49828#52992#51460
            ImageIndex = 4
            object gb_Holiday2: TAdvGroupBox
              Left = 0
              Top = 0
              Width = 742
              Height = 153
              Align = alTop
              TabOrder = 0
              object Label201: TLabel
                Left = 16
                Top = 24
                Width = 30
                Height = 12
                Caption = '1'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label202: TLabel
                Left = 103
                Top = 25
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label203: TLabel
                Left = 164
                Top = 25
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label204: TLabel
                Left = 196
                Top = 25
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label205: TLabel
                Left = 332
                Top = 25
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label206: TLabel
                Left = 271
                Top = 25
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label207: TLabel
                Left = 387
                Top = 24
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label208: TLabel
                Left = 16
                Top = 48
                Width = 30
                Height = 12
                Caption = '2'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label209: TLabel
                Left = 103
                Top = 49
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label210: TLabel
                Left = 164
                Top = 49
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label211: TLabel
                Left = 196
                Top = 49
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label212: TLabel
                Left = 271
                Top = 49
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label213: TLabel
                Left = 332
                Top = 49
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label214: TLabel
                Left = 387
                Top = 48
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label215: TLabel
                Left = 16
                Top = 72
                Width = 30
                Height = 12
                Caption = '3'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label216: TLabel
                Left = 103
                Top = 73
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label217: TLabel
                Left = 164
                Top = 73
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label218: TLabel
                Left = 196
                Top = 73
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label219: TLabel
                Left = 271
                Top = 73
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label220: TLabel
                Left = 332
                Top = 73
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label221: TLabel
                Left = 387
                Top = 72
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label222: TLabel
                Left = 16
                Top = 96
                Width = 30
                Height = 12
                Caption = '4'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label223: TLabel
                Left = 103
                Top = 97
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label224: TLabel
                Left = 164
                Top = 97
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label225: TLabel
                Left = 196
                Top = 97
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label226: TLabel
                Left = 271
                Top = 97
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label227: TLabel
                Left = 332
                Top = 97
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label228: TLabel
                Left = 387
                Top = 96
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label229: TLabel
                Left = 16
                Top = 120
                Width = 30
                Height = 12
                Caption = '5'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label230: TLabel
                Left = 103
                Top = 121
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label231: TLabel
                Left = 164
                Top = 121
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label232: TLabel
                Left = 196
                Top = 121
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label233: TLabel
                Left = 271
                Top = 121
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label234: TLabel
                Left = 332
                Top = 121
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label235: TLabel
                Left = 387
                Top = 120
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object ed_holiday21shh: TAdvEdit
                Left = 72
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 0
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday21smm: TAdvEdit
                Left = 128
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 1
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday21ehh: TAdvEdit
                Tag = 1
                Left = 240
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 2
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday21emm: TAdvEdit
                Tag = 1
                Left = 304
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 3
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday21mode: TAdvComboBox
                Left = 464
                Top = 20
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 4
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_holiday22shh: TAdvEdit
                Tag = 2
                Left = 72
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 5
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday22smm: TAdvEdit
                Tag = 2
                Left = 128
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 6
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday22ehh: TAdvEdit
                Tag = 2
                Left = 240
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 7
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday22emm: TAdvEdit
                Tag = 2
                Left = 304
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 8
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday22mode: TAdvComboBox
                Left = 464
                Top = 44
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 9
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_holiday23shh: TAdvEdit
                Tag = 3
                Left = 72
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 10
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday23smm: TAdvEdit
                Tag = 3
                Left = 128
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 11
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday23ehh: TAdvEdit
                Tag = 3
                Left = 240
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 12
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday23emm: TAdvEdit
                Tag = 3
                Left = 304
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 13
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday23mode: TAdvComboBox
                Left = 464
                Top = 68
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 14
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_holiday24shh: TAdvEdit
                Tag = 4
                Left = 72
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 15
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday24smm: TAdvEdit
                Tag = 4
                Left = 128
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 16
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday24ehh: TAdvEdit
                Tag = 4
                Left = 240
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 17
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday24emm: TAdvEdit
                Tag = 4
                Left = 304
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 18
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday24mode: TAdvComboBox
                Left = 464
                Top = 92
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 19
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_holiday25shh: TAdvEdit
                Tag = 5
                Left = 72
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 20
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday25smm: TAdvEdit
                Tag = 5
                Left = 128
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 21
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday25ehh: TAdvEdit
                Left = 240
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 22
                Text = '24'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday25emm: TAdvEdit
                Left = 304
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 23
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday25mode: TAdvComboBox
                Left = 464
                Top = 116
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 24
                Text = '0.'#50868#50689#47784#46300
              end
            end
          end
          object tb_holiday3: TTabSheet
            Caption = #53945#51221#51068'3'#49828#52992#51460
            ImageIndex = 5
            object gb_Holiday3: TAdvGroupBox
              Left = 0
              Top = 0
              Width = 742
              Height = 153
              Align = alTop
              TabOrder = 0
              object lb_Section11: TLabel
                Left = 16
                Top = 24
                Width = 30
                Height = 12
                Caption = '1'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object lb_StartHH11: TLabel
                Left = 103
                Top = 25
                Width = 12
                Height = 12
                Caption = #49884
              end
              object lb_StartMM11: TLabel
                Left = 164
                Top = 25
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label87: TLabel
                Left = 196
                Top = 25
                Width = 9
                Height = 12
                Caption = '~'
              end
              object lb_EndMM11: TLabel
                Left = 332
                Top = 25
                Width = 12
                Height = 12
                Caption = #48516
              end
              object lb_EndHH11: TLabel
                Left = 271
                Top = 25
                Width = 12
                Height = 12
                Caption = #49884
              end
              object lb_Mode11: TLabel
                Left = 387
                Top = 24
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label32: TLabel
                Left = 16
                Top = 48
                Width = 30
                Height = 12
                Caption = '2'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label33: TLabel
                Left = 103
                Top = 49
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label34: TLabel
                Left = 164
                Top = 49
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label35: TLabel
                Left = 196
                Top = 49
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label36: TLabel
                Left = 271
                Top = 49
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label37: TLabel
                Left = 332
                Top = 49
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label38: TLabel
                Left = 387
                Top = 48
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label39: TLabel
                Left = 16
                Top = 72
                Width = 30
                Height = 12
                Caption = '3'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label40: TLabel
                Left = 103
                Top = 73
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label41: TLabel
                Left = 164
                Top = 73
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label42: TLabel
                Left = 196
                Top = 73
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label43: TLabel
                Left = 271
                Top = 73
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label44: TLabel
                Left = 332
                Top = 73
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label45: TLabel
                Left = 387
                Top = 72
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label46: TLabel
                Left = 16
                Top = 96
                Width = 30
                Height = 12
                Caption = '4'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label47: TLabel
                Left = 103
                Top = 97
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label48: TLabel
                Left = 164
                Top = 97
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label49: TLabel
                Left = 196
                Top = 97
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label50: TLabel
                Left = 271
                Top = 97
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label51: TLabel
                Left = 332
                Top = 97
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label52: TLabel
                Left = 387
                Top = 96
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label53: TLabel
                Left = 16
                Top = 120
                Width = 30
                Height = 12
                Caption = '5'#44396#44036
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label54: TLabel
                Left = 103
                Top = 121
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label55: TLabel
                Left = 164
                Top = 121
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label56: TLabel
                Left = 196
                Top = 121
                Width = 9
                Height = 12
                Caption = '~'
              end
              object Label57: TLabel
                Left = 271
                Top = 121
                Width = 12
                Height = 12
                Caption = #49884
              end
              object Label58: TLabel
                Left = 332
                Top = 121
                Width = 12
                Height = 12
                Caption = #48516
              end
              object Label59: TLabel
                Left = 387
                Top = 120
                Width = 48
                Height = 12
                Caption = #46041#51089#47784#46300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object ed_holiday31shh: TAdvEdit
                Left = 72
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 0
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday31smm: TAdvEdit
                Left = 128
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 1
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday31ehh: TAdvEdit
                Tag = 1
                Left = 240
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 2
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday31emm: TAdvEdit
                Tag = 1
                Left = 304
                Top = 22
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 3
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday31mode: TAdvComboBox
                Left = 464
                Top = 20
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 4
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_holiday32shh: TAdvEdit
                Tag = 2
                Left = 72
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 5
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday32smm: TAdvEdit
                Tag = 2
                Left = 128
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 6
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday32ehh: TAdvEdit
                Tag = 2
                Left = 240
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 7
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday32emm: TAdvEdit
                Tag = 2
                Left = 304
                Top = 46
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 8
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday32mode: TAdvComboBox
                Left = 464
                Top = 44
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 9
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_holiday33shh: TAdvEdit
                Tag = 3
                Left = 72
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 10
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday33smm: TAdvEdit
                Tag = 3
                Left = 128
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 11
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday33ehh: TAdvEdit
                Tag = 3
                Left = 240
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 12
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday33emm: TAdvEdit
                Tag = 3
                Left = 304
                Top = 70
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 13
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday33mode: TAdvComboBox
                Left = 464
                Top = 68
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 14
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_holiday34shh: TAdvEdit
                Tag = 4
                Left = 72
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 15
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday34smm: TAdvEdit
                Tag = 4
                Left = 128
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 16
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday34ehh: TAdvEdit
                Tag = 4
                Left = 240
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 17
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday34emm: TAdvEdit
                Tag = 4
                Left = 304
                Top = 94
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 18
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday34mode: TAdvComboBox
                Left = 464
                Top = 92
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 19
                Text = '0.'#50868#50689#47784#46300
              end
              object ed_holiday35shh: TAdvEdit
                Tag = 5
                Left = 72
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 20
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday35smm: TAdvEdit
                Tag = 5
                Left = 128
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 21
                Text = '00'
                Visible = True
                OnKeyUp = ed_week2shhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday35ehh: TAdvEdit
                Left = 240
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 22
                Text = '24'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object ed_holiday35emm: TAdvEdit
                Left = 304
                Top = 118
                Width = 25
                Height = 18
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                Lookup.Separator = ';'
                Color = clWindow
                Enabled = False
                ImeName = 'Microsoft IME 2010'
                MaxLength = 2
                TabOrder = 23
                Text = '00'
                Visible = True
                OnKeyUp = ed_week1ehhKeyUp
                Version = '2.9.3.1'
              end
              object cmb_holiday35mode: TAdvComboBox
                Left = 464
                Top = 116
                Width = 185
                Height = 22
                Color = clWindow
                Version = '1.4.0.0'
                Visible = True
                ButtonWidth = 18
                Style = csOwnerDrawFixed
                DropWidth = 0
                Enabled = True
                ImeName = 'Microsoft IME 2010'
                ItemIndex = 0
                ItemHeight = 16
                Items.Strings = (
                  '0.'#50868#50689#47784#46300
                  '1.'#44060#48169#47784#46300
                  '2.'#54224#49604#47784#46300
                  '3.'#47560#49828#53552#47784#46300)
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
                TabOrder = 24
                Text = '0.'#50868#50689#47784#46300
              end
            end
          end
        end
        object AdvPanel1: TAdvPanel
          Left = 0
          Top = 193
          Width = 750
          Height = 56
          Align = alTop
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          UseDockManager = True
          Version = '2.1.0.4'
          Caption.Color = clHighlight
          Caption.ColorTo = clNone
          Caption.Font.Charset = DEFAULT_CHARSET
          Caption.Font.Color = clWindowText
          Caption.Font.Height = -12
          Caption.Font.Name = #44404#47548
          Caption.Font.Style = []
          StatusBar.Font.Charset = DEFAULT_CHARSET
          StatusBar.Font.Color = clWindowText
          StatusBar.Font.Height = -11
          StatusBar.Font.Name = 'Tahoma'
          StatusBar.Font.Style = []
          FullHeight = 200
          object btn_TextSave: TRzBitBtn
            Left = 11
            Top = 9
            Width = 87
            Height = 30
            Caption = #51201#50857
            Color = 15791348
            HighlightColor = 16026986
            HotTrack = True
            HotTrackColor = 3983359
            TabOrder = 0
            OnClick = btn_TextSaveClick
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
    end
    object AdvPanel2: TAdvPanel
      Left = 1
      Top = 1
      Width = 758
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UseDockManager = True
      Version = '2.1.0.4'
      Caption.Color = clHighlight
      Caption.ColorTo = clNone
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -12
      Caption.Font.Name = #44404#47548
      Caption.Font.Style = []
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clWindowText
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      FullHeight = 200
      object lb_SelectDoor: TLabel
        Left = 0
        Top = 8
        Width = 758
        Height = 24
        Align = alBottom
        AutoSize = False
        Caption = #49440#53469#46108' '#52636#51077#47928' : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuHighlight
        Font.Height = -16
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited CommandArray: TCommandArray
    Commands = <
      item
        CommandName = 'GRADEREFRESH'
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
  object Query_Sch: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 1024
    Top = 56
  end
  object Query_Door: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 1064
    Top = 56
  end
end
