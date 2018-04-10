unit uAttendConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  FolderDialog, RzShellDialogs,ADODB, ExtCtrls,FileCtrl,ActiveX;

type
  TfmAttendConfig = class(TForm)
    PageControl1: TPageControl;
    GroupBox2: TGroupBox;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    FolderDialog1: TFolderDialog;
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    TabSheet14: TTabSheet;
    GroupBox30: TGroupBox;
    Label16: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    ed_kttServerIP: TEdit;
    ed_kttServerPort: TEdit;
    ed_kttClientPort: TEdit;
    Label44: TLabel;
    ed_KTTPamCycle: TEdit;
    Label45: TLabel;
    GroupBox32: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    ed_DDNSIP: TEdit;
    ed_DDNSQueryIP: TEdit;
    ed_DDNSPort: TEdit;
    ed_DDNSQueryPort: TEdit;
    rg_kttDDNSServerUses: TRadioGroup;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_faceconnectClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetConfig;
    Function InsertTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aConfigDetail:string=''):Boolean;
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aConfigDetail:string=''):Boolean;
    Function UpdateTB_FOODCODE(aFOODCODE,aSTARTTIME ,aENDTIME,aFOAMT:string):Boolean;
    Function UpdateTB_ATWORKTYPE(aCode,aField,aValue:string):Boolean;

    //procedure InsertATCode;
    Function InsertTB_ATCODE(aATCODE,aATName,aInFromTime,aInToTime,aWorkFromTime,aWorkToTime:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmAttendConfig: TfmAttendConfig;

implementation
uses
  uDataModule1,
  uLomosUtil, uPostGreSql, uMssql,
  uMDBSql, uFireBird, uCommonSql;
{$R *.dfm}

procedure TfmAttendConfig.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAttendConfig.FormActivate(Sender: TObject);
begin
  GetConfig;
end;

procedure TfmAttendConfig.GetConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_Config ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      While Not Eof do
      begin
        if Findfield('CO_CONFIGGROUP').AsString = 'KTT' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'KTTSUSES' then
          begin
            //if isdigit(FindField('CO_CONFIGVALUE').AsString) then rg_kttControlServerUses.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
            //else rg_kttControlServerUses.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'KTTSIP' then
          begin
            ed_kttServerIP.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'KTTSPORT' then
          begin
            ed_kttServerPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'KTTCPORT' then
          begin
            ed_kttClientPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'KTTPCYCLE' then
          begin
            ed_KTTPamCycle.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DDNSUSES' then
          begin
            if isdigit(FindField('CO_CONFIGVALUE').AsString) then rg_kttDDNSServerUses.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
            else rg_kttDDNSServerUses.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'DDNS_SIP' then
          begin
            ed_DDNSIP.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DDNS_SPORT' then
          begin
            ed_DDNSPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DDNS_QIP' then
          begin
            ed_DDNSQueryIP.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DDNS_QPORT' then
          begin
            ed_DDNSQueryPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end;
        end;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAttendConfig.btn_SaveClick(Sender: TObject);
var
  nTemp : integer;
begin

  UpdateTB_CONFIG('KTT','KTTSIP',ed_kttServerIP.Text );
  UpdateTB_CONFIG('KTT','KTTSPORT',ed_kttServerPort.Text );
  UpdateTB_CONFIG('KTT','KTTCPORT',ed_kttClientPort.Text );
  UpdateTB_CONFIG('KTT','KTTPCYCLE',ed_KTTPamCycle.Text );
  if rg_kttDDNSServerUses.ItemIndex < 0 then rg_kttDDNSServerUses.ItemIndex := 0;
  UpdateTB_CONFIG('KTT','DDNSUSES',inttostr(rg_kttDDNSServerUses.ItemIndex));
  UpdateTB_CONFIG('KTT','DDNS_SIP',ed_DDNSIP.Text );
  UpdateTB_CONFIG('KTT','DDNS_SPORT',ed_DDNSPort.Text );
  UpdateTB_CONFIG('KTT','DDNS_QIP',ed_DDNSQueryIP.Text );
  UpdateTB_CONFIG('KTT','DDNS_QPORT',ed_DDNSQueryPort.Text );

  Close;
end;

function TfmAttendConfig.UpdateTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string;aConfigDetail:string=''): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'Update TB_CONFIG ';
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  if aConfigDetail <> '' then
  stSql := stSql + ', CO_CONFIGDETAIL = ''' + aConfigDetail + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmAttendConfig.UpdateTB_FOODCODE(aFOODCODE, aSTARTTIME,
  aENDTIME,aFOAMT: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'Update TB_FOODCODE ';
  stSql := stSql + ' Set FO_STARTTIME = ''' + aSTARTTIME + ''', ';
  stSql := stSql + ' FO_ENDTIME = ''' + aENDTIME + ''', ';
  stSql := stSql + ' FO_AMT = ' + aFOAMT ;
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FO_FOODCODE = ''' + aFOODCODE + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;
{
procedure TfmAttendConfig.InsertATCode;
var
  stSql : string;
  stInFromTime : string;
  stInToTime : string;
  stWorkFromTime : string;
  stWorkToTime : string;
begin
  stSql := 'Delete From TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  DataModule1.ProcessExecSQL(stSql);

  stInFromTime := ed_InFrom1Hour.Text + ed_InFrom1Min.Text;
  stInToTime := ed_InTo1Hour.Text + ed_InTo1Min.Text;
  stWorkFromTime := ed_WorkFrom1Hour.Text + ed_WorkFrom1Min.Text;
  stWorkToTime := ed_WorkTo1Hour.Text + ed_WorkTo1Min.Text;
  InsertTB_ATCODE('001','1교대',stInFromTime,stInToTime,stWorkFromTime,stWorkToTime);

  if cmb_ChangCnt.ItemIndex > 0 then
  begin
    stInFromTime := ed_InFrom2Hour.Text + ed_InFrom2Min.Text;
    stInToTime := ed_InTo2Hour.Text + ed_InTo2Min.Text;
    stWorkFromTime := ed_WorkFrom2Hour.Text + ed_WorkFrom2Min.Text;
    stWorkToTime := ed_WorkTo2Hour.Text + ed_WorkTo2Min.Text;
    InsertTB_ATCODE('002','2교대',stInFromTime,stInToTime,stWorkFromTime,stWorkToTime);
  end;

  if cmb_ChangCnt.ItemIndex > 1 then
  begin
    stInFromTime := ed_InFrom3Hour.Text + ed_InFrom3Min.Text;
    stInToTime := ed_InTo3Hour.Text + ed_InTo3Min.Text;
    stWorkFromTime := ed_WorkFrom3Hour.Text + ed_WorkFrom3Min.Text;
    stWorkToTime := ed_WorkTo3Hour.Text + ed_WorkTo3Min.Text;
    InsertTB_ATCODE('003','3교대',stInFromTime,stInToTime,stWorkFromTime,stWorkToTime);
  end;

  if cmb_ChangCnt.ItemIndex > 2 then
  begin
    stInFromTime := ed_InFrom4Hour.Text + ed_InFrom4Min.Text;
    stInToTime := ed_InTo4Hour.Text + ed_InTo4Min.Text;
    stWorkFromTime := ed_WorkFrom4Hour.Text + ed_WorkFrom4Min.Text;
    stWorkToTime := ed_WorkTo4Hour.Text + ed_WorkTo4Min.Text;
    InsertTB_ATCODE('004','4교대',stInFromTime,stInToTime,stWorkFromTime,stWorkToTime);
  end;

end;  }

function TfmAttendConfig.InsertTB_ATCODE(aATCODE, aATName, aInFromTime,
  aInToTime, aWorkFromTime, aWorkToTime: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := ' Insert Into TB_ATCODE( ';
  stSql := stSql + ' GROUP_CODE,AT_ATCODE,AT_CODENAME,';
  stSql := stSql + ' AT_WORKSTARTTIME,AT_WORKENDTIME,AT_INFROMTIME,AT_INTOTIME )';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aATCODE + ''',';
  stSql := stSql + '''' + aATName + ''',';
  stSql := stSql + '''' + aWorkFromTime + ''',';
  stSql := stSql + '''' + aWorkToTime + ''',';
  stSql := stSql + '''' + aInFromTime + ''',';
  stSql := stSql + '''' + aInToTime + ''') ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmAttendConfig.InsertTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string;aConfigDetail:string=''): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'Insert Into TB_CONFIG (';
  stSql := stSql + ' GROUP_CODE ,';
  stSql := stSql + ' CO_CONFIGGROUP ,';
  stSql := stSql + ' CO_CONFIGCODE ,';
  stSql := stSql + ' CO_CONFIGVALUE,';
  stSql := stSql + ' CO_CONFIGDETAIL ) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + ' ''' + GROUPCODE + ''', ';
  stSql := stSql + ' ''' + aCONFIGGROUP + ''', ';
  stSql := stSql + ' ''' + aCONFIGCODE + ''', ';
  stSql := stSql + ' ''' + aCONFIGVALUE + ''', ';
  stSql := stSql + ' ''' + aConfigDetail + ''' ) ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmAttendConfig.UpdateTB_ATWORKTYPE(aCode, aField,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATWORKTYPE set ' + aField + ' = ''' + aValue + ''' ';
  stSql := stSql + ' Where AW_CODE = ''' + aCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmAttendConfig.btn_faceconnectClick(Sender: TObject);
begin                                                         //'facedb'
end;

end.
