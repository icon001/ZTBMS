inherited fmDoorAntiPass: TfmDoorAntiPass
  Left = 356
  Top = 146
  Width = 516
  Height = 362
  Caption = #52636#51077#47928' '#50504#54000#54056#49828#49444#51221
  Font.Height = -12
  Font.Name = #47569#51008' '#44256#46357
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object BodyPanel: TPanel [0]
    Left = 0
    Top = 0
    Width = 508
    Height = 328
    Align = alClient
    TabOrder = 0
    object lb_List: TLabel
      Left = 18
      Top = 18
      Width = 194
      Height = 28
      Caption = #52636#51077#47928' '#50504#54000#54056#49828' '#49444#51221
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object sg_List: TAdvStringGrid
      Left = 16
      Top = 72
      Width = 473
      Height = 209
      Cursor = crDefault
      ColCount = 8
      FixedCols = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      OnCheckBoxClick = sg_ListCheckBoxClick
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        ''
        #52636#51077#47928#47749
        #50504#54000#54056#49828#44536#47353)
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
      FixedColWidth = 26
      FixedRowHeight = 22
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
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurrence'
      SearchFooter.HintFindPrev = 'Find previous occurrence'
      SearchFooter.HintHighlight = 'Highlight occurrences'
      SearchFooter.MatchCaseCaption = 'Match case'
      SortSettings.Show = True
      SortSettings.AutoFormat = False
      Version = '6.0.4.4'
      ColWidths = (
        26
        204
        218
        64
        64
        64
        64
        64)
    end
    object btn_AntiGroup: TAdvGlowButton
      Left = 368
      Top = 44
      Width = 121
      Height = 20
      Caption = 'ANTIPASS GROUP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btn_AntiGroupClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object pan_AntiGroup: TPanel
      Left = 72
      Top = 136
      Width = 345
      Height = 89
      TabOrder = 2
      Visible = False
      object AdvSmoothLabel1: TAdvSmoothLabel
        Left = 16
        Top = 19
        Width = 113
        Height = 16
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'ANTIPASS GROUP'
        Caption.Font.Charset = ANSI_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -12
        Caption.Font.Name = #47569#51008' '#44256#46357
        Caption.Font.Style = []
        Caption.ColorStart = clBlack
        Caption.ColorEnd = clBlack
        CaptionShadow.Text = 'ANTIPASS GROUP'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.5.0.1'
      end
      object cmb_AntiGroup: TComboBox
        Left = 136
        Top = 16
        Width = 193
        Height = 23
        Style = csDropDownList
        ImeName = 'Microsoft IME 2010'
        ItemHeight = 15
        TabOrder = 0
      end
      object btn_AntiGroupSelect: TAdvGlowButton
        Left = 98
        Top = 56
        Width = 80
        Height = 22
        Caption = #51201#50857
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btn_AntiGroupSelectClick
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
      end
      object btn_AntiGroupCancel: TAdvGlowButton
        Left = 184
        Top = 58
        Width = 80
        Height = 20
        Caption = #52712#49548
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btn_AntiGroupCancelClick
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
      end
    end
  end
end
