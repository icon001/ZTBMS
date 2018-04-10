object fmProductCreateRequest: TfmProductCreateRequest
  Left = 524
  Top = 291
  Width = 603
  Height = 481
  Caption = #49373#49328#50836#52397
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 24
      Top = 52
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #49373#49328#44079#49688
    end
    object Label1: TLabel
      Left = 24
      Top = 23
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #47932#54408#47749
    end
    object ed_Count: TEdit
      Left = 104
      Top = 48
      Width = 185
      Height = 18
      Ctl3D = False
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ParentCtl3D = False
      TabOrder = 0
    end
    object cmb_GoodsList: TComboBox
      Left = 104
      Top = 19
      Width = 185
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 1
      Text = '0.'#51204#52404
      Items.Strings = (
        '0.'#51204#52404
        '1.'#45936#47788#54532#47196#44536#47016
        '2.'#44288#51228#54532#47196#44536#47016
        '3.'#44540#53468#49885#49688#54532#47196#44536#47016
        '4.'#48169#44284#54980#45936#47788
        '5.'#48169#44284#54980#44288#51228)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 382
    Width = 595
    Height = 65
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object btn_save: TSpeedButton
      Left = 103
      Top = 10
      Width = 100
      Height = 39
      Caption = #51200#51109
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = btn_saveClick
    end
    object btn_close: TSpeedButton
      Left = 395
      Top = 10
      Width = 100
      Height = 39
      Caption = #45803#44592
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FF3333333333333447333333333333377FFF33333333333744473333333
        333337773FF3333333333444447333333333373F773FF3333333334444447333
        33333373F3773FF3333333744444447333333337F333773FF333333444444444
        733333373F3333773FF333334444444444733FFF7FFFFFFF77FF999999999999
        999977777777777733773333CCCCCCCCCC3333337333333F7733333CCCCCCCCC
        33333337F3333F773333333CCCCCCC3333333337333F7733333333CCCCCC3333
        333333733F77333333333CCCCC333333333337FF7733333333333CCC33333333
        33333777333333333333CC333333333333337733333333333333}
      NumGlyphs = 2
      OnClick = btn_closeClick
    end
  end
  object pan_Delivery: TPanel
    Left = 0
    Top = 81
    Width = 595
    Height = 112
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      Left = 24
      Top = 12
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #44256#44061#49324
    end
    object Label4: TLabel
      Left = 24
      Top = 36
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #48156#49569#51452#49548
    end
    object Label5: TLabel
      Left = 24
      Top = 60
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #51204#54868#48264#54840
    end
    object Label6: TLabel
      Left = 24
      Top = 84
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #45812#45817#51088#47749
    end
    object ed_CustomerName: TEdit
      Left = 104
      Top = 8
      Width = 185
      Height = 18
      Ctl3D = False
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ParentCtl3D = False
      TabOrder = 0
    end
    object ed_Addr: TEdit
      Left = 104
      Top = 32
      Width = 457
      Height = 18
      Ctl3D = False
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ParentCtl3D = False
      TabOrder = 1
    end
    object ed_TelNumber: TEdit
      Left = 104
      Top = 56
      Width = 185
      Height = 18
      Ctl3D = False
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ParentCtl3D = False
      TabOrder = 2
    end
    object ed_CustomerManager: TEdit
      Left = 104
      Top = 80
      Width = 185
      Height = 18
      Ctl3D = False
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ParentCtl3D = False
      TabOrder = 3
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 193
    Width = 595
    Height = 189
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    OnResize = Panel4Resize
    object Label7: TLabel
      Left = 24
      Top = 12
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #48708#44256
    end
    object mem_Bigo: TMemo
      Left = 104
      Top = 12
      Width = 473
      Height = 157
      Ctl3D = False
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object TempQuery: TZQuery
    Connection = dmDB.ZConnection1
    Params = <>
    Top = 72
  end
end
