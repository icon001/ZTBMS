inherited fmCustomerConsulting: TfmCustomerConsulting
  Left = 196
  Top = 116
  Width = 1112
  Height = 715
  Caption = #44256#44061#49345#45812
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  FormStyle = fsMDIChild
  OldCreateOrder = True
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel12: TPanel [0]
    Left = 0
    Top = 0
    Width = 1104
    Height = 33
    Align = alTop
    Caption = #44256#44061#49345#45812#44288#47532
    Color = 15387318
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentBackground = True
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 33
    Width = 1104
    Height = 272
    Align = alTop
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 1102
      Height = 270
      Align = alClient
      Caption = #49345#45812#51221#48372
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 23
        Width = 72
        Height = 12
        Caption = #49345#45812#51204#54868#48264#54840
      end
      object Label2: TLabel
        Left = 16
        Top = 95
        Width = 36
        Height = 12
        Caption = #44256#44061#47749
      end
      object btn_Memo: TSpeedButton
        Left = 712
        Top = 81
        Width = 169
        Height = 25
        Caption = #47700#47784#51204#49569
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
        OnClick = btn_MemoClick
      end
      object btn_Send: TSpeedButton
        Left = 712
        Top = 49
        Width = 169
        Height = 25
        Caption = #44256#44061#51060#44288
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0000377777777777777707FFFFFFFFFFFF70773FF33333333F770F77FFFFFFFF
          77F07F773FFFFFFF77F70FFF7700000000007F337777777777770FFFFF0FFFFF
          FFF07F333F7F3FFFF3370FFF700F0000FFF07F3F777F777733370F707F0FFFFF
          FFF07F77337F3FFFFFF7007EEE0F000000F077FFFF7F777777370777770FFFFF
          FFF07777777F3FFFFFF7307EEE0F000000F03773FF7F7777773733707F0FFFFF
          FFF03337737F3FFF33373333700F000FFFF03333377F77733FF73333330FFFFF
          00003333337F3FF377773333330F00FF0F033333337F77337F733333330FFFFF
          00333333337FFFFF773333333300000003333333337777777333}
        NumGlyphs = 2
        OnClick = btn_SendClick
      end
      object btn_ManagerAdd: TSpeedButton
        Left = 712
        Top = 17
        Width = 169
        Height = 25
        Caption = #44256#44061#46321#47197
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
        OnClick = btn_ManagerAddClick
      end
      object Label5: TLabel
        Left = 16
        Top = 47
        Width = 24
        Height = 12
        Caption = #48376#48512
      end
      object Label13: TLabel
        Left = 16
        Top = 71
        Width = 24
        Height = 12
        Caption = #51648#49324
      end
      object Label14: TLabel
        Left = 288
        Top = 23
        Width = 36
        Height = 12
        Caption = #51109#48708#47749
      end
      object Label15: TLabel
        Left = 288
        Top = 47
        Width = 36
        Height = 12
        Caption = #47784#45944#47749
      end
      object Label16: TLabel
        Left = 288
        Top = 71
        Width = 60
        Height = 12
        Caption = #54156#50920#50612#48260#51260
      end
      object Label17: TLabel
        Left = 288
        Top = 95
        Width = 48
        Height = 12
        Caption = #52376#47532#45824#49345
      end
      object btn_Close: TSpeedButton
        Left = 888
        Top = 16
        Width = 110
        Height = 41
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
      object Label20: TLabel
        Left = 560
        Top = 95
        Width = 48
        Height = 12
        Caption = #52376#47532#44592#54620
      end
      object ed_TelNum: TEdit
        Left = 104
        Top = 19
        Width = 169
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 0
        OnKeyDown = ed_QnaSubjectKeyDown
        OnKeyUp = ed_TelNumKeyUp
      end
      object ed_CustomerName: TEdit
        Left = 104
        Top = 91
        Width = 169
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 3
        OnKeyDown = ed_QnaSubjectKeyDown
      end
      object GroupBox3: TGroupBox
        Left = 2
        Top = 112
        Width = 1098
        Height = 156
        Align = alBottom
        Caption = #49345#45812
        TabOrder = 8
        object Label3: TLabel
          Left = 16
          Top = 20
          Width = 48
          Height = 12
          Caption = #51217#49688#45236#50857
        end
        object Label4: TLabel
          Left = 16
          Top = 72
          Width = 48
          Height = 12
          Caption = #52376#47532#44208#44284
        end
        object Label7: TLabel
          Left = 16
          Top = 47
          Width = 48
          Height = 12
          Caption = #52376#47532#50976#54805
        end
        object Label8: TLabel
          Left = 256
          Top = 47
          Width = 48
          Height = 12
          Caption = #52376#47532#49345#53468
        end
        object btn_Save: TSpeedButton
          Left = 888
          Top = 16
          Width = 110
          Height = 41
          Caption = #51200#51109'[Ctrl+S]'
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
          OnClick = btn_SaveClick
        end
        object Label18: TLabel
          Left = 472
          Top = 47
          Width = 48
          Height = 12
          Caption = #51109#50528#49464#48512
        end
        object Label19: TLabel
          Left = 680
          Top = 47
          Width = 48
          Height = 12
          Caption = #48520#47049#49324#50976
        end
        object ed_QnaSubject: TEdit
          Left = 104
          Top = 16
          Width = 769
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 0
          OnKeyDown = ed_QnaSubjectKeyDown
        end
        object mem_QnaData: TMemo
          Left = 104
          Top = 72
          Width = 873
          Height = 65
          ImeName = 'Microsoft IME 2003'
          ScrollBars = ssBoth
          TabOrder = 5
        end
        object cmb_QnaCode1: TComboBox
          Left = 104
          Top = 43
          Width = 140
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 1
          OnKeyDown = ed_QnaSubjectKeyDown
        end
        object cmb_ConsultCode1: TComboBox
          Left = 314
          Top = 43
          Width = 140
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 2
          OnKeyDown = ed_QnaSubjectKeyDown
        end
        object cmb_errDetail: TComboBox
          Left = 525
          Top = 43
          Width = 140
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 3
          OnKeyDown = ed_QnaSubjectKeyDown
        end
        object cmb_ErrTarget: TComboBox
          Left = 736
          Top = 43
          Width = 140
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 4
          OnKeyDown = ed_QnaSubjectKeyDown
        end
      end
      object ed_emNum: TEdit
        Left = 736
        Top = 88
        Width = 57
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 9
        Visible = False
      end
      object ed_JijumName: TEdit
        Left = 104
        Top = 43
        Width = 169
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 1
        OnKeyDown = ed_QnaSubjectKeyDown
      end
      object ed_DepartName: TEdit
        Left = 104
        Top = 67
        Width = 169
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 2
        OnKeyDown = ed_QnaSubjectKeyDown
      end
      object cmb_DeviceName: TComboBox
        Left = 368
        Top = 19
        Width = 177
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 4
        OnChange = cmb_DeviceNameChange
        OnKeyDown = ed_QnaSubjectKeyDown
      end
      object cmb_ModelName: TComboBox
        Left = 368
        Top = 43
        Width = 177
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 5
        OnKeyDown = ed_QnaSubjectKeyDown
      end
      object cmb_FirmWareVersion: TComboBox
        Left = 368
        Top = 67
        Width = 177
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 6
        OnKeyDown = ed_QnaSubjectKeyDown
      end
      object cmb_DeviceType: TComboBox
        Left = 368
        Top = 91
        Width = 177
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 7
        OnKeyDown = ed_QnaSubjectKeyDown
      end
      object ed_CompanyName: TEdit
        Left = 736
        Top = 59
        Width = 169
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 10
        Visible = False
        OnKeyDown = ed_QnaSubjectKeyDown
      end
      object cmb_ProcessTime: TComboBox
        Left = 616
        Top = 91
        Width = 89
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 11
        OnKeyPress = cmb_ProcessTimeKeyPress
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 305
    Width = 1104
    Height = 376
    Align = alClient
    TabOrder = 3
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 1102
      Height = 374
      Align = alClient
      Caption = #49345#45812#51060#47141#51312#54924
      TabOrder = 0
      object sg_Consulting: TAdvStringGrid
        Left = 2
        Top = 105
        Width = 1098
        Height = 267
        Cursor = crDefault
        Align = alClient
        ColCount = 30
        DefaultRowHeight = 21
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowMoving, goRowSelect]
        PopupMenu = PopupMenu2
        ScrollBars = ssBoth
        TabOrder = 0
        OnDblClick = sg_ConsultingDblClick
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          #49345#45812#51068#51088
          #49345#45812#49884#44036
          #44256#44061#47749
          #47928#51032#45236#50857
          #49345#45812#45236#50857
          #49345#45812#51088)
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
        FixedColWidth = 130
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
          130
          105
          112
          240
          338
          85
          106
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64)
      end
      object Panel3: TPanel
        Left = 2
        Top = 14
        Width = 1098
        Height = 91
        Align = alTop
        TabOrder = 1
        object Label6: TLabel
          Left = 16
          Top = 15
          Width = 36
          Height = 12
          Caption = #54924#49324#47749
        end
        object Label9: TLabel
          Left = 16
          Top = 39
          Width = 48
          Height = 12
          Caption = #52376#47532#50976#54805
        end
        object Label10: TLabel
          Left = 16
          Top = 63
          Width = 48
          Height = 12
          Caption = #52376#47532#49345#53468
        end
        object btn_Search: TSpeedButton
          Left = 848
          Top = 0
          Width = 65
          Height = 17
          Caption = #51312#54924
          NumGlyphs = 2
          Visible = False
          OnClick = btn_SearchClick
        end
        object Label11: TLabel
          Left = 344
          Top = 39
          Width = 48
          Height = 12
          Caption = #51217#49688#45236#50857
        end
        object Label12: TLabel
          Left = 344
          Top = 63
          Width = 48
          Height = 12
          Caption = #52376#47532#44208#44284
        end
        object cmb_CompanyCode: TComboBox
          Left = 104
          Top = 11
          Width = 200
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 0
          Text = '0.'#54924#49324#47749
          OnChange = cmb_CompanyCodeChange
          OnExit = cmb_CompanyCodeExit
          OnKeyPress = cmb_CompanyCodeKeyPress
          Items.Strings = (
            '0.'#54924#49324#47749
            '1.'#51204#54868#48264#54840
            '2.'#44256#44061#47749
            '3.'#54924#49324#47749'+'#44256#44061#47749)
        end
        object cmb_QnaCode2: TComboBox
          Left = 104
          Top = 35
          Width = 200
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 1
          Text = '0.'#51204#52404
          OnChange = cmb_QnaCode2Change
          Items.Strings = (
            '0.'#51204#52404
            '1.'#45936#47788#54532#47196#44536#47016
            '2.'#44288#51228#54532#47196#44536#47016
            '3.'#44540#53468#49885#49688#54532#47196#44536#47016
            '4.'#48169#44284#54980#45936#47788
            '5.'#48169#44284#54980#44288#51228)
        end
        object cmb_ConsultCode2: TComboBox
          Left = 104
          Top = 59
          Width = 200
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 2
          Text = '0.'#51204#52404
          OnChange = cmb_ConsultCode2Change
          Items.Strings = (
            '0.'#51204#52404
            '1.'#45936#47788#54532#47196#44536#47016
            '2.'#44288#51228#54532#47196#44536#47016
            '3.'#44540#53468#49885#49688#54532#47196#44536#47016
            '4.'#48169#44284#54980#45936#47788
            '5.'#48169#44284#54980#44288#51228)
        end
        object ed_sQna: TEdit
          Left = 424
          Top = 35
          Width = 513
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 3
          OnKeyUp = ed_sQnaKeyUp
        end
        object ed_sContent: TEdit
          Left = 424
          Top = 59
          Width = 513
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 4
          OnKeyUp = ed_sContentKeyUp
        end
      end
    end
  end
  object sg_Customer: TAdvStringGrid [3]
    Left = 360
    Top = 81
    Width = 593
    Height = 152
    Cursor = crDefault
    ColCount = 7
    DefaultRowHeight = 21
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowMoving, goRowSelect]
    PopupMenu = PopupMenu2
    ScrollBars = ssBoth
    TabOrder = 1
    Visible = False
    OnDblClick = sg_CustomerDblClick
    OnKeyDown = sg_CustomerKeyDown
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ColumnHeaders.Strings = (
      #51060#47492
      #51204#54868#48264#54840
      #54924#49324#47749
      #51648#51216#47749
      #48512#49436#47749)
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
    FixedColWidth = 103
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
      103
      105
      112
      126
      123
      85
      106)
  end
  inherited CommandArray: TCommandArray
    Commands = <
      item
        CommandName = 'REFRESH'
        CommandKind = 0
        Name = 'TCommand0'
        OnExecute = CommandArrayCommandsTCommand0Execute
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 154
    Top = 435
    object mn_F4: TMenuItem
      Caption = #51200#51109
      ShortCut = 16467
      OnClick = mn_F4Click
    end
  end
  object PopupMenu2: TPopupMenu
    AutoHotkeys = maManual
    Left = 322
    Top = 427
    object MenuItem1: TMenuItem
      AutoHotkeys = maManual
      Caption = #49688#51221
      OnClick = MenuItem1Click
    end
  end
  object TempQuery: TZQuery
    Connection = dmDB.ZConnection1
    Params = <>
    Left = 8
    Top = 160
  end
end
