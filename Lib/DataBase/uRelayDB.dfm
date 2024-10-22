object dmRelayDB: TdmRelayDB
  OldCreateOrder = False
  Left = 192
  Top = 133
  Height = 188
  Width = 306
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
    Left = 56
    Top = 80
  end
  object AttendRelayADOConnection: TADOConnection
    ConnectionString = 
      'Provider=PostgreSQL.1;Password=1;User ID=postgres;Data Source=12' +
      '7.0.0.1;Location="";Extended Properties=""'
    Provider = 'PostgreSQL.1'
    Left = 216
    Top = 8
  end
  object HUADOConnection: TADOConnection
    ConnectionString = 
      'Provider=PostgreSQL.1;Password=1;User ID=postgres;Data Source=12' +
      '7.0.0.1;Location="";Extended Properties=""'
    Provider = 'PostgreSQL.1'
    Left = 144
    Top = 80
  end
end
