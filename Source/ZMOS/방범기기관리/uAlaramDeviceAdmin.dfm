inherited fmAlaramDeviceAdmin: TfmAlaramDeviceAdmin
  Left = 779
  Top = 187
  Width = 763
  Height = 581
  Caption = #48169#48276#44396#50669#44288#47532
  Color = clWhite
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object StatusBar1: TStatusBar [0]
    Left = 0
    Top = 520
    Width = 755
    Height = 34
    Panels = <>
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 456
    Width = 755
    Height = 64
    Align = alBottom
    Color = clWhite
    TabOrder = 1
    object btn_Insert: TSpeedButton
      Left = 32
      Top = 16
      Width = 100
      Height = 35
      Caption = #52628#44032
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
      OnClick = btn_InsertClick
    end
    object btn_Update: TSpeedButton
      Left = 152
      Top = 16
      Width = 100
      Height = 35
      Caption = #49688#51221
      Enabled = False
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
      OnClick = btn_UpdateClick
    end
    object btn_Save: TSpeedButton
      Left = 392
      Top = 16
      Width = 100
      Height = 35
      Caption = #51200#51109
      Enabled = False
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
      OnClick = btn_SaveClick
    end
    object btn_Delete: TSpeedButton
      Left = 272
      Top = 16
      Width = 100
      Height = 35
      Caption = #49325#51228
      Enabled = False
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
      OnClick = btn_DeleteClick
    end
    object btn_Close: TSpeedButton
      Left = 632
      Top = 16
      Width = 100
      Height = 35
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
    object btn_Cancel: TSpeedButton
      Left = 512
      Top = 16
      Width = 100
      Height = 35
      Caption = #52712#49548
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
      OnClick = btn_CancelClick
    end
  end
  object pan_header: TPanel [2]
    Left = 0
    Top = 0
    Width = 755
    Height = 41
    Align = alTop
    Caption = #48169#48276#44396#50669#44288#47532
    Color = clSilver
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object GroupBox4: TGroupBox [3]
    Left = 0
    Top = 41
    Width = 755
    Height = 415
    Align = alClient
    TabOrder = 3
    object Splitter2: TSplitter
      Left = 369
      Top = 14
      Height = 399
    end
    object Panel6: TPanel
      Left = 372
      Top = 14
      Width = 381
      Height = 399
      Align = alClient
      Color = clWhite
      TabOrder = 0
      object GroupBox10: TGroupBox
        Left = 1
        Top = 1
        Width = 379
        Height = 397
        Align = alClient
        TabOrder = 0
        object Label7: TLabel
          Left = 16
          Top = 48
          Width = 54
          Height = 12
          Caption = #44592#44592' '#47749#52845
        end
        object Label22: TLabel
          Left = 16
          Top = 96
          Width = 78
          Height = 12
          Caption = #48169#48276#44396#50669' '#47749#52845
        end
        object Label3: TLabel
          Left = 16
          Top = 121
          Width = 48
          Height = 12
          Caption = #51312#54924#49692#49436
        end
        object lb_sBuilding1: TLabel
          Left = 16
          Top = 272
          Width = 48
          Height = 12
          Caption = #48716#46377#53076#46300
        end
        object lb_sFloorCode1: TLabel
          Left = 16
          Top = 297
          Width = 36
          Height = 12
          Caption = #52789#53076#46300
        end
        object lb_sAreaCode1: TLabel
          Left = 16
          Top = 323
          Width = 48
          Height = 12
          Caption = #44396#50669#53076#46300
        end
        object Label12: TLabel
          Left = 16
          Top = 349
          Width = 48
          Height = 12
          Caption = #50948#52824#51221#48372
          Visible = False
        end
        object Label14: TLabel
          Left = 40
          Top = 217
          Width = 72
          Height = 12
          Caption = #53748#49892#51648#50672#49884#44036
          Transparent = True
          Visible = False
        end
        object Label4: TLabel
          Left = 195
          Top = 233
          Width = 12
          Height = 12
          Caption = #52488
          Transparent = True
          Visible = False
        end
        object Label76: TLabel
          Left = 216
          Top = 218
          Width = 72
          Height = 12
          Caption = #51077#49892#51648#50672#49884#44036
          Transparent = True
          Visible = False
        end
        object Label5: TLabel
          Left = 380
          Top = 218
          Width = 12
          Height = 12
          Caption = #52488
          Transparent = True
          Visible = False
        end
        object Label8: TLabel
          Left = 16
          Top = 24
          Width = 72
          Height = 12
          Caption = #47700#51064#52968#53944#47204#47084
        end
        object Label9: TLabel
          Left = 16
          Top = 168
          Width = 90
          Height = 12
          Caption = #48169#48276#44396#50669' '#50672#46973#52376
        end
        object Label10: TLabel
          Left = 16
          Top = 192
          Width = 48
          Height = 12
          Caption = #53945#51060#49324#54637
        end
        object Label11: TLabel
          Left = 16
          Top = 144
          Width = 78
          Height = 12
          Caption = #48169#48276#44396#50669' '#44396#48516
        end
        object Label15: TLabel
          Left = 16
          Top = 73
          Width = 72
          Height = 12
          Caption = #48169#48276#44396#50669#48264#54840
        end
        object Label17: TLabel
          Left = 16
          Top = 240
          Width = 48
          Height = 12
          Caption = #50672#46041#53076#46300
        end
        object ed_regAlarmName: TEdit
          Left = 120
          Top = 92
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          MaxLength = 100
          TabOrder = 1
          OnEnter = ed_regAlarmNameEnter
        end
        object cmb_regDeviceCode: TComboBox
          Left = 120
          Top = 44
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 0
          OnChange = cmb_regDeviceCodeChange
        end
        object ed_regAlarmSeq: TSpinEdit
          Left = 120
          Top = 117
          Width = 217
          Height = 21
          MaxValue = 65000
          MinValue = 0
          TabOrder = 2
          Value = 1
        end
        object cmb_sBuildingCode: TComboBox
          Left = 120
          Top = 268
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 7
          OnChange = cmb_sBuildingCodeChange
        end
        object cmb_sFloorCode: TComboBox
          Left = 120
          Top = 293
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 9
          OnChange = cmb_sFloorCodeChange
        end
        object cmb_sAreaCode: TComboBox
          Left = 120
          Top = 318
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 11
          OnChange = cmb_sAreaCodeChange
        end
        object ed_TotWidth: TEdit
          Left = 128
          Top = 360
          Width = 25
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 5
          Visible = False
        end
        object ed_TotHeight: TEdit
          Left = 160
          Top = 360
          Width = 25
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 6
          Visible = False
        end
        object ed_CurX: TEdit
          Left = 192
          Top = 360
          Width = 25
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 8
          Visible = False
        end
        object ed_CurY: TEdit
          Left = 224
          Top = 360
          Width = 25
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 10
          Visible = False
        end
        object btnAlarmPosition: TBitBtn
          Left = 120
          Top = 344
          Width = 217
          Height = 25
          Caption = #50948#52824#46321#47197
          Enabled = False
          TabOrder = 12
          OnClick = btnAlarmPositionClick
        end
        object chk_AlarmReg: TCheckBox
          Left = 72
          Top = 344
          Width = 49
          Height = 17
          Caption = #46321#47197
          TabOrder = 13
          Visible = False
        end
        object GroupBox1: TGroupBox
          Left = 192
          Top = 272
          Width = 321
          Height = 113
          Caption = #47700#51064#51221#48372
          TabOrder = 14
          Visible = False
          object Label1: TLabel
            Left = 16
            Top = 28
            Width = 66
            Height = 12
            Caption = #44288#51228' '#50500#51060#46356
          end
          object Label2: TLabel
            Left = 16
            Top = 55
            Width = 78
            Height = 12
            Caption = #44288#51228' '#51204#54868#48264#54840
          end
          object Label79: TLabel
            Left = 16
            Top = 75
            Width = 60
            Height = 24
            Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
            Caption = #50896#44201#51228#50612#13#10#47553#49688#49888#54943#49688
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object ed_AlarmID: TEdit
            Left = 104
            Top = 24
            Width = 185
            Height = 20
            ImeName = 'Microsoft IME 2003'
            MaxLength = 4
            TabOrder = 0
            OnChange = ed_AlarmIDChange
          end
          object ed_MuxTelNo: TEdit
            Left = 104
            Top = 51
            Width = 185
            Height = 20
            ImeName = 'Microsoft IME 2003'
            MaxLength = 12
            TabOrder = 1
            OnChange = ed_MuxTelNoChange
          end
          object Spinner_Ring: TRzSpinner
            Left = 106
            Top = 78
            Width = 60
            Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
            CheckRange = True
            Max = 50
            Min = 1
            Value = 9
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentColor = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
        end
        object SpinEdit_OutDelay: TRzSpinEdit
          Left = 144
          Top = 213
          Width = 51
          Height = 20
          AllowKeyEdit = True
          Max = 999.000000000000000000
          FlatButtons = True
          FrameVisible = True
          ImeName = 'Microsoft IME 2003'
          TabOrder = 3
          Visible = False
          OnChange = SpinEdit_OutDelayChange
        end
        object SpinEdit_InDelay: TRzSpinEdit
          Left = 320
          Top = 214
          Width = 51
          Height = 20
          AllowKeyEdit = True
          Max = 999.000000000000000000
          FlatButtons = True
          FrameVisible = True
          ImeName = 'Microsoft IME 2003'
          TabOrder = 4
          Visible = False
          OnChange = SpinEdit_InDelayChange
        end
        object ed_AlarmNo: TEdit
          Left = 256
          Top = 216
          Width = 57
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 15
          Visible = False
        end
        object chk_AlaramUpdate: TCheckBox
          Left = 8
          Top = 0
          Width = 153
          Height = 25
          Caption = #48169#48276#44396#50669#51221#48372#50629#45936#51060#53944
          TabOrder = 16
          Visible = False
        end
        object cmb_sMCUCode: TComboBox
          Left = 120
          Top = 20
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 17
          OnChange = cmb_sMCUCodeChange
        end
        object ed_telno: TEdit
          Left = 120
          Top = 164
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          MaxLength = 30
          TabOrder = 18
        end
        object mem_etc: TMemo
          Left = 120
          Top = 192
          Width = 217
          Height = 41
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 19
          OnKeyPress = mem_etcKeyPress
        end
        object cmb_ArmGubun: TComboBox
          Left = 120
          Top = 140
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 20
        end
        object se_ArmAreaNo: TSpinEdit
          Left = 120
          Top = 69
          Width = 217
          Height = 21
          MaxValue = 8
          MinValue = 0
          TabOrder = 21
          Value = 1
        end
        object ed_RelayCode: TEdit
          Left = 120
          Top = 236
          Width = 217
          Height = 20
          ImeName = 'Microsoft IME 2003'
          MaxLength = 30
          TabOrder = 22
        end
      end
    end
    object Panel5: TPanel
      Left = 2
      Top = 14
      Width = 367
      Height = 399
      Align = alLeft
      Color = clWhite
      TabOrder = 1
      object GroupBox11: TGroupBox
        Left = 1
        Top = 1
        Width = 365
        Height = 168
        Align = alTop
        TabOrder = 0
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
        object Label6: TLabel
          Left = 16
          Top = 96
          Width = 72
          Height = 12
          Caption = #47700#51064#52968#53944#47204#47084
        end
        object Label13: TLabel
          Left = 16
          Top = 120
          Width = 66
          Height = 12
          Caption = #54869#51109#44592' '#47749#52845
        end
        object Label16: TLabel
          Left = 16
          Top = 144
          Width = 78
          Height = 12
          Caption = #48169#48276#44396#50669' '#47749#52845
        end
        object SpeedButton1: TSpeedButton
          Left = 312
          Top = 144
          Width = 49
          Height = 17
          Caption = #54028#51068
          OnClick = SpeedButton1Click
        end
        object cmb_MCUCode: TComboBox
          Left = 120
          Top = 92
          Width = 185
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 0
          OnChange = cmb_MCUCodeChange
        end
        object cmb_BuildingCode1: TComboBox
          Left = 120
          Top = 20
          Width = 185
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 1
          OnChange = cmb_BuildingCode1Change
        end
        object cmb_FloorCode1: TComboBox
          Left = 120
          Top = 44
          Width = 185
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 2
          OnChange = cmb_FloorCode1Change
        end
        object cmb_AreaCode1: TComboBox
          Left = 120
          Top = 68
          Width = 185
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 3
          OnChange = cmb_AreaCode1Change
        end
        object cmb_Ecu: TComboBox
          Left = 120
          Top = 116
          Width = 185
          Height = 20
          Style = csDropDownList
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          TabOrder = 4
          OnChange = cmb_EcuChange
        end
        object ed_ArmAreaName: TEdit
          Left = 120
          Top = 140
          Width = 185
          Height = 20
          ImeName = 'Microsoft IME 2003'
          MaxLength = 30
          TabOrder = 5
          OnChange = ed_ArmAreaNameChange
        end
      end
      object sg_Alarm: TAdvStringGrid
        Left = 1
        Top = 169
        Width = 365
        Height = 229
        Cursor = crDefault
        Align = alClient
        ColCount = 25
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
        TabOrder = 1
        OnClick = sg_AlarmClick
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          #48169#48276#44396#50669' '#47749#52845
          #47700#51064' '#47749#52845
          #47196#52972' ID'
          #48169#48276#44396#50669#48264#54840
          #45432#46300#48264#54840
          #51312#54924#49692#49436
          #53748#49892#51648#50672#49884#44036
          #51077#49892#51648#50672#49884#44036
          #44288#51228#50500#51060#46356
          #44288#51228#51204#54868#48264#54840
          #50896#44201#51228#50612#47553#49688#49888#54943#49688
          #48716#46377#53076#46300
          #52789#53076#46300
          #44396#50669#53076#46300
          #50948#52824#49324#50857
          #52509#45331#51060
          #52509#45458#51060
          #54788#51116'X'
          #54788#51116'Y'
          #51204#54868#48264#54840
          #53945#51060#49324#54637
          #48169#48276#44396#50669#53076#46300)
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
        FixedColWidth = 119
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
        Version = '6.0.4.4'
        ColWidths = (
          119
          128
          71
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
          90
          90
          90
          90
          90)
      end
    end
  end
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 24
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'CSV'
    Filter = 'CSV Files (*.csv)|*.csv|All Files (*.*)|*.*'
    InitialDir = #51200#51109#54624' '#54028#51068#51012' '#49440#53469' '#46608#45716' '#51077#47141' '#54616#49464#50836
    Options = [ofOverwritePrompt, ofHideReadOnly]
    Left = 72
    Top = 448
  end
  object ADOSearchQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 64
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 104
    Top = 8
  end
end
