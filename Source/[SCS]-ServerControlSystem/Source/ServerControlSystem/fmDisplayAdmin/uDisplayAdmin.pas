unit uDisplayAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, BaseGrid, AdvGrid, uSubForm, CommandArray,
  Buttons, StdCtrls, DB, ADODB,ActiveX;

type
  TfmDisplayAdmin = class(TfmASubForm)
    sg_Door: TAdvStringGrid;
    Splitter2: TSplitter;
    Panel1: TPanel;
    btn_Close: TSpeedButton;
    btn_Save: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    ed_DisplayIP: TEdit;
    ed_DisplayPORT: TEdit;
    ed_GeneralTime: TEdit;
    ed_GeneralMessage: TEdit;
    ed_AuthMessage: TEdit;
    ed_NotAuthMessage: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    st_DoorName: TStaticText;
    ADOQuery: TADOQuery;
    ed_nodeNo: TEdit;
    ed_ecuid: TEdit;
    ed_doorNo: TEdit;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure sg_DoorClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure SearchDisplayInfo(aDoorID:string;aTop :integer = 0);
    function GetMessage(aNodeNo,aEcuID,aDoorNo:string;var aGeneralMessage,aAuthMessage,aNotAuthMessage:string):Boolean;
    function SaveTB_KTBMDISPLAY(aNodeNo,aEcuID,aDoorNo,
                     aDisplayIP,aDisplayPORT,aGeneralTime:string):Boolean;
    Function SaveTB_KTBMDISPLAYMESSAGE(aNodeNo,aEcuID,aDoorNo,aCode,aMessage:string):Boolean;

    Function CheckTB_KTBMDISPLAY(aNodeNo, aEcuID, aDoorNo:string):Boolean;
    Function InsertTB_KTBMDISPLAY(aNodeNo, aEcuID, aDoorNo,
                      aDisplayIP, aDisplayPORT, aGeneralTime:string):Boolean;
    Function UpdateTB_KTBMDISPLAY(aNodeNo, aEcuID, aDoorNo,
                      aDisplayIP, aDisplayPORT, aGeneralTime:string):Boolean;
    Function CheckTB_KTBMDISPLAYMESSAGE(aNodeNo, aEcuID, aDoorNo,aCode:string):Boolean;
    Function InsertTB_KTBMDISPLAYMESSAGE(aNodeNo, aEcuID,
                                aDoorNo, aCode, aMessage:string):Boolean;
    Function UpdateTB_KTBMDISPLAYMESSAGE(aNodeNo, aEcuID,
                                aDoorNo, aCode, aMessage:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmDisplayAdmin: TfmDisplayAdmin;

implementation

uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

procedure TfmDisplayAdmin.FormActivate(Sender: TObject);
begin
  SearchDisplayInfo('');
end;

procedure TfmDisplayAdmin.SearchDisplayInfo(aDoorID:string;aTop :integer = 0);
var
  stSql : string;
  nRow : integer;
begin
  GridInit(sg_Door,4);
  stSql := 'Select a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO,  ';
  stSql := stSql + 'a.DO_DOORNONAME,b.KD_IP,b.KD_PORT, ';
  stSql := stSql + 'b.KD_CLEARTIME,b.KD_GENERALTIME ';
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' Left Join TB_KTBMDISPLAY b ';
  stSql := stSql + ' ON ( a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';

  with AdoQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    nRow := 1;
    sg_Door.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      with sg_Door do
      begin
        Cells[0,nRow] := FindField('DO_DOORNONAME').AsString;
        Cells[1,nRow] := FindField('KD_IP').AsString;
        Cells[2,nRow] := FindField('KD_PORT').AsString;
        Cells[3,nRow] := FindField('KD_GENERALTIME').AsString;
        Cells[4,nRow] := FindField('AC_NODENO').AsString;
        Cells[5,nRow] := FindField('AC_ECUID').AsString;
        Cells[6,nRow] := FindField('DO_DOORNO').AsString;

        if aDoorID = (FillZeroNumber(FindField('AC_NODENO').AsInteger,3) +
                      FindField('AC_ECUID').AsString +
                      FindField('DO_DOORNO').AsString) then
        begin
          SelectRows(nRow,1);
        end;
      end;
      inc(nRow);
      Next;
    end;
  end;
  sg_DoorClick(self);
  if aTop <> 0 then
    sg_Door.topRow := aTop
  else
  begin
    if sg_Door.row > 17 then sg_Door.TopRow := sg_Door.row - 16;
  end;

end;

procedure TfmDisplayAdmin.sg_DoorClick(Sender: TObject);
var
  stGeneralMessage : string;
  stAuthMessage : string;
  stNotAuthMessage : string;
begin
  stGeneralMessage := '';
  stAuthMessage := '';
  stNotAuthMessage := '';
  //inherited;
  with sg_Door do
  begin
    st_DoorName.Caption := Cells[0,row];
    ed_DisplayIP.Text :=  Cells[1,row];
    ed_DisplayPORT.Text :=  Cells[2,row];
    ed_GeneralTime.Text :=  Cells[3,row];
    ed_NodeNo.Text := Cells[4,row] ;
    ed_ecuid.Text := Cells[5,row];
    ed_doorno.Text := Cells[6,row];

    GetMessage(Cells[4,row],Cells[5,row],Cells[6,row],stGeneralMessage,stAuthMessage,stNotAuthMessage);

    ed_GeneralMessage.Text := stGeneralMessage;
    ed_AuthMessage.Text := stAuthMessage;
    ed_NotAuthMessage.Text := stNotAuthMessage;

  end;
end;

procedure TfmDisplayAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

function TfmDisplayAdmin.GetMessage(aNodeNo, aEcuID, aDoorNo: string;
  var aGeneralMessage, aAuthMessage, aNotAuthMessage: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' Select * from TB_KTBMDISPLAYMESSAGE ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNO + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      while Not Eof do
      begin
        if FindField('KM_CODE').AsString = '000' then
        begin
          aGeneralMessage := FindField('KM_MESSAGE').AsString;
        end else if FindField('KM_CODE').AsString = '001' then
        begin
          aAuthMessage := FindField('KM_MESSAGE').AsString;
        end else if FindField('KM_CODE').AsString = '002' then
        begin
          aNotAuthMessage := FindField('KM_MESSAGE').AsString;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmDisplayAdmin.btn_SaveClick(Sender: TObject);
begin
  if not isdigit(ed_nodeno.text) then
  begin
    showmessage('출입문이 선택되지 않았습니다.');
    Exit;
  end;
  if not isdigit(ed_nodeno.text) then
  begin
    showmessage('출입문이 선택되지 않았습니다.');
    Exit;
  end;
  if not isdigit(ed_doorNo.text) then
  begin
    showmessage('출입문이 선택되지 않았습니다.');
    Exit;
  end;

  SaveTB_KTBMDISPLAY(ed_nodeno.text,ed_ecuid.text,ed_doorNo.text,
                     ed_DisplayIP.Text,ed_DisplayPORT.Text,ed_GeneralTime.Text);
  SaveTB_KTBMDISPLAYMESSAGE(ed_nodeno.text,ed_ecuid.text,ed_doorNo.text,
                     '000',ed_GeneralMessage.Text);
  SaveTB_KTBMDISPLAYMESSAGE(ed_nodeno.text,ed_ecuid.text,ed_doorNo.text,
                     '001',ed_AuthMessage.Text);
  SaveTB_KTBMDISPLAYMESSAGE(ed_nodeno.text,ed_ecuid.text,ed_doorNo.text,
                     '002',ed_NotAuthMessage.Text);

  SearchDisplayInfo(FillZeroNumber(strtoint(ed_nodeNo.Text),3)+ed_ecuid.Text+ ed_doorNo.Text,sg_Door.TopRow);

end;

function TfmDisplayAdmin.SaveTB_KTBMDISPLAY(aNodeNo, aEcuID, aDoorNo,
  aDisplayIP, aDisplayPORT, aGeneralTime: string): Boolean;
begin
  if Not CheckTB_KTBMDISPLAY(aNodeNo, aEcuID, aDoorNo) then
  begin
    result := InsertTB_KTBMDISPLAY(aNodeNo, aEcuID, aDoorNo,
                      aDisplayIP, aDisplayPORT, aGeneralTime);
  end else
  begin
    result := UpdateTB_KTBMDISPLAY(aNodeNo, aEcuID, aDoorNo,
                      aDisplayIP, aDisplayPORT, aGeneralTime);
  end;
end;

function TfmDisplayAdmin.SaveTB_KTBMDISPLAYMESSAGE(aNodeNo, aEcuID,
  aDoorNo, aCode, aMessage: string): Boolean;
begin
  if Not CheckTB_KTBMDISPLAYMESSAGE(aNodeNo, aEcuID, aDoorNo,aCode) then
  begin
    result := InsertTB_KTBMDISPLAYMESSAGE(aNodeNo, aEcuID,
                                aDoorNo, aCode, aMessage);
  end else
  begin
    result := UpdateTB_KTBMDISPLAYMESSAGE(aNodeNo, aEcuID,
                                aDoorNo, aCode, aMessage);
  end;

end;

function TfmDisplayAdmin.CheckTB_KTBMDISPLAY(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := 'Select * from TB_KTBMDISPLAY ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo ;
  stSql := stsql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmDisplayAdmin.CheckTB_KTBMDISPLAYMESSAGE(aNodeNo, aEcuID,
  aDoorNo, aCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := 'Select * from TB_KTBMDISPLAYMESSAGE ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo ;
  stSql := stsql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND KM_CODE = ''' + aCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmDisplayAdmin.InsertTB_KTBMDISPLAY(aNodeNo, aEcuID, aDoorNo,
  aDisplayIP, aDisplayPORT, aGeneralTime: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_KTBMDISPLAY(';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' KD_IP,';
  stSql := stSql + ' KD_PORT,';
  stSql := stSql + ' KD_GENERALTIME)';
  stSql := stSql + '  Values(';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aDisplayIP + ''',';
  stSql := stSql + '''' + aDisplayPORT + ''',';
  stSql := stSql + '''' + aGeneralTime + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDisplayAdmin.InsertTB_KTBMDISPLAYMESSAGE(aNodeNo, aEcuID,
  aDoorNo, aCode, aMessage: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_KTBMDISPLAYMESSAGE(';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' KM_CODE,';
  stSql := stSql + ' KM_MESSAGE)';
  stSql := stSql + '  Values(';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aMessage + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDisplayAdmin.UpdateTB_KTBMDISPLAY(aNodeNo, aEcuID, aDoorNo,
  aDisplayIP, aDisplayPORT, aGeneralTime: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_KTBMDISPLAY set ';
  stSql := stSql + ' KD_IP = ''' + aDisplayIP + ''',';
  stSql := stSql + ' KD_PORT = ''' + aDisplayPORT + ''',';
  stSql := stSql + ' KD_GENERALTIME = ''' + aGeneralTime + ''' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDisplayAdmin.UpdateTB_KTBMDISPLAYMESSAGE(aNodeNo, aEcuID,
  aDoorNo, aCode, aMessage: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_KTBMDISPLAYMESSAGE set ';
  stSql := stSql + ' KM_MESSAGE = ''' + aMessage + ''' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND KM_CODE = ''' + aCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

end.
