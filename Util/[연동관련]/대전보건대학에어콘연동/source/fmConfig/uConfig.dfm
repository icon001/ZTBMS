object fmConfig: TfmConfig
  Left = 442
  Top = 333
  Width = 419
  Height = 340
  Caption = #54872#44221#49444#51221
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
  object sbSave: TSpeedButton
    Left = 80
    Top = 232
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
    Left = 240
    Top = 232
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 272
    Width = 411
    Height = 34
    Panels = <
      item
        Width = 300
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 411
    Height = 217
    ActivePage = TabSheet2
    Align = alTop
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #51217#49549#54872#44221
      object Label2: TLabel
        Left = 16
        Top = 20
        Width = 96
        Height = 12
        Caption = #45936#51060#53552#48288#51060#49828#53440#51077
      end
      object Label3: TLabel
        Left = 16
        Top = 44
        Width = 84
        Height = 12
        Caption = #45936#51060#53552#48288#51060#49828'IP'
      end
      object Label4: TLabel
        Left = 16
        Top = 68
        Width = 96
        Height = 12
        Caption = #45936#51060#53552#48288#51060#49828'PORT'
      end
      object Label6: TLabel
        Left = 16
        Top = 92
        Width = 36
        Height = 12
        Caption = #44228#51221'ID'
      end
      object Label8: TLabel
        Left = 16
        Top = 116
        Width = 60
        Height = 12
        Caption = #44228#51221'PASSWD'
      end
      object Label5: TLabel
        Left = 16
        Top = 140
        Width = 84
        Height = 12
        Caption = #45936#51060#53552#48288#51060#49828#47749
      end
      object cmb_DBType: TComboBox
        Left = 128
        Top = 16
        Width = 201
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        ItemHeight = 12
        ItemIndex = 2
        TabOrder = 0
        Text = '3.ORACLE'
        Items.Strings = (
          '1.MSSQL'
          '2.POSTGRESQL'
          '3.ORACLE'
          '4.MDB')
      end
      object ed_dbip: TEdit
        Left = 128
        Top = 40
        Width = 201
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 1
        Text = 'ed_dbip'
      end
      object ed_dbport: TEdit
        Left = 128
        Top = 64
        Width = 201
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 2
        Text = 'Edit1'
      end
      object ed_dbuserid: TEdit
        Left = 128
        Top = 88
        Width = 201
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 3
        Text = 'Edit1'
      end
      object ed_dbpw: TEdit
        Left = 128
        Top = 112
        Width = 201
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 4
        Text = 'Edit1'
      end
      object ed_dbname: TEdit
        Left = 128
        Top = 136
        Width = 201
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 5
        Text = 'Edit1'
      end
    end
    object TabSheet2: TTabSheet
      Caption = #54532#47196#44536#47016
      ImageIndex = 1
      object Label1: TLabel
        Left = 16
        Top = 12
        Width = 72
        Height = 12
        Caption = #54532#47196#44536#47016#53440#51077
      end
      object Label7: TLabel
        Left = 16
        Top = 36
        Width = 48
        Height = 12
        Caption = #50672#46041#51452#44592
      end
      object Label9: TLabel
        Left = 232
        Top = 36
        Width = 12
        Height = 12
        Caption = #48516
      end
      object cmb_ProgramType: TComboBox
        Left = 128
        Top = 8
        Width = 201
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 0
        Text = '1.'#50500#51452#45824#54617#44368
        Items.Strings = (
          '1.'#50500#51452#45824#54617#44368)
      end
      object ed_RelayTime: TEdit
        Left = 128
        Top = 32
        Width = 97
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 1
        Text = '30'
      end
    end
  end
end
