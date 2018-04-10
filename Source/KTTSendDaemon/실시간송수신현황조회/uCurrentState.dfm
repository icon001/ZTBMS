inherited fmCurrentState: TfmCurrentState
  Left = 441
  Top = 271
  Width = 1016
  Height = 607
  Caption = #49892#49884#44036' '#49569#49688#49888' '#54788#54889' '#51312#54924
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
  object AdvPanel1: TAdvPanel [0]
    Left = 0
    Top = 0
    Width = 1008
    Height = 65
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
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
    object btn_stop: TSpeedButton
      Left = 672
      Top = 16
      Width = 97
      Height = 33
      Caption = #51473#51648
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
      OnClick = btn_stopClick
    end
    object btn_start: TSpeedButton
      Left = 568
      Top = 16
      Width = 97
      Height = 33
      Caption = #49884#51089
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
      OnClick = btn_startClick
    end
    object btn_Clear: TSpeedButton
      Left = 776
      Top = 16
      Width = 97
      Height = 33
      Caption = #54868#47732'Clear'
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
      OnClick = btn_ClearClick
    end
    object btn_FileSave: TSpeedButton
      Left = 880
      Top = 16
      Width = 97
      Height = 33
      Caption = #54868#51068#51200#51109
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666000
        0000000000006666666604074770400000006666666604074770400000006666
        6666044777744000000066666666044444444000000066666666047777774000
        000066666666047FFFF74000000066666666047FFFF70000000060000066047F
        FFF7400000008777780600000000000000008FF7780666661166660000008F7F
        780666611116660000008FF7780666111111660000008F7F7806666611666600
        00008FF7780666661166660000008888880666611866660000008FF7F7011111
        866666000000688888666666666666000000}
      OnClick = btn_FileSaveClick
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 8
      Width = 497
      Height = 49
      Caption = #51312#54924#51312#44148
      Columns = 4
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        #51204#52404#51312#54924
        'MCU'#48324' '#51312#54924
        'ECU'#48324' '#51312#54924
        #47749#47161#50612#48324' '#51312#54924)
      ParentFont = False
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object ed_cmd: TEdit
      Left = 384
      Top = 44
      Width = 41
      Height = 21
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
      Visible = False
    end
    object ed_subcmd: TEdit
      Left = 424
      Top = 44
      Width = 41
      Height = 21
      ImeName = 'Microsoft IME 2003'
      TabOrder = 2
      Visible = False
    end
  end
  object AdvPanel2: TAdvPanel [1]
    Left = 0
    Top = 65
    Width = 1008
    Height = 508
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
    object AdvStringGrid1: TAdvStringGrid
      Left = 1
      Top = 1
      Width = 1006
      Height = 506
      Cursor = crDefault
      Align = alClient
      ColCount = 7
      DefaultRowHeight = 21
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowMoving]
      PopupMenu = PopupMenu1
      ScrollBars = ssVertical
      TabOrder = 0
      OnKeyDown = AdvStringGrid1KeyDown
      OnResize = AdvStringGrid1Resize
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        #49884#44036
        #49569#49688#49888
        #47749#47161
        'IP'
        'ECUID'
        #45936#51060#53552)
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
      FixedColWidth = 92
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
      SelectionColor = clWindow
      ShowSelection = False
      Version = '6.0.4.4'
      ColWidths = (
        92
        58
        51
        90
        64
        64
        64)
    end
  end
  object GroupBox1: TGroupBox [2]
    Left = 40
    Top = 48
    Width = 297
    Height = 41
    TabOrder = 2
    Visible = False
    object IP: TLabel
      Left = 8
      Top = 16
      Width = 12
      Height = 12
      Caption = 'IP'
    end
    object lb_ECUID: TLabel
      Left = 144
      Top = 16
      Width = 30
      Height = 12
      Caption = 'ECUID'
    end
    object ed_ip: TEdit
      Left = 32
      Top = 10
      Width = 97
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
    end
    object ed_ecuid: TEdit
      Left = 184
      Top = 10
      Width = 97
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
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
        CommandName = 'Close'
        CommandKind = 0
        Name = 'TCommand1'
        OnExecute = CommandArrayCommandsTCommand1Execute
      end>
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'csv'
    Filter = 'CSV Files (*.csv)|*.csv|All Files (*.*)|*.*'
    InitialDir = #51200#51109#54624' '#54028#51068#51012' '#49440#53469' '#46608#45716' '#51077#47141' '#54616#49464#50836
    Options = [ofOverwritePrompt, ofHideReadOnly]
    Left = 72
    Top = 448
  end
  object SearchTimer: TTimer
    Interval = 5
    OnTimer = SearchTimerTimer
    Left = 64
    Top = 224
  end
  object PopupMenu1: TPopupMenu
    Left = 233
    Top = 178
    object mn_DoorOpen: TMenuItem
      Caption = #52636#51077#47928#44060#48169
      OnClick = mn_DoorOpenClick
    end
  end
end
