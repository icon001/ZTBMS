object fmMain: TfmMain
  Left = 442
  Top = 287
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'KT'#49324#50896#48264#54840#48320#44221
  ClientHeight = 153
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object btn_Change: TSpeedButton
    Left = 16
    Top = 16
    Width = 361
    Height = 57
    Caption = #49324#50896#48264#54840#48320#44221'(9'#51088#47532'->8'#51088#47532')'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btn_ChangeClick
  end
  object Gauge1: TGauge
    Left = 16
    Top = 104
    Width = 361
    Height = 33
    ForeColor = clBlue
    Progress = 0
  end
  object st_count: TStaticText
    Left = 16
    Top = 80
    Width = 193
    Height = 16
    AutoSize = False
    TabOrder = 0
  end
  object MDBADOConnection: TADOConnection
    ConnectionString = 
      'Provider=PostgreSQL.1;Password=1;User ID=postgres;Data Source=12' +
      '7.0.0.1;Location="";Extended Properties=""'
    Provider = 'PostgreSQL.1'
    Left = 32
    Top = 32
  end
  object MdbTempADOQuery: TADOQuery
    Connection = MDBADOConnection
    Parameters = <>
    Left = 64
    Top = 32
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 48
    Top = 80
  end
end
