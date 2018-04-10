object Form1: TForm1
  Left = 192
  Top = 114
  Width = 870
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 128
    Top = 32
    Width = 353
    Height = 353
    ImeName = 'Microsoft IME 2003'
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 528
    Top = 40
    Width = 121
    Height = 57
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 536
    Top = 128
    Width = 121
    Height = 57
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 536
    Top = 200
    Width = 129
    Height = 57
    Caption = 'Button3'
    TabOrder = 3
    OnClick = Button3Click
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    Left = 16
    Top = 24
  end
end
