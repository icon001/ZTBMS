unit uOracleRelay;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs, ExtCtrls,
  uDataModule1;

type
  TdmOracleRelay = class(TDataModule)
    OracleADOConnection: TADOConnection;
    OracleConnectTimer: TTimer;
    procedure OracleConnectTimerTimer(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    L_bOracleConnecting : Boolean;
    FOnAdoConnected: TAdoConnectedEvent;
    { Private declarations }
  Published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  public
    { Public declarations }
    Function AdoConnected(aServerIP, aServerPort,aUserID, aUserPW, aDataBaseName:string):Boolean;
  end;

var
  dmOracleRelay: TdmOracleRelay;
  G_stOracleServerIP : string;
  G_stOracleServerPort : string;
  G_stOracleUserID : string;
  G_stOracleUserPW : string;
  G_stOracleDataBaseName : string;
implementation

{$R *.dfm}

{ TdmOracleRelay }

function TdmOracleRelay.AdoConnected(aServerIP, aServerPort, aUserID,
  aUserPW, aDataBaseName: string): Boolean;
var
  conStr : string;
begin
  result := False;

  conStr := 'Provider=OraOLEDB.Oracle;';
  conStr := constr + 'Password=' + aUserPw + ';';
  conStr := constr + 'User ID='+ aUserID + ';';
  conStr := constr + 'Data Source=' + aDataBaseName + ';';
  conStr := constr + 'Persist Security Info=True';
  {//Test Mode
    conStr := 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=saPasswd;';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=sa;';
    conStr := constr + 'Initial Catalog=DLIDB;';
    conStr := constr + 'Data Source=127.0.0.1,1433 ';
  //Test Mode End }
  
  with OracleADOConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
      Connected := True;
    Except
      on E : Exception do
        begin
          if Assigned(FOnAdoConnected) then
          begin
            OnAdoConnected(Self,False);
          end;
          // ERROR MESSAGE-BOX DISPLAY
          //ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          if Assigned(FOnAdoConnected) then
          begin
            OnAdoConnected(Self,False);
          end;
          //ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    if Assigned(FOnAdoConnected) then
    begin
      OnAdoConnected(Self,True);
    end;
    CursorLocation := clUseServer;
  end;
  result := True;
end;

procedure TdmOracleRelay.OracleConnectTimerTimer(Sender: TObject);
begin
  if L_bOracleConnecting then Exit;
  L_bOracleConnecting := True;
  OracleConnectTimer.Enabled := False;
  OracleADOConnection.Connected := False;
  AdoConnected(G_stOracleServerIP,
               G_stOracleServerPort,
               G_stOracleUserID,
               G_stOracleUserPW,
               G_stOracleDataBaseName);
  L_bOracleConnecting := False;
end;

procedure TdmOracleRelay.DataModuleCreate(Sender: TObject);
begin
  L_bOracleConnecting := False;
end;

end.
