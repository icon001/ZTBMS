object dmCardReader: TdmCardReader
  OldCreateOrder = False
  Left = 318
  Top = 114
  Height = 150
  Width = 215
  object CardCreatePort: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.0.109')
    WsLocalAddressIndex = 0
    WsPort = '3431'
    WsSocksServerInfo.Port = 0
    AutoOpen = False
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    Left = 16
    Top = 15
  end
  object ReaderPort: TApdComPort
    Baud = 9600
    AutoOpen = False
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    Left = 8
    Top = 68
  end
  object ApdDataPacket1: TApdDataPacket
    Enabled = True
    AutoEnable = False
    ComPort = ReaderPort
    PacketSize = 0
    Left = 40
    Top = 68
  end
end
