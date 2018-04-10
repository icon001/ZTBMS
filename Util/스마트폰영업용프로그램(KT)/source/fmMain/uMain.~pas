unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, RzStatus, OoMisc, AdStatLt, ExtCtrls, RzPanel, AdPort,
  AdWnPort, ComCtrls, ToolWin, ImgList, ActnList, AdPacket,ActiveX,ADODB;

type
  TfmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    RzStatusBar1: TRzStatusBar;
    Panel_ActiveClinetCount: TRzStatusPane;
    RzFieldStatus1: TRzFieldStatus;
    ToolBar1: TToolBar;
    btnEmployee: TToolButton;
    btnMonitor: TToolButton;
    btnEmploy: TToolButton;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N3: TMenuItem;
    N8: TMenuItem;
    Menu_ImageList: TImageList;
    ToolButton1: TToolButton;
    ActionList1: TActionList;
    Action_Config: TAction;
    Action_Employee: TAction;
    Action_Monitor: TAction;
    Action_Exit: TAction;
    ReaderPort: TApdComPort;
    ApdDataPacket1: TApdDataPacket;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Action_ExitExecute(Sender: TObject);
    procedure Action_ConfigExecute(Sender: TObject);
    procedure ApdDataPacket1StringPacket(Sender: TObject; Data: String);
    procedure Action_EmployeeExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action_MonitorExecute(Sender: TObject);
  private
    L_bShowModalVisible : Boolean;
    { Private declarations }
    Procedure DataModuleAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    function GetConfigTable:Boolean;
    function PortOpen : Boolean;
    procedure RcvCardDataByReader(aData:string);
    procedure CardReadProcess(aCardNo:string);
  private
    Procedure MDIChildShow(FormName:String;aMaximized:Boolean = True);
    Function  MDIForm(FormName:string):TForm;
  public
    L_bEmployeeshow : Boolean;
    L_bMonitorShow : Boolean;
    { Public declarations }

  end;

var
  fmMain: TfmMain;


implementation

uses
  uCommonVariable,
  uDataBaseConfig,
  uDBModule,
  uConfig,
  uLomosUtil,
  uEmployee,
  uMonitor;
{$R *.dfm}

procedure TfmMain.DataModuleAdoConnected(Sender: TObject;
  DBConnected: Boolean);
begin
  if Not DBConnected then
  begin
    //AdoConnectCheckTimer.Enabled := True;
  end;

end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  dmDBModule.OnAdoConnected := DataModuleAdoConnected;
end;

procedure TfmMain.FormShow(Sender: TObject);
var
  LogoFile : string;
begin
  TDataBaseConfig.GetObject.DataBaseConnect;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('데이터베이스를 열수 없습니다. 데이터가 깨졌는지 확인후 재작업 하세요.');
    Application.Terminate;
  end;

  GetConfigTable;
  PortOpen;

  LogoFile := ExtractFileDir(Application.ExeName) + '\Logo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);

end;

procedure TfmMain.Action_ExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.Action_ConfigExecute(Sender: TObject);
begin
  Try
    ApdDataPacket1.Enabled := False;
    ReaderPort.Open := False;
  Except
  End;

  fmConfig:= TfmConfig.Create(Self);
  Try
    L_bShowModalVisible := True;
    fmConfig.SHowmodal;
  Finally
    L_bShowModalVisible := False;
    fmConfig.Free;
  End;
  GetConfigTable;
  PortOpen;
  //
end;

function TfmMain.GetConfigTable: Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin

  G_nCardRegisterPort := 0;
  
  stSql := 'Select * from TB_CONFIG ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;

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

      While Not Eof do
      begin
        if FindField('CO_GROUPID').AsString = 'SMART' then
        begin
          if FindField('CO_CODE').AsString = 'COMPORT' then
          begin
            if isDigit(FindField('CO_VALUE').AsString) then
            begin
              G_nCardRegisterPort := strtoint(FindField('CO_VALUE').AsString);
            end;
          end;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.PortOpen: Boolean;
begin
  result := False;
  if G_nCardRegisterPort > 0 then
  begin
    try
      ApdDataPacket1.AutoEnable := false;
      ApdDataPacket1.StartCond := scString;
      ApdDataPacket1.StartString := #$02;
      ApdDataPacket1.EndCond := [ecString];
      ApdDataPacket1.EndString := #$03;
      ApdDataPacket1.Timeout := 0;
      ReaderPort.ComNumber := G_nCardRegisterPort;
      ReaderPort.Open := true;
      ApdDataPacket1.Enabled := True;
    except
      Exit;
    end;
  end else
  begin
    showmessage('카드 등록기 포트를 확인해 주세요.');
    Exit;
  end;
  result := True;

end;

procedure TfmMain.ApdDataPacket1StringPacket(Sender: TObject;
  Data: String);
begin
  RcvCardDataByReader(Data);
  ApdDataPacket1.Enabled := True;
end;

procedure TfmMain.RcvCardDataByReader(aData: string);
var
  aIndex: Integer;
  aCardNo:String;
  bCardNo: int64;
  stMsg : string;
begin
  //STX 삭제
  aIndex:= Pos(#$2,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);
  //ETX삭제
  aIndex:= Pos(#$3,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);

  aCardNo := aData;
  if Trim(aCardNo) <> '' then CardReadProcess(aCardNo);

end;

procedure TfmMain.CardReadProcess(aCardNo: string);
var
  fmEmploy : TForm;
  fmMonitor : TForm;
begin
  if L_bEmployeeshow then
  begin
    fmEmploy := MDIForm('TfmEmploy');
    if fmEmploy <> nil then
    begin
      TfmEmploy(fmEmploy).CardReadProcess(aCardNo);
    end;
  end;

  if L_bMonitorShow then
  begin
    fmMonitor := MDIForm('TfmMonitor');
    if fmMonitor <> nil then
    begin
      TfmMonitor(fmMonitor).CardReadProcess(aCardNo);
    end;
  end;
end;

procedure TfmMain.Action_EmployeeExecute(Sender: TObject);
begin
  MDIChildShow('TfmEmploy',False);
end;

procedure TfmMain.MDIChildShow(FormName: String;aMaximized:Boolean = True);
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        if Screen.ActiveForm = Screen.Forms[i] then
        begin
          if aMaximized then Screen.Forms[i].WindowState := wsMaximized;
          Exit;
        end;
        Screen.Forms[i].Show;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    if aMaximized then tmpForm.WindowState := wsMaximized;
    tmpForm.Show;
  end;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ApdDataPacket1.Enabled := False;
  ReaderPort.Open := False;

end;

function TfmMain.MDIForm(FormName: string): TForm;
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  result := nil;
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        result := Screen.Forms[i];
        Exit;
      end;
    end;
  end;
end;

procedure TfmMain.Action_MonitorExecute(Sender: TObject);
begin
  MDIChildShow('TfmMonitor',False);
end;

end.
