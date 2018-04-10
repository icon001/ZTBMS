object Form1: TForm1
  Left = 192
  Top = 114
  Width = 870
  Height = 640
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn_Send: TSpeedButton
    Left = 232
    Top = 16
    Width = 153
    Height = 41
    Caption = #51204#49569
    OnClick = btn_SendClick
  end
  object ed_cardNo: TEdit
    Left = 40
    Top = 24
    Width = 137
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 0
    Text = '04412441'
  end
  object Memo1: TMemo
    Left = 24
    Top = 64
    Width = 617
    Height = 241
    ImeName = 'Microsoft Office IME 2007'
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object WinsockPort1: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.0.109')
    WsLocalAddressIndex = 0
    WsPort = '3431'
    WsSocksServerInfo.Port = 0
    AutoOpen = False
    DeviceLayer = dlWinsock
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    TapiMode = tmOff
    UseMSRShadow = False
    OnTriggerAvail = WinsockPort1TriggerAvail
    Left = 184
    Top = 23
  end
end
