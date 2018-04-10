object dm3MPServer: Tdm3MPServer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 1165
  Top = 229
  Height = 475
  Width = 425
  object KTSocket: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.0.106'
      '192.168.101.3'
      '192.168.10.3')
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
    OnWsConnect = KTSocketWsConnect
    OnWsDisconnect = KTSocketWsDisconnect
    OnWsError = KTSocketWsError
    OnTriggerAvail = KTSocketTriggerAvail
    Left = 31
    Top = 60
  end
end
