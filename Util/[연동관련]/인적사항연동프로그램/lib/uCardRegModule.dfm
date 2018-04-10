object dmCardReg: TdmCardReg
  OldCreateOrder = False
  Left = 673
  Top = 320
  Height = 150
  Width = 215
  object ReaderPort: TApdComPort
    Baud = 9600
    AutoOpen = False
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    Left = 24
    Top = 20
  end
  object ApdDataPacket1: TApdDataPacket
    Enabled = True
    AutoEnable = False
    ComPort = ReaderPort
    PacketSize = 0
    OnStringPacket = ApdDataPacket1StringPacket
    Left = 56
    Top = 20
  end
end
