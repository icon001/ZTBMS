object dmKTTDDNS: TdmKTTDDNS
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 433
  Top = 177
  Height = 295
  Width = 495
  object DDNSRegTimer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = DDNSRegTimerTimer
    Left = 32
    Top = 8
  end
  object DDNSSocket: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.0.106'
      '192.168.101.3')
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
    OnWsConnect = DDNSSocketWsConnect
    OnWsDisconnect = DDNSSocketWsDisconnect
    OnWsError = DDNSSocketWsError
    OnTriggerAvail = DDNSSocketTriggerAvail
    Left = 31
    Top = 60
  end
  object DDNSQueryTimer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = DDNSQueryTimerTimer
    Left = 136
    Top = 8
  end
  object DDNSQuerySocket: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.0.106'
      '192.168.101.3')
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
    OnWsConnect = DDNSQuerySocketWsConnect
    OnWsDisconnect = DDNSQuerySocketWsDisconnect
    OnWsError = DDNSQuerySocketWsError
    OnTriggerAvail = DDNSQuerySocketTriggerAvail
    Left = 135
    Top = 60
  end
end
