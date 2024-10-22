inherited fmTreeEmployee: TfmTreeEmployee
  Left = 207
  Top = 214
  Width = 1024
  Height = 640
  Caption = #44060#48324#49324#50896#44288#47532
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter2: TSplitter [0]
    Left = 305
    Top = 73
    Width = 1
    Height = 540
  end
  object AdvPageControl1: TAdvPageControl [1]
    Left = 0
    Top = 73
    Width = 305
    Height = 540
    ActivePage = AdvTabSheet1
    ActiveFont.Charset = DEFAULT_CHARSET
    ActiveFont.Color = clWindowText
    ActiveFont.Height = -11
    ActiveFont.Name = 'Tahoma'
    ActiveFont.Style = []
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabBackGroundColor = clBtnFace
    TabMargin.RightMargin = 0
    TabOverlap = 0
    RoundEdges = True
    Version = '2.0.0.3'
    PersistPagesState.Location = plRegistry
    PersistPagesState.Enabled = False
    TabOrder = 0
    object AdvTabSheet1: TAdvTabSheet
      Caption = #48516#47448
      Color = clBtnFace
      ColorTo = clNone
      TabColor = clBtnFace
      TabColorTo = clNone
      object AdvPanel3: TAdvPanel
        Left = 0
        Top = 0
        Width = 297
        Height = 512
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UseDockManager = True
        Version = '2.1.0.4'
        AutoHideChildren = False
        BorderColor = clGray
        BorderShadow = True
        Caption.Color = clHighlight
        Caption.ColorTo = clBlue
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clHighlightText
        Caption.Font.Height = -11
        Caption.Font.Name = 'Verdana'
        Caption.Font.Style = []
        Caption.Indent = 2
        Caption.Visible = True
        CollapsColor = clBtnFace
        CollapsDelay = 0
        ColorTo = 14938354
        HoverColor = clBlack
        HoverFontColor = clBlack
        ShadowColor = clBlack
        ShadowOffset = 0
        StatusBar.BorderColor = clGray
        StatusBar.BorderStyle = bsSingle
        StatusBar.Font.Charset = DEFAULT_CHARSET
        StatusBar.Font.Color = clWindowText
        StatusBar.Font.Height = -11
        StatusBar.Font.Name = 'Tahoma'
        StatusBar.Font.Style = []
        StatusBar.Color = 14938354
        StatusBar.ColorTo = clWhite
        Styler = AdvPanelStyler2
        FullHeight = 0
        object TreeView_Location: TTreeView
          Left = 0
          Top = 18
          Width = 297
          Height = 494
          Align = alClient
          BorderStyle = bsNone
          HotTrack = True
          Images = toolslist
          Indent = 19
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
        object TreeView_LocationCode: TTreeView
          Left = 42
          Top = 328
          Width = 203
          Height = 81
          Align = alCustom
          BorderStyle = bsNone
          HotTrack = True
          Images = toolslist
          Indent = 19
          TabOrder = 1
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
  end
  object AdvPanel1: TAdvPanel [2]
    Left = 306
    Top = 73
    Width = 710
    Height = 540
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    Version = '2.1.0.4'
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    FullHeight = 0
    object Splitter1: TSplitter
      Left = 1
      Top = 190
      Width = 708
      Height = 1
      Cursor = crVSplit
      Align = alBottom
    end
    object pan_Employee: TAdvPanel
      Left = 1
      Top = 191
      Width = 708
      Height = 348
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UseDockManager = True
      Visible = False
      Version = '2.1.0.4'
      AutoHideChildren = False
      BorderColor = clGray
      BorderShadow = True
      Caption.Color = clHighlight
      Caption.ColorTo = clBlue
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clHighlightText
      Caption.Font.Height = -11
      Caption.Font.Name = 'Verdana'
      Caption.Font.Style = []
      Caption.Indent = 2
      Caption.Text = '<FONT size="12"><center><B>'#52628#44032'</B></center></FONT>'
      Caption.Visible = True
      CollapsColor = clBtnFace
      CollapsDelay = 0
      ColorTo = 14938354
      HoverColor = clBlack
      HoverFontColor = clBlack
      ShadowColor = clBlack
      ShadowOffset = 0
      StatusBar.BorderColor = clGray
      StatusBar.BorderStyle = bsSingle
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clWindowText
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      StatusBar.Color = 14938354
      StatusBar.ColorTo = clWhite
      Styler = AdvPanelStyler2
      DesignSize = (
        708
        348)
      FullHeight = 0
      object lb_CompanyName: TLabel
        Left = 16
        Top = 34
        Width = 48
        Height = 13
        Caption = #54924#49324#53076#46300
      end
      object lb_JijumName: TLabel
        Left = 16
        Top = 58
        Width = 48
        Height = 13
        Caption = #51648#51216#53076#46300
      end
      object lb_DepartName: TLabel
        Left = 16
        Top = 82
        Width = 48
        Height = 13
        Caption = #48512#49436#53076#46300
      end
      object lb_PosiName: TLabel
        Left = 16
        Top = 106
        Width = 48
        Height = 13
        Caption = #51649#50948#53076#46300
      end
      object lb_emType: TLabel
        Left = 16
        Top = 131
        Width = 48
        Height = 13
        Caption = #51649#50896#53076#46300
      end
      object lb_sabun: TLabel
        Left = 16
        Top = 155
        Width = 48
        Height = 13
        Caption = #49324'      '#48264
      end
      object lb_Name: TLabel
        Left = 16
        Top = 179
        Width = 48
        Height = 13
        Caption = #51060'      '#47492
      end
      object Label6: TLabel
        Left = 16
        Top = 203
        Width = 60
        Height = 13
        Caption = #55092#45824#54256#48264#54840
      end
      object Label7: TLabel
        Left = 16
        Top = 252
        Width = 48
        Height = 13
        Caption = #52852#46300#48264#54840
      end
      object lb_OutDate: TLabel
        Left = 320
        Top = 251
        Width = 36
        Height = 13
        Caption = #51333#47308#51068
      end
      object lb_CompanyPhone: TLabel
        Left = 16
        Top = 228
        Width = 72
        Height = 13
        Caption = #49324#45236#51204#54868#48264#54840
      end
      object cmb_Company: TRzComboBox
        Tag = 3
        Left = 126
        Top = 30
        Width = 171
        Height = 21
        Style = csDropDownList
        Ctl3D = False
        FlatButtons = True
        FrameVisible = True
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
        OnChange = cmb_CompanyChange
      end
      object cmb_Jijum: TRzComboBox
        Tag = 3
        Left = 126
        Top = 54
        Width = 171
        Height = 21
        Style = csDropDownList
        Ctl3D = False
        FlatButtons = True
        FrameVisible = True
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 1
        OnChange = cmb_JijumChange
      end
      object cmb_Depart: TRzComboBox
        Tag = 3
        Left = 126
        Top = 78
        Width = 171
        Height = 21
        Style = csDropDownList
        Ctl3D = False
        FlatButtons = True
        FrameVisible = True
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
      end
      object cmb_Posi: TRzComboBox
        Tag = 3
        Left = 126
        Top = 102
        Width = 171
        Height = 21
        Style = csDropDownList
        Ctl3D = False
        FlatButtons = True
        FrameVisible = True
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 3
      end
      object cmb_emType: TRzComboBox
        Tag = 3
        Left = 126
        Top = 127
        Width = 171
        Height = 21
        Style = csDropDownList
        Ctl3D = False
        FlatButtons = True
        FrameVisible = True
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 4
      end
      object ed_EmpNo: TEdit
        Left = 126
        Top = 151
        Width = 171
        Height = 19
        Ctl3D = False
        ImeName = 'Microsoft IME 2003'
        ParentCtl3D = False
        TabOrder = 5
      end
      object ed_Name: TEdit
        Left = 126
        Top = 175
        Width = 171
        Height = 19
        Ctl3D = False
        ImeName = 'Microsoft IME 2003'
        ParentCtl3D = False
        TabOrder = 6
      end
      object ed_Handphone: TEdit
        Left = 126
        Top = 199
        Width = 171
        Height = 19
        Ctl3D = False
        ImeName = 'Microsoft IME 2003'
        ParentCtl3D = False
        TabOrder = 7
      end
      object ed_CardNo: TEdit
        Left = 126
        Top = 248
        Width = 171
        Height = 19
        Ctl3D = False
        ImeName = 'Microsoft IME 2003'
        ParentCtl3D = False
        TabOrder = 8
      end
      object Panel5: TPanel
        Left = 320
        Top = 32
        Width = 161
        Height = 169
        BevelOuter = bvLowered
        TabOrder = 9
        object Image1: TImage
          Left = 1
          Top = 1
          Width = 159
          Height = 167
          Align = alClient
          Stretch = True
          OnClick = Image1Click
        end
      end
      object btn_Save: TXiButton
        Left = 96
        Top = 296
        Width = 193
        Height = 41
        ColorFace = clWhite
        ColorGrad = 16776176
        ColorDark = 16776176
        ColorLight = clWhite
        ColorBorder = clBlue
        ColorText = clBlack
        OverColorFace = clWhite
        OverColorGrad = clWhite
        OverColorDark = clHighlight
        OverColorLight = clWhite
        OverColorBorder = clBlue
        OverColorText = clBlack
        DownColorFace = 2865919
        DownColorGrad = clWhite
        DownColorDark = 9099775
        DownColorLight = 30647
        DownColorBorder = clBlue
        DownColorText = clBlack
        DisabledColorFace = 15658734
        DisabledColorGrad = clWhite
        DisabledColorDark = 13816530
        DisabledColorLight = clWhite
        DisabledColorBorder = clGray
        DisabledColorText = clGray
        ColorFocusRect = 16776176
        ColorScheme = csCustom
        Ctl3D = True
        Layout = blGlyphLeft
        Spacing = 4
        TransparentGlyph = True
        Gradient = True
        HotTrack = True
        Caption = #51200#51109
        TabOrder = 10
        Visible = False
        OnClick = btn_SaveClick
      end
      object btn_Cancel: TXiButton
        Left = 312
        Top = 296
        Width = 193
        Height = 41
        ColorFace = clWhite
        ColorGrad = 16776176
        ColorDark = 16776176
        ColorLight = clWhite
        ColorBorder = clBlue
        ColorText = clBlack
        OverColorFace = clWhite
        OverColorGrad = clWhite
        OverColorDark = clHighlight
        OverColorLight = clWhite
        OverColorBorder = clBlue
        OverColorText = clBlack
        DownColorFace = 2865919
        DownColorGrad = clWhite
        DownColorDark = 9099775
        DownColorLight = 30647
        DownColorBorder = clBlue
        DownColorText = clBlack
        DisabledColorFace = 15658734
        DisabledColorGrad = clWhite
        DisabledColorDark = 13816530
        DisabledColorLight = clWhite
        DisabledColorBorder = clGray
        DisabledColorText = clGray
        ColorFocusRect = 16776176
        ColorScheme = csCustom
        Ctl3D = True
        Layout = blGlyphLeft
        Spacing = 4
        TransparentGlyph = True
        Gradient = True
        HotTrack = True
        Caption = #52712#49548
        TabOrder = 11
        Visible = False
        OnClick = btn_CancelClick
      end
      object dt_RetireDt: TDateTimePicker
        Left = 368
        Top = 247
        Width = 145
        Height = 20
        Date = 2958464.456619827000000000
        Time = 2958464.456619827000000000
        ImeName = 'Microsoft IME 2003'
        TabOrder = 12
        OnChange = dt_RetireDtChange
      end
      object ed_EmpImg: TEdit
        Left = 488
        Top = 32
        Width = 169
        Height = 21
        ImeName = 'Microsoft IME 2003'
        TabOrder = 13
        Visible = False
      end
      object st_Exit: TStaticText
        Left = 696
        Top = 0
        Width = 13
        Height = 16
        Anchors = [akTop, akRight]
        Caption = 'X'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 14
        OnClick = st_ExitClick
      end
      object ed_CompanyPhone: TEdit
        Left = 126
        Top = 224
        Width = 171
        Height = 19
        Ctl3D = False
        ImeName = 'Microsoft IME 2003'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 15
      end
      object ed_OldEmpNo: TEdit
        Left = 318
        Top = 207
        Width = 171
        Height = 19
        Ctl3D = False
        ImeName = 'Microsoft IME 2003'
        ParentCtl3D = False
        TabOrder = 16
        Visible = False
      end
    end
    object sg_Employ: TAdvStringGrid
      Left = 1
      Top = 1
      Width = 708
      Height = 189
      Cursor = crDefault
      Align = alClient
      ColCount = 23
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
      PopupMenu = PopupMenu_Employee
      ScrollBars = ssBoth
      TabOrder = 1
      OnDblClick = sg_EmployDblClick
      OnResize = sg_EmployResize
      OnSelectionChanged = sg_EmploySelectionChanged
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        #54924#49324#47749
        #51648#51216#47749
        #48512#49436#47749
        #51649#50948#47749
        #49324#48264
        #51060#47492
        #52852#46300#48264#54840
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
        #52852#46300#46321#47197#44396#48516
        #51648#47928#48264#54840)
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
      SortSettings.AutoFormat = False
      Version = '6.0.4.4'
      ColWidths = (
        167
        119
        100
        82
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
        90)
      object pan_gauge: TPanel
        Left = 34
        Top = 96
        Width = 329
        Height = 73
        TabOrder = 3
        Visible = False
        object Label8: TLabel
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
  object AdvPanel2: TAdvPanel [3]
    Left = 0
    Top = 0
    Width = 1016
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    UseDockManager = True
    Version = '2.1.0.4'
    AutoHideChildren = False
    BorderColor = clGray
    BorderShadow = True
    Caption.Color = clHighlight
    Caption.ColorTo = clBlue
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Verdana'
    Caption.Font.Style = []
    Caption.Indent = 2
    Caption.Text = '<FONT size="12"><center><B>'#44060#48324#49324#50896#44288#47532'</B></center></FONT>'
    CollapsColor = clBtnFace
    CollapsDelay = 0
    ColorTo = 14938354
    HoverColor = clBlack
    HoverFontColor = clBlack
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clGray
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 14938354
    StatusBar.ColorTo = clWhite
    Styler = AdvPanelStyler1
    DesignSize = (
      1016
      73)
    FullHeight = 0
    object btn_Close: TXiButton
      Left = 840
      Top = 24
      Width = 160
      Height = 41
      ColorFace = clWhite
      ColorGrad = 16776176
      ColorDark = 16776176
      ColorLight = clWhite
      ColorBorder = clBlue
      ColorText = clBlack
      OverColorFace = clWhite
      OverColorGrad = clWhite
      OverColorDark = clHighlight
      OverColorLight = clWhite
      OverColorBorder = clBlue
      OverColorText = clBlack
      DownColorFace = 2865919
      DownColorGrad = clWhite
      DownColorDark = 9099775
      DownColorLight = 30647
      DownColorBorder = clBlue
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 16776176
      ColorScheme = csCustom
      Ctl3D = True
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Anchors = [akTop, akRight]
      Caption = #45803#44592
      TabOrder = 0
      OnClick = btn_CloseClick
    end
    object btn_Update: TXiButton
      Left = 336
      Top = 24
      Width = 160
      Height = 41
      ColorFace = clWhite
      ColorGrad = 16776176
      ColorDark = 16776176
      ColorLight = clWhite
      ColorBorder = clBlue
      ColorText = clBlack
      OverColorFace = clWhite
      OverColorGrad = clWhite
      OverColorDark = clHighlight
      OverColorLight = clWhite
      OverColorBorder = clBlue
      OverColorText = clBlack
      DownColorFace = 2865919
      DownColorGrad = clWhite
      DownColorDark = 9099775
      DownColorLight = 30647
      DownColorBorder = clBlue
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 16776176
      ColorScheme = csCustom
      Ctl3D = True
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Anchors = [akTop, akRight]
      Caption = #49688#51221
      TabOrder = 1
      OnClick = btn_UpdateClick
    end
    object btn_Add: TXiButton
      Left = 168
      Top = 24
      Width = 160
      Height = 41
      ColorFace = clWhite
      ColorGrad = 16776176
      ColorDark = 16776176
      ColorLight = clWhite
      ColorBorder = clBlue
      ColorText = clBlack
      OverColorFace = clWhite
      OverColorGrad = clWhite
      OverColorDark = clHighlight
      OverColorLight = clWhite
      OverColorBorder = clBlue
      OverColorText = clBlack
      DownColorFace = 2865919
      DownColorGrad = clWhite
      DownColorDark = 9099775
      DownColorLight = 30647
      DownColorBorder = clBlue
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 16776176
      ColorScheme = csCustom
      Ctl3D = True
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Anchors = [akTop, akRight]
      Caption = #52628#44032
      TabOrder = 2
      OnClick = btn_AddClick
    end
    object btn_Delete: TXiButton
      Left = 504
      Top = 24
      Width = 160
      Height = 41
      ColorFace = clWhite
      ColorGrad = 16776176
      ColorDark = 16776176
      ColorLight = clWhite
      ColorBorder = clBlue
      ColorText = clBlack
      OverColorFace = clWhite
      OverColorGrad = clWhite
      OverColorDark = clHighlight
      OverColorLight = clWhite
      OverColorBorder = clBlue
      OverColorText = clBlack
      DownColorFace = 2865919
      DownColorGrad = clWhite
      DownColorDark = 9099775
      DownColorLight = 30647
      DownColorBorder = clBlue
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 16776176
      ColorScheme = csCustom
      Ctl3D = True
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Anchors = [akTop, akRight]
      Caption = #49325#51228
      TabOrder = 3
      OnClick = btn_DeleteClick
    end
    object btn_Excel: TXiButton
      Left = 672
      Top = 24
      Width = 160
      Height = 41
      ColorFace = clWhite
      ColorGrad = 16776176
      ColorDark = 16776176
      ColorLight = clWhite
      ColorBorder = clBlue
      ColorText = clBlack
      OverColorFace = clWhite
      OverColorGrad = clWhite
      OverColorDark = clHighlight
      OverColorLight = clWhite
      OverColorBorder = clBlue
      OverColorText = clBlack
      DownColorFace = 2865919
      DownColorGrad = clWhite
      DownColorDark = 9099775
      DownColorLight = 30647
      DownColorBorder = clBlue
      DownColorText = clBlack
      DisabledColorFace = 15658734
      DisabledColorGrad = clWhite
      DisabledColorDark = 13816530
      DisabledColorLight = clWhite
      DisabledColorBorder = clGray
      DisabledColorText = clGray
      ColorFocusRect = 16776176
      ColorScheme = csCustom
      Ctl3D = True
      Layout = blGlyphLeft
      Spacing = 4
      TransparentGlyph = True
      Gradient = True
      HotTrack = True
      Anchors = [akTop, akRight]
      Caption = #50641#49472
      TabOrder = 4
      OnClick = btn_ExcelClick
    end
    object ed_SelectID: TEdit
      Left = 16
      Top = 32
      Width = 97
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 5
      Text = 'ed_SelectID'
      Visible = False
    end
  end
  inherited CommandArray: TCommandArray
    Commands = <
      item
        CommandName = 'Close'
        CommandKind = 0
        Name = 'TClose'
        OnExecute = CommandArrayCommandsTCloseExecute
      end>
  end
  object AdvPanelStyler1: TAdvPanelStyler
    Tag = 0
    AutoThemeAdapt = True
    Settings.AnchorHint = False
    Settings.AutoHideChildren = False
    Settings.BevelInner = bvNone
    Settings.BevelOuter = bvNone
    Settings.BevelWidth = 1
    Settings.BorderColor = clGray
    Settings.BorderShadow = True
    Settings.BorderStyle = bsNone
    Settings.BorderWidth = 0
    Settings.CanMove = False
    Settings.CanSize = False
    Settings.Caption.Color = clHighlight
    Settings.Caption.ColorTo = clBlue
    Settings.Caption.Font.Charset = DEFAULT_CHARSET
    Settings.Caption.Font.Color = clHighlightText
    Settings.Caption.Font.Height = -11
    Settings.Caption.Font.Name = 'Verdana'
    Settings.Caption.Font.Style = []
    Settings.Caption.Indent = 2
    Settings.Collaps = False
    Settings.CollapsColor = clBtnFace
    Settings.CollapsDelay = 0
    Settings.CollapsSteps = 0
    Settings.Color = clWhite
    Settings.ColorTo = 14938354
    Settings.ColorMirror = clNone
    Settings.ColorMirrorTo = clNone
    Settings.Cursor = crDefault
    Settings.Font.Charset = DEFAULT_CHARSET
    Settings.Font.Color = clWindowText
    Settings.Font.Height = -11
    Settings.Font.Name = 'Verdana'
    Settings.Font.Style = []
    Settings.FixedTop = False
    Settings.FixedLeft = False
    Settings.FixedHeight = False
    Settings.FixedWidth = False
    Settings.Height = 120
    Settings.Hover = False
    Settings.HoverColor = clBlack
    Settings.HoverFontColor = clBlack
    Settings.Indent = 0
    Settings.ShadowColor = clBlack
    Settings.ShadowOffset = 0
    Settings.ShowHint = False
    Settings.ShowMoveCursor = False
    Settings.StatusBar.BorderColor = clGray
    Settings.StatusBar.BorderStyle = bsSingle
    Settings.StatusBar.Font.Charset = DEFAULT_CHARSET
    Settings.StatusBar.Font.Color = clWindowText
    Settings.StatusBar.Font.Height = -11
    Settings.StatusBar.Font.Name = 'Tahoma'
    Settings.StatusBar.Font.Style = []
    Settings.StatusBar.Color = 14938354
    Settings.StatusBar.ColorTo = clWhite
    Settings.TextVAlign = tvaTop
    Settings.TopIndent = 0
    Settings.URLColor = clBlue
    Settings.Width = 0
    Comments = #49324#50896#44288#47532
    Left = 339
    Top = 2
  end
  object AdvPanelStyler2: TAdvPanelStyler
    Tag = 0
    Settings.AnchorHint = False
    Settings.AutoHideChildren = False
    Settings.BevelInner = bvNone
    Settings.BevelOuter = bvNone
    Settings.BevelWidth = 1
    Settings.BorderColor = clGray
    Settings.BorderShadow = True
    Settings.BorderStyle = bsNone
    Settings.BorderWidth = 0
    Settings.CanMove = False
    Settings.CanSize = False
    Settings.Caption.Color = clHighlight
    Settings.Caption.ColorTo = clBlue
    Settings.Caption.Font.Charset = DEFAULT_CHARSET
    Settings.Caption.Font.Color = clHighlightText
    Settings.Caption.Font.Height = -11
    Settings.Caption.Font.Name = 'Verdana'
    Settings.Caption.Font.Style = []
    Settings.Caption.Indent = 2
    Settings.Caption.Visible = True
    Settings.Collaps = False
    Settings.CollapsColor = clBtnFace
    Settings.CollapsDelay = 0
    Settings.CollapsSteps = 0
    Settings.Color = clWhite
    Settings.ColorTo = 14938354
    Settings.ColorMirror = clNone
    Settings.ColorMirrorTo = clNone
    Settings.Cursor = crDefault
    Settings.Font.Charset = DEFAULT_CHARSET
    Settings.Font.Color = clWindowText
    Settings.Font.Height = -11
    Settings.Font.Name = 'Verdana'
    Settings.Font.Style = []
    Settings.FixedTop = False
    Settings.FixedLeft = False
    Settings.FixedHeight = False
    Settings.FixedWidth = False
    Settings.Height = 120
    Settings.Hover = False
    Settings.HoverColor = clBlack
    Settings.HoverFontColor = clBlack
    Settings.Indent = 0
    Settings.ShadowColor = clBlack
    Settings.ShadowOffset = 0
    Settings.ShowHint = False
    Settings.ShowMoveCursor = False
    Settings.StatusBar.BorderColor = clGray
    Settings.StatusBar.BorderStyle = bsSingle
    Settings.StatusBar.Font.Charset = DEFAULT_CHARSET
    Settings.StatusBar.Font.Color = clWindowText
    Settings.StatusBar.Font.Height = -11
    Settings.StatusBar.Font.Name = 'Tahoma'
    Settings.StatusBar.Font.Style = []
    Settings.StatusBar.Color = 14938354
    Settings.StatusBar.ColorTo = clWhite
    Settings.TextVAlign = tvaTop
    Settings.TopIndent = 0
    Settings.URLColor = clBlue
    Settings.Width = 0
    Left = 315
    Top = 322
  end
  object toolslist: TImageList
    BkColor = clWhite
    Left = 168
    Top = 352
    Bitmap = {
      494C010106000900040010001000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
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
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0004D30400624C3700C09263008870560088705600AD855F00DCA3
      6A00DCA36A00DCA36A00C09263009B795A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0007B607007A5D4100DCA36A00DCA36A00C0926300AD855F00DCA3
      6A00B78B600088705600A5815D00C9966600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000080808000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000C8B0C00AB805500A5815D007E695400A5815D00C9966600DCA3
      6A00DCA36A00C09263009B795A0088705600FFFFFF00FFFFFF00000000000000
      0000808080008080800000000000000000008080800080808000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0011611100B8895B00DCA36A00C9966600B78B6000AD855F00DCA3
      6A00B78B6000A5815D00C9966600DCA36A00FFFFFF0000000000808080000000
      000000000000000000000000000000000000FFFF0000FFFFFF00808080008080
      800080808000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0012521200D29D67007E6954009B795A00B78B6000D29D6700DCA3
      6A00DCA36A00AB8055006D543D003D3328008080800080808000808080000000
      0000808080000000000080808000FFFF0000FFFF0000FFFFFF0000000000FFFF
      FF008080800080808000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003D332800DCA36A00DCA36A00DCA36A00C4925F0093704C005643
      3200433E3A007070700036363600F1F1F1008080800080808000808080000000
      0000808080008080800080808000FFFF000080808000FFFFFF0080808000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0003E2030056433200AB8055006D543D003D332800272727009A9A9A004444
      4400D4D4D400FFFFFF0053535300C5C5C5008080800080808000808080008080
      8000808080008080800080808000FFFF000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0004D30400153515000F6F0F0007B6070009A8090053535300F1F1F1004444
      44007E7E7E0044444400272727007E7E7E00FFFFFF00FFFFFF00FFFFFF00FFFF
      00008080800080808000FFFF00008080800080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C8B0C0019191900535353003636
      3600C5C5C500FFFFFF0044444400FFFFFF00FFFFFF00FFFFFF00000000008080
      800080808000FFFF0000FFFF00008080800080808000FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C8B0C008C8C8C00FFFFFF005353
      5300C5C5C5008C8C8C002727270044424200FFFFFF00FFFFFF00000000008080
      800080808000FFFF0000808080008080800080808000FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00116111003636360036363600453A
      3A00725C5C00AB888800D8AAAA00C99F9F00FFFFFF00FFFFFF00000000008080
      800080808000FFFF000080808000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0007B607000F6F0F0025332300725C
      5C00AB888800544545004A3B2D003D332800FFFFFF00FFFFFF00000000000000
      00000000800000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      8000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0004D3
      04000A990A004A3B2D00C4925F0026221D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00808080000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0026221D003129230044444400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000080808000FFFFFF0000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0004D304000A990A0011611100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      800000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      8000FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C4921008C49
      21008C4921008C4921008C4921008C4921008C4921008C4921008C4921008C49
      2100FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FDFD
      FD00EDEDED00E0E0E000B9B9B9005757570075757500D3D3D300F4F4F400FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C492100F7DB
      A500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA5008C4921008C49
      21008C492100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDADE001515
      1500000000000400000017171900747673009291920024242400000000002D2D
      2D008A8A8A00EEEEEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00007F7F7F007F7F7F00BFBFBF007F7F7F00000000007F7F7F00BFBFBF007F7F
      7F007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008C492100F7DB
      A500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA5008C492100EFC7
      AD008C4921008C492100FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00DDDDDD0000000000AAA5
      A000CDD2D800CCCFD600CEC8C600A9AAAA007E7E7E00E4E4E400E1E1E100C0C0
      C0005454540044444400FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F7F7F00000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000FFFFFF0073756B0073756B008C492100F7DB
      A500FFFFFF008C492100F7DBA500FFFFFF008C492100F7DBA5008C492100EFC7
      AD00EFC7AD008C49210073756B0073756B0000FF000000FF000000FF00000000
      0000FFFFFF0080808000FFFFFF00FFFFFF008080800080808000FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF0080808000FFFFFF0000000000D3D5D400DBDC
      DB00E5AA6B00ECAA6100DFB79D00CDC7C700C1C1C10081828200E1E1E100D6D6
      D600DDDDDD0024242400E4E4E400FFFFFF00FFFFFF00FFFFFF00000000007F7F
      7F007F7F7F007F7F7F00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF007F7F
      7F007F7F7F007F7F7F0000000000FFFFFF0000FF000000FF00008C492100F7DB
      A5008C4921008C492100F7DBA5008C4921008C492100F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF000000FF00000000
      0000FFFFFF0080808000FFFFFF00FFFFFF008080800080808000FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF0080808000DDDDDD005A5A5A00E4E6E800EC77
      3600FE831B00FCA05A00FD964C00F4914E00CECACC00A49F9F00DFD8DA00DADC
      DC00F6F3F200E3E1E00021212100FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000FFFFFF0000FF000000FF00008C492100F7DB
      A500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF000000FF00000000
      0000FFFFFF0080808000FFFFFF00FFFFFF008080800080808000FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF008080800085858500BCBCBC00EADAD100FF60
      1C00F9762100FD8B4700FB9B6300FA955800DEAF9300C3C5C700C5C2C400E5E3
      E200EDEAE800F0EFED004C4C4C00E2E2E200FFFFFF00FFFFFF00000000007F7F
      7F007F7F7F007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000FFFFFF0000FF000000FF00008C492100F7DB
      A500FFFFFF008C492100F7DBA500FFFFFF008C492100F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008D8D8D00CFD0D000F4CCC600FF91
      7A00FA7E4800FA7A3E00FD996400FE905B00E6B39E00CDD0CF007BC6A100C8F1
      DB00E4E6E600DEDBDE0081818100F9F9F900FFFFFF00FFFFFF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000FFFFFF0000FF000000FF00008C492100F7DB
      A5008C4921008C492100F7DBA5008C4921008C492100F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEBEB0099999900F4F4F400F975
      6400F9C7B600FB997100FD966500FD906300E1CFC100BDC2C1005BF2A40056F1
      A5004DEB9800E2E7E50021212100FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF0000FF000000FF00008C492100F7DB
      A500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA500F7DBA5008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000B0B0B00FFFFFF00F2D1
      D200F7917500FD9C7400F67D5700E5AF9C00ECEAEC008BA0910096FACD006FF7
      B10060F4AB00F8F8F8003A3A3A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF0000000000FFFFFF00FFFFFF00FFFFFF0000FF000000FF00008C4921008C49
      21008C4921008C4921008C4921008C4921008C4921008C4921008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF000000FF00000000
      000000808000008080000080800000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000FEFEFE00FFFFFF0028242600FFFF
      FF00FAFCFD00F1EFED00F0F3F400F3F3F300A1A2A200FFFFFF00FDFDFF00FFFF
      FC00FAFAF700E0DDE100AEAEAE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF0000000000FFFFFF00FFFFFF00FFFFFF0000FF000000FF00008C492100D696
      1000D6961000D6961000D6961000D6961000D6961000D69610008C492100EFC7
      AD00EFC7AD008C49210000FF000000FF000000FF000000FF000000FF00000000
      00000080800000808000008080000080800000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000FFFFFF00FEFEFE00FFFFFF003F3F
      3F00A0A09F00BCBCBC00C9C9C800DFDFDF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFFFF008E8E8E00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF0000000000FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF00008C49
      2100D6961000D6961000D6961000D6961000D6961000D6961000D69610008C49
      2100EFC7AD008C49210000FF000000FF000000FF000000FF000000FF000000FF
      00000000000000808000008080000080800000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00373737007C7C7C00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE001E1E1E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F00BFBFBF00000000000000000000000000BFBFBF007F7F
      7F007F7F7F00FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF
      00008C492100D6961000D6961000D6961000D6961000D6961000D6961000D696
      10008C4921008C49210000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000000000000000000008080000080800000FFFF0000FFFF0000FF
      FF00000000000000000000FF000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B2B2B200404040006E6E6E00CFCFCF00FFFFFF00EFEF
      EF00EEEEEE0054545400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF
      000000FF00008C4921008C4921008C4921008C4921008C4921008C4921008C49
      21008C49210000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000000000008080000080800000FFFF000000
      00000000000000FF000000FF000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA009B9B9B003E3E
      3E0055555500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000000000008080000080800000FFFF000000
      000000FF000000FF000000FF000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F800FFFF00000000F800F84F00000000
      F800C03300000000F800804500000000F800005300000000F800005D00000000
      F000007F00000000F000E07F00000000FF00C07700000000FF00C07500000000
      FF00C03D00000000FF00C12D00000000FFE0F00100000000FFF8F14700000000
      FFF8F80700000000FFFFFC3F00000000FFFFCE81FFFFFC1FC00F0000E00FF007
      C0070000C003E003C00300008003C00100000B008001C00100000B000001C001
      00000B000000C001000000000000C00100001FFF0001E00300000000A001F1C7
      000000005041F1C700000000A0F1F1C700000000F1F3F00700000000FC23F80F
      00000000FF87FC1F00000000FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object RzOpenDialog1: TOpenDialog
    Left = 692
    Top = 372
  end
  object fdmsADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 440
    Top = 112
  end
  object FileCtrl: TLMDFileCtrl
    Options = [ffNoActionConfirm, ffShowNoProgress, ffUseRecycleBin]
    Left = 699
    Top = 405
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'XLS'
    Filter = 'EXCEL Files (*.xls)|*.xls|All Files (*.*)|*.*'
    InitialDir = #51200#51109#54624' '#54028#51068#51012' '#49440#53469' '#46608#45716' '#51077#47141' '#54616#49464#50836
    Options = [ofOverwritePrompt, ofHideReadOnly]
    Left = 728
    Top = 32
  end
  object PopupMenu_Employee: TPopupMenu
    AutoHotkeys = maManual
    Left = 619
    Top = 157
    object mn_add: TMenuItem
      Caption = #52628#44032
      OnClick = btn_AddClick
    end
    object mn_Update: TMenuItem
      Caption = #49688#51221
      OnClick = btn_UpdateClick
    end
    object mn_delete: TMenuItem
      Caption = #49325#51228
      OnClick = btn_DeleteClick
    end
  end
end
