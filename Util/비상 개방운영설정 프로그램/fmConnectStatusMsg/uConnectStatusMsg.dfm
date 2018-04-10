object fmConnectStatusMsg: TfmConnectStatusMsg
  Left = 567
  Top = 326
  Width = 343
  Height = 138
  BorderIcons = [biSystemMenu]
  Caption = #50672#44208#49345#53468
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object SpeedButton1: TSpeedButton
    Left = 112
    Top = 64
    Width = 97
    Height = 25
    Caption = 'CLOSE'
    OnClick = SpeedButton1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 335
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Caption = #50672#44208#46104#50632#49845#45768#45796'.'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object WaitTimer: TTimer
    OnTimer = WaitTimerTimer
    Left = 24
    Top = 16
  end
end
