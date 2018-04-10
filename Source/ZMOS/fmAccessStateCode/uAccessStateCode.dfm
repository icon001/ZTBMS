object fmAccessStateCode: TfmAccessStateCode
  Left = 446
  Top = 121
  Width = 354
  Height = 480
  Caption = #52636#51077#49849#51064#49345#53468#53076#46300#44288#47532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 340
    Width = 346
    Height = 106
    Align = alBottom
    TabOrder = 0
    object Label8: TLabel
      Left = 16
      Top = 10
      Width = 114
      Height = 12
      Caption = #52636#51077#49849#51064#53076#46300'(1'#51088#47532')'
    end
    object Label1: TLabel
      Left = 16
      Top = 34
      Width = 96
      Height = 12
      Caption = #52636#51077#49849#51064#53076#46300#47749#52845
    end
    object btn_AccessDelete: TSpeedButton
      Left = 248
      Top = 65
      Width = 81
      Height = 25
      Caption = #49325#51228
      OnClick = btn_AccessDeleteClick
    end
    object btn_AccessSave: TSpeedButton
      Left = 168
      Top = 65
      Width = 81
      Height = 25
      Caption = #51200#51109
      OnClick = btn_AccessSaveClick
    end
    object btn_AccessUpdate: TSpeedButton
      Left = 88
      Top = 65
      Width = 81
      Height = 25
      Caption = #49688#51221
      OnClick = btn_AccessUpdateClick
    end
    object btn_AccessInsert: TSpeedButton
      Left = 8
      Top = 65
      Width = 81
      Height = 25
      Caption = #49888#44508#51077#47141
      OnClick = btn_AccessInsertClick
    end
    object ed_AccessStateCode: TEdit
      Left = 136
      Top = 6
      Width = 129
      Height = 20
      ImeName = 'Microsoft IME 2003'
      MaxLength = 1
      TabOrder = 0
      OnKeyPress = ed_AccessStateCodeKeyPress
    end
    object ed_AccessStateName: TEdit
      Left = 136
      Top = 30
      Width = 185
      Height = 20
      ImeName = 'Microsoft IME 2003'
      MaxLength = 30
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 346
    Height = 25
    Align = alTop
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 25
    Width = 346
    Height = 315
    Align = alClient
    TabOrder = 2
    object sg_AccessStateCode: TAdvStringGrid
      Left = 1
      Top = 1
      Width = 344
      Height = 313
      Cursor = crDefault
      Align = alClient
      ColCount = 2
      DefaultColWidth = 150
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
      TabOrder = 0
      OnClick = sg_AccessStateCodeClick
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
      FixedColWidth = 94
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      ColumnHeaders.Strings = (
        #52636#51077#49849#51064#53076#46300
        #52636#51077#49849#51064#53076#46300#47749)
      Filter = <>
      Version = '3.3.0.1'
      ColWidths = (
        94
        210)
    end
  end
end
