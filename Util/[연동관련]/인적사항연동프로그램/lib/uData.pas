unit uData;

interface

uses
  SysUtils, Classes;

type
  TStateChange = procedure(Sender: TObject; aPatientNo,aHospitalizeDate,aLeaveDate,aState:string) of object;
  TdmData = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TPatientInfo = class(TComponent)
  private
    FState: string;
    FPatientNo: string;
    FHospitalizeDate: string;
    FLeaveDate: string;
    FOnStateChange: TStateChange;
    procedure SetState(const Value: string);
    procedure SetHospitalizeDate(const Value: string);
    procedure SetLeaveDate(const Value: string);
  public
    ProPerty OnStateChange : TStateChange read FOnStateChange Write FOnStateChange;
  published
    Property PatientNo : string read FPatientNo write FPatientNo;
    Property HospitalizeDate : string read FHospitalizeDate write SetHospitalizeDate; //입원일자
    Property LeaveDate : string read FLeaveDate write SetLeaveDate; //퇴원일자
    Property State : string read FState write SetState;           //입퇴원 상태 C:입원,S:퇴원
  end;

var
  dmData: TdmData;

implementation

{$R *.dfm}

{ TPatientInfo }

procedure TPatientInfo.SetHospitalizeDate(const Value: string);
begin
  if FHospitalizeDate >= Value then  Exit;
  FHospitalizeDate := Value;
end;

procedure TPatientInfo.SetLeaveDate(const Value: string);
begin
  if FLeaveDate >= Value then  Exit;
  FLeaveDate := Value;
end;

procedure TPatientInfo.SetState(const Value: string);
begin
  if FState = Value then Exit;
  FState := Value;
  if Assigned(FOnStateChange) then
  begin
    OnStateChange(Self,PatientNo,HospitalizeDate,LeaveDate,State);
  end;
end;

end.
