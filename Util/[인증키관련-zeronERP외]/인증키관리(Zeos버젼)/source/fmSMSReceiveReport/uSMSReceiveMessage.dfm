object fmSMSReceiveMessage: TfmSMSReceiveMessage
  Left = 709
  Top = 179
  Width = 365
  Height = 590
  Caption = 'fmSMSReceiveMessage'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 73
    Height = 13
    AutoSize = False
    Caption = #48156#49888#48264#54840
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 73
    Height = 13
    AutoSize = False
    Caption = #48156#49888#51088
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 73
    Height = 13
    AutoSize = False
    Caption = 'SMS '#47700#49884#51648
  end
  object mem_Message: TMemo
    Left = 16
    Top = 104
    Width = 321
    Height = 385
    ImeName = 'Microsoft IME 2010'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 128
    Top = 512
    Width = 105
    Height = 25
    Caption = #54869#51064
    TabOrder = 1
    OnClick = Button1Click
  end
  object ed_Telnumber: TEdit
    Left = 104
    Top = 12
    Width = 233
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 2
  end
  object ed_UserName: TEdit
    Left = 104
    Top = 44
    Width = 233
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 3
  end
end
