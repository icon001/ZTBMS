object SerialModule: TSerialModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 114
  Height = 150
  Width = 215
  object WinsockPort: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.0.100')
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
    Top = 12
  end
  object ApdSLController1: TApdSLController
    ComPort = WinsockPort
    Left = 40
    Top = 8
  end
end
