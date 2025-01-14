{***************************************************************}
{                                                               }
{  uDataModule1.Pas :DB Module1                                 }
{                                                               }
{  Copyright (c) 2005 this70@naver.com                          }
{                                                               }
{  All rights reserved.                                         }
{                                                               }
{***************************************************************}
unit uDataModule1;




interface

uses
  Controls,
  Dialogs,
  uLomosUtil,
  ComCtrls,
  Messages,
  SysUtils,
  Classes,
  DB,
  dbisamtb, LMDCustomComponent, ADODB,iniFiles,forms,SyncObjs,ActiveX,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZConnection,
  ZAbstractConnection;

const
  Msg_CardNoDownload  = WM_USER + 1004;
  MAXBUFFSIZE = 1024;
  SERVERTIMEOUT = 6000;
  LINEEND = #13;  //클라이언트에서 한문장의 끝을 알리는 데이터값
  DATADELIMITER = '^';
  DelayTime = 100;
  RETRYCOUNT = 3;
  DOORCOUNT = 2;  //기기당 출입문 사용 갯수
  CARDREADERCOUNT = 8; //기기당 카드리더 사용 갯수
  ZONECOUNT = 8;   //기기당 존 갯수
  DOORTYPE  = '1'; //Door Type
  ALARMTYPE = '2'; //ALARM TYPE
  GRADETYPE = '3'; //GRADE TYPE


const
 USE_ENUMPORTS_API = False;
 MAX_COMPORT = 36;       // 최대 255 까지
 MAX_LISTCOUNT = 100; //리스트 출력 count

const
  MCUBMP = 'MCU.bmp';
  ECUBMP = 'ECU.bmp';
  DOORBMP = 'DOOR.bmp';
  DOOROPEROPEN = 'DOOROPEROPEN.bmp';
  DOOROPERCLOSE = 'DOOROPERCLOSE.bmp';
  DOORNOTOPEROPEN = 'DOORNOTOPEROPEN.bmp';
  DOORNOTOPERCLOSE = 'DOORNOTOPERCLOSE.bmp';
  ALARMBMP = 'ALARM.bmp';
  WATCHALARM = 'WATCHALARM.bmp';
  NOTWATCHALARM = 'NOTWATCHALARM.bmp';
  WARNINGALARM = 'WARNINGALARM.bmp';
  FOODBMP = 'FOOD.bmp';
  ZONEBMP = 'ZONE.bmp';

type
//  TSystemType = (stDoor,stAlarm,stGrade);
  //TCardtype = (ctnothing,ctAccess, ctAlarm, ctBoth);
  TDownloadMode = (dmNone,dmTimeSync,dmCardData,dmCheckDoor);

  TDataModule1 = class(TDataModule)
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZTempQuery: TZQuery;
    ZSMSQuery: TZQuery;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    isEditMode: Boolean;
    BeforeCardNo: String;
    Function DBConnect(aIp,aPort,aDataBase,aUser,aUserPw:string):Boolean;
    Function ProcessExecSQL(aSql:String): Boolean;
    {SQLLOG저장}
    procedure SQLErrorLog(aSQL:string);

    class function GetObject:TDataModule1;

  end;

var
  DataModule1: TDataModule1;
  ExeFolder : string;
implementation

{$R *.dfm}



class function TDataModule1.GetObject: TDataModule1;
begin
 If DataModule1 = Nil then DataModule1:= TDataModule1.Create(Nil);
 Result:= DataModule1;

end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
//  DataModule1.Free;
  DataModule1 := Nil;

end;


function TDataModule1.ProcessExecSQL(aSql: String): Boolean;
var
  ExecQuery :TZQuery;
begin
  Result:= False;
  Try
    OleInitialize(nil);
    ExecQuery := TZQuery.Create(nil);
    ExecQuery.Connection := ZConnection1;
    with ExecQuery do
    begin
      Close;
      //SQL.Clear;
      SQL.Text:= aSql;
      try
        ExecSQL;
      except
      ON E: Exception do
        begin
          SQLErrorLog(aSql);
          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.Free;
    OleUninitialize;
  End;
  Result:= True;
end;

procedure TDataModule1.SQLErrorLog(aSQL: string);
Var
  f: TextFile;
  st: string;
  aFileName: String;
begin

//  if SaveLogData < 1 then Exit;
  if Application.Terminated then Exit;
  {$I-}
  //Critical_SaveLog.Acquire;
  aFileName:= ExeFolder + '\DBerr'+ FormatDateTIme('yyyymmdd',Now)+'.log';
  AssignFile(f, aFileName);
  Append(f);
  if IOResult <> 0 then Rewrite(f);
  st := FormatDateTIme('hh:nn:ss:zzz">"   ',Now) + #13#10 + aSQL;
  WriteLn(f,st);
  System.Close(f);
  //Critical_SaveLog.Release;
  {$I+}
end;

function TDataModule1.DBConnect(aIp, aPort, aDataBase, aUser,
  aUserPw: string): Boolean;
begin
  result := False;
  Try
    ZConnection1.Disconnect;
  Except
  End;
  
  ZConnection1.Protocol := 'mysql';
  ZConnection1.Database := aDataBase;
  ZConnection1.HostName := aIp;
  ZConnection1.Port := strtoint(aPort);
  ZConnection1.User := aUser;
  ZConnection1.Password := aUserPw;
  try
    ZConnection1.Connect;
  Except
    Exit;
  End;
  result := True;

end;

end.


