object fmRelaysentence: TfmRelaysentence
  Left = 446
  Top = 157
  Width = 513
  Height = 299
  Caption = 'fmRelaysentence'
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object sbSave: TSpeedButton
    Left = 120
    Top = 210
    Width = 89
    Height = 25
    Caption = #51201#50857
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    OnClick = sbSaveClick
  end
  object sbCancel: TSpeedButton
    Left = 280
    Top = 210
    Width = 89
    Height = 25
    Caption = #52712#49548
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      3333333777333777FF3333993333339993333377FF3333377FF3399993333339
      993337777FF3333377F3393999333333993337F777FF333337FF993399933333
      399377F3777FF333377F993339993333399377F33777FF33377F993333999333
      399377F333777FF3377F993333399933399377F3333777FF377F993333339993
      399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
      99333773FF3333777733339993333339933333773FFFFFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    NumGlyphs = 2
    OnClick = sbCancelClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 505
    Height = 73
    Align = alTop
    Caption = #50672#46041#45936#51060#53552
    TabOrder = 0
    object chk_serial: TCheckBox
      Left = 109
      Top = 16
      Width = 81
      Height = 17
      Caption = #51068#47144#48264#54840
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chk_companycode: TCheckBox
      Left = 204
      Top = 16
      Width = 81
      Height = 17
      Caption = #54924#49324#53076#46300
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chk_empno: TCheckBox
      Left = 299
      Top = 16
      Width = 81
      Height = 17
      Caption = #49324#50896#48264#54840
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object chk_empname: TCheckBox
      Left = 394
      Top = 16
      Width = 81
      Height = 17
      Caption = #51060#47492
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object chk_changestate: TCheckBox
      Left = 109
      Top = 40
      Width = 81
      Height = 17
      Caption = #48320#44221#49345#53468
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object chk_cardstate: TCheckBox
      Left = 14
      Top = 40
      Width = 81
      Height = 17
      Caption = #52852#46300#49345#53468
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object chk_cardNo: TCheckBox
      Left = 14
      Top = 16
      Width = 81
      Height = 17
      Caption = #52852#46300#48264#54840
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 73
    Width = 505
    Height = 56
    Align = alTop
    Caption = #45936#51060#53552#44396#48516
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 72
      Height = 12
      Caption = #45936#51060#53552#44396#48516#51088
    end
    object ed_Delimiter: TEdit
      Left = 104
      Top = 20
      Width = 25
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      Text = ','
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 129
    Width = 505
    Height = 64
    Align = alTop
    Caption = #50672#46041#49436#48260#51221#48372
    TabOrder = 2
    object Label2: TLabel
      Left = 16
      Top = 28
      Width = 12
      Height = 12
      Caption = 'IP'
    end
    object Label3: TLabel
      Left = 224
      Top = 28
      Width = 24
      Height = 12
      Caption = 'PORT'
    end
    object ed_relayserverIP: TEdit
      Left = 40
      Top = 24
      Width = 137
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
    end
    object ed_relayserverPort: TEdit
      Left = 264
      Top = 24
      Width = 97
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
    end
  end
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 32
    Top = 96
  end
end
