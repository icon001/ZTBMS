inherited fmSMSLogin: TfmSMSLogin
  Left = 506
  Top = 367
  Width = 231
  Height = 148
  Caption = #47196#44536#51064
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object btn_Login: TSpeedButton [0]
    Left = 8
    Top = 72
    Width = 90
    Height = 25
    Caption = #47196#44536#51064
    OnClick = btn_LoginClick
  end
  object btn_Cancel: TSpeedButton [1]
    Left = 112
    Top = 72
    Width = 90
    Height = 25
    Caption = #45803#44592
    OnClick = btn_CancelClick
  end
  object Label1: TLabel [2]
    Left = 8
    Top = 20
    Width = 12
    Height = 12
    Caption = 'ID'
  end
  object Label2: TLabel [3]
    Left = 8
    Top = 44
    Width = 48
    Height = 12
    Caption = #48708#48128#48264#54840
  end
  object edUserID: TEdit [4]
    Left = 72
    Top = 16
    Width = 129
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 0
    OnKeyPress = edUserIDKeyPress
  end
  object edPassword: TEdit [5]
    Left = 72
    Top = 40
    Width = 129
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 1
    OnKeyPress = edPasswordKeyPress
  end
end
