object dmRelayDB: TdmRelayDB
  OldCreateOrder = False
  Left = 192
  Top = 133
  Height = 150
  Width = 215
  object FaceCopADOConnection: TADOConnection
    ConnectionString = 
      'Provider=PostgreSQL.1;Password=1;User ID=postgres;Data Source=12' +
      '7.0.0.1;Location="";Extended Properties=""'
    Provider = 'PostgreSQL.1'
    Left = 48
    Top = 8
  end
  object ADOQuery: TADOQuery
    Connection = FaceCopADOConnection
    Parameters = <>
    Left = 24
    Top = 56
  end
  object AttendRelayADOConnection: TADOConnection
    ConnectionString = 
      'Provider=PostgreSQL.1;Password=1;User ID=postgres;Data Source=12' +
      '7.0.0.1;Location="";Extended Properties=""'
    Provider = 'PostgreSQL.1'
    Left = 152
    Top = 8
  end
end
