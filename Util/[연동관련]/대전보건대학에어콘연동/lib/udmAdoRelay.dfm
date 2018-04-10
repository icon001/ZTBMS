object dmAdoRelay: TdmAdoRelay
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 613
  Top = 248
  Height = 257
  Width = 308
  object RelayExeQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 224
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 120
    Top = 32
  end
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=lomo;Ini' +
      'tial Catalog=LOMO;Data Source=127.0.0.1'
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 32
  end
end
