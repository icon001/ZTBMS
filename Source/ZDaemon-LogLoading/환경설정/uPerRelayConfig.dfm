object fmperRelayConfig: TfmperRelayConfig
  Left = 270
  Top = 0
  Width = 620
  Height = 649
  Caption = #51064#51201#49324#54637#50672#46041#54872#44221#49444#51221
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object sbSave: TSpeedButton
    Left = 152
    Top = 564
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
    Left = 312
    Top = 564
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
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 612
    Height = 337
    Align = alTop
    Caption = #51217#49549#54872#44221#49444#51221
    TabOrder = 0
    object GroupBox7: TGroupBox
      Left = 2
      Top = 241
      Width = 608
      Height = 94
      Align = alBottom
      Caption = #52852#46300#45936#51060#53552#48516#49437#48169#48277
      TabOrder = 0
      object GroupBox6: TGroupBox
        Left = 2
        Top = 14
        Width = 255
        Height = 78
        Align = alLeft
        TabOrder = 0
        object Label6: TLabel
          Left = 104
          Top = 16
          Width = 24
          Height = 12
          Caption = #46321#47197
          Visible = False
        end
        object Label7: TLabel
          Left = 8
          Top = 16
          Width = 48
          Height = 12
          Hint = #49325#51228#53076#46300' '#49324#50857#49884' EM_STATE'#44050#51060' '#49325#51228#53076#46300#51060#47732' '#45936#51060#53552#49325#51228
          Caption = #49325#51228#53076#46300
          ParentShowHint = False
          ShowHint = True
        end
        object Label8: TLabel
          Left = 8
          Top = 44
          Width = 48
          Height = 12
          Hint = #44396#48516#53076#46300#49324#50857#49884' 1:'#51068#48152#52852#46300',2:'#47784#48148#51068#52852#46300#47196' '#44396#48516#54616#50668' '#52376#47532
          Caption = #44396#48516#53076#46300
          ParentShowHint = False
          ShowHint = True
        end
        object ed_live: TEdit
          Left = 144
          Top = 12
          Width = 57
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 0
          Visible = False
        end
        object ed_delete: TEdit
          Left = 64
          Top = 12
          Width = 33
          Height = 20
          ImeName = 'Microsoft IME 2003'
          TabOrder = 1
        end
        object cmb_cardgubuncode: TComboBox
          Left = 64
          Top = 40
          Width = 65
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          ItemIndex = 1
          TabOrder = 2
          Text = '1.'#49324#50857
          Items.Strings = (
            '0.'#48120#49324#50857
            '1.'#49324#50857)
        end
      end
      object GroupBox8: TGroupBox
        Left = 257
        Top = 14
        Width = 349
        Height = 78
        Hint = #52852#46300#44256#51221#44600#51060' '#49324#50857#49884' '#45936#51060#53552' '#48320#54872#49884' '#54644#45817' '#44600#51060' '#47564#53372' '#54644#45817' '#47928#51088#47484' '#52292#50892#49436' '#44256#51221#51004#47196' '#52852#46300#45936#51060#53552#47484' '#49373#49457#54632
        Align = alClient
        Caption = #52852#46300#44256#51221
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object Label9: TLabel
          Left = 8
          Top = 20
          Width = 48
          Height = 12
          Hint = #44396#48516#53076#46300#49324#50857#49884' '#48320#54872#49884' '#52852#46300' '#50526#50640' '#39'01'#39' '#44284' '#44057#51060' '#44396#48516#53076#46300#47484' '#45927#48537#51076
          Caption = #49324#50857#50976#47924
          ParentShowHint = False
          ShowHint = True
        end
        object Label10: TLabel
          Left = 136
          Top = 16
          Width = 48
          Height = 12
          Hint = #49325#51228#53076#46300' '#49324#50857#49884' EM_STATE'#44050#51060' '#49325#51228#53076#46300#51060#47732' '#45936#51060#53552#49325#51228
          Caption = #44256#51221#44600#51060
          ParentShowHint = False
          ShowHint = True
        end
        object Label11: TLabel
          Left = 8
          Top = 48
          Width = 48
          Height = 12
          Hint = #49325#51228#53076#46300' '#49324#50857#49884' EM_STATE'#44050#51060' '#49325#51228#53076#46300#51060#47732' '#45936#51060#53552#49325#51228
          Caption = #52292#50880#47928#51088
          ParentShowHint = False
          ShowHint = True
        end
        object cmb_FixUse: TComboBox
          Left = 64
          Top = 16
          Width = 65
          Height = 20
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          ItemIndex = 1
          TabOrder = 0
          Text = '1.'#49324#50857
          Items.Strings = (
            '0.'#48120#49324#50857
            '1.'#49324#50857)
        end
        object ed_FixLength: TEdit
          Left = 192
          Top = 12
          Width = 33
          Height = 20
          ImeName = 'Microsoft IME 2003'
          MaxLength = 2
          TabOrder = 1
        end
        object ed_FixChar: TEdit
          Left = 64
          Top = 44
          Width = 33
          Height = 20
          ImeName = 'Microsoft IME 2003'
          MaxLength = 1
          TabOrder = 2
        end
      end
    end
    object gb_dbConfig1: TGroupBox
      Left = 2
      Top = 14
      Width = 303
      Height = 227
      Align = alLeft
      Caption = #50672#46041'DB1'
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 60
        Width = 36
        Height = 12
        Caption = #49436#48260'IP'
      end
      object btn_Connect: TSpeedButton
        Left = 96
        Top = 176
        Width = 89
        Height = 33
        Caption = #51217#49549#53580#49828#53944
        OnClick = btn_ConnectClick
      end
      object Label5: TLabel
        Left = 16
        Top = 156
        Width = 96
        Height = 12
        Caption = #45936#51060#53552#48288#51060#49828'Name'
      end
      object Label4: TLabel
        Left = 16
        Top = 132
        Width = 84
        Height = 12
        Caption = #49324#50857#51088#48708#48128#48264#54840
      end
      object Label3: TLabel
        Left = 16
        Top = 108
        Width = 60
        Height = 12
        Caption = #49324#50857#51088#44228#51221
      end
      object Label2: TLabel
        Left = 16
        Top = 84
        Width = 48
        Height = 12
        Caption = #49436#48260'PORT'
      end
      object cmb_DBType: TComboBox
        Left = 16
        Top = 16
        Width = 217
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 0
        Text = '1.MSSQL'
        Items.Strings = (
          '0.MDB'
          '1.MSSQL'
          '2.POSTGRESQL'
          '3.ORACLE')
      end
      object ed_ServerIP: TEdit
        Left = 128
        Top = 56
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 1
      end
      object ed_ServerPort: TEdit
        Left = 128
        Top = 80
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 2
      end
      object ed_DBUser: TEdit
        Left = 128
        Top = 104
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 3
      end
      object ed_DBPasswd: TEdit
        Left = 128
        Top = 128
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 4
      end
      object ed_DBName: TEdit
        Left = 128
        Top = 152
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 5
      end
      object st_Connected: TStaticText
        Left = 200
        Top = 184
        Width = 89
        Height = 16
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvNone
        BevelKind = bkTile
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
    object gb_dbConfig2: TGroupBox
      Left = 305
      Top = 14
      Width = 305
      Height = 227
      Align = alClient
      Caption = #50672#46041'DB2'
      TabOrder = 2
      object Label12: TLabel
        Left = 16
        Top = 60
        Width = 36
        Height = 12
        Caption = #49436#48260'IP'
      end
      object btn_ConnectTest2: TSpeedButton
        Left = 96
        Top = 176
        Width = 89
        Height = 33
        Caption = #51217#49549#53580#49828#53944
        OnClick = btn_ConnectTest2Click
      end
      object Label13: TLabel
        Left = 16
        Top = 156
        Width = 96
        Height = 12
        Caption = #45936#51060#53552#48288#51060#49828'Name'
      end
      object Label14: TLabel
        Left = 16
        Top = 132
        Width = 84
        Height = 12
        Caption = #49324#50857#51088#48708#48128#48264#54840
      end
      object Label15: TLabel
        Left = 16
        Top = 108
        Width = 60
        Height = 12
        Caption = #49324#50857#51088#44228#51221
      end
      object Label16: TLabel
        Left = 16
        Top = 84
        Width = 48
        Height = 12
        Caption = #49436#48260'PORT'
      end
      object cmb_DBType2: TComboBox
        Left = 16
        Top = 16
        Width = 217
        Height = 20
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 12
        TabOrder = 0
        Text = '1.MSSQL'
        Items.Strings = (
          '0.MDB'
          '1.MSSQL'
          '2.POSTGRESQL'
          '3.ORACLE')
      end
      object ed_ServerIP2: TEdit
        Left = 128
        Top = 56
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 1
      end
      object ed_ServerPort2: TEdit
        Left = 128
        Top = 80
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 2
      end
      object ed_DBUser2: TEdit
        Left = 128
        Top = 104
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 3
      end
      object ed_DBPasswd2: TEdit
        Left = 128
        Top = 128
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 4
      end
      object ed_DBName2: TEdit
        Left = 128
        Top = 152
        Width = 161
        Height = 20
        ImeName = 'Microsoft IME 2003'
        TabOrder = 5
      end
      object st_Connected2: TStaticText
        Left = 200
        Top = 184
        Width = 89
        Height = 16
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvNone
        BevelKind = bkTile
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 337
    Width = 612
    Height = 88
    Align = alTop
    Caption = #51312#54924#53244#47532#47928
    TabOrder = 1
    object mem_Query: TMemo
      Left = 2
      Top = 14
      Width = 608
      Height = 72
      Align = alClient
      ImeName = 'Microsoft IME 2003'
      MaxLength = 500
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 425
    Width = 612
    Height = 64
    Align = alTop
    Caption = #51204#52404#50629#45936#51060#53944#53244#47532#47928
    TabOrder = 2
    object mem_AllUpdateQuery: TMemo
      Left = 2
      Top = 14
      Width = 608
      Height = 48
      Align = alClient
      ImeName = 'Microsoft IME 2003'
      MaxLength = 500
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 489
    Width = 612
    Height = 64
    Align = alTop
    Caption = #50629#45936#51060#53944#53244#47532#47928
    TabOrder = 3
    object mem_UpdateQuery: TMemo
      Left = 2
      Top = 14
      Width = 608
      Height = 48
      Align = alClient
      ImeName = 'Microsoft IME 2003'
      MaxLength = 500
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 32
    Top = 96
  end
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=lomo;Ini' +
      'tial Catalog=LOMO;Data Source=127.0.0.1'
    Provider = 'SQLOLEDB.1'
    Left = 312
    Top = 56
  end
end
