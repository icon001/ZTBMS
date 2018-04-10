object dmAdoRelay: TdmAdoRelay
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 1014
  Top = 267
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
      'Provider=CUBRID OLE DB Provider;Location=203.249.39.19;Data Sour' +
      'ce=ISSUE;User ID=dba;Cache Authentication=False;Encrypt Password' +
      '=False;Mask Password=False;Persist Encrypted=False;Persist Secur' +
      'ity Info=False;Port=0;Fetch Size=100'
    Provider = 'CUBRID OLE DB Provider'
    Left = 32
    Top = 32
  end
  object ADOConnectionTEST: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=lomo;Ini' +
      'tial Catalog=LOMO;Data Source=127.0.0.1'
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 136
  end
end
