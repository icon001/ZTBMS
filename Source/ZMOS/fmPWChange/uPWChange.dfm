object fmPWChange: TfmPWChange
  Left = 337
  Top = 220
  BorderStyle = bsNone
  Caption = 'fmPWChange'
  ClientHeight = 150
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 394
    Height = 150
    ActivePage = Tab_Message
    Align = alClient
    TabOrder = 0
    object Tab_Message: TTabSheet
      Caption = #44221#44256
      object btn_PWChange: TSpeedButton
        Left = 38
        Top = 90
        Width = 116
        Height = 20
        Caption = #48708#48128#48264#54840#48320#44221
        OnClick = btn_PWChangeClick
      end
      object btn_Cancel: TSpeedButton
        Left = 224
        Top = 90
        Width = 116
        Height = 20
        Caption = #52712#49548
        OnClick = btn_CancelClick
      end
      object chk_Update: TCheckBox
        Left = 0
        Top = 64
        Width = 209
        Height = 14
        Caption = '7'#51068#44036' '#47700#49884#51648' '#54364#49884#54616#51648' '#50506#51020
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 386
        Height = 58
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = #48708#48128#48264#54840#47484' '#48320#44221' '#54980' $DATE'#51068#51060' '#51648#45228#49845#45768#45796'.'#48708#48128#48264#54840#47484' '#48320#44221' '#54616#50668' '#51452#49901#49884#50836'.'
        Color = clWhite
        TabOrder = 1
      end
    end
    object Tab_PWChange: TTabSheet
      Caption = #48708#48128#48264#54840#48320#44221
      ImageIndex = 1
      object SpeedButton2: TSpeedButton
        Left = 224
        Top = 90
        Width = 116
        Height = 20
        Caption = #52712#49548
        OnClick = btn_CancelClick
      end
      object btn_Save: TSpeedButton
        Left = 38
        Top = 90
        Width = 116
        Height = 20
        Caption = #51200#51109
        OnClick = btn_SaveClick
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 386
        Height = 71
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        object StaticText1: TStaticText
          Left = 26
          Top = 13
          Width = 76
          Height = 16
          Caption = #49888#44508#48708#48128#48264#54840
          TabOrder = 0
        end
        object StaticText2: TStaticText
          Left = 26
          Top = 38
          Width = 100
          Height = 16
          Caption = #49888#44508#48708#48128#48264#54840#54869#51064
          TabOrder = 1
        end
        object ed_PW1: TEdit
          Left = 136
          Top = 11
          Width = 223
          Height = 18
          Ctl3D = False
          ImeName = 'Microsoft IME 2010'
          ParentCtl3D = False
          PasswordChar = '*'
          TabOrder = 2
        end
        object ed_PW2: TEdit
          Left = 136
          Top = 37
          Width = 223
          Height = 18
          Ctl3D = False
          ImeName = 'Microsoft IME 2010'
          ParentCtl3D = False
          PasswordChar = '*'
          TabOrder = 3
        end
      end
    end
  end
end
