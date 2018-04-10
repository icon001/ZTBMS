object dmDevice: TdmDevice
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 871
  Top = 278
  Height = 267
  Width = 420
  object WinsockPort: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.0.109')
    WsLocalAddressIndex = 0
    WsPort = 'telnet'
    WsSocksServerInfo.Port = 0
    WsTelnet = False
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
    OnWsAccept = WinsockPortWsAccept
    OnWsDisconnect = WinsockPortWsDisconnect
    OnWsError = WinsockPortWsError
    OnTriggerAvail = WinsockPortTriggerAvail
    Left = 7
    Top = 4
  end
  object ApdSLController1: TApdSLController
    ComPort = WinsockPort
    Left = 8
    Top = 64
  end
  object SendTimer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = SendTimerTimer
    Left = 80
    Top = 16
  end
  object PolingTimer: TTimer
    Enabled = False
    Interval = 9000
    OnTimer = PolingTimerTimer
    Left = 88
    Top = 64
  end
  object EventSendingTimer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = EventSendingTimerTimer
    Left = 152
    Top = 56
  end
end
