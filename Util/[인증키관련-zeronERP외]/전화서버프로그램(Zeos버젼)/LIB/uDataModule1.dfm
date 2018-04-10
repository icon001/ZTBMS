object DataModule1: TDataModule1
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 566
  Top = 259
  Height = 730
  Width = 799
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Port = 0
    Left = 40
    Top = 40
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 104
    Top = 40
  end
  object ZTempQuery: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 40
    Top = 104
  end
  object ZSMSQuery: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 48
    Top = 168
  end
end
