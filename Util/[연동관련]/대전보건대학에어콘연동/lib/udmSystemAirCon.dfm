object dmSystemAircon: TdmSystemAircon
  OldCreateOrder = False
  Left = 758
  Top = 271
  Height = 150
  Width = 215
  object SentenceSock: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.50.128')
    WsLocalAddressIndex = 0
    WsPort = '3431'
    WsSocksServerInfo.Port = 0
    AutoOpen = False
    DeviceLayer = dlWinsock
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    TapiMode = tmOff
    UseMSRShadow = False
    Left = 24
    Top = 15
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    Left = 88
    Top = 24
  end
end
