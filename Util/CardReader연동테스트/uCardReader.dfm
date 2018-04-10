object Form1: TForm1
  Left = 395
  Top = 175
  Width = 332
  Height = 148
  Caption = 'CardRead'
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 60
    Height = 12
    Caption = #49884#47532#50620#54252#53944
  end
  object Label19: TLabel
    Left = 8
    Top = 41
    Width = 48
    Height = 12
    Caption = #52852#46300#48264#54840
  end
  object SpeedButton1: TSpeedButton
    Left = 88
    Top = 72
    Width = 97
    Height = 25
    Caption = #45803#44592
    OnClick = SpeedButton1Click
  end
  object cmb_ComPort: TComboBox
    Left = 80
    Top = 12
    Width = 121
    Height = 20
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 12
    TabOrder = 0
    OnChange = cmb_ComPortChange
  end
  object ed_CardNo: TEdit
    Left = 80
    Top = 37
    Width = 169
    Height = 20
    ImeName = 'Microsoft IME 2003'
    MaxLength = 10
    TabOrder = 1
  end
  object chk_Send: TCheckBox
    Left = 216
    Top = 16
    Width = 57
    Height = 17
    Caption = #51204#49569
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object ReaderPort: TApdComPort
    Baud = 9600
    AutoOpen = False
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    Left = 24
    Top = 68
  end
  object ApdDataPacket1: TApdDataPacket
    Enabled = True
    AutoEnable = False
    ComPort = ReaderPort
    PacketSize = 0
    OnStringPacket = ApdDataPacket1StringPacket
    Left = 56
    Top = 76
  end
  object IdTCPClient1: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 0
    Left = 224
    Top = 72
  end
end
