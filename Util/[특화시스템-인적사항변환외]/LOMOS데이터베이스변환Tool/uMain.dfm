object fmMain: TfmMain
  Left = 421
  Top = 144
  Width = 562
  Height = 520
  Caption = #45936#51060#53552#48288#51060#49828' '#48320#54872' Tool'
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object btn_next: TSpeedButton
    Left = 128
    Top = 424
    Width = 97
    Height = 33
    Caption = #45796#51020
    OnClick = btn_nextClick
  end
  object btn_Close: TSpeedButton
    Left = 328
    Top = 424
    Width = 97
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
  object NextImg: TImage
    Left = 24
    Top = 424
    Width = 33
    Height = 17
    Picture.Data = {
      07544269746D617076010000424D760100000000000076000000280000002000
      000010000000010004000000000000010000120B0000120B0000100000000000
      0000000000000000800000800000008080008000000080008000808000007F7F
      7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF0033333333333333333FF3333333333333447333333333333377FFF3333333
      3333744473333333333337773FF3333333333444447333333333373F773FF333
      333333444444733333333373F3773FF3333333744444447333333337F333773F
      F333333444444444733333373F3333773FF333334444444444733FFF7FFFFFFF
      77FF999999999999999977777777777733773333CCCCCCCCCC3333337333333F
      7733333CCCCCCCCC33333337F3333F773333333CCCCCCC3333333337333F7733
      333333CCCCCC3333333333733F77333333333CCCCC333333333337FF77333333
      33333CCC3333333333333777333333333333CC33333333333333773333333333
      3333}
    Visible = False
  end
  object CheckImg: TImage
    Left = 24
    Top = 448
    Width = 33
    Height = 17
    Picture.Data = {
      07544269746D617076010000424D760100000000000076000000280000002000
      000010000000010004000000000000010000120B0000120B0000100000000000
      0000000000000000800000800000008080008000000080008000808000007F7F
      7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00555555555555555555555555555555555555555555555555555555FF5555
      555555555905555555555555577FF5555555555599905555555555557777F555
      5555555599905555555555557777FF5555555559999905555555555777777F55
      55555599999905555555557777777FF5555557990599905555555777757777F5
      555579055559905555557775555777FF5555555555599905555555555557777F
      5555555555559905555555555555777FF5555555555559905555555555555777
      FF5555555555557905555555555555777FF55555555555579055555555555557
      77FF555555555555599055555555555557775555555555555555555555555555
      5555}
    Visible = False
  end
  object SpeedButton1: TSpeedButton
    Left = 456
    Top = 424
    Width = 73
    Height = 33
    Caption = #48169#48276#44396#50669
    OnClick = SpeedButton1Click
  end
  object Notebook1: TNotebook
    Left = 0
    Top = 49
    Width = 554
    Height = 360
    Align = alTop
    PageIndex = 1
    TabOrder = 0
    OnPageChanged = Notebook1PageChanged
    object TPage
      Left = 0
      Top = 0
      Caption = #45936#51060#53552#48288#51060#49828' '#54872#44221#49444#51221
      object pan_DBConfig: TPanel
        Left = 0
        Top = 0
        Width = 554
        Height = 360
        Align = alClient
        TabOrder = 0
        object gr_org: TGroupBox
          Left = 1
          Top = 177
          Width = 552
          Height = 182
          Align = alClient
          Caption = #48320#44221#54624' '#45936#51060#53552#48288#51060#49828' '#54872#44221
          TabOrder = 0
          object Rd_DBType: TRadioGroup
            Left = 8
            Top = 24
            Width = 129
            Height = 145
            Caption = #45936#51060#53552#48288#51060#49828' '#44396#48516
            ItemIndex = 0
            Items.Strings = (
              'PostGreSql'
              'MS SQL')
            TabOrder = 0
          end
          object GroupBox3: TGroupBox
            Left = 152
            Top = 24
            Width = 385
            Height = 145
            Caption = #54872#44221
            TabOrder = 1
            object Label6: TLabel
              Left = 16
              Top = 20
              Width = 42
              Height = 12
              Caption = #49436#48260' IP'
            end
            object Label7: TLabel
              Left = 16
              Top = 44
              Width = 54
              Height = 12
              Caption = #49436#48260' Port'
            end
            object Label8: TLabel
              Left = 16
              Top = 92
              Width = 60
              Height = 12
              Caption = #51217#49549#44228#51221'ID'
            end
            object Label9: TLabel
              Left = 16
              Top = 116
              Width = 60
              Height = 12
              Caption = #51217#49549#44228#51221'PW'
            end
            object Label10: TLabel
              Left = 16
              Top = 68
              Width = 96
              Height = 12
              Caption = #45936#51060#53552#48288#51060#49828#47749#52845
            end
            object ed_ServerIP: TEdit
              Left = 128
              Top = 16
              Width = 225
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 0
            end
            object ed_ServerPort: TEdit
              Left = 128
              Top = 40
              Width = 225
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 1
              Text = '5432'
            end
            object ed_UserID: TEdit
              Left = 128
              Top = 88
              Width = 225
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 2
            end
            object ed_UserPW: TEdit
              Left = 128
              Top = 112
              Width = 225
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 3
            end
            object ed_DBName: TEdit
              Left = 128
              Top = 64
              Width = 225
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 4
            end
          end
        end
        object GroupBox1: TGroupBox
          Left = 1
          Top = 1
          Width = 552
          Height = 176
          Align = alTop
          Caption = #50896#48376' '#45936#51060#53552#48288#51060#49828' '#54872#44221
          TabOrder = 1
          object Rd_OrgDBType: TRadioGroup
            Left = 8
            Top = 24
            Width = 129
            Height = 145
            Caption = #45936#51060#53552#48288#51060#49828' '#44396#48516
            Enabled = False
            ItemIndex = 1
            Items.Strings = (
              'MS SQL'
              'DB ISAM')
            TabOrder = 0
            OnClick = Rd_OrgDBTypeClick
          end
          object gb_MssqlConfig1: TGroupBox
            Left = 152
            Top = 24
            Width = 385
            Height = 145
            Caption = #54872#44221
            TabOrder = 1
            Visible = False
            object Label1: TLabel
              Left = 16
              Top = 20
              Width = 42
              Height = 12
              Caption = #49436#48260' IP'
            end
            object Label2: TLabel
              Left = 16
              Top = 44
              Width = 54
              Height = 12
              Caption = #49436#48260' Port'
            end
            object Label3: TLabel
              Left = 16
              Top = 92
              Width = 60
              Height = 12
              Caption = #51217#49549#44228#51221'ID'
            end
            object Label4: TLabel
              Left = 16
              Top = 116
              Width = 60
              Height = 12
              Caption = #51217#49549#44228#51221'PW'
            end
            object Label5: TLabel
              Left = 16
              Top = 68
              Width = 96
              Height = 12
              Caption = #45936#51060#53552#48288#51060#49828#47749#52845
            end
            object ed_OrgServerIP: TEdit
              Left = 128
              Top = 16
              Width = 225
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 0
            end
            object ed_OrgServerPort: TEdit
              Left = 128
              Top = 40
              Width = 225
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 1
              Text = '1433'
            end
            object ed_OrgUserID: TEdit
              Left = 128
              Top = 88
              Width = 225
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 2
            end
            object ed_OrgUserPW: TEdit
              Left = 128
              Top = 112
              Width = 225
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 3
            end
            object ed_OrgDBName: TEdit
              Left = 128
              Top = 64
              Width = 225
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 4
            end
          end
          object gb_DBISAM1: TGroupBox
            Left = 152
            Top = 24
            Width = 385
            Height = 145
            Caption = #54872#44221
            TabOrder = 2
            object Label13: TLabel
              Left = 16
              Top = 20
              Width = 66
              Height = 12
              Caption = 'DB '#46356#47113#53664#47532
            end
            object Label14: TLabel
              Left = 16
              Top = 60
              Width = 36
              Height = 12
              Caption = #54924#49324#47749
              Visible = False
            end
            object ed_DBISAM: TEdit
              Left = 16
              Top = 32
              Width = 225
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 0
            end
            object btFileSearch: TRzBitBtn
              Left = 256
              Top = 28
              Width = 80
              Hint = '12'
              Caption = #52286#44592
              Color = 15791348
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 1
              OnClick = btFileSearchClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                5555555555555555555555555555555555555555555555555555555555555555
                555555555555555555555555555555555555555FFFFFFFFFF555550000000000
                55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
                B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
                000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
                555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
                55555575FFF75555555555700007555555555557777555555555555555555555
                5555555555555555555555555555555555555555555555555555}
              NumGlyphs = 2
            end
            object ed_CompanyName: TEdit
              Left = 16
              Top = 72
              Width = 225
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 2
              Visible = False
            end
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #45936#51060#53552#48288#51060#49828' '#48320#54872
      object pan_DataConv: TPanel
        Left = 0
        Top = 0
        Width = 554
        Height = 360
        Align = alClient
        TabOrder = 0
        object Panel1: TPanel
          Left = 1
          Top = 1
          Width = 552
          Height = 128
          Align = alTop
          TabOrder = 0
          object GroupBox5: TGroupBox
            Left = 1
            Top = 1
            Width = 550
            Height = 126
            Align = alClient
            Caption = #51652#54665' '#49345#54889
            TabOrder = 0
            object Label11: TLabel
              Left = 32
              Top = 64
              Width = 72
              Height = 12
              Caption = #51204#52404#51652#54665#45236#50669
            end
            object Label12: TLabel
              Left = 32
              Top = 32
              Width = 84
              Height = 12
              Caption = #53580#51060#48660#51652#54665#45236#50669
            end
            object Gauge_Table: TGauge
              Left = 144
              Top = 24
              Width = 377
              Height = 25
              ForeColor = clBlue
              Progress = 0
            end
            object Gauge_Tot: TGauge
              Left = 144
              Top = 56
              Width = 377
              Height = 25
              ForeColor = clBlue
              Progress = 0
            end
            object StatusBar1: TStatusBar
              Left = 2
              Top = 96
              Width = 546
              Height = 28
              Panels = <
                item
                  Width = 1000
                end>
            end
          end
        end
        object Panel2: TPanel
          Left = 1
          Top = 129
          Width = 552
          Height = 230
          Align = alClient
          TabOrder = 1
          object GroupBox4: TGroupBox
            Left = 1
            Top = 1
            Width = 550
            Height = 228
            Align = alClient
            Caption = #51652#54665' '#45236#50669
            TabOrder = 0
            object memList: TMemo
              Left = 2
              Top = 14
              Width = 546
              Height = 212
              Align = alClient
              ImeName = 'Microsoft IME 2003'
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object pan_header: TPanel
    Left = 0
    Top = 0
    Width = 554
    Height = 49
    Align = alTop
    Caption = #45936#51060#53552#48288#51060#49828' '#54872#44221#49444#51221
    Color = 15387318
    TabOrder = 1
  end
  object ADOConnection: TADOConnection
    Top = 256
  end
  object ADOOrgConnection: TADOConnection
    Top = 8
  end
  object ADOOrgSelectQuery: TADOQuery
    Connection = ADOOrgConnection
    Parameters = <>
    Left = 8
    Top = 48
  end
  object ADOInsertQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 24
    Top = 256
  end
  object FolderDialog1: TFolderDialog
    Directory = 'E:\'#54532#47196#51229#53944'\'#51109#48708#49444#51221'\zReg'
    DialogX = 0
    DialogY = 0
    Version = '1.1.0.1'
    Left = 676
    Top = 116
  end
  object DBISAMSession1: TDBISAMSession
    EngineVersion = '4.24 Build 1'
    Active = True
    ForceBufferFlush = True
    LockRetryCount = 15
    LockWaitTime = 100
    LockProtocol = lpPessimistic
    PrivateDir = 'c:\Temp'
    ProgressSteps = 20
    SessionName = 'DBISAMSession1_1'
    SessionType = stLocal
    RemoteEncryption = False
    RemoteEncryptionPassword = 'elevatesoft'
    RemoteCompression = 0
    RemoteAddress = '127.0.0.1'
    RemotePort = 12005
    RemoteTrace = False
    RemoteUser = 'Admin'
    RemotePassword = 'DBAdmin'
    RemoteTimeout = 300
    RemotePing = True
    RemotePingInterval = 60
    Left = 406
    Top = 8
  end
  object DBISAMDatabase1: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    DatabaseName = 'LomosDB'
    Directory = 'E:\'#54532#47196#51229#53944'\DBISAM'#54532#47196#51229#53944'\STX\LOMOS\DB'
    RemoteDatabase = 'LOMOSDB'
    KeepTablesOpen = True
    SessionName = 'DBISAMSession1_1'
    Left = 374
    Top = 8
  end
  object DBISAMOrgSelectQuery: TDBISAMQuery
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'LomosDB'
    SessionName = 'DBISAMSession1_1'
    EngineVersion = '4.24 Build 1'
    MaxRowCount = -1
    SQL.Strings = (
      'SELECT DOOR_CODE, DEVICE_ID, DOOR_NO, DOOR_NAME,DOOR_FLOOR'
      'FROM TB_DOOR')
    Params = <>
    Left = 438
    Top = 8
  end
  object ADOTargetTempQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 24
    Top = 288
  end
end
