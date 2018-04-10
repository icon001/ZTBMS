object dmDBModule: TdmDBModule
  OldCreateOrder = False
  Left = 569
  Top = 472
  Height = 150
  Width = 215
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=PostgreSQL.1;Password=1;User ID=postgres;Data Source=12' +
      '7.0.0.1;Location="";Extended Properties=""'
    Provider = 'PostgreSQL.1'
    Left = 32
    Top = 8
  end
  object ADOQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 32
    Top = 56
  end
  object ADOTempQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 104
    Top = 56
  end
  object ADODBSocketQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 104
    Top = 16
  end
end
