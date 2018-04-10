object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 277
  Top = 4
  Height = 730
  Width = 799
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=PostgreSQL.1;Password=1;User ID=postgres;Data Source=12' +
      '7.0.0.1;Location="";Extended Properties=""'
    Provider = 'PostgreSQL.1'
    Left = 32
    Top = 32
  end
  object ADOQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 32
    Top = 96
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 104
    Top = 96
  end
  object ADOExecQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 168
    Top = 96
  end
  object ADOConnectionEVENT: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=lomo;Ini' +
      'tial Catalog=LOMO;Data Source=127.0.0.1'
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 304
  end
  object ADOConnectionLOG: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=lomo;Ini' +
      'tial Catalog=LOMO;Data Source=127.0.0.1'
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 352
  end
  object ADOBackupConnection: TADOConnection
    Left = 48
    Top = 424
  end
  object ADOTmpQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 32
    Top = 136
  end
end
