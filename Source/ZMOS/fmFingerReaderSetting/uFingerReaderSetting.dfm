inherited fmFingerReaderSetting: TfmFingerReaderSetting
  Left = 681
  Top = 450
  Width = 696
  Height = 577
  Caption = #51648#47928#47532#45908#44288#47532
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton2: TSpeedButton [0]
    Left = 360
    Top = 64
    Width = 73
    Height = 25
    Caption = #52628#44032
    Flat = True
  end
  object AdvSmoothPanel1: TAdvSmoothPanel [1]
    Left = 0
    Top = 0
    Width = 688
    Height = 543
    Cursor = crDefault
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -11
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -16
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Fill.Color = clWhite
    Fill.ColorTo = clWhite
    Fill.ColorMirror = clWhite
    Fill.ColorMirrorTo = clWhite
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = clWhite
    Fill.Rounding = 10
    Fill.ShadowOffset = 0
    Fill.Glow = gmNone
    Version = '1.2.1.0'
    Align = alClient
    TabOrder = 0
    object lb_FingerReaderIP: TAdvSmoothLabel
      Left = 32
      Top = 39
      Width = 81
      Height = 22
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtSolid
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Caption.Text = #51648#47928#47532#45908'IP'
      Caption.Location = plCenterLeft
      Caption.Font.Charset = HANGEUL_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -11
      Caption.Font.Name = #47569#51008' '#44256#46357
      Caption.Font.Style = []
      Caption.ColorStart = clBlack
      Caption.ColorEnd = clBlack
      CaptionShadow.Text = #51648#47928#47532#45908'IP'
      CaptionShadow.Font.Charset = DEFAULT_CHARSET
      CaptionShadow.Font.Color = clWindowText
      CaptionShadow.Font.Height = -27
      CaptionShadow.Font.Name = 'Tahoma'
      CaptionShadow.Font.Style = []
      Version = '1.5.0.1'
    end
    object lb_FingerReaderName: TAdvSmoothLabel
      Left = 32
      Top = 63
      Width = 81
      Height = 22
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtSolid
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Caption.Text = #51648#47928#47532#45908#47749
      Caption.Location = plCenterLeft
      Caption.Font.Charset = HANGEUL_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -11
      Caption.Font.Name = #47569#51008' '#44256#46357
      Caption.Font.Style = []
      Caption.ColorStart = clBlack
      Caption.ColorEnd = clBlack
      CaptionShadow.Text = #51648#47928#47532#45908#47749
      CaptionShadow.Font.Charset = DEFAULT_CHARSET
      CaptionShadow.Font.Color = clWindowText
      CaptionShadow.Font.Height = -27
      CaptionShadow.Font.Name = 'Tahoma'
      CaptionShadow.Font.Style = []
      Version = '1.5.0.1'
    end
    object btn_Image: TSpeedButton
      Left = 280
      Top = 60
      Width = 73
      Height = 25
      Caption = #51312#54924
      OnClick = btn_ImageClick
    end
    object SpeedButton1: TSpeedButton
      Left = 360
      Top = 60
      Width = 73
      Height = 25
      Caption = #52628#44032
    end
    object SpeedButton3: TSpeedButton
      Left = 440
      Top = 60
      Width = 73
      Height = 25
      Caption = #49325#51228
    end
    object SpeedButton4: TSpeedButton
      Left = 520
      Top = 60
      Width = 73
      Height = 25
      Caption = #51648#47928#51116#51204#49569
    end
    object SpeedButton5: TSpeedButton
      Left = 600
      Top = 60
      Width = 73
      Height = 25
      Caption = #45803#44592
      OnClick = SpeedButton5Click
    end
    object ed_ReaderIP: TAdvEdit
      Left = 120
      Top = 40
      Width = 145
      Height = 21
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      ImeName = 'Microsoft IME 2010'
      TabOrder = 0
      Visible = True
      Version = '2.9.3.1'
    end
    object ed_SearchName: TAdvEdit
      Left = 120
      Top = 64
      Width = 145
      Height = 21
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      ImeName = 'Microsoft IME 2010'
      TabOrder = 1
      Visible = True
      Version = '2.9.3.1'
    end
    object sg_List: TAdvStringGrid
      Left = 16
      Top = 96
      Width = 657
      Height = 425
      Cursor = crDefault
      ColCount = 8
      FixedCols = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 2
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        ''
        #51648#47928#47532#45908'IP'
        #51648#47928#47532#45908#47749
        #51648#47928#47532#45908#49692#48264
        #52968#53944#47204#47084'ID'
        #47532#45908#54252#53944#48264#54840
        #47532#45908'ID'
        #47532#45908#53440#51077)
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
      FixedColWidth = 43
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
      Version = '6.0.4.4'
      ColWidths = (
        43
        151
        148
        106
        110
        83
        102
        64)
    end
  end
end
