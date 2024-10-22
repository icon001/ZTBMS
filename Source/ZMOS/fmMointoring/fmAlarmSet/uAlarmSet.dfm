object fmAlarmSet: TfmAlarmSet
  Left = 1174
  Top = 375
  Width = 381
  Height = 274
  Caption = #50508#46988' '#54869#51064' '#49483#54021
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 373
    Height = 97
    Align = alTop
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 48
      Height = 12
      Caption = #44221#48708#44396#50669
    end
    object Label2: TLabel
      Left = 16
      Top = 44
      Width = 48
      Height = 12
      Caption = #48156#49373#53076#46300
    end
    object Label3: TLabel
      Left = 16
      Top = 68
      Width = 60
      Height = 12
      Caption = #51060#48292#53944#45236#50857
    end
    object ed_AlarmName: TEdit
      Left = 80
      Top = 16
      Width = 281
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
    end
    object ed_AlarmCode: TEdit
      Left = 80
      Top = 40
      Width = 281
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
    end
    object ed_AlarmContent: TEdit
      Left = 80
      Top = 64
      Width = 281
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 97
    Width = 373
    Height = 143
    Align = alClient
    Caption = #52376#47532#45236#50857
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 24
      Width = 48
      Height = 12
      Caption = #52376#47532#53076#46300
    end
    object Label5: TLabel
      Left = 16
      Top = 48
      Width = 36
      Height = 12
      Caption = #47700#49464#51648
    end
    object cmb_Code: TComboBox
      Left = 80
      Top = 20
      Width = 281
      Height = 20
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 0
    end
    object mem_Msg: TMemo
      Left = 80
      Top = 48
      Width = 281
      Height = 41
      ImeName = 'Microsoft IME 2003'
      MaxLength = 100
      TabOrder = 1
    end
    object btn_Save: TBitBtn
      Left = 80
      Top = 104
      Width = 97
      Height = 25
      Caption = #51201#50857
      TabOrder = 2
      OnClick = btn_SaveClick
    end
    object btn_Close: TBitBtn
      Left = 208
      Top = 104
      Width = 97
      Height = 25
      Caption = #52712#49548
      TabOrder = 3
      OnClick = btn_CloseClick
    end
  end
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 16
    Top = 136
  end
end
