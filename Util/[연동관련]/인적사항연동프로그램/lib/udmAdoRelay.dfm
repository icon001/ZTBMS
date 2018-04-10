object dmAdoRelay: TdmAdoRelay
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 1044
  Top = 196
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
      'Provider=tbprov.Tbprov.1;Cache Authentication=False;Encrypt Pass' +
      'word=False;Integrated Security="";Mask Password=False;Password=y' +
      'onsei_kt;Persist Encrypted=False;Persist Security Info=True;User' +
      ' ID=yonsei_kt;Bind Flags=0;Initial Catalog="";Data Source=ysidmm' +
      'aster;Impersonation Level=Anonymous;Location="";Lock Owner="";Mo' +
      'de=ReadWrite;Protection Level=None;Extended Properties="";Updata' +
      'ble Cursor=False;Enlist=None'
    Provider = 'tbprov.Tbprov.1'
    Left = 32
    Top = 32
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=lomo;Ini' +
      'tial Catalog=LOMO;Data Source=127.0.0.1'
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 88
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
