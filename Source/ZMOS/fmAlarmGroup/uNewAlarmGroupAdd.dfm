object fmNewAlarmGroupName: TfmNewAlarmGroupName
  Left = 407
  Top = 366
  Width = 315
  Height = 121
  Caption = #50508#46988#44536#47353#52628#44032
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
    Top = 16
    Width = 72
    Height = 12
    Caption = #50508#46988#44536#47353#47749#52845
  end
  object ed_GroupName: TEdit
    Left = 104
    Top = 12
    Width = 145
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 0
  end
  object btn_Add: TButton
    Left = 72
    Top = 48
    Width = 73
    Height = 25
    Caption = #52628#44032
    TabOrder = 1
    OnClick = btn_AddClick
  end
  object btn_Cancel: TButton
    Left = 176
    Top = 48
    Width = 73
    Height = 25
    Caption = #52712#49548
    TabOrder = 2
    OnClick = btn_CancelClick
  end
end
