object Form1: TForm1
  Left = 629
  Top = 391
  Width = 295
  Height = 321
  Caption = 'FildChange'
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 287
    Height = 169
    Align = alTop
    TabOrder = 0
    object chk_Company: TCheckBox
      Left = 16
      Top = 24
      Width = 81
      Height = 25
      Caption = #54924#49324#53076#46300
      TabOrder = 0
    end
    object ed_companycode: TEdit
      Left = 152
      Top = 26
      Width = 73
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 1
      Text = '10'
    end
    object chk_Jijum: TCheckBox
      Left = 16
      Top = 48
      Width = 81
      Height = 25
      Caption = #51648#51216#53076#46300
      TabOrder = 2
    end
    object ed_jijumcode: TEdit
      Left = 152
      Top = 50
      Width = 73
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 3
      Text = '10'
    end
    object ed_departcode: TEdit
      Left = 152
      Top = 74
      Width = 73
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 4
      Text = '10'
    end
    object chk_Depart: TCheckBox
      Left = 16
      Top = 72
      Width = 81
      Height = 25
      Caption = #48512#49436#53076#46300
      TabOrder = 5
    end
    object chk_posi: TCheckBox
      Left = 16
      Top = 96
      Width = 81
      Height = 25
      Caption = #51649#50948#53076#46300
      TabOrder = 6
    end
    object ed_posicode: TEdit
      Left = 152
      Top = 98
      Width = 73
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 7
      Text = '10'
    end
    object chk_empcode: TCheckBox
      Left = 16
      Top = 120
      Width = 81
      Height = 25
      Caption = #49324#48264
      Enabled = False
      TabOrder = 8
    end
    object ed_employeecode: TEdit
      Left = 152
      Top = 122
      Width = 73
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 9
      Text = '50'
    end
  end
  object btn_Field: TButton
    Left = 64
    Top = 192
    Width = 153
    Height = 41
    Caption = 'Field'#44600#51060' '#48320#44221
    TabOrder = 1
    OnClick = btn_FieldClick
  end
end
