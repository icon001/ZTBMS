object Form1: TForm1
  Left = 339
  Top = 216
  Width = 647
  Height = 480
  Caption = #51204#54868#48264#54840#54869#51064
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 417
    Width = 639
    Height = 29
    AutoStyle = False
    BorderInner = fsBump
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 0
    object Panel_ActiveClinetCount: TRzStatusPane
      Left = 2
      Top = 2
      Width = 287
      Height = 25
      Align = alLeft
      BlinkIntervalOff = 1500
    end
    object RzClockStatus1: TRzClockStatus
      Left = 487
      Top = 2
      Height = 25
      Align = alRight
      Interval = 2000
      Alignment = taRightJustify
      BlinkIntervalOff = 1500
    end
    object RXLight: TApdStatusLight
      Left = 242
      Top = 8
      Width = 13
      Height = 13
      Lit = False
      LitColor = clLime
    end
    object TXLight: TApdStatusLight
      Left = 262
      Top = 8
      Width = 13
      Height = 13
      Lit = False
      NotLitColor = clMaroon
    end
    object RzFieldStatus1: TRzFieldStatus
      Left = 289
      Top = 2
      Width = 832
      Height = 25
      Align = alLeft
      BlinkIntervalOff = 1500
    end
  end
  object memo_TelNo: TMemo
    Left = 0
    Top = 113
    Width = 639
    Height = 304
    Align = alClient
    ImeName = 'Microsoft IME 2003'
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 639
    Height = 113
    Align = alTop
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 256
      Top = 88
      Width = 73
      Height = 17
      Caption = 'TEST'
      Visible = False
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 128
      Top = 50
      Width = 12
      Height = 12
      Caption = #52488
    end
    object CB_SerialComm: TLMDLabeledListComboBox
      Left = 24
      Top = 26
      Width = 100
      Height = 21
      Bevel.Mode = bmWindows
      Caret.BlinkRate = 530
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      Items.Strings = (
        'com0'
        'com1'
        'com2'
        'com3'
        'com4'
        'com5'
        'com6'
        'com7'
        'com8'
        'com9'
        'com10'
        'com11'
        'com12'
        'com13'
        'com14'
        'com15'
        'com16'
        'com17'
        'com18'
        'com19')
      LabelSpacing = 1
      EditLabel.Width = 92
      EditLabel.Height = 14
      EditLabel.Caption = 'Serial Commport'
      DateTime = 0.000000000000000000
    end
    object btn_Connect: TBitBtn
      Left = 24
      Top = 72
      Width = 97
      Height = 25
      Caption = #50672#44208
      TabOrder = 1
      OnClick = btn_ConnectClick
    end
    object BitBtn1: TBitBtn
      Left = 156
      Top = 0
      Width = 73
      Height = 25
      Caption = #49704#44592#44592
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object btn_PhoneOpen: TBitBtn
      Left = 156
      Top = 26
      Width = 73
      Height = 25
      Caption = #51204#54868#48155#44592
      TabOrder = 3
      OnClick = btn_PhoneOpenClick
    end
    object btn_PhoneClose: TBitBtn
      Left = 156
      Top = 53
      Width = 73
      Height = 25
      Caption = #51204#54868#45130#44592
      TabOrder = 4
      OnClick = btn_PhoneCloseClick
    end
    object btn_Call: TBitBtn
      Left = 156
      Top = 80
      Width = 73
      Height = 25
      Caption = #51204#54868#44152#44592
      TabOrder = 5
      OnClick = btn_CallClick
    end
    object ed_delay: TEdit
      Left = 24
      Top = 48
      Width = 97
      Height = 20
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      TabOrder = 6
      Text = '0'
      OnChange = ed_delayChange
    end
    object CB_WCDMA: TLMDLabeledListComboBox
      Left = 448
      Top = 26
      Width = 100
      Height = 21
      Bevel.Mode = bmWindows
      Caret.BlinkRate = 530
      ImeName = 'Microsoft IME 2003'
      TabOrder = 7
      Items.Strings = (
        'com0'
        'com1'
        'com2'
        'com3'
        'com4'
        'com5'
        'com6'
        'com7'
        'com8'
        'com9'
        'com10'
        'com11'
        'com12'
        'com13'
        'com14'
        'com15'
        'com16'
        'com17'
        'com18'
        'com19')
      LabelSpacing = 1
      EditLabel.Width = 92
      EditLabel.Height = 14
      EditLabel.Caption = 'Serial Commport'
      DateTime = 0.000000000000000000
    end
    object btn_WCDMAConnect: TBitBtn
      Left = 448
      Top = 56
      Width = 97
      Height = 25
      Caption = #50672#44208
      TabOrder = 8
      OnClick = btn_WCDMAConnectClick
    end
  end
  object WinsockPort: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.0.106'
      '192.168.101.3'
      '192.168.10.3')
    WsLocalAddressIndex = 0
    WsPort = 'telnet'
    WsSocksServerInfo.Port = 0
    AutoOpen = False
    Baud = 38400
    BufferFull = 3072
    BufferResume = 1024
    DeviceLayer = dlWinsock
    TraceAllHex = True
    TraceName = 'APRO.TRC'
    LogAllHex = True
    LogName = 'APRO.LOG'
    PromptForPort = False
    RTS = False
    TapiMode = tmOff
    UseMSRShadow = False
    OnTriggerAvail = WinsockPortTriggerAvail
    Left = 7
    Top = 164
  end
  object ApdSLController1: TApdSLController
    ComPort = WinsockPort
    Lights.TXDLight = TXLight
    Lights.RXDLight = RXLight
    Left = 40
    Top = 168
  end
  object LMDIniCtrl1: TLMDIniCtrl
    IniFile = 'zReg.INI'
    IniPrefix = ppProgram
    Target = itIniFile
    Left = 871
    Top = 124
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 168
    Top = 248
  end
  object TimerBufferSend: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerBufferSendTimer
    Left = 232
    Top = 248
  end
  object tbi: TantTaskbarIcon
    Icon.Data = {
      0000010001002020000000000000A80800001600000028000000200000004000
      0000010008000000000000000000000000000000000000000000000000000000
      0000000080000080000000808000800000008000800080800000C0C0C0008080
      80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000070708080808080808080808080808080808080000000000000000
      0000000000000707070707070707070707070707070707000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000070707070700000000000000000000000000000000
      0000000000000000000007070707070000000000000000000000000000000000
      0000000000000000000707070808000000000000000000000000000000000000
      0000000000000000070708080800000000000000000000000C0C0C0000000000
      0000000000000007080808080000000008080808080C0C07070F0F0C00000000
      000000000000070808080000000808080808080C0C070A0A0A070F0C00000000
      00000000000707080800000808080808080C0C070A0A0A0A0A070F0C00000000
      000000000007080800000808080808080C07070A0A0A0A0A0A0F0C0000000000
      0000000000070800000808080808080C0C070A0A0A0A0A0A070F0C0000000000
      00000000000000000708080808080C0C070A0A0A0A0A0A070F0C000000000000
      000000000000000007080808080C0C070A0A0A0A0A0A070F0C00000000000000
      0000000000000007070808080C0C070A0A0A0A0A0A0A070F0C00000000000000
      00000000000000070808080C0C07070A0A0A0A0A0A070F0C0000000000000000
      000000000000000708080C0C0C0C070A0A0A0A0A0A0F0C000000000000000000
      0000000000000707080C0C07070C0C070A0A0A0A0F0C00000000000000000000
      00000000000007070C0C070A0A070C0C070A0A0F0C0000000000000000000000
      000000000000070C0C070A0A0A0A070C0C070F0C000000000000000000000000
      000000000007070C07070A0A0A0A0A070C0C0C00000000000000000000000000
      0000000000070C07070A0A0A0A0A0A070F0C0C00000000000000000000000000
      0000000000070C070A0A0A0A0A0A070F0C000C0C0C0C0C000000000000000000
      00000000000C070A0A0A0A0A0A0A0F0C00000000090909000000000000000000
      00000000000C070A0A0A0A07070F0C0000000000000909000000000000000000
      000000000C07070A0A0A070F0F0C000000000000000000070000000000000000
      000000000C0F0707070F0F0C0C00000000000000000000000000000000000000
      000000000C0F0F0F0F0C0C000000000000000000000000000000000000000000
      00000000000C0C0C0C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFC00001FFE00003FFF00007FFFF01FFFFFE03FFFFFC07FFFFF80C007FF00
      0003FE000003FC000003FC000007FC000007FE00000FFF80001FFF00001FFF00
      003FFF00007FFE0000FFFE0001FFFE0003FFFC0007FFFC0007FFFC00107FFC00
      383FFC007C3FFC00FE3FFC01FFFFFC07FFFFFE1FFFFFFFFFFFFFFFFFFFFF}
    PopupMenu = pmTest
    OnDblClick = tbiDblClick
    Left = 120
    Top = 65535
  end
  object pmTest: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 96
    Top = 65535
    object N5: TMenuItem
      Caption = #51204#54868#48155#44592
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #51204#54868#45130#44592
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #51204#54868#44152#44592
      OnClick = N7Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object miShow: TMenuItem
      Caption = #54868#47732#48372#44592
      OnClick = miShowClick
    end
    object N4: TMenuItem
      Caption = #51116#49884#51089
      OnClick = N4Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Ver011: TMenuItem
      Caption = 'Ver 4.4'
    end
    object N9: TMenuItem
      Caption = #50629#44536#47112#51060#46300
      OnClick = N9Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #51333#47308
      OnClick = N1Click
    end
  end
  object HideTimer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = HideTimerTimer
    Left = 200
    Top = 248
  end
  object RSERVER1: TDXServerCore
    ReleaseDate = '2003-04-15'
    ListenerThreadPriority = tpNormal
    SpawnedThreadPriority = tpNormal
    ProtocolToBind = wpTCPOnly
    ServerPort = 100001
    Suspend = False
    UseSSL = False
    UseNagle = False
    UseThreadPool = True
    SocketOutputBufferSize = bsfNormal
    SocketQueueSize = 100
    ServerType = stThreadBlocking
    ThreadCacheSize = 20
    Timeout = 10000
    OnNewConnect = RSERVER1NewConnect
    Left = 8
    Top = 128
  end
  object DXUnicastDataQueue1: TDXUnicastDataQueue
    ReleaseDate = '2003-04-15'
    IgnoreOverruns = True
    ThreadStart = False
    Left = 40
    Top = 127
  end
  object IdUDPClient1: TIdUDPClient
    Port = 0
    Left = 264
    Top = 251
  end
  object IdUDPServer1: TIdUDPServer
    Bindings = <>
    DefaultPort = 0
    OnUDPRead = IdUDPServer1UDPRead
    Left = 120
    Top = 259
  end
  object WinsockWCDMA: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.0.106'
      '192.168.101.3'
      '192.168.10.3')
    WsLocalAddressIndex = 0
    WsPort = 'telnet'
    WsSocksServerInfo.Port = 0
    AutoOpen = False
    Baud = 38400
    BufferFull = 3072
    BufferResume = 1024
    DeviceLayer = dlWinsock
    TraceAllHex = True
    TraceName = 'APRO.TRC'
    LogAllHex = True
    LogName = 'APRO.LOG'
    PromptForPort = False
    TapiMode = tmOff
    UseMSRShadow = False
    OnTriggerAvail = WinsockWCDMATriggerAvail
    Left = 7
    Top = 204
  end
  object ApdSLController2: TApdSLController
    ComPort = WinsockWCDMA
    Lights.TXDLight = TXLight
    Lights.RXDLight = RXLight
    Left = 40
    Top = 208
  end
  object SMSTimer: TTimer
    Enabled = False
    OnTimer = SMSTimerTimer
    Left = 168
    Top = 280
  end
end
