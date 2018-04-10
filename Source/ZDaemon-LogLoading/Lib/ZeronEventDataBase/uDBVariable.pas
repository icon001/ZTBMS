unit uDBVariable;

interface

const
  //DataBase Type
  MSSQL = 0;
  POSTGRESQL = 1;
  MDB = 2;
  FIREBIRD = 3;

type
  TAdoConnectedEvent = procedure(Sender: TObject;  Connected:Boolean) of object;

var
  G_nDBType : integer;

implementation

end.
