object Form1: TForm1
  Left = 539
  Top = 233
  Width = 291
  Height = 185
  BorderIcons = []
  Caption = #54532#47196#44536#47016#51064#51613
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 72
    Height = 12
    Caption = #44256#44061#49324#50500#51060#46356
  end
  object Label2: TLabel
    Left = 16
    Top = 51
    Width = 60
    Height = 12
    Caption = #49324#50629#51088#47749#52845
    Visible = False
  end
  object Label3: TLabel
    Left = 24
    Top = 168
    Width = 96
    Height = 12
    Caption = #54532#47196#44536#47016#44277#44553#50629#52404
    Visible = False
  end
  object Label4: TLabel
    Left = 16
    Top = 83
    Width = 48
    Height = 12
    Caption = #48708#48128#48264#54840
  end
  object msk_SaupId: TMaskEdit
    Left = 128
    Top = 16
    Width = 129
    Height = 18
    Ctl3D = False
    EditMask = 'Z-99999999;1;_'
    ImeName = #54620#44397#50612'('#54620#44544')'
    MaxLength = 10
    ParentCtl3D = False
    TabOrder = 0
    Text = 'Z-        '
    OnKeyPress = msk_SaupIdKeyPress
  end
  object ed_Coname: TEdit
    Left = 128
    Top = 48
    Width = 132
    Height = 18
    Ctl3D = False
    ImeName = 'Microsoft IME 2003'
    ParentCtl3D = False
    TabOrder = 1
    Visible = False
    OnKeyPress = ed_ConameKeyPress
  end
  object btn_Auth: TButton
    Left = 16
    Top = 112
    Width = 90
    Height = 25
    Caption = #51064#51613
    TabOrder = 3
    OnClick = btn_AuthClick
  end
  object btn_Close: TButton
    Left = 160
    Top = 112
    Width = 90
    Height = 25
    Caption = #45803#44592
    TabOrder = 4
    OnClick = btn_CloseClick
  end
  object Memo1: TMemo
    Left = 16
    Top = 144
    Width = 305
    Height = 233
    ImeName = 'Microsoft IME 2003'
    TabOrder = 5
    Visible = False
  end
  object ComboBox1: TComboBox
    Left = 136
    Top = 160
    Width = 137
    Height = 20
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 12
    TabOrder = 6
    Text = 'ComboBox1'
    Visible = False
  end
  object ed_AuthKey: TEdit
    Left = 128
    Top = 80
    Width = 132
    Height = 18
    Ctl3D = False
    Enabled = False
    ImeName = 'Microsoft IME 2003'
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 7
    Visible = False
    OnKeyPress = ed_ConameKeyPress
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 192
    Width = 129
    Height = 49
    Caption = 'GroupBox1'
    TabOrder = 8
    Visible = False
    object WebBrowser1: TWebBrowser
      Left = -96
      Top = -32
      Width = 225
      Height = 81
      TabOrder = 0
      ControlData = {
        4C000000411700005F0800000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object edPasswd: TEdit
    Left = 128
    Top = 80
    Width = 132
    Height = 18
    Ctl3D = False
    ImeName = 'Microsoft IME 2003'
    ParentCtl3D = False
    TabOrder = 2
    OnKeyPress = edPasswdKeyPress
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 0
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 304
    Top = 8
  end
  object LMDIniCtrl1: TLMDIniCtrl
    IniFile = '.INI'
    IniPrefix = ppProgram
    Target = itIniFile
    Left = 911
    Top = 124
  end
  object ADOConnection1: TADOConnection
    Left = 8
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 8
    Top = 56
  end
end
