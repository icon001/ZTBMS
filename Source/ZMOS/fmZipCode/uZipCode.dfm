inherited fmZipCode: TfmZipCode
  Left = 441
  Top = 142
  Width = 416
  Height = 397
  Caption = #50864#54200#48264#54840#44160#49353
  Font.Height = -12
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox [0]
    Left = 0
    Top = 0
    Width = 408
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 22
      Width = 48
      Height = 12
      Caption = #51021'/'#47732'/'#46041
    end
    object ed_Dong: TEdit
      Left = 80
      Top = 18
      Width = 121
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      OnKeyPress = ed_DongKeyPress
    end
    object btn_Search: TBitBtn
      Left = 216
      Top = 16
      Width = 65
      Height = 25
      Caption = #44160#49353
      TabOrder = 1
      OnClick = btn_SearchClick
    end
  end
  object StatusBar1: TStatusBar [1]
    Left = 0
    Top = 336
    Width = 408
    Height = 27
    Panels = <
      item
        Text = #44160#49353#54980' '#45908#48660#53364#47533' '#54616#49884#47732' '#51201#50857#46121#45768#45796'.'
        Width = 5000
      end>
  end
  object sg_ZipCode: TAdvStringGrid [2]
    Left = 0
    Top = 57
    Width = 408
    Height = 279
    Cursor = crDefault
    Align = alClient
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
    ScrollBars = ssVertical
    TabOrder = 2
    OnDblClick = sg_ZipCodeDblClick
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
    FixedColWidth = 70
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = [fsBold]
    FloatFormat = '%.2f'
    ColumnHeaders.Strings = (
      #50864#54200#48264#54840
      #49884'/'#46020
      #44396'/'#44400
      #51021'/'#47732'/'#46041
      #48264#51648)
    Filter = <>
    Version = '3.3.0.1'
    ColWidths = (
      70
      72
      76
      69
      90)
  end
end
