object fmUser: TfmUser
  Left = 507
  Top = 388
  Width = 360
  Height = 272
  BorderIcons = []
  Caption = #49324#50857#51088#51077#47141
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
    Left = 16
    Top = 136
    Width = 66
    Height = 12
    Caption = #51089#50629#51088' '#51060#47492
  end
  object Label2: TLabel
    Left = 16
    Top = 160
    Width = 90
    Height = 12
    Caption = #51089#50629#51088' '#51204#54868#48264#54840
  end
  object btnOk: TSpeedButton
    Left = 40
    Top = 192
    Width = 105
    Height = 33
    Caption = #54869#51064
    OnClick = btnOkClick
  end
  object btnCancel: TSpeedButton
    Left = 200
    Top = 192
    Width = 105
    Height = 33
    Caption = #52712#49548
    OnClick = btnCancelClick
  end
  object ed_name: TEdit
    Left = 120
    Top = 136
    Width = 185
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 0
  end
  object ed_Phone: TEdit
    Left = 120
    Top = 160
    Width = 185
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 1
  end
  object st_msg: TStaticText
    Left = 0
    Top = 0
    Width = 352
    Height = 113
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 2
  end
end
