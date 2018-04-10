object fmSMSSender: TfmSMSSender
  Left = 726
  Top = 256
  Width = 401
  Height = 291
  Caption = 'fmSMSSender'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 78
    Height = 17
    Caption = #49688#49888#51204#54868#48264#54840
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 65
    Height = 17
    Caption = #47928#51088#47700#49884#51648
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 39
    Height = 17
    Caption = #44544#51088#49688
  end
  object lb_count: TLabel
    Left = 56
    Top = 88
    Width = 39
    Height = 17
    AutoSize = False
  end
  object ed_PhoneNumber: TEdit
    Left = 104
    Top = 8
    Width = 225
    Height = 25
    ImeName = 'Microsoft IME 2010'
    TabOrder = 0
  end
  object mem_Message: TMemo
    Left = 104
    Top = 40
    Width = 225
    Height = 137
    ImeName = 'Microsoft IME 2010'
    TabOrder = 1
    OnKeyUp = mem_MessageKeyUp
  end
  object Button1: TButton
    Left = 104
    Top = 192
    Width = 225
    Height = 33
    Caption = #47928#51088#51204#49569
    TabOrder = 2
    OnClick = Button1Click
  end
end
