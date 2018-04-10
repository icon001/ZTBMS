object Form_SetComPort: TForm_SetComPort
  Left = 374
  Top = 308
  BorderStyle = bsDialog
  Caption = #53685#49888' '#54252#53944' '#49444#51221
  ClientHeight = 138
  ClientWidth = 219
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 15
    Top = 50
    Width = 180
    Height = 12
    Caption = #50672#44208#54637' '#53685#49888' '#54252#53944#47484' '#49440#53469' '#54616#49464#50836
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 219
    Height = 33
    Align = alTop
    BorderInner = fsFlat
    BorderOuter = fsFlatBold
    Caption = #53685#49888#54252#53944' '#49444#51221
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    UseGradients = True
  end
  object ComboBox_ComNo: TRzComboBox
    Left = 16
    Top = 74
    Width = 81
    Height = 23
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    FrameVisible = True
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 15
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    Text = 'COM 1'
    Items.Strings = (
      'COM 1'
      'COM 2'
      'COm 3'
      'COM 4'
      'COM 5'
      'COM 6'
      'COM 7'
      'COM 8'
      'COM 9'
      'COM 10'
      'COM 11'
      'COM 12'
      'COM 13'
      'COM 14'
      'COM 15')
    ItemIndex = 0
  end
  object btnOK: TRzBitBtn
    Left = 9
    Top = 104
    Width = 100
    Height = 28
    Color = 15791348
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    TabOrder = 2
    Kind = bkOK
  end
  object btnCancel: TRzBitBtn
    Left = 112
    Top = 104
    Width = 100
    Height = 28
    Color = 15791348
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    TabOrder = 3
    Kind = bkCancel
  end
end
