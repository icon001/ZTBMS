unit uDeviceInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfmDeviceInfo = class(TForm)
    Label1: TLabel;
    ed_DeviceNM: TEdit;
    Label2: TLabel;
    ed_NodeNo: TEdit;
    Label3: TLabel;
    ed_NodeIP: TEdit;
    Label4: TLabel;
    ed_NodePort: TEdit;
    Label5: TLabel;
    ed_McuID: TEdit;
    Label6: TLabel;
    ed_MCUName: TEdit;
    Label7: TLabel;
    ed_ECUID: TEdit;
    Label8: TLabel;
    ed_ECUName: TEdit;
    Label9: TLabel;
    ed_DoorNo: TEdit;
    btn_Close: TSpeedButton;
    ADOQuery1: TADOQuery;
    ed_LocateName: TEdit;
    Label10: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetDoorInfo(aDeviceID,aDeviceName,aLocateName:string);
    procedure GetAlarmInfo(aDeviceID,aDeviceName,aLocateName:string);
  public
    DeviceName : String;
    DeviceID : string;
    LocateName : string;
    DeviceType : string;
    { Public declarations }
  end;

var
  fmDeviceInfo: TfmDeviceInfo;

implementation

uses
  uDataModule1,
  uLomosUtil;
{$R *.dfm}

procedure TfmDeviceInfo.FormActivate(Sender: TObject);
begin
  if DeviceType = '3' then GetDoorInfo(DeviceID,DeviceName,LocateName)
  else if DeviceType = '4' then GetAlarmInfo(DeviceID,DeviceName,LocateName);
end;

procedure TfmDeviceInfo.GetAlarmInfo(aDeviceID, aDeviceName,aLocateName: string);
var
  stSql : string;
begin
  ed_DeviceNM.Text := aDeviceName;
  ed_LocateName.Text := aLocateName;

  stSql := ' Select a.AC_NODENO,b.AC_MCUIP,b.AC_MCUPORT,b.AC_MCUID, ';
  stSql := stSql + ' b.AC_DEVICENAME as MCU_NAME,c.AC_ECUID,c.AC_DEVICENAME as ECU_NAME ';
  stSql := stSql + ' from TB_ARMAREA a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND b.AC_ECUID = ''00'' ) ';
  stSql := stSql + ' Left Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(copy(aDeviceID,1,3)));
  stSql := stSql + ' AND a.AC_ECUID = ''' + copy(aDeviceID,4,2) + ''' ';
  stSql := stSql + ' AND a.AR_AREANO = ''' + FillZeroStrNum(copy(aDeviceID,6,1),2) + ''' ';

  With AdoQuery1 do
  begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      ed_NodeNo.Text := FindField('AC_NODENO').AsString;
      ed_NodeIP.Text := FindField('AC_MCUIP').AsString;
      ed_NodePort.Text := FindField('AC_MCUPORT').AsString ;
      ed_MCUID.Text := FindField('AC_MCUID').AsString ;
      ed_MCUName.Text := FindField('MCU_NAME').AsString ;
      ed_ECUID.Text := FindField('AC_ECUID').AsString;
      ed_ECUName.Text := FindField('ECU_NAME').AsString;
      Label9.Visible := False;
      ed_DoorNo.Visible := False;

  end;

end;

procedure TfmDeviceInfo.GetDoorInfo(aDeviceID, aDeviceName,aLocateName: string);
var
  stSql : string;
begin
  ed_DeviceNM.Text := aDeviceName;
  ed_LocateName.Text := aLocateName;

  stSql := ' Select a.AC_NODENO,a.DO_DoorNo,b.AC_MCUIP,b.AC_MCUPORT,b.AC_MCUID, ';
  stSql := stSql + ' b.AC_DEVICENAME as MCU_NAME,c.AC_ECUID,c.AC_DEVICENAME as ECU_NAME ';
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND b.AC_ECUID = ''00'' ) ';
  stSql := stSql + ' Left Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(copy(aDeviceID,1,3)));
  stSql := stSql + ' AND a.AC_ECUID = ''' + copy(aDeviceID,4,2) + ''' ';
  stSql := stSql + ' AND a.DO_DoorNo = ''' + inttostr(strtoint(copy(aDeviceID,6,2))) + ''' ';

  With AdoQuery1 do
  begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      ed_NodeNo.Text := FindField('AC_NODENO').AsString;
      ed_NodeIP.Text := FindField('AC_MCUIP').AsString;
      ed_NodePort.Text := FindField('AC_MCUPORT').AsString ;
      ed_MCUID.Text := FindField('AC_MCUID').AsString ;
      ed_MCUName.Text := FindField('MCU_NAME').AsString ;
      ed_ECUID.Text := FindField('AC_ECUID').AsString;
      ed_ECUName.Text := FindField('ECU_NAME').AsString;
      ed_DoorNo.Text := FindField('DO_DOORNO').AsString;
      Label9.Visible := True;
      ed_DoorNo.Visible := True;


  end;

end;

procedure TfmDeviceInfo.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

end.
