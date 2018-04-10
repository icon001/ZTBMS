object dmDaySummary: TdmDaySummary
  OldCreateOrder = False
  Left = 680
  Top = 306
  Height = 150
  Width = 215
  object ADOQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 2
    Top = 65535
  end
  object ADOTmpQuery: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 34
    Top = 65535
  end
  object ADOSummary: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 66
    Top = 65535
  end
  object ADOMonthSummary: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 98
    Top = 65535
  end
end
