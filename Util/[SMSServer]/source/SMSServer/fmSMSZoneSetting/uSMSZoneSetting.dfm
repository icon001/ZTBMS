inherited fmSMSZoneSetting: TfmSMSZoneSetting
  Left = 374
  Top = 252
  Width = 1079
  Height = 640
  Caption = #51316#48324#50508#46988#49444#51221
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter2: TSplitter [0]
    Left = 561
    Top = 41
    Height = 531
  end
  object StatusBar1: TStatusBar [1]
    Left = 0
    Top = 572
    Width = 1071
    Height = 34
    Panels = <>
  end
  object pan_header: TPanel [2]
    Left = 0
    Top = 0
    Width = 1071
    Height = 41
    Align = alTop
    Caption = #51316#48324#50508#46988#49444#51221
    Color = 15387318
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Panel5: TPanel [3]
    Left = 0
    Top = 41
    Width = 561
    Height = 531
    Align = alLeft
    TabOrder = 2
    object GroupBox11: TGroupBox
      Left = 1
      Top = 1
      Width = 559
      Height = 144
      Align = alTop
      TabOrder = 0
      object Label9: TLabel
        Left = 16
        Top = 112
        Width = 60
        Height = 12
        Caption = #52968#53944#47204#47084#47749
      end
      object lb_Building1: TLabel
        Left = 16
        Top = 16
        Width = 48
        Height = 12
        Caption = #48716#46377#53076#46300
      end
      object lb_FloorCode1: TLabel
        Left = 16
        Top = 40
        Width = 36
        Height = 12
        Caption = #52789#53076#46300
      end
      object lb_AreaCode1: TLabel
        Left = 16
        Top = 64
        Width = 48
        Height = 12
        Caption = #44396#50669#53076#46300
      end
      object Label2: TLabel
        Left = 16
        Top = 88
        Width = 48
        Height = 12
        Caption = #47700#51064#44396#48516
      end
      object cmb_AlarmCode: TComboBox
        Left = 96
        Top = 108
        Width = 209
        Height = 20
        Style = csDropDownList
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 0
        OnChange = cmb_AlarmCodeChange
      end
      object cmb_BuildingCode1: TComboBox
        Left = 96
        Top = 12
        Width = 210
        Height = 20
        Style = csDropDownList
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 1
        OnChange = cmb_BuildingCode1Change
      end
      object cmb_FloorCode1: TComboBox
        Left = 96
        Top = 36
        Width = 210
        Height = 20
        Style = csDropDownList
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 2
        OnChange = cmb_FloorCode1Change
      end
      object cmb_AreaCode1: TComboBox
        Left = 96
        Top = 60
        Width = 210
        Height = 20
        Style = csDropDownList
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 3
        OnChange = cmb_AreaCode1Change
      end
      object cmb_MCUCode: TComboBox
        Left = 96
        Top = 84
        Width = 209
        Height = 20
        Style = csDropDownList
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 4
        OnChange = cmb_MCUCodeChange
      end
    end
    object sg_AlarmZone: TAdvStringGrid
      Left = 1
      Top = 145
      Width = 559
      Height = 385
      Cursor = crDefault
      Align = alClient
      ColCount = 21
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
      ScrollBars = ssBoth
      TabOrder = 1
      OnClick = sg_AlarmZoneClick
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        #48169#48276#44396#50669' '#47749#52845
        #51316#48264#54840
        #51316' '#47749#52845)
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
      FixedColWidth = 174
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
      Version = '6.0.4.4'
      ColWidths = (
        174
        74
        275
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
    end
  end
  object Panel6: TPanel [4]
    Left = 564
    Top = 41
    Width = 507
    Height = 531
    Align = alClient
    TabOrder = 3
    object GroupBox10: TGroupBox
      Left = 1
      Top = 1
      Width = 505
      Height = 529
      Align = alClient
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 179
        Width = 36
        Height = 12
        Caption = #51316#47749#52845
      end
      object Label3: TLabel
        Left = 16
        Top = 211
        Width = 66
        Height = 12
        Caption = 'SMS'#49324#50857#50976#47924
      end
      object Label4: TLabel
        Left = 16
        Top = 235
        Width = 60
        Height = 12
        Caption = #55092#45824#54256#48264#54840
      end
      object Label5: TLabel
        Left = 16
        Top = 259
        Width = 48
        Height = 12
        Caption = #51204#49569#47928#44396
      end
      object Label6: TLabel
        Left = 96
        Top = 363
        Width = 180
        Height = 12
        Caption = #48169#48276#44396#50669#47749' '#51077#47141#49884' {'#48169#48276#44396#50669#47749'}'
      end
      object Label7: TLabel
        Left = 96
        Top = 379
        Width = 132
        Height = 12
        Caption = #51316#47749#52845' '#51077#47141#49884' {'#51316#47749#52845'}'
      end
      object ed_AlarmNo: TEdit
        Left = 352
        Top = 208
        Width = 177
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 0
        Visible = False
      end
      object ed_devicecode: TEdit
        Left = 360
        Top = 176
        Width = 73
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 1
        Visible = False
      end
      object cmb_smsuse: TComboBox
        Left = 96
        Top = 204
        Width = 241
        Height = 20
        Style = csDropDownList
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 2
        Items.Strings = (
          #48120#49324#50857
          #49324#50857)
      end
      object ed_Telnum: TEdit
        Left = 96
        Top = 231
        Width = 241
        Height = 20
        Enabled = False
        ImeName = 'Microsoft IME 2003'
        MaxLength = 30
        TabOrder = 3
      end
      object mem_Message: TMemo
        Left = 96
        Top = 256
        Width = 241
        Height = 97
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 4
      end
      object st_ZoneName: TStaticText
        Left = 96
        Top = 176
        Width = 241
        Height = 16
        AutoSize = False
        BevelInner = bvNone
        BevelKind = bkSoft
        Color = 16776176
        ParentColor = False
        TabOrder = 5
      end
      object Panel2: TPanel
        Left = 16
        Top = 400
        Width = 337
        Height = 49
        Caption = #51204#49569#47928#44396#45716' '#47749#52845' '#54252#54632' '#54620#44544' 45'#51088#47532#47564' '#51204#49569' '#46121#45768#45796'.'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object Panel1: TPanel
        Left = 2
        Top = 463
        Width = 501
        Height = 64
        Align = alBottom
        TabOrder = 7
        OnResize = Panel1Resize
        object btn_Update: TBitBtn
          Left = 116
          Top = 16
          Width = 80
          Height = 25
          Caption = #49688#51221
          TabOrder = 0
          OnClick = btn_UpdateClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
        end
        object btn_Save: TBitBtn
          Left = 284
          Top = 16
          Width = 80
          Height = 25
          Caption = #51200#51109
          TabOrder = 1
          OnClick = btn_SaveClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
            7700333333337777777733333333008088003333333377F73377333333330088
            88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
            000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
            FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
            99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
        end
        object btn_Cancel: TBitBtn
          Left = 368
          Top = 16
          Width = 80
          Height = 25
          Caption = #52712#49548
          TabOrder = 2
          OnClick = btn_CancelClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
            3333333777333777FF3333993333339993333377FF3333377FF3399993333339
            993337777FF3333377F3393999333333993337F777FF333337FF993399933333
            399377F3777FF333377F993339993333399377F33777FF33377F993333999333
            399377F333777FF3377F993333399933399377F3333777FF377F993333339993
            399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
            99333773FF3333777733339993333339933333773FFFFFF77333333999999999
            3333333777333777333333333999993333333333377777333333}
          NumGlyphs = 2
        end
        object btn_Add: TBitBtn
          Left = 32
          Top = 16
          Width = 80
          Height = 25
          Caption = #52628#44032
          TabOrder = 3
          OnClick = btn_AddClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
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
        end
        object btn_Delete: TBitBtn
          Left = 200
          Top = 16
          Width = 80
          Height = 25
          Caption = #49325#51228
          TabOrder = 4
          OnClick = btn_DeleteClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
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
        end
      end
      object GroupBox1: TGroupBox
        Left = 2
        Top = 14
        Width = 501
        Height = 147
        Align = alTop
        Caption = #46321#47197#48264#54840
        TabOrder = 8
        object sg_smsphone: TAdvStringGrid
          Left = 2
          Top = 14
          Width = 497
          Height = 131
          Cursor = crDefault
          Align = alClient
          ColCount = 3
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
          ScrollBars = ssBoth
          TabOrder = 0
          OnClick = sg_smsphoneClick
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ColumnHeaders.Strings = (
            #55092#45824#54256#48264#54840
            'SMS'#49324#50857#50976#47924
            #51204#49569#47928#44396)
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
          FixedColWidth = 148
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
          Version = '6.0.4.4'
          ColWidths = (
            148
            93
            238)
        end
      end
      object ed_OldTelNumber: TEdit
        Left = 352
        Top = 232
        Width = 177
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 9
        Visible = False
      end
    end
  end
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 24
    Top = 8
  end
end
