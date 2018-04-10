object fmPhoneCall: TfmPhoneCall
  Left = 482
  Top = 356
  Width = 281
  Height = 137
  Caption = 'fmPhoneCall'
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
  object Label1: TLabel
    Left = 8
    Top = 28
    Width = 48
    Height = 12
    Caption = #51204#54868#48264#54840
  end
  object ed_PhoneNum: TEdit
    Left = 72
    Top = 24
    Width = 177
    Height = 20
    ImeName = 'Microsoft IME 2003'
    TabOrder = 0
    OnKeyPress = ed_PhoneNumKeyPress
  end
  object btn_call: TButton
    Left = 40
    Top = 64
    Width = 73
    Height = 25
    Caption = #51204#54868#44152#44592
    TabOrder = 1
    OnClick = btn_callClick
  end
  object btn_Cancel: TButton
    Left = 144
    Top = 64
    Width = 73
    Height = 25
    Caption = #52712#49548
    TabOrder = 2
    OnClick = btn_CancelClick
  end
end
