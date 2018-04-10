object fmQuery: TfmQuery
  Left = 192
  Top = 114
  Width = 808
  Height = 725
  Caption = 'fmQuery'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Query'
  end
  object Memo1: TMemo
    Left = 80
    Top = 8
    Width = 393
    Height = 49
    ImeName = 'Microsoft IME 2010'
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 496
    Top = 8
    Width = 97
    Height = 25
    Caption = #51312#54924
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 72
    Width = 793
    Height = 609
    DataSource = DataSource1
    ImeName = 'Microsoft IME 2010'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ADOQuery1: TADOQuery
    Connection = dmAdoRelay.ADOConnection
    Parameters = <>
    Left = 520
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 560
    Top = 40
  end
end
