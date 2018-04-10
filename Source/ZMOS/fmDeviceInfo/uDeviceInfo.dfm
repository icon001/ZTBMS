object fmDeviceInfo: TfmDeviceInfo
  Left = 503
  Top = 189
  Width = 338
  Height = 368
  Caption = 'fmDeviceInfo'
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
  object Label1: TLabel
    Left = 16
    Top = 20
    Width = 36
    Height = 12
    Caption = #44592#44592#47749
  end
  object Label2: TLabel
    Left = 16
    Top = 44
    Width = 42
    Height = 12
    Caption = 'Node No'
  end
  object Label3: TLabel
    Left = 16
    Top = 68
    Width = 42
    Height = 12
    Caption = 'Node IP'
  end
  object Label4: TLabel
    Left = 16
    Top = 92
    Width = 54
    Height = 12
    Caption = 'Node Port'
  end
  object Label5: TLabel
    Left = 16
    Top = 116
    Width = 36
    Height = 12
    Caption = 'MCU ID'
    Visible = False
  end
  object Label6: TLabel
    Left = 16
    Top = 140
    Width = 48
    Height = 12
    Caption = 'MCU '#47749#52845
  end
  object Label7: TLabel
    Left = 16
    Top = 164
    Width = 36
    Height = 12
    Caption = 'ECU ID'
  end
  object Label8: TLabel
    Left = 16
    Top = 188
    Width = 48
    Height = 12
    Caption = 'ECU '#47749#52845
  end
  object Label9: TLabel
    Left = 16
    Top = 236
    Width = 36
    Height = 12
    Caption = #47928#48264#54840
  end
  object btn_Close: TSpeedButton
    Left = 112
    Top = 280
    Width = 113
    Height = 33
    Caption = #54869#51064
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
    OnClick = btn_CloseClick
  end
  object Label10: TLabel
    Left = 16
    Top = 212
    Width = 24
    Height = 12
    Caption = #50948#52824
  end
  object ed_DeviceNM: TEdit
    Left = 80
    Top = 16
    Width = 225
    Height = 20
    Enabled = False
    ImeName = 'Microsoft IME 2003'
    TabOrder = 0
  end
  object ed_NodeNo: TEdit
    Left = 80
    Top = 40
    Width = 225
    Height = 20
    Enabled = False
    ImeName = 'Microsoft IME 2003'
    TabOrder = 1
  end
  object ed_NodeIP: TEdit
    Left = 80
    Top = 64
    Width = 225
    Height = 20
    Enabled = False
    ImeName = 'Microsoft IME 2003'
    TabOrder = 2
  end
  object ed_NodePort: TEdit
    Left = 80
    Top = 88
    Width = 225
    Height = 20
    Enabled = False
    ImeName = 'Microsoft IME 2003'
    TabOrder = 3
  end
  object ed_McuID: TEdit
    Left = 80
    Top = 112
    Width = 225
    Height = 20
    Enabled = False
    ImeName = 'Microsoft IME 2003'
    TabOrder = 4
    Visible = False
  end
  object ed_MCUName: TEdit
    Left = 80
    Top = 136
    Width = 225
    Height = 20
    Enabled = False
    ImeName = 'Microsoft IME 2003'
    TabOrder = 5
  end
  object ed_ECUID: TEdit
    Left = 80
    Top = 160
    Width = 225
    Height = 20
    Enabled = False
    ImeName = 'Microsoft IME 2003'
    TabOrder = 6
  end
  object ed_ECUName: TEdit
    Left = 80
    Top = 184
    Width = 225
    Height = 20
    Enabled = False
    ImeName = 'Microsoft IME 2003'
    TabOrder = 7
  end
  object ed_DoorNo: TEdit
    Left = 80
    Top = 232
    Width = 225
    Height = 20
    Enabled = False
    ImeName = 'Microsoft IME 2003'
    TabOrder = 8
  end
  object ed_LocateName: TEdit
    Left = 80
    Top = 208
    Width = 225
    Height = 20
    Enabled = False
    ImeName = 'Microsoft IME 2003'
    TabOrder = 9
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 9
    Top = 58
  end
end
