object fmCompanyGrade: TfmCompanyGrade
  Left = 375
  Top = 177
  Width = 606
  Height = 472
  Caption = #54924#49324#44428#54620#44288#47532
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 598
    Height = 373
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object Panel15: TPanel
      Left = 1
      Top = 1
      Width = 233
      Height = 371
      Align = alLeft
      TabOrder = 0
      object sg_Company: TAdvStringGrid
        Left = 1
        Top = 34
        Width = 231
        Height = 336
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
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing, goRowSelect]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        Multilinecells = True
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
        FixedColWidth = 85
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        ColumnHeaders.Strings = (
          #54924#49324#53076#46300
          #54924#49324#47749)
        Filter = <>
        Version = '3.3.0.1'
        ColWidths = (
          85
          116)
      end
      object Panel19: TPanel
        Left = 1
        Top = 1
        Width = 231
        Height = 33
        Align = alTop
        Caption = #54924#49324#53076#46300' '#47785#47197
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentBackground = True
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel16: TPanel
      Left = 234
      Top = 1
      Width = 112
      Height = 371
      Align = alLeft
      TabOrder = 1
      object btn_CompanyGradeInsert: TSpeedButton
        Left = 16
        Top = 101
        Width = 81
        Height = 33
        Caption = #44428#54620#46321#47197
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333FF33333333FF333993333333300033377F3333333777333993333333
          300033F77FFF3333377739999993333333333777777F3333333F399999933333
          33003777777333333377333993333333330033377F3333333377333993333333
          3333333773333333333F333333333333330033333333F33333773333333C3333
          330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
          333333333337733333FF3333333C333330003333333733333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = btn_CompanyGradeInsertClick
      end
      object btn_CompanyGradeDelete: TSpeedButton
        Left = 16
        Top = 170
        Width = 81
        Height = 33
        Caption = #44428#54620#49325#51228
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          300033FFFFFF3333377739999993333333333777777F3333333F399999933333
          3300377777733333337733333333333333003333333333333377333333333333
          3333333333333333333F333333333333330033333F33333333773333C3333333
          330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
          333333377F33333333FF3333C333333330003333733333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = btn_CompanyGradeDeleteClick
      end
      object Panel20: TPanel
        Left = 1
        Top = 1
        Width = 110
        Height = 33
        Align = alTop
        Caption = #44428#54620#44288#47532
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentBackground = True
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel17: TPanel
      Left = 346
      Top = 1
      Width = 251
      Height = 371
      Align = alClient
      TabOrder = 2
      object sg_GradeCompany: TAdvStringGrid
        Left = 1
        Top = 34
        Width = 249
        Height = 336
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
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing, goRowSelect]
        ParentFont = False
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
        FixedColWidth = 84
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        ColumnHeaders.Strings = (
          #54924#49324#53076#46300
          #54924#49324#47749)
        Filter = <>
        Version = '3.3.0.1'
        ColWidths = (
          84
          128)
      end
      object Panel21: TPanel
        Left = 1
        Top = 1
        Width = 249
        Height = 33
        Align = alTop
        Caption = #49440#53469#50500#51060#46356#44428#54620#51312#54924
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentBackground = True
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 598
    Height = 65
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 72
      Height = 12
      Caption = #50868#50689#51088#50500#51060#46356
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 60
      Height = 12
      Caption = #50868#50689#51088#51060#47493
    end
    object btn_Close: TSpeedButton
      Left = 456
      Top = 16
      Width = 121
      Height = 33
      Caption = #45803#44592
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
      OnClick = btn_CloseClick
    end
    object st_Userid: TStaticText
      Left = 104
      Top = 14
      Width = 201
      Height = 16
      AutoSize = False
      BevelKind = bkFlat
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object st_userName: TStaticText
      Left = 104
      Top = 38
      Width = 201
      Height = 16
      AutoSize = False
      BevelKind = bkFlat
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
end
