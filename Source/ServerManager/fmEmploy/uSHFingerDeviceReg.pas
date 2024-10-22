unit uSHFingerDeviceReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, AdvSmoothLabel;

type
  TfmSHFingerDeviceReg = class(TForm)
    btn_Apply: TSpeedButton;
    btn_Cancel: TSpeedButton;
    Timer: TTimer;
    lb_fingeruserid: TAdvSmoothLabel;
    lb_Message: TAdvSmoothLabel;
    procedure TimerTimer(Sender: TObject);
    procedure btn_ApplyClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
  private
    L_stFingerData : string;
    FFingerUserID: String;
    FFingerData: String;
    FFingerDeviceID: integer;
    FSave: Boolean;
    FFingerCardNo: string;
    procedure SetFingerUserID(const Value: String);
    procedure SetFingerData(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property FingerUserID : String read FFingerUserID write SetFingerUserID;
    property FingerData : String read FFingerData write SetFingerData;
    property FingerCardNo : string read FFingerCardNo write FFingerCardNo;
    property FingerDeviceID : integer read FFingerDeviceID write FFingerDeviceID;
    property Save : Boolean read FSave write FSave;
  end;

var
  fmSHFingerDeviceReg: TfmSHFingerDeviceReg;

implementation

uses
  uSHFDBRelay,
  uDataModule1,
  uLomosUtil, uDBFunction, udmAdoQuery;

{$R *.dfm}

procedure TfmSHFingerDeviceReg.SetFingerUserID(const Value: String);
var
  stmmddhhnn : string;
  stuserid : string;
  nRanNum : integer;
  stRanNum : string;
  stFingerUserID : string;
  i : integer;
  nTemp : integer;
  stFingerData : string;
begin
  if FFingerUserID = Value then Exit;
  FFingerUserID := Value;
//  stFingerUserID := FillZeroStrNum(Value,G_nFPUserIDLength);
  stFingerUserID := FillZeroStrNum(Value,6);
  stmmddhhnn := formatdatetime('mmddhhnn',now);
  Randomize();
  nRanNum := Random(99);
  stRanNum := FillZeroNumber(nRanNum,2);
  stuserid := copy(stmmddhhnn,1,2) + copy(stFingerUserID,1,2) +
              copy(stmmddhhnn,5,2) + copy(stFingerUserID,3,2) +
              copy(stmmddhhnn,3,2) + copy(stFingerUserID,5,2) +
              copy(stmmddhhnn,7,2) ;
  stFingerData := '';
  for i:=1 to 14 do
  begin
    if (i mod 2 = 0) then nTemp := strtoint(stuserid[i]) + strtoint(stRanNum[2])
    else nTemp := strtoint(stuserid[i]) + strtoint(stRanNum[1]);
    stFingerData := stFingerData + inttostr(nTemp mod 10);
  end;
  stFingerData := stFingerData + stRanNum;
  FingerData := stFingerData;
  Timer.Enabled := True;
end;

procedure TfmSHFingerDeviceReg.TimerTimer(Sender: TObject);
var
  nResult : integer;
begin
  lb_Message.Visible := Not lb_Message.Visible;
  if dmSHFDBRelay.DBConnected then
  begin
    if dmSHFDBRelay.CheckTB_Approvalnum_Sucess(FillZeroStrNum(FingerUserID,G_nFPUserIDLength),inttostr(FingerDeviceID)) then
    begin
      Timer.Enabled := False;
      showmessage('지문등록 성공!');
      btn_ApplyClick(btn_Apply);
    end;
  end;
end;

procedure TfmSHFingerDeviceReg.btn_ApplyClick(Sender: TObject);
begin
  Save := True;
  if FingerCardNo = '' then FingerCardNo := dmDBFunction.GetFdmsCardNo;
  if dmSHFDBRelay.DBConnected then
    L_stFingerData := dmSHFDBRelay.GetTB_Employe_FingerData(FillZeroStrNum(FingerUserID,G_nFPUserIDLength));

  if DataModule1.DupCheckTB_CARDFINGER(FingerUserID) then
  begin
    dmAdoQuery.UpdateTB_CARDFINGER(FingerUserID,FingerCARDNO,L_stFingerData,'1','Y');
  end else
  begin
    dmAdoQuery.InsertIntoTB_CARDFINGER(FingerUserID,FingerCARDNO,L_stFingerData,'1','Y');
  end;
  Close;
end;

procedure TfmSHFingerDeviceReg.btn_CancelClick(Sender: TObject);
begin
  Save := False;
    (*
    if dmSHFDBRelay.CheckTB_Syncuserterminal_Key(FillZeroStrNum(FingerUserID,G_nFPUserIDLength),inttostr(FingerDeviceID)) = 1 then
    begin
      dmSHFDBRelay.UpdateTB_Syncuserterminal_value(FillZeroStrNum(FingerUserID,G_nFPUserIDLength),inttostr(FingerDeviceID),'D');
    end else
    begin
      dmSHFDBRelay.InsertIntoTB_Syncuserterminal_value(FillZeroStrNum(FingerUserID,G_nFPUserIDLength),inttostr(FingerDeviceID),'D');
    end;
    *)
    //dmSHFDBRelay.UpdateTb_approvalnum(FillZeroStrNum(FingerUserID,G_nFPUserIDLength),inttostr(FingerDeviceID),'D');
  Close;

end;

procedure TfmSHFingerDeviceReg.SetFingerData(const Value: String);
begin
  if FFingerData = Value then Exit;

  FFingerData := Value;
  lb_fingeruserid.Caption.Text := '승인번호 : ' + Value;
  if fdmsDBType = 0 then
  begin
    if Not dmSHFDBRelay.DataBaseConnect(fdmsDBType,fdmsDBIP,fdmsDBPort,fdmsDBUser,fdmsPW,fdmsPath,0,False) then
    begin
      G_nFingerDeviceType := 0;
    end;
  end else if fdmsDBType = 1 then
  begin
    if Not dmSHFDBRelay.DataBaseConnect(fdmsDBType,fdmsDBIP,fdmsDBPort,fdmsDBUser,fdmsPW,fdmsDBName,0,False) then
    begin
      G_nFingerDeviceType := 0;
    end;
  end;
  if Not dmSHFDBRelay.DBConnected then
  begin
    showmessage('데이터베이스 연동 테이블에 접속할 수 없습니다.');
    Close;
    Exit;
  end;
  dmSHFDBRelay.DeleteTb_approvalnum(FillZeroStrNum(FingerUserID,G_nFPUserIDLength),inttostr(FingerDeviceID));
  dmSHFDBRelay.InsertIntoTb_approvalnum(FillZeroStrNum(FingerUserID,G_nFPUserIDLength),inttostr(FingerDeviceID),Value);
end;

end.
