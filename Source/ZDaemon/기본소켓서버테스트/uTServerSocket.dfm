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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TRzStatusBar
    Left = 0
    Top = 427
    Width = 862
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 0
    object StatusPane1: TRzStatusPane
      Left = 0
      Top = 0
      Width = 241
      Height = 19
      Align = alLeft
      Caption = 'aa'
    end
  end
  object ServerSocket1: TServerSocket
    Active = True
    Port = 23
    ServerType = stThreadBlocking
    OnAccept = ServerSocket1Accept
    OnGetThread = ServerSocket1GetThread
    OnClientError = ServerSocket1ClientError
    Left = 16
    Top = 16
  end
end
