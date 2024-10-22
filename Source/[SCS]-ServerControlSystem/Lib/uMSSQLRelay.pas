unit uMSSQLRelay;

interface

uses
  SysUtils, Classes, ExtCtrls, DB, ADODB,uDataModule1;

type
  TdmMSSQLRelay = class(TDataModule)
    MssqlADOConnection: TADOConnection;
    MssqlConnectTimer: TTimer;
    ADOSP: TADOStoredProc;
    procedure MssqlConnectTimerTimer(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    L_bMssqlConnecting : Boolean;
    FOnAdoConnected: TAdoConnectedEvent;
    { Private declarations }
  public
    { Public declarations }
    Function AdoConnected(aServerIP, aServerPort,aUserID, aUserPW, aDataBaseName:string):Boolean;
  Published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;

var
  dmMSSQLRelay: TdmMSSQLRelay;
  G_stMSSQLRelayServerIP : string;
  G_stMSSQLRelayServerPort : string;
  G_stMSSQLRelayUserID : string;
  G_stMSSQLRelayUserPW : string;
  G_stMSSQLRelayDataBaseName : string;
  G_stKTBIZDBType : string;

implementation

{$R *.dfm}

{ TdmMSSQLRelay }

function TdmMSSQLRelay.AdoConnected(aServerIP, aServerPort, aUserID,
  aUserPW, aDataBaseName: string): Boolean;
var
  conStr : string;
begin
  result := False;

  if UpperCase(G_stKTBIZDBType) = 'ORACLE' then
  begin
    //conStr := 'Provider=OraOLEDB.Oracle;';
    conStr := 'Provider=MSDAORA.1;';
    conStr := constr + 'Password=' + aUserPw + ';';
    conStr := constr + 'User ID='+ aUserID + ';';
    conStr := constr + 'Data Source=' + aDataBaseName + ';';
    conStr := constr + 'Persist Security Info=True';
  end else
  begin
    conStr := 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + aUserPW + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + aUserID + ';';
    conStr := constr + 'Initial Catalog=' + aDataBaseName + ';';
    conStr := constr + 'Data Source=' + aServerIP + ',' + aServerPort + ' ';
  end;

  with MssqlADOConnection do
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

procedure TdmMSSQLRelay.MssqlConnectTimerTimer(Sender: TObject);
begin
  if L_bMssqlConnecting then Exit;
  L_bMssqlConnecting := True;
  MssqlConnectTimer.Enabled := False;
  MssqlADOConnection.Connected := False;
  AdoConnected(G_stMSSQLRelayServerIP,
               G_stMssqlRelayServerPort,
               G_stMssqlRelayUserID,
               G_stMssqlRelayUserPW,
               G_stMssqlRelayDataBaseName);
  L_bMssqlConnecting := False;

end;

procedure TdmMSSQLRelay.DataModuleCreate(Sender: TObject);
begin
  L_bMssqlConnecting := False;

end;

end.
