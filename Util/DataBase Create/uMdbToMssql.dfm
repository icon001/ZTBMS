object fmMain: TfmMain
  Left = 449
  Top = 114
  Width = 427
  Height = 456
  Caption = #45936#51060#53552#48288#51060#49828#49373#49457
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 0
    Top = 57
    Width = 419
    Height = 152
    Align = alTop
    Caption = #45936#51060#53552#48288#51060#49828' '#44228#51221#51221#48372
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 20
      Width = 42
      Height = 12
      Caption = #49436#48260' IP'
    end
    object Label3: TLabel
      Left = 16
      Top = 44
      Width = 54
      Height = 12
      Caption = #49436#48260' Port'
    end
    object Label4: TLabel
      Left = 16
      Top = 68
      Width = 42
      Height = 12
      Caption = #44228#51221' ID'
    end
    object Label5: TLabel
      Left = 16
      Top = 92
      Width = 48
      Height = 12
      Caption = #48708#48128#48264#54840
    end
    object Label6: TLabel
      Left = 16
      Top = 116
      Width = 24
      Height = 12
      Caption = 'DB'#47749
    end
    object ed_serverip: TEdit
      Left = 80
      Top = 16
      Width = 209
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
    end
    object ed_serverPort: TEdit
      Left = 80
      Top = 40
      Width = 209
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
    end
    object ed_userid: TEdit
      Left = 80
      Top = 64
      Width = 209
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 2
    end
    object ed_Passwd: TEdit
      Left = 80
      Top = 88
      Width = 209
      Height = 20
      ImeName = 'Microsoft IME 2003'
      PasswordChar = '*'
      TabOrder = 3
    end
    object ed_DBName: TEdit
      Left = 80
      Top = 112
      Width = 209
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 4
    end
    object rg_Type: TRadioGroup
      Left = 296
      Top = 64
      Width = 105
      Height = 81
      ItemIndex = 0
      Items.Strings = (
        'MDB->MSSQL'
        'MSSQL->MDB')
      TabOrder = 5
      Visible = False
    end
    object chk_DataBaseCreate: TCheckBox
      Left = 296
      Top = 16
      Width = 121
      Height = 17
      Caption = #45936#51060#53552#48288#51060#49828#49373#49457
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 419
    Height = 57
    Align = alTop
    Caption = 'MDB '#51221#48372
    TabOrder = 1
    Visible = False
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 48
      Height = 12
      Caption = 'MDB '#54028#51068
    end
    object ed_mdbfile: TEdit
      Left = 80
      Top = 16
      Width = 209
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
    end
    object btn_FileSearch: TBitBtn
      Left = 304
      Top = 14
      Width = 81
      Height = 25
      Caption = #54028#51068' '#52286#44592
      TabOrder = 1
      OnClick = btn_FileSearchClick
    end
  end
  object btn_DBTrance: TButton
    Left = 152
    Top = 320
    Width = 113
    Height = 41
    Caption = #45936#51060#53552#49373#49457
    TabOrder = 2
    OnClick = btn_DBTranceClick
  end
  object btn_Exit: TButton
    Left = 312
    Top = 320
    Width = 113
    Height = 41
    Caption = #51333' '#47308
    TabOrder = 3
    Visible = False
    OnClick = btn_ExitClick
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 257
    Width = 419
    Height = 64
    Align = alTop
    TabOrder = 4
    object Label7: TLabel
      Left = 16
      Top = 16
      Width = 377
      Height = 17
      AutoSize = False
    end
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 40
      Width = 393
      Height = 17
      TabOrder = 0
      Visible = False
    end
  end
  object rg_DBType: TRadioGroup
    Left = 0
    Top = 365
    Width = 419
    Height = 57
    Align = alBottom
    Caption = 'DataBase Type '#49440#53469
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'MSSQL'
      'PostgreSQL'
      'MDB'
      'FireBird')
    TabOrder = 5
    OnClick = rg_DBTypeClick
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 209
    Width = 419
    Height = 48
    Align = alTop
    Caption = #54532#47196#44536#47016#54872#44221#49444#51221
    TabOrder = 6
    object cmb_Program: TComboBox
      Left = 80
      Top = 20
      Width = 209
      Height = 20
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 0
      Items.Strings = (
        ''
        '1.'#48276#50857#54532#47196#44536#47016
        '2.KT'#49324#50725)
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'TXT'
    Left = 588
    Top = 68
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Top = 256
  end
  object ADOMDBConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=SA;Initi' +
      'al Catalog=master;Data Source=127.0.0.1'
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 232
  end
  object ADOMDBQuery: TADOQuery
    Connection = ADOMDBConnection
    Parameters = <>
    Left = 48
    Top = 256
  end
  object ADOMdbTemp: TADOQuery
    Connection = ADOMDBConnection
    Parameters = <>
    Left = 80
    Top = 240
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=SA;Initi' +
      'al Catalog=master;Data Source=127.0.0.1'
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 280
  end
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=PostgreSQL.1;Password=1;User ID=postgres;Data Source=12' +
      '7.0.0.1;Location=zmos;Extended Properties=""'
    Provider = 'PostgreSQL.1'
    Left = 40
    Top = 320
  end
end
