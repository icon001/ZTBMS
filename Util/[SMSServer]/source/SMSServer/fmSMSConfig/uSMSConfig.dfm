object fmSMSConfig: TfmSMSConfig
  Left = 566
  Top = 273
  Width = 534
  Height = 569
  Caption = #54872#44221#49444#51221
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object btn_Setting: TSpeedButton
    Left = 96
    Top = 496
    Width = 113
    Height = 33
    Caption = #51201#50857
    OnClick = btn_SettingClick
  end
  object btn_Cancel: TSpeedButton
    Left = 312
    Top = 496
    Width = 113
    Height = 33
    Caption = #45803#44592
    OnClick = btn_CancelClick
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 526
    Height = 489
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet3: TTabSheet
      Caption = #54872#44208#49444#51221
      ImageIndex = 2
      object rg_SMSNumGubun: TRadioGroup
        Left = 0
        Top = 114
        Width = 518
        Height = 57
        Align = alTop
        Caption = 'SMS'#48264#54840#49444#51221
        Columns = 2
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          #50508#46988#44396#48516#48324#49444#51221
          #51068#44292#51648#51221'('#54620#49324#46988#47564' '#48155#45716#44221#50864')')
        TabOrder = 0
      end
      object rg_areagubun: TRadioGroup
        Left = 0
        Top = 57
        Width = 518
        Height = 57
        Align = alTop
        Caption = #50508#46988#44396#48516#49444#51221
        Columns = 3
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          #51316#48324#50508#46988#51648#51221
          #52840#51077#49888#54840#48324#50508#46988#51648#51221
          #48169#48276#44396#50669#48324#50508#46988#51648#51221)
        TabOrder = 1
      end
      object rg_SMSUse: TRadioGroup
        Left = 0
        Top = 0
        Width = 518
        Height = 57
        Align = alTop
        Caption = 'SMS'#49436#48260#49324#50857#50976#47924
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          #48120#49324#50857
          #49324#50857)
        TabOrder = 2
        OnClick = rg_SMSUseClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = #50672#46041#54872#44221
      object gb_smsSeverConfig: TGroupBox
        Left = 0
        Top = 0
        Width = 518
        Height = 217
        Align = alTop
        Caption = 'SMS'#49436#48260#54872#44221
        TabOrder = 0
        Visible = False
        object Panel1: TPanel
          Left = 2
          Top = 14
          Width = 514
          Height = 59
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 8
            Width = 66
            Height = 12
            Caption = 'SMS'#49436#48260#53440#51077
          end
          object Label3: TLabel
            Left = 16
            Top = 32
            Width = 36
            Height = 12
            Caption = 'DBType'
          end
          object cmb_ServerType: TComboBox
            Left = 104
            Top = 4
            Width = 329
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            ItemHeight = 12
            TabOrder = 0
            Text = #50500#51452#45824'SMS'
            OnChange = cmb_ServerTypeChange
            Items.Strings = (
              #50500#51452#45824'SMS'
              'SOPEN')
          end
          object cmb_DBType: TComboBox
            Left = 104
            Top = 28
            Width = 329
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            ItemHeight = 12
            TabOrder = 1
            Text = 'mssql'
            OnChange = cmb_ServerTypeChange
            Items.Strings = (
              'mssql'
              'mysql'
              'odbc')
          end
        end
        object Panel2: TPanel
          Left = 2
          Top = 73
          Width = 514
          Height = 142
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object lb_ServerIP: TLabel
            Left = 16
            Top = 16
            Width = 36
            Height = 12
            Caption = #49436#48260'IP'
          end
          object lb_ServerPort: TLabel
            Left = 16
            Top = 38
            Width = 48
            Height = 12
            Caption = #49436#48260'Port'
          end
          object Label4: TLabel
            Left = 16
            Top = 82
            Width = 36
            Height = 12
            Caption = #44228#51221'ID'
          end
          object Label5: TLabel
            Left = 16
            Top = 104
            Width = 72
            Height = 12
            Caption = #44228#51221'Password'
          end
          object Label9: TLabel
            Left = 16
            Top = 60
            Width = 42
            Height = 12
            Caption = 'DB Name'
          end
          object ed_SMSServerIP: TEdit
            Left = 104
            Top = 12
            Width = 329
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 0
          end
          object ed_SMSServerPort: TEdit
            Left = 104
            Top = 34
            Width = 329
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 1
          end
          object ed_SMSUserID: TEdit
            Left = 104
            Top = 78
            Width = 329
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 2
          end
          object ed_SMSUserPW: TEdit
            Left = 104
            Top = 100
            Width = 329
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 3
          end
          object ed_DBName: TEdit
            Left = 104
            Top = 56
            Width = 329
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 4
          end
        end
      end
      object gb_smsSendConfig: TGroupBox
        Left = 0
        Top = 217
        Width = 518
        Height = 103
        Align = alTop
        Caption = #51204#49569#54872#44221
        TabOrder = 1
        object Label6: TLabel
          Left = 16
          Top = 24
          Width = 36
          Height = 12
          Caption = 'SMS ID'
        end
        object Label7: TLabel
          Left = 16
          Top = 48
          Width = 48
          Height = 12
          Caption = #54924#49888#48264#54840
        end
        object Label8: TLabel
          Left = 16
          Top = 72
          Width = 48
          Height = 12
          Caption = #48156#49888#51088'ID'
        end
        object ed_smsid: TEdit
          Left = 104
          Top = 20
          Width = 329
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 0
        end
        object ed_callbacknum: TEdit
          Left = 104
          Top = 44
          Width = 329
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 1
        end
        object ed_Sendername: TEdit
          Left = 104
          Top = 68
          Width = 329
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 2
        end
      end
      object btn_Test: TButton
        Left = 184
        Top = 336
        Width = 75
        Height = 25
        Caption = #53580#49828#53944
        TabOrder = 2
        OnClick = btn_TestClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'SMS'#47700#49884#51648
      ImageIndex = 1
      object Label2: TLabel
        Left = 16
        Top = 8
        Width = 78
        Height = 12
        Caption = 'SMS'#44592#48376#47700#49884#51648
      end
      object ed_smsMessage: TRichEdit
        Left = 16
        Top = 32
        Width = 449
        Height = 113
        ImeName = 'Microsoft IME 2010'
        TabOrder = 0
      end
    end
  end
end
