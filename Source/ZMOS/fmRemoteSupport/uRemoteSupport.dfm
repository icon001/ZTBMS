inherited fmRemoteSupport: TfmRemoteSupport
  Left = 255
  Top = 240
  Width = 870
  Height = 640
  Caption = #50896#44201#51648#50896#51217#49549
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser [0]
    Left = 0
    Top = 0
    Width = 862
    Height = 606
    Align = alClient
    TabOrder = 0
    ControlData = {
      4C00000017590000A23E00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E12620A000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  inherited CommandArray: TCommandArray
    Commands = <
      item
        CommandName = 'Close'
        CommandKind = 0
        Name = 'TClose'
        OnExecute = CommandArrayCommandsTCloseExecute
      end>
  end
end
