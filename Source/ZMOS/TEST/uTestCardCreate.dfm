object fmTestCardCreate: TfmTestCardCreate
  Left = 453
  Top = 294
  Width = 298
  Height = 225
  Caption = 'fmTestCardCreate'
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
    Left = 8
    Top = 16
    Width = 78
    Height = 13
    Caption = #52852#46300#49373#49457#44148#49688
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 52
    Height = 13
    Caption = #52852#46300#44600#51060
  end
  object Gauge1: TGauge
    Left = 16
    Top = 72
    Width = 249
    Height = 17
    ForeColor = clNavy
    Progress = 0
  end
  object SpeedButton1: TSpeedButton
    Left = 16
    Top = 112
    Width = 113
    Height = 33
    Caption = #49373#49457
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 152
    Top = 112
    Width = 113
    Height = 33
    Caption = #45803#44592
    OnClick = SpeedButton2Click
  end
  object ed_cardCount: TEdit
    Left = 96
    Top = 16
    Width = 89
    Height = 21
    ImeName = 'Microsoft IME 2003'
    TabOrder = 0
    Text = '65000'
  end
  object ed_cardLen: TEdit
    Left = 96
    Top = 40
    Width = 89
    Height = 21
    ImeName = 'Microsoft IME 2003'
    TabOrder = 1
    Text = '11'
  end
  object ADOExec: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 16
    Top = 8
  end
end
