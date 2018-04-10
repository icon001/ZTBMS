object dmSocket: TdmSocket
  OldCreateOrder = False
  Left = 206
  Top = 111
  Height = 150
  Width = 215
  object Commport: TApdWinsockPort
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
    OnWsAccept = CommportWsAccept
    OnWsConnect = CommportWsConnect
    OnWsDisconnect = CommportWsDisconnect
    OnWsError = CommportWsError
    OnTriggerAvail = CommportTriggerAvail
    OnTriggerOutSent = CommportTriggerOutSent
    Left = 47
    Top = 12
  end
  object SendTimer: TTimer
    Interval = 200
    OnTimer = SendTimerTimer
    Left = 84
    Top = 12
  end
end
