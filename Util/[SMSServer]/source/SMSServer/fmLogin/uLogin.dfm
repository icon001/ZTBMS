inherited fmLogin: TfmLogin
  Left = 531
  Top = 370
  Width = 442
  Height = 263
  Caption = #47196#44536#51064
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  Font.Name = #44404#47548
  FormStyle = fsMDIForm
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  object btn_Login: TSpeedButton [0]
    Left = 72
    Top = 148
    Width = 113
    Height = 33
    Caption = #47196#44536#51064
    OnClick = btn_LoginClick
  end
  object btn_Cancel: TSpeedButton [1]
    Left = 264
    Top = 148
    Width = 113
    Height = 33
    Caption = #45803#44592
    OnClick = btn_CancelClick
  end
  object edUserID: TEdit [2]
    Left = 120
    Top = 56
    Width = 209
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 0
    Text = 'edUserID'
  end
  object edPassword: TEdit [3]
    Left = 120
    Top = 104
    Width = 209
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 1
    Text = 'edUserID'
  end
end
