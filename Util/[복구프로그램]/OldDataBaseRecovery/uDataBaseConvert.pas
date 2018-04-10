unit uDataBaseConvert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Gauges, DB, ADODB, FolderDialog,
  Grids, DBGrids, FindFile, ComCtrls,IniFiles,ActiveX;

type
  TfmMain = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    rg_targetDBType: TRadioGroup;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ed_targetUserpw: TEdit;
    ed_targetUserName: TEdit;
    ed_targetDBName: TEdit;
    ed_targetDBPort: TEdit;
    ed_targetDBIP: TEdit;
    btn_DBRecovery: TSpeedButton;
    btn_Close: TSpeedButton;
    gb_Progress: TGroupBox;
    ga_Table: TGauge;
    targetADOConnection: TADOConnection;
    targetADOQuery: TADOQuery;
    FolderDialog1: TFolderDialog;
    Ga_Tot: TGauge;
    Label2: TLabel;
    lbl_Table: TLabel;
    targetSearchADOQuery: TADOQuery;
    Label1: TLabel;
    ed_BackupDir: TEdit;
    btn_Folder: TButton;
    FindFile: TFindFile;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    cmb_FileList: TComboBox;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    FileName_: TEdit;
    Location_: TEdit;
    Subfolders: TCheckBox;
    Phrase: TEdit;
    CaseSenstitive: TCheckBox;
    WholeWord: TCheckBox;
    TabSheet3: TTabSheet;
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    CreatedBeforeDate: TDateTimePicker;
    CreatedAfterDate: TDateTimePicker;
    CreatedBeforeTime: TDateTimePicker;
    CreatedAfterTime: TDateTimePicker;
    CBD: TCheckBox;
    CBT: TCheckBox;
    CAD: TCheckBox;
    CAT: TCheckBox;
    TabSheet5: TTabSheet;
    ModifiedBeforeDate: TDateTimePicker;
    ModifiedAfterDate: TDateTimePicker;
    ModifiedBeforeTime: TDateTimePicker;
    ModifiedAfterTime: TDateTimePicker;
    MBD: TCheckBox;
    MBT: TCheckBox;
    MAD: TCheckBox;
    MAT: TCheckBox;
    TabSheet6: TTabSheet;
    AccessedBeforeDate: TDateTimePicker;
    AccessedAfterDate: TDateTimePicker;
    AccessedBeforeTime: TDateTimePicker;
    AccessedAfterTime: TDateTimePicker;
    ABD: TCheckBox;
    ABT: TCheckBox;
    AAD: TCheckBox;
    AAT: TCheckBox;
    TabSheet2: TTabSheet;
    Attributes: TGroupBox;
    System: TCheckBox;
    Hidden: TCheckBox;
    Readonly: TCheckBox;
    Archive: TCheckBox;
    Directory: TCheckBox;
    Compressed: TCheckBox;
    Encrypted: TCheckBox;
    Offline: TCheckBox;
    SparseFile: TCheckBox;
    ReparsePoint: TCheckBox;
    Temporary: TCheckBox;
    Device: TCheckBox;
    Normal: TCheckBox;
    NotContentIndexed: TCheckBox;
    Virtual: TCheckBox;
    FileSize: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    SizeMaxEdit: TEdit;
    SizeMinEdit: TEdit;
    SizeMin: TUpDown;
    SizeMax: TUpDown;
    SizeMinUnit: TComboBox;
    SizeMaxUnit: TComboBox;
    TblImport: TADOQuery;
    btn_Stop: TSpeedButton;
    qryInsert: TADOQuery;
    Memo1: TMemo;
    procedure btn_CloseClick(Sender: TObject);
    procedure rg_targetDBTypeClick(Sender: TObject);
    procedure btn_FolderClick(Sender: TObject);
    procedure FindFileFolderChange(Sender: TObject; const Folder: String;
      var IgnoreFolder: TFolderIgnore);
    procedure FormCreate(Sender: TObject);
    procedure FindFileFileMatch(Sender: TObject;
      const FileInfo: TFileDetails);
    procedure FindFileSearchFinish(Sender: TObject);
    procedure btn_DBRecoveryClick(Sender: TObject);
    procedure btn_StopClick(Sender: TObject);
  private
    FDBTYPE: string;
    L_nBackupTableVer : integer;

    { Private declarations }
    Function targetAdoConnect : Boolean;
    procedure SetDBType(const Value: string);
    function GetCurrentTableVersion:integer;
    procedure TableVersionSync(aCurrentVersion,aBackupTableVer:integer);

  private
    property DBTYPE : string read FDBTYPE write SetDBType;
    function Table1VersionMake: Boolean;
    function Table2VersionMake: Boolean;
    function Table3VersionMake: Boolean;
    function Table4VersionMake: Boolean;
    function Table5VersionMake: Boolean;
    function Table6VersionMake: Boolean;
    function Table7VersionMake: Boolean;
    function Table8VersionMake: Boolean;
    function Table9VersionMake: Boolean;
    function Table10VersionMake: Boolean;
    function Table11VersionMake: Boolean;
    function Table12VersionMake: Boolean;
    function Table13VersionMake: Boolean;
    function Table14VersionMake: Boolean;
    function Table15VersionMake: Boolean;
    function Table16VersionMake: Boolean;
    function Table17VersionMake: Boolean;
    function Table18VersionMake: Boolean;
    function Table19VersionMake: Boolean;
    function Table20VersionMake: Boolean;
    function Table21VersionMake: Boolean;
    function Table22VersionMake: Boolean;
    function Table23VersionMake: Boolean;
    function Table24VersionMake: Boolean;
    function Table25VersionMake: Boolean;
    function Table26VersionMake: Boolean;
    function Table27VersionMake: Boolean;
    function Table28VersionMake: Boolean;
    function Table29VersionMake: Boolean;
    function Table30VersionMake: Boolean;
    function Table31VersionMake: Boolean;
    function Table32VersionMake: Boolean;
    function Table33VersionMake: Boolean;
    function Table34VersionMake: Boolean;
    function Table35VersionMake: Boolean;
    function Table36VersionMake: Boolean;
    function Table37VersionMake: Boolean;
    function Table38VersionMake: Boolean;
    function Table39VersionMake: Boolean;
    function Table40VersionMake: Boolean;
    function Table41VersionMake: Boolean;
    function Table42VersionMake: Boolean;
    function Table43VersionMake: Boolean;
    function Table44VersionMake: Boolean;
    function Table45VersionMake: Boolean;
    function Table46VersionMake: Boolean;
    function Table47VersionMake: Boolean;
    function Table48VersionMake: Boolean;
    function Table49VersionMake: Boolean;
    function Table50VersionMake: Boolean;
    function Table51VersionMake: Boolean;
    function Table52VersionMake: Boolean;
    function Table53VersionMake: Boolean;
    function Table54VersionMake: Boolean;
    function Table55VersionMake: Boolean;
    function Table56VersionMake: Boolean;
    function Table57VersionMake: Boolean;
    function Table58VersionMake: Boolean;
    function Table59VersionMake: Boolean;
    function Table60VersionMake: Boolean;
    function Table61VersionMake: Boolean;
    function Table62VersionMake: Boolean;
    function Table63VersionMake: Boolean;
    function Table64VersionMake: Boolean;
    function Table65VersionMake: Boolean;
    function Table66VersionMake: Boolean;
    function Table67VersionMake: Boolean;
    function Table68VersionMake: Boolean;
    function Table69VersionMake: Boolean;
    function Table70VersionMake: Boolean;
    function Table71VersionMake: Boolean;
    function Table72VersionMake: Boolean;
    function Table73VersionMake: Boolean;
    function Table74VersionMake: Boolean;
    function Table75VersionMake: Boolean;
    function Table76VersionMake: Boolean;
    function Table77VersionMake: Boolean;
    function Table78VersionMake: Boolean;
    function Table79VersionMake: Boolean;
    function Table80VersionMake: Boolean;
    function Table81VersionMake: Boolean;
    function Table82VersionMake: Boolean;
    function Table83VersionMake: Boolean;
    function Table84VersionMake: Boolean;
    function Table85VersionMake: Boolean;  //KTT관제 연동
    function Table86VersionMake: Boolean;
    function Table87VersionMake: Boolean;  //KTT관제 연동
    function Table88VersionMake: Boolean;
    function Table89VersionMake: Boolean;
    function Table90VersionMake: Boolean;  //KTT관제 연동
    function Table91VersionMake: Boolean;  //KTT관제 연동
    function Table92VersionMake: Boolean;  //KTT관제 연동
    function Table93VersionMake: Boolean;
    function Table94VersionMake: Boolean;
    function Table95VersionMake: Boolean;
    function Table96VersionMake: Boolean;
    function Table97VersionMake: Boolean;
    function Table98VersionMake: Boolean;
    function Table99VersionMake: Boolean;
    function Table100VersionMake: Boolean;
    function Table101VersionMake: Boolean;
    function Table102VersionMake: Boolean;
    function Table103VersionMake: Boolean;
    function Table104VersionMake: Boolean;
    function Table105VersionMake: Boolean;
    function Table106VersionMake: Boolean;
    function Table107VersionMake: Boolean;
    function Table108VersionMake: Boolean;
    function Table109VersionMake: Boolean;
    function Table110VersionMake: Boolean;
    function Table111VersionMake: Boolean;
    function Table112VersionMake: Boolean;
    function Table113VersionMake: Boolean;
    function Table114VersionMake: Boolean;
    function Table115VersionMake: Boolean;
    function Table116VersionMake: Boolean;
    function Table117VersionMake: Boolean;
    function Table118VersionMake: Boolean;
    function Table119VersionMake: Boolean;
    function Table120VersionMake: Boolean;
    function Table121VersionMake: Boolean;
    function Table122VersionMake: Boolean;
    function Table123VersionMake: Boolean;
    function Table124VersionMake: Boolean;
    function Table125VersionMake: Boolean;
    function Table126VersionMake: Boolean;
    function Table127VersionMake: Boolean;
    function Table128VersionMake: Boolean;
    function Table129VersionMake: Boolean;
    function Table130VersionMake: Boolean;
    function Table131VersionMake: Boolean;
    function Table132VersionMake: Boolean;
    function Table133VersionMake: Boolean;
    function Table134VersionMake: Boolean;
    function Table135VersionMake: Boolean;
    function Table136VersionMake: Boolean;
    function Table137VersionMake: Boolean;
    function Table138VersionMake: Boolean;
    function Table139VersionMake: Boolean;
    function Table140VersionMake: Boolean;
    function Table141VersionMake: Boolean;
    function Table142VersionMake: Boolean;
    function Table143VersionMake: Boolean;
    function Table144VersionMake: Boolean;
    function Table146VersionMake: Boolean;
    function Table147VersionMake: Boolean;
    function Table148VersionMake: Boolean;
    function Table149VersionMake: Boolean;
    function Table150VersionMake: Boolean;
    function Table151VersionMake: Boolean;
    function Table152VersionMake: Boolean;
    function Table153VersionMake: Boolean;
    function Table154VersionMake: Boolean;

    function PositionNumberValueSetting:Boolean;
    Function UpdateTB_CARDPoitionNum(aGroupCode,aCardNo:string;aPositionNumber:integer):Boolean;
    function CheckPersonRelay : string;
    function CheckSamyuk : Boolean;
    function CheckFdms : Boolean;
  public
    BackupFileList : TStringList;
    L_bStop : Boolean;
    { Public declarations }
    procedure BackupFileLoad;
    Function FileDBRestor(aImportFileName:string):Boolean;
    Function CreateTable(aTableName:string):Boolean;
    Function DeleteTable(aTableName:string):Boolean;
    Function DropTable(aTableName:string):Boolean;
  end;

var
  fmMain: TfmMain;

implementation

uses
  uDataModule1,
  uLomosUtil,
  uCommonSql,
  uMDBSql, uPostGreSql, uMssql, uFireBird,
  DIMime;
{$R *.dfm}
function GetAttributeStatus(CB: TCheckBox): TFileAttributeStatus;
begin
  case CB.State of
    cbUnchecked: Result := fsUnset;
    cbChecked: Result := fsSet;
  else
    Result := fsIgnore;
  end;
end;

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.rg_targetDBTypeClick(Sender: TObject);
begin
  if rg_targetDBType.ItemIndex = 0 then
  begin
    ed_targetDBPort.Text := '1433';
    ed_targetDBPort.Visible := True;
    ed_targetUserName.Text := 'sa';
    ed_targetUserPw.Text := 'sapasswd';
  end else
  begin
    ed_targetDBPort.Text := '5432';
    ed_targetDBPort.Visible := False;
    ed_targetUserName.Text := 'postgres';
    ed_targetUserPw.Text := '1';
  end;

end;

function TfmMain.targetAdoConnect: Boolean;
var
  conStr : wideString;
  stHost : String;
  stPort : String;
  stuserID : String;
  stuserPW : String;
  stDBName : string;
begin
  result := False;
  stHost  := ed_targetDBIP.Text;
  stPort := ed_targetDBPort.Text;
  stuserID := ed_targetUserName.Text;
  stuserPW := ed_targetUserPw.Text;  //saPasswd
  stDBName := ed_targetDBName.Text;
  if rg_targetDBType.ItemIndex = 0 then
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + stuserPW + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + stuserID + ';';
    conStr := constr + 'Initial Catalog=' + stDBName + ';';
    conStr := constr + 'Data Source=' + stHost  + ',' + stPort;
  end else
  begin
    conStr := 'Provider=PostgreSQL OLE DB Provider;';
    conStr := constr + 'Data Source=' + stHost + ';'   ;
    conStr := constr + 'location=' + stDBName + ';';
    conStr := constr + 'User Id='+ stuserID + ';';
    conStr := constr + 'password=' + stuserPW;
  end;
  with targetADOConnection do
  begin
    Connected := False;
    Try
      ConnectionString := conStr;
      LoginPrompt:= false ;
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
    //CursorLocation := clUseClient;
  end;
  result := True;
end;

procedure TfmMain.btn_FolderClick(Sender: TObject);
begin
  L_nBackupTableVer := -1;
  FolderDialog1.Title := '백업 폴더 찾기';

  if FolderDialog1.Execute then
  begin
    ed_BackupDir.Text := FolderDialog1.Directory;
    BackupFileList.Clear;
    BackupFileList.Add('TB_ACCESSDEVICE.BAK');
    BackupFileList.Add('TB_ADMIN.BAK');
    BackupFileList.Add('TB_ADMINALARMDEVICE.BAK');
    BackupFileList.Add('TB_ADMINCOMPANY.BAK');
    BackupFileList.Add('TB_ADMINDOOR.BAK');
    BackupFileList.Add('TB_ADMINFOOD.BAK');
    BackupFileList.Add('TB_ALARMDEVICE.BAK');
    BackupFileList.Add('TB_ATCARD.BAK');
    BackupFileList.Add('TB_ATCODE.BAK');
    BackupFileList.Add('TB_ATDAYSUMMARY.BAK');
    BackupFileList.Add('TB_ATEMPEXTRA.BAK');
    BackupFileList.Add('TB_ATINCODE.BAK');
    BackupFileList.Add('TB_ATMONTHEXTRA.BAK');
    BackupFileList.Add('TB_ATMONTHSUMMARY.BAK');
    BackupFileList.Add('TB_ATOUTCODE.BAK');
    BackupFileList.Add('TB_ATPASS.BAK');
    BackupFileList.Add('TB_ATVACATION.BAK');
    BackupFileList.Add('TB_ATVACODE.BAK');
    BackupFileList.Add('TB_BASEPAY.BAK');
    BackupFileList.Add('TB_CARD.BAK');
    BackupFileList.Add('TB_COMPANY.BAK');
    BackupFileList.Add('TB_CONFIG.BAK');
    BackupFileList.Add('TB_DEVICECARDNO.BAK');
    BackupFileList.Add('TB_DEVICECARDNO_PROMISE.BAK');
    BackupFileList.Add('TB_DEVICESCHEDULE.BAK');
    BackupFileList.Add('TB_DOOR.BAK');
    BackupFileList.Add('TB_EMPLOYEE.BAK');
    BackupFileList.Add('TB_FOOD.BAK');
    BackupFileList.Add('TB_FOODCODE.BAK');
    BackupFileList.Add('TB_FOODEVENT.BAK');
    BackupFileList.Add('TB_FOODGRADE.BAK');
    BackupFileList.Add('TB_GRADE.BAK');
    BackupFileList.Add('TB_GRADEPROGRAM.BAK');
    BackupFileList.Add('TB_HOLIDAY.BAK');
    BackupFileList.Add('TB_LOCATION.BAK');
    BackupFileList.Add('TB_MONTHAT.BAK');
    BackupFileList.Add('TB_POSI.BAK');
    BackupFileList.Add('TB_READER.BAK');
    BackupFileList.Add('TB_SENSOREVENT.BAK');
    BackupFileList.Add('TB_ZONEDEVICE.BAK');
    BackupFileList.Add('TB_ZONESCHEDULE.BAK');
    BackupFileList.Add('TB_ATEVENT.BAK');
    BackupFileList.Add('TB_ALARMEVENT.BAK');
    BackupFileList.Add('TB_ACCESSEVENT.BAK');

    FindFileSearchFinish(Sender);
    DBTYPE := 'PG';
    rg_targetDBType.ItemIndex := 1;
    btn_DBRecovery.Enabled := True;
    BackupFileLoad;
  end;

end;


procedure TfmMain.FindFileFolderChange(Sender: TObject;
  const Folder: String; var IgnoreFolder: TFolderIgnore);
begin
  if not FindFile.Threaded then
    Application.ProcessMessages;
end;

procedure TfmMain.BackupFileLoad;
var
  i : integer;
  ConfigList : TStringList;
  stTemp : string;
  nIndex : integer;
begin
  if Not FileExists(ed_BackupDir.Text + '\TB_CONFIG.BAK') then Exit;
  ConfigList := TStringList.Create;
  Try
    ConfigList.LoadFromFile(ed_BackupDir.Text + '\TB_CONFIG.BAK');
    for i := 0 to ConfigList.Count - 1 do
    begin
      stTemp := ConfigList.Strings[i];
      nIndex := Pos('TABLE_VER',stTemp);
      if nIndex > 0 then
      begin
        delete(stTemp,1,nIndex - 1);
        delete(stTemp,1,length('TABLE_VER'));
        stTemp := Trim(stTemp);
        stTemp := copy(stTemp,1,3);
        stTemp := Trim(stTemp);
        L_nBackupTableVer := strtoint(stTemp);
      end;
    end;
  Finally
    ConfigList.Free;
  End;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  BackupFileList := TStringList.Create;
  BackupFileList.Clear;

  L_bStop := False;
  L_nBackupTableVer := -1;
  GROUPCODE := '1234567890';

  ExeFolder := ExtractFileDir(Application.ExeName);
end;

procedure TfmMain.FindFileFileMatch(Sender: TObject;
  const FileInfo: TFileDetails);
begin
  BackupFileList.Add(FileInfo.name);
end;

procedure TfmMain.FindFileSearchFinish(Sender: TObject);
var
  i : integer;

begin

  cmb_FileList.Items.Clear;
  cmb_FileList.Items.Add('전체');
  cmb_FileList.ItemIndex := 0;
  for i := 0 to BackupFileList.Count - 1 do
  begin
    cmb_FileList.Items.Add(BackupFileList.Strings[i]);
  end;

end;

function TfmMain.FileDBRestor(aImportFileName: string): Boolean;
var
   targetName: string;
   i,idx:      Integer;
   txtFile:    TextFile;
   fldStr:     String;
   ValStr:     String;
   delStr:     String;
   v:          String;
   QryList:    TStringList;
   q:          String;
   stSql : string;
   nTemp : integer;
   nIgnore : integer;
begin
  result := False;
  if Not FileExists(aImportFileName) then Exit;
  targetName := ExtractFileName(aImportFileName);
  targetName := ChangeFileExt(targetName,'');
  if UpperCase(targetName) = 'TB_ZIPCODE' then
  begin
    ga_Table.Progress := ga_Table.MaxValue;
    Ga_Tot.Progress := Ga_Tot.Progress + 1;
    result := True;
    Exit;
  end;
//  targetName := copy(targetName,9,Length(targetName) - 8);
  lbl_Table.Caption := '[' + targetName + '] 테이블 복구중...';
  Screen.Cursor              := crSQLWait;

  if UpperCase(targetName) = 'TB_EMPHIS' then
  begin
    ga_Table.Progress := ga_Table.MaxValue;
    Ga_Tot.Progress := Ga_Tot.Progress + 1;
    result := True; //TB_EMPHIS 테이블은 복구 하지 말자. Serial 부분 때문에 문제 발생함
    Exit;
  end;
  DeleteTable(targetName);
  if rg_targetDBType.ItemIndex = 0 then
  begin
    Try

      q:= '''';
      fldStr     := '';
      ValStr     := '';
      QryList    := TstringList.Create;
      QryList.Clear;

      TblImport.Close;
      TblImport.LoadFromFile(aImportFileName);
      if TblImport.IsEmpty() then begin
        ga_Table.Progress := ga_Table.MaxValue;
        Ga_Tot.Progress := Ga_Tot.Progress + 1;
        result := True;
        Exit;
      end;
      ga_Table.MaxValue := TblImport.RecordCount;
      ga_Table.Progress := 0;

      delStr:='';
      nIgnore := -1;
      for i := 0 to (TblImport.FieldCount - 1)  do begin
        if L_bStop then Exit;
        if UpperCase(targetName) = 'TB_EMPHIS' then
        begin
          if i = 0 then continue; //TB_EMPHIS 의 첫번째 필드는 identity
        end;
        if UpperCase(TblImport.Fields[i].FieldName) = 'EM_IMAGE' then
        begin
          nIgnore := i;
          continue;
        end;
        if UpperCase(TblImport.Fields[i].FieldName) = 'LO_CADIMAGE' then
        begin
          nIgnore := i;
          continue;
        end;
         fldStr := fldStr + delStr+ '['+TblImport.Fields[i].FieldName+']';
         delStr :=',';
      end; // for
      //QryList.Append('TRUNCATE TABLE ['+targetName+']');
      QryList.Append('INSERT INTO ['+targetName+']');
      fldStr := '('+fldStr+')';
      QryList.Append(fldStr);
      QryList.Append('VALUES');
      //    MainForm.LogMessage(targetName+' - Records:'+IntToStr(QryMain.RecordCount),True);
      delstr := '';
      TblImport.First();
      WHILE (NOT(TblImport.Eof)) do begin
        if L_bStop then Exit;
         Application.ProcessMessages;
         For i := 0 to (TblImport.FieldCount - 1) do begin
          if L_bStop then Exit;
          if UpperCase(targetName) = 'TB_EMPHIS' then
          begin
            if i = 0 then continue; //TB_EMPHIS 의 첫번째 필드는 identity
          end;
          if i = nIgnore then continue;
          
            if TblImport.Fields[i].IsNull then begin
               v      := '';
               ValStr := ValStr+delStr+'NULL'; // NO quotes
            end else begin
               v      := TblImport.Fields[i].AsString;
               idx := POS('''',v);
               if idx > 0 then begin
                  Insert(q,v,idx);
               end;
      //             StringReplace(v,,'',[rfReplaceAll]);  // get rid of single quotes in query
               ValStr := ValStr+delStr+''''+v+''''; // quote it
            end;
            delStr := ',';
         end; //for field values
         ValStr   := '('+ ValStr +')';
         QryList.Append(ValStr);
         //QryInsert.SQL.Clear;
         qryInsert.SQL := QryList;
         stSql := '';
         for nTemp := 0 to QryList.count - 1 do
         begin
          stSql := stSql + ' ' + QryList.Strings[nTemp];
         end;
         Try
          QryInsert.ExecSQL;                         //   <-------------- very slow for 100K+ records
         Except
          ON E: Exception do
          begin
           memo1.Lines.Add('Error('+ E.Message + ')' + stSql);
           ValStr   := '';
           delstr   := '';
           QryList.Delete(QryList.Count - 1);
           ga_Table.Progress := ga_Table.Progress +  1;
           TblImport.Next();
           continue;
          end;
          //무시
         End;
         //memo1.Lines.Add(stSql);
         ValStr   := '';
         delstr   := '';
         QryList.Delete(QryList.Count - 1);
         ga_Table.Progress := ga_Table.Progress +  1;
         TblImport.Next();
      end;
    Finally
      Screen.Cursor                    := crDefault;
      QryList.Free;
    End;
  end else 
  begin
  //  DeleteRestoreTable(targetName);
    stSql := 'copy ' + targetName + ' From ''' + stringReplace(aImportFileName,'\','\\',[rfReplaceAll]) + '''';
    with TblImport do
    begin
      Close;
      //Sql.Clear;
      Sql.text := stSql;
      Try
        ExecSql;
      Except
        //
      End;
    end;
  end;
  Screen.Cursor                    := crDefault;
  Ga_Tot.Progress := Ga_Tot.Progress + 1;
  result := True;

end;

procedure TfmMain.btn_DBRecoveryClick(Sender: TObject);
var
  i : integer;
  nCurrentVersion : integer;
begin
  if L_nBackupTableVer = -1 then
  begin
    showmessage('복구 파일은 PostgreSql용 백업 파일만 지원 됩니다.');
    Exit;
  end;
  if Not targetAdoConnect then
  begin
    showmessage('타겟데이터베이스 접속환경을 확인하세요.');
    Exit;
  end;
  nCurrentVersion := GetCurrentTableVersion;
  if nCurrentVersion > L_nBackupTableVer then
  begin
    showmessage('현재 테이블 버젼이 백업 테이블 버젼 보다 상위 버젼입니다. 복구 기능이 제공되지 않습니다.');
    Exit;
  end;
  TableVersionSync(nCurrentVersion,L_nBackupTableVer);
  if Application.MessageBox(PChar('데이터 복구시 현재 데이터는 모두 사라집니다.복구를 진행하시겠습니까?'),PChar('경고'),MB_YESNO) = IDNO then Exit;
  L_bStop := False;

  btn_DBRecovery.Enabled := False;
  btn_Stop.Enabled := True;

  if cmb_FileList.ItemIndex = 0 then
  begin
    Ga_Tot.MaxValue := BackupFileList.Count;
    Ga_Tot.Progress := 0;
    for i := 0 to BackupFileList.Count - 1 do
    begin
      if Not L_bStop then
      begin
        if Not FileDBRestor(ed_BackupDir.Text + '\' + BackupFileList.Strings[i]) then
        begin
          Memo1.Lines.Add(BackupFileList.Strings[i] + ' 복구 실패');
          //showmessage(BackupFileList.Strings[i] + ' 복구 실패');
          continue;
        end;
      end;
    end;
  end else
  begin
    Ga_Tot.MaxValue := 1;
    Ga_Tot.Progress := 0;
    FileDBRestor(ed_BackupDir.Text + '\' + cmb_FileList.Text);
  end;

  btn_DBRecovery.Enabled := True;
  btn_Stop.Enabled := False;

end;

procedure TfmMain.btn_StopClick(Sender: TObject);
begin
  L_bStop := True;
end;

procedure TfmMain.SetDBType(const Value: string);
begin
  FDBTYPE := UpperCase(Value);
  rg_targetDBType.ItemIndex := -1;
  btn_DBRecovery.Enabled := False;
  if FDBTYPE = 'PG' then
  begin
    rg_targetDBType.ItemIndex := 1;
    btn_DBRecovery.Enabled := True;
  end else if FDBTYPE = 'MSSQL' then
  begin
    rg_targetDBType.ItemIndex := 0;
    btn_DBRecovery.Enabled := True;
  end;

  rg_targetDBType.Enabled := False;
end;

function TfmMain.CreateTable(aTableName: string): Boolean;
var
  CreateTableList : TStringList;
  stFileName : string;
  i,j : integer;
  stSql : string;
  nIndex : integer;
  stTemp : string;
begin
  result := False;
  Try
    CreateTableList := TStringList.Create;
    CreateTableList.Clear;

    stFileName := ed_BackupDir.Text + '\' + aTableName + '.csql';

    if Not FileExists(stFileName) then
    begin
      showmessage(stFileName + ' 파일이 존재하지 않습니다.');
      Exit;
    end;

    CreateTableList.LoadFromFile(stFileName);
    stSql := '';

    for i:=0 to CreateTableList.Count - 1 do
    begin
      Application.ProcessMessages;
      if Pos(';',CreateTableList.Strings[i]) > 0 then
      begin
        stSql := stSql + ' ' + CreateTableList.Strings[i];

        stSql := StringReplace(stSql,'seq INTEGER NOT NULL  DEFAULT nextval(''tb_emphis_seq_seq''::regclass)','seq serial NOT NULL',[rfReplaceAll]);
        stSql := StringReplace(stSql,'IDENTITY(1,1)','IDENTITY',[rfReplaceAll]);
        nIndex := 1;
        while nIndex > 0 do
        begin
          nIndex := Pos('IMAGE(',UpperCase(stSql));
          if nIndex > 0 then
          begin
            stTemp := copy(stSql,1,nIndex - 1) + ' ';
            delete(stSql,1,nIndex);
            nIndex := Pos(')',stSql);
            if nIndex > 0 then Delete(stSql,1,nIndex);
            stTemp := stTemp + 'image ' + stSql;
            stSql := stTemp;
          end;
        end;

        with targetADOQuery do
        begin
          Close;
          Sql.Clear;
          Sql.Text := stSql;
          Try
            ExecSql;
          Except
            stSql := '';
            Exit;
          End;
          stSql := '';
          continue;
        end;
      end else
      begin
        stSql := stSql + ' ' + CreateTableList.Strings[i];
      end;
    end;

    result := True;
  Finally
    CreateTableList.Free;
  End;

end;

function TfmMain.DropTable(aTableName: string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Drop Table ' + aTableName;

  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
   

end;

function TfmMain.GetCurrentTableVersion: integer;
var
  stSql : string;
  nVersion : integer;
begin
  result := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''TABLE_VER'' ';
  with targetSearchADOQuery do
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
    Try
      nVersion := strtoint(FindField('CO_CONFIGVALUE').AsString);
    Except
      Exit;
    End;
    result := nVersion;
  end;
end;

procedure TfmMain.TableVersionSync(aCurrentVersion,
  aBackupTableVer: integer);
begin
  if (aCurrentVersion < 1) and (aBackupTableVer >= 1)  then Table1VersionMake;
  if (aCurrentVersion < 2) and (aBackupTableVer >= 2)  then Table2VersionMake;
  if (aCurrentVersion < 3) and (aBackupTableVer >= 3)  then Table3VersionMake;
  if (aCurrentVersion < 4) and (aBackupTableVer >= 4)  then Table4VersionMake;
  if (aCurrentVersion < 5) and (aBackupTableVer >= 5)  then Table5VersionMake;
  if (aCurrentVersion < 6) and (aBackupTableVer >= 6)  then Table6VersionMake;
  if (aCurrentVersion < 7) and (aBackupTableVer >= 7)  then Table7VersionMake;
  if (aCurrentVersion < 8) and (aBackupTableVer >= 8)  then Table8VersionMake;
  if (aCurrentVersion < 9) and (aBackupTableVer >= 9)  then Table9VersionMake;
  if (aCurrentVersion < 10) and (aBackupTableVer >= 10)  then Table10VersionMake;
  if (aCurrentVersion < 11) and (aBackupTableVer >= 11)  then Table11VersionMake;
  if (aCurrentVersion < 12) and (aBackupTableVer >= 12)  then Table12VersionMake;
  if (aCurrentVersion < 13) and (aBackupTableVer >= 13)  then Table13VersionMake;
  if (aCurrentVersion < 14) and (aBackupTableVer >= 14)  then Table14VersionMake;
  if (aCurrentVersion < 15) and (aBackupTableVer >= 15)  then Table15VersionMake;
  if (aCurrentVersion < 16) and (aBackupTableVer >= 16)  then Table16VersionMake;
  if (aCurrentVersion < 17) and (aBackupTableVer >= 17)  then Table17VersionMake;
  if (aCurrentVersion < 18) and (aBackupTableVer >= 18)  then Table18VersionMake;
  if (aCurrentVersion < 19) and (aBackupTableVer >= 19)  then Table19VersionMake;
  if (aCurrentVersion < 20) and (aBackupTableVer >= 20)  then Table20VersionMake;
  if (aCurrentVersion < 21) and (aBackupTableVer >= 21)  then Table21VersionMake;
  if (aCurrentVersion < 22) and (aBackupTableVer >= 22)  then Table22VersionMake;
  if (aCurrentVersion < 23) and (aBackupTableVer >= 23)  then Table23VersionMake;
  if (aCurrentVersion < 24) and (aBackupTableVer >= 24)  then Table24VersionMake;
  if (aCurrentVersion < 25) and (aBackupTableVer >= 25)  then Table25VersionMake;
  if (aCurrentVersion < 26) and (aBackupTableVer >= 26)  then Table26VersionMake;
  if (aCurrentVersion < 27) and (aBackupTableVer >= 27)  then Table27VersionMake;
  if (aCurrentVersion < 28) and (aBackupTableVer >= 28)  then Table28VersionMake;
  if (aCurrentVersion < 29) and (aBackupTableVer >= 29)  then Table29VersionMake;
  if (aCurrentVersion < 30) and (aBackupTableVer >= 30)  then Table30VersionMake;
  if (aCurrentVersion < 31) and (aBackupTableVer >= 31)  then Table31VersionMake;
  if (aCurrentVersion < 32) and (aBackupTableVer >= 32)  then Table32VersionMake;
  if (aCurrentVersion < 33) and (aBackupTableVer >= 33)  then Table33VersionMake;
  if (aCurrentVersion < 34) and (aBackupTableVer >= 34)  then Table34VersionMake;
  if (aCurrentVersion < 35) and (aBackupTableVer >= 35)  then Table35VersionMake;
  if (aCurrentVersion < 36) and (aBackupTableVer >= 36)  then Table36VersionMake;
  if (aCurrentVersion < 37) and (aBackupTableVer >= 37)  then Table37VersionMake;
  if (aCurrentVersion < 38) and (aBackupTableVer >= 38)  then Table38VersionMake;
  if (aCurrentVersion < 39) and (aBackupTableVer >= 39)  then Table39VersionMake;
  if (aCurrentVersion < 40) and (aBackupTableVer >= 40)  then Table40VersionMake;
  if (aCurrentVersion < 41) and (aBackupTableVer >= 41)  then Table41VersionMake;
  if (aCurrentVersion < 42) and (aBackupTableVer >= 42)  then Table42VersionMake;
  if (aCurrentVersion < 43) and (aBackupTableVer >= 43)  then Table43VersionMake;
  if (aCurrentVersion < 44) and (aBackupTableVer >= 44)  then Table44VersionMake;
  if (aCurrentVersion < 45) and (aBackupTableVer >= 45)  then Table45VersionMake;
  if (aCurrentVersion < 46) and (aBackupTableVer >= 46)  then Table46VersionMake;
  if (aCurrentVersion < 47) and (aBackupTableVer >= 47)  then Table47VersionMake;
  if (aCurrentVersion < 48) and (aBackupTableVer >= 48)  then Table48VersionMake;
  if (aCurrentVersion < 49) and (aBackupTableVer >= 49)  then Table49VersionMake;
  if (aCurrentVersion < 50) and (aBackupTableVer >= 50)  then Table50VersionMake;
  if (aCurrentVersion < 51) and (aBackupTableVer >= 51)  then Table51VersionMake;
  if (aCurrentVersion < 52) and (aBackupTableVer >= 52)  then Table52VersionMake;
  if (aCurrentVersion < 53) and (aBackupTableVer >= 53)  then Table53VersionMake;
  if (aCurrentVersion < 54) and (aBackupTableVer >= 54)  then Table54VersionMake;
  if (aCurrentVersion < 55) and (aBackupTableVer >= 55)  then Table55VersionMake;
  if (aCurrentVersion < 56) and (aBackupTableVer >= 56)  then Table56VersionMake;
  if (aCurrentVersion < 57) and (aBackupTableVer >= 57)  then Table57VersionMake;
  if (aCurrentVersion < 58) and (aBackupTableVer >= 58)  then Table58VersionMake;
  if (aCurrentVersion < 59) and (aBackupTableVer >= 59)  then Table59VersionMake;
  if (aCurrentVersion < 60) and (aBackupTableVer >= 60)  then Table60VersionMake;
  if (aCurrentVersion < 61) and (aBackupTableVer >= 61)  then Table61VersionMake;
  if (aCurrentVersion < 62) and (aBackupTableVer >= 62)  then Table62VersionMake;
  if (aCurrentVersion < 63) and (aBackupTableVer >= 63)  then Table63VersionMake;
  if (aCurrentVersion < 64) and (aBackupTableVer >= 64)  then Table64VersionMake;
  if (aCurrentVersion < 65) and (aBackupTableVer >= 65)  then Table65VersionMake;
  if (aCurrentVersion < 66) and (aBackupTableVer >= 66)  then Table66VersionMake;
  if (aCurrentVersion < 67) and (aBackupTableVer >= 67)  then Table67VersionMake;
  if (aCurrentVersion < 68) and (aBackupTableVer >= 68)  then Table68VersionMake;
  if (aCurrentVersion < 69) and (aBackupTableVer >= 69)  then Table69VersionMake;
  if (aCurrentVersion < 70) and (aBackupTableVer >= 70)  then Table70VersionMake;
  if (aCurrentVersion < 71) and (aBackupTableVer >= 71)  then Table71VersionMake;
  if (aCurrentVersion < 72) and (aBackupTableVer >= 72)  then Table72VersionMake;
  if (aCurrentVersion < 73) and (aBackupTableVer >= 73)  then Table73VersionMake;
  if (aCurrentVersion < 74) and (aBackupTableVer >= 74)  then Table74VersionMake;
  if (aCurrentVersion < 75) and (aBackupTableVer >= 75)  then Table75VersionMake;
  if (aCurrentVersion < 76) and (aBackupTableVer >= 76)  then Table76VersionMake;
  if (aCurrentVersion < 77) and (aBackupTableVer >= 77)  then Table77VersionMake;
  if (aCurrentVersion < 78) and (aBackupTableVer >= 78)  then Table78VersionMake;
  if (aCurrentVersion < 79) and (aBackupTableVer >= 79)  then Table79VersionMake;
  if (aCurrentVersion < 80) and (aBackupTableVer >= 80)  then Table80VersionMake;
  if (aCurrentVersion < 81) and (aBackupTableVer >= 81)  then Table81VersionMake;
  if (aCurrentVersion < 82) and (aBackupTableVer >= 82)  then Table82VersionMake;
  if (aCurrentVersion < 83) and (aBackupTableVer >= 83)  then Table83VersionMake;
  if (aCurrentVersion < 84) and (aBackupTableVer >= 84)  then Table84VersionMake;
  if (aCurrentVersion < 85) and (aBackupTableVer >= 85)  then Table85VersionMake;
  if (aCurrentVersion < 86) and (aBackupTableVer >= 86)  then Table86VersionMake;
  if (aCurrentVersion < 87) and (aBackupTableVer >= 87)  then Table87VersionMake;
  if (aCurrentVersion < 88) and (aBackupTableVer >= 88)  then Table88VersionMake;
  if (aCurrentVersion < 89) and (aBackupTableVer >= 89)  then Table89VersionMake;
  if (aCurrentVersion < 90) and (aBackupTableVer >= 90)  then Table90VersionMake;
  if (aCurrentVersion < 91) and (aBackupTableVer >= 91)  then Table91VersionMake;
  if (aCurrentVersion < 92) and (aBackupTableVer >= 92)  then Table92VersionMake;
  if (aCurrentVersion < 93) and (aBackupTableVer >= 93)  then Table93VersionMake;
  if (aCurrentVersion < 94) and (aBackupTableVer >= 94)  then Table94VersionMake;
  if (aCurrentVersion < 95) and (aBackupTableVer >= 95)  then Table95VersionMake;
  if (aCurrentVersion < 96) and (aBackupTableVer >= 96)  then Table96VersionMake;
  if (aCurrentVersion < 97) and (aBackupTableVer >= 97)  then Table97VersionMake;
  if (aCurrentVersion < 98) and (aBackupTableVer >= 98)  then Table98VersionMake;
  if (aCurrentVersion < 99) and (aBackupTableVer >= 99)  then Table99VersionMake;
  if (aCurrentVersion < 100) and (aBackupTableVer >= 100)  then Table100VersionMake;
  if (aCurrentVersion < 101) and (aBackupTableVer >= 101)  then Table101VersionMake;
  if (aCurrentVersion < 102) and (aBackupTableVer >= 102)  then Table102VersionMake;
  if (aCurrentVersion < 103) and (aBackupTableVer >= 103)  then Table103VersionMake;
  if (aCurrentVersion < 104) and (aBackupTableVer >= 104)  then Table104VersionMake;
  if (aCurrentVersion < 105) and (aBackupTableVer >= 105)  then Table105VersionMake;
  if (aCurrentVersion < 106) and (aBackupTableVer >= 106)  then Table106VersionMake;
  if (aCurrentVersion < 107) and (aBackupTableVer >= 107)  then Table107VersionMake;
  if (aCurrentVersion < 108) and (aBackupTableVer >= 108)  then Table108VersionMake;
  if (aCurrentVersion < 109) and (aBackupTableVer >= 109)  then Table109VersionMake;
  if (aCurrentVersion < 110) and (aBackupTableVer >= 110)  then Table110VersionMake;
  if (aCurrentVersion < 111) and (aBackupTableVer >= 111)  then Table111VersionMake;
  if (aCurrentVersion < 112) and (aBackupTableVer >= 112)  then Table112VersionMake;
  if (aCurrentVersion < 113) and (aBackupTableVer >= 113)  then Table113VersionMake;
  if (aCurrentVersion < 114) and (aBackupTableVer >= 114)  then Table114VersionMake;
  if (aCurrentVersion < 115) and (aBackupTableVer >= 115)  then Table115VersionMake;
  if (aCurrentVersion < 116) and (aBackupTableVer >= 116)  then Table116VersionMake;
  if (aCurrentVersion < 117) and (aBackupTableVer >= 117)  then Table117VersionMake;
  if (aCurrentVersion < 118) and (aBackupTableVer >= 118)  then Table118VersionMake;
  if (aCurrentVersion < 119) and (aBackupTableVer >= 119)  then Table119VersionMake;
  if (aCurrentVersion < 120) and (aBackupTableVer >= 120)  then Table120VersionMake;
  if (aCurrentVersion < 121) and (aBackupTableVer >= 121)  then Table121VersionMake;
  if (aCurrentVersion < 122) and (aBackupTableVer >= 122)  then Table122VersionMake;
  if (aCurrentVersion < 123) and (aBackupTableVer >= 123)  then Table123VersionMake;
  if (aCurrentVersion < 124) and (aBackupTableVer >= 124)  then Table124VersionMake;
  if (aCurrentVersion < 125) and (aBackupTableVer >= 125)  then Table125VersionMake;
  if (aCurrentVersion < 126) and (aBackupTableVer >= 126)  then Table126VersionMake;
  if (aCurrentVersion < 127) and (aBackupTableVer >= 127)  then Table127VersionMake;
  if (aCurrentVersion < 128) and (aBackupTableVer >= 128)  then Table128VersionMake;
  if (aCurrentVersion < 129) and (aBackupTableVer >= 129)  then Table129VersionMake;
  if (aCurrentVersion < 130) and (aBackupTableVer >= 130)  then Table130VersionMake;
  if (aCurrentVersion < 131) and (aBackupTableVer >= 131)  then Table131VersionMake;
  if (aCurrentVersion < 132) and (aBackupTableVer >= 132)  then Table132VersionMake;
  if (aCurrentVersion < 133) and (aBackupTableVer >= 133)  then Table133VersionMake;
  if (aCurrentVersion < 134) and (aBackupTableVer >= 134)  then Table134VersionMake;
  if (aCurrentVersion < 135) and (aBackupTableVer >= 135)  then Table135VersionMake;
  if (aCurrentVersion < 136) and (aBackupTableVer >= 136)  then Table136VersionMake;
  if (aCurrentVersion < 137) and (aBackupTableVer >= 137)  then Table137VersionMake;
  if (aCurrentVersion < 138) and (aBackupTableVer >= 138)  then Table138VersionMake;
  if (aCurrentVersion < 139) and (aBackupTableVer >= 139)  then Table139VersionMake;
  if (aCurrentVersion < 140) and (aBackupTableVer >= 140)  then Table140VersionMake;
  if (aCurrentVersion < 141) and (aBackupTableVer >= 141)  then Table141VersionMake;
  if (aCurrentVersion < 142) and (aBackupTableVer >= 142)  then Table142VersionMake;
  if (aCurrentVersion < 143) and (aBackupTableVer >= 143)  then Table143VersionMake;
  if (aCurrentVersion < 144) and (aBackupTableVer >= 144)  then Table144VersionMake;
//  if (aCurrentVersion < 145) and (aBackupTableVer >= 145)  then Table145VersionMake;
  if (aCurrentVersion < 146) and (aBackupTableVer >= 146)  then Table146VersionMake;
  if (aCurrentVersion < 147) and (aBackupTableVer >= 147)  then Table147VersionMake;
  if (aCurrentVersion < 148) and (aBackupTableVer >= 148)  then Table148VersionMake;
  if (aCurrentVersion < 149) and (aBackupTableVer >= 149)  then Table149VersionMake;
  if (aCurrentVersion < 150) and (aBackupTableVer >= 150)  then Table150VersionMake;
  if (aCurrentVersion < 151) and (aBackupTableVer >= 151)  then Table151VersionMake;
  if (aCurrentVersion < 152) and (aBackupTableVer >= 152)  then Table152VersionMake;
  if (aCurrentVersion < 153) and (aBackupTableVer >= 153)  then Table153VersionMake;

end;

function TfmMain.Table10VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_DEVICECARDNOACKINDEX
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_DEVICECARDNOACKINDEX
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_DEVICECARDNOACKINDEX
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_DEVICECARDNOACKINDEX
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISCARDNO
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISCARDNO
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISCARDNO
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISCARDNO
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISCARDTYPE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISCARDTYPE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISCARDTYPE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISCARDTYPE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISSENDSTATUS2
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISSENDSTATUS2
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISSENDSTATUS2
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISSENDSTATUS2
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','10');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table11VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_WORKLOG
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_WORKLOG
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_WORKLOG
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_WORKLOG
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','11');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table12VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := ' update TB_CONFIG set CO_CONFIGVALUE = ''DOOR'' ';
  stSql := stSql + ' Where CO_CONFIGGROUP = ''MOSTYPE'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''FOODDEVICE'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','12');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table13VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := 'ALTER TABLE TB_CARD ADD POSITIONNUM INTEGER ';
  if DBType <> 'FB' then stSql := stSql + ' NULL ';
  DataModule1.ProcessExecSQL(stSql);

  PositionNumberValueSetting;

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','13');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table14VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := commonSql.InsertIntoTB_PROGRAMID('ATC04r','ATREPORT','실시간근태보고서','Y','23','ATTEND','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','14');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table15VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_READERInOutCount
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_READERInOutCount
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_READERInOutCount
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_READERInOutCount
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_INOUTCOUNT
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_INOUTCOUNT
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_INOUTCOUNT
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_INOUTCOUNT
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_INOUTGROUP
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_INOUTGROUP
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_INOUTGROUP
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_INOUTGROUP
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('MOSTYPE','INOUTCOUNT','N');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','15');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table16VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','DEVICESVER','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','DTOSPORT1','3000');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','DTOSPORT2','3001');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','DTOSPORT3','3002');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','16');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table17VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_FTPLIST
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_FTPLIST
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_FTPLIST
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_FTPLIST
  else exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','FTPPORT','3100');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','17');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table18VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMSTATUSCODEALARMSOUND
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMSTATUSCODEALARMSOUND
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMSTATUSCODEALARMSOUND
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMSTATUSCODEALARMSOUND
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','18');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table19VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','SPECIALCD','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','19');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table1VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','TABLE_VER','1');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table20VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_KTCARDISSUE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_KTCARDISSUE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_KTCARDISSUE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_KTCARDISSUE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISINSERTTIME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISINSERTTIME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISINSERTTIME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISINSERTTIME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','20');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table21VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then Exit
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateView_CARD
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateView_CARD
  else if DBTYPE = 'FB' then stSql := FireBird.CreateView_CARD
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','21');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table22VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := commonSql.InsertIntoTB_PROGRAMID('MOB06i','MOMANAGE','KT카드발급','Y','11','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','22');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table23VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_RELAYGUBUN
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_RELAYGUBUN
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_RELAYGUBUN
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_RELAYGUBUN
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEERelayGubun
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEERelayGubun
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEERelayGubun
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEERelayGubun
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_EMPLOYEE set RG_CODE = ''001'' ';
  stSql := stSql + ' where RG_CODE IS NULL ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','23');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table24VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_FORMNAME('040','직원구분','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('041','직원코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('042','직원코드명칭','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','24');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table25VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_RELAYGUBUN('001','정직원');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_RELAYGUBUN('002','외부인');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','25');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table26VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_COMPANYUPDATECHECK
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_COMPANYUPDATECHECK
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_COMPANYUPDATECHECK
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_COMPANYUPDATECHECK
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_POSIUPDATECHECK
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_POSIUPDATECHECK
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_POSIUPDATECHECK
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_POSIUPDATECHECK
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','26');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table27VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINBuildingGrade
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINBuildingGrade
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINBuildingGrade
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINBuildingGrade
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINDongCode
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINDongCode
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINDongCode
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINDongCode
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINFloorCode
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINFloorCode
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINFloorCode
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINFloorCode
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINAreaCode
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINAreaCode
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINAreaCode
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINAreaCode
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDaemonGubun
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDaemonGubun
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEDaemonGubun
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDaemonGubun
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.updateTB_ACCESSDEVICEDaemonGubunAll('1');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_FORMNAME('901','빌딩코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('902','빌딩명칭','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('903','빌딩권한','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('911','층코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('912','층명칭','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('913','층권한','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('921','구역코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('922','구역명칭','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('923','구역권한','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('933','출입문권한','Y');
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','27');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table28VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := CommonSql.InsertIntoTB_PROGRAMGROUP('MODEVICE','관제-기기관리','Y','MONITORING');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOF00','MODEVICE','기기관리','D','50','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOF01i','MODEVICE','위치정보관리','Y','51','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOF02i','MODEVICE','컨트롤러관리','Y','52','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOF03i','MODEVICE','출입문관리','Y','53','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOF04i','MODEVICE','방범구역관리','Y','54','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','28');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table29VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','FTPUSE','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','MULTI','0');
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_DAEMONMULTI
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_DAEMONMULTI
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_DAEMONMULTI
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_DAEMONMULTI
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','29');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table2VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := 'select * from TB_MONTHAT ';
  with targetSearchADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if FieldCount < 42 then
    begin
      stSql := ' ALTER TABLE TB_MONTHAT ADD MO_NIGHTTIME int ';
      if DBTYPE <> 'FB' then stSql := stSql + ' NULL ';
      DataModule1.ProcessExecSQL(stSql);
      stSql := ' ALTER TABLE TB_MONTHAT ADD MO_HOLIDAYTIME int ';
      if DBTYPE <> 'FB' then stSql := stSql + ' NULL ';
      DataModule1.ProcessExecSQL(stSql);
    end;
  end;
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','2');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table30VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_CARDDoorGrade
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_CARDDoorGrade
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_CARDDoorGrade
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_CARDDoorGrade
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_CARD set CA_DOORGRADE = ''Y'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','30');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table31VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOF05i','MODEVICE','출입문스케줄관리','Y','55','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','31');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table32VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_DOORGUBUN
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_DOORGUBUN
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_DOORGUBUN
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_DOORGUBUN
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORGUBUN
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORGUBUN
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORGUBUN
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORGUBUN
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertTB_DOORGUBUN('001','구분1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_DOORGUBUN('002','구분2');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','32');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table33VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOE04r','MOREPORT','출입통계보고서','Y','44','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','33');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table34VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','KHUADDDAY','','경희대입력연동날짜');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','KHUDELDAY','','경희대삭제연동날짜');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','34');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table35VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','MAXPROCESS','10');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','35');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table36VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSNO','4');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','36');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table37VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISEMNAME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISEMNAME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISEMNAME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISEMNAME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISHANDPHONE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISHANDPHONE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISHANDPHONE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISHANDPHONE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISCOMPANYNAME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISCOMPANYNAME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISCOMPANYNAME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISCOMPANYNAME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISJIJUMNAME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISJIJUMNAME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISJIJUMNAME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISJIJUMNAME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISDEPARTNAME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISDEPARTNAME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISDEPARTNAME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISDEPARTNAME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISPOSINAME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISPOSINAME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISPOSINAME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISPOSINAME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','37');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table38VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','CARDADDDAY','','경희대카드연동날짜');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','CARDDELDAY','','경희대카드삭제연동날짜');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','38');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table39VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_PERMITCODE(';
  stSql := stSql + 'PE_PERMITCODE,';
  stSql := stSql + 'PE_PERMITNAME)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''F'',';
  stSql := stSql + '''유효기간만료'')';
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','39');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table3VersionMake: Boolean;
var
  stSql : string;
  stPath : string;
begin
  stPath := 'C:\Program Files\ACServer\ACCESS.mdb';
  if DBTYPE = 'PG' then stPath := 'C:\\Program Files\\ACServer\\ACCESS.mdb';
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','fdmsUSE','FALSE');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','fdmsPath',stPath);
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','fdmsPW','fdmsamho');
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' ALTER TABLE TB_EMPLOYEE ADD FDMS_ID int ';
  if DBTYPE <> 'FB' then stSql := stSql + ' NULL ';
  DataModule1.ProcessExecSQL(stSql);
  if DBTYPE = 'MDB' then  stSql := ' ALTER TABLE TB_EMPLOYEE ADD FDMS_RELAY text(1) '
  else stSql := ' ALTER TABLE TB_EMPLOYEE ADD FDMS_RELAY varchar(1) ';
  if DBTYPE <> 'FB' then stSql := stSql + ' NULL ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' ALTER TABLE TB_DOOR ADD FDMS_ID int ';
  if DBTYPE <> 'FB' then stSql := stSql + ' NULL ';
  DataModule1.ProcessExecSQL(stSql);
  if DBTYPE = 'MDB' then  stSql := ' ALTER TABLE TB_DOOR ADD FDMS_RELAY text(1) '
  else stSql := ' ALTER TABLE TB_DOOR ADD FDMS_RELAY varchar(1) ';
  if DBTYPE <> 'FB' then stSql := stSql + ' NULL ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','3');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table40VersionMake: Boolean;
var
  stSql : string;
  stCardLen : string;
begin
  stCardLen := '24'; //성현지문카드길이

  if CheckPersonRelay = '3' then stCardLen := '32'; //경희대 성현지문카드길이 = 32자리

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSCARDLN',stCardLen,'성현지문카드길이');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','40');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table41VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := CommonSql.InsertIntoTB_CONFIG('CARD','CARDFIXED','FALSE','카드길이고정유무');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('CARD','FIXEDLEN','11','카드길이');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('CARD','FILLPOSI','0','채움문자위치 0:앞,1:뒤');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('CARD','FILLCHAR','0','채움문자');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','41');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table42VersionMake: Boolean;
var
  stSql : string;
  stCode1Name,stCode2Name : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_CARDTYPE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_CARDTYPE
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_CARDTYPE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_CARDTYPE
  else exit;
  DataModule1.ProcessExecSQL(stSql);

  stCode1Name := '일반카드';
  stCode2Name := '기타카드';
  if CheckSamyuk then  //삼육대인경우
  begin
    stCode1Name := '일반카드';
    stCode2Name := '모바일카드';
  end else if CheckFdms then  //지문연동인 경우
  begin
    stCode1Name := '지문연동카드';
    stCode2Name := '일반카드';
  end;
  
  stSql := 'Insert Into TB_CARDTYPE(CT_CODE,CT_NAME) ';
  stSql := stSql + ' Values( ''1'',''' + stCode1Name + ''') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_CARDTYPE(CT_CODE,CT_NAME) ';
  stSql := stSql + ' Values( ''2'',''' + stCode2Name + ''') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','42');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table43VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := 'Insert Into TB_CURRENTDAEMON(CU_STATECODE,CU_STATEVALUE) ';
  stSql := stSql + ' Values( ''FIREORIGIN'',''FALSE'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','43');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table44VersionMake: Boolean;
var
  stSql : string;
begin

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_HOLIDAYState
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_HOLIDAYState
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_HOLIDAYState
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_HOLIDAYState
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','44');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table45VersionMake: Boolean;
var
  stSql : string;
begin

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEHoSend
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEHoSend
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEHoSend
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEHoSend
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','45');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table46VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := 'Insert Into TB_CURRENTDAEMON(CU_STATECODE,CU_STATEVALUE) ';
  stSql := stSql + ' Values( ''SEND_HOYY'','''') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','46');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table47VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ALARMSTATUSCODE(';
  stSql := stSql + ' AL_ALARMSTATUSCODE,';
  stSql := stSql + ' AL_ALARMNAME,';
  stSql := stSql + ' AL_ALARMVIEW,';
  stSql := stSql + ' AL_ALARMGRADE,';
  stSql := stSql + ' AL_ALARMSOUND ) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''FI'',';
  stSql := stSql + '''FI 화재알람'',';
  stSql := stSql + '1,';
  stSql := stSql + '3,';
  stSql := stSql + '1) ';
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','47');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table48VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('R1','RESET(경계모드)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('R2','RESET(해제모드)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('A1','경계모드변경(카드)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('A2','경계모드변경(관제)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('A3','경계모드변경(연동)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('A4','경계모드변경(서버)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('C1','해제모드변경(카드)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('C2','해제모드변경(관제)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('C3','해제모드변경(연동)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('C4','해제모드변경(서버)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('R3','복구버튼','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('ZS','알람발생(쇼트)','1','3','1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('ZP','알람발생(단선)','1','3','1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('ZN','알람복구','1','0','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','48');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table49VersionMake: Boolean;
var
  stSql : string;
begin
  //뷰삭제
  stSql := 'DROP VIEW VI_CARDINFO ';
  DataModule1.ProcessExecSQL(stSql);
  //tb_employee 이름 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEEmNameChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_EMPLOYEEEmNameChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEEmNameChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEEmNameChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  {
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMSTATUSCODEPrimaryDelete
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ALARMSTATUSCODEPrimaryDelete
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMSTATUSCODEPrimaryDelete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMSTATUSCODEPrimaryDelete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);   }
  //알람상태코드 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMSTATUSCODECodeChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ALARMSTATUSCODECodeChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMSTATUSCODECodeChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMSTATUSCODECodeChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  //알람 이벤트 상태코드 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTCodeChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ALARMEVENTCodeChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTCodeChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTCodeChange
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);
  //알람 이벤트 oper 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTOperChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ALARMEVENTOperChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTOperChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTOperChange
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);
  //알람 이벤트 재정의 상태코드 생성
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTSTATECODE2Add
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ALARMEVENTSTATECODE2Add
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTSTATECODE2Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTSTATECODE2Add
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);
  //알람상태 그룹 테이블 생성
  if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_ALARMCODEGROUP
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_ALARMCODEGROUP
  else if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_ALARMCODEGROUP
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_ALARMCODEGROUP
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  //알람 모드변경 제외 그룹 테이블 생성
  if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_ALARMMODENOTCARD
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_ALARMMODENOTCARD
  else if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_ALARMMODENOTCARD
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_ALARMMODENOTCARD
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  //알람 모드변경 제외 데이터 인서트
  stSql := CommonSql.InsertIntoTB_ALARMMODENOTCARD('001','***RESET**');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMMODENOTCARD('002','.KTLinkUs.');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMMODENOTCARD('003','ForceRelay');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMMODENOTCARD('004','0000000000');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMMODENOTCARD('005','RecoveryOK');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('ET','기타','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','49');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table4VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_FormName
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_FormName
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_FormName
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_FormName
  else exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_FORMNAME('001','회사코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('002','회사명','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('011','지점코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('012','지점명','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('021','부서코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('022','부서명','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('031','직위코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('032','직위명','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('101','사번','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('102','이름','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('103','사내전화번호','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('104','입사일','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('105','퇴사일','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('106','사원','Y');
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','4');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table50VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','DAEMON_VER','0','데몬버젼');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','50');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table51VersionMake: Boolean;
var
  stSql : string;
begin
  //카드외의 상태코드 테이블
  if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_NOTCARDALARMCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_NOTCARDALARMCODE
  else if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_NOTCARDALARMCODE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_NOTCARDALARMCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('RESET','R1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('RESET','R2');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('RESET','WR');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('RESET','CR');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','A1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','A2');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','A3');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','A4');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','C1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','C2');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','C3');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','C4');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','ZS');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','ZP');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','ZN');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','E1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','F1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','FI');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','G1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','Q1');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','NF');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','NR');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('AC전원','AF');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('AC전원','AN');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Data','BF');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','CC');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','CO');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('밧데리','DF');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('밧데리','DL');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('밧데리','DR');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기타','ET');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('001','a','R1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('001','d','R2');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('002','a','A2');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('002','d','C2');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('003','a','A3');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('003','d','C3');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('004','a','A4');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('004','d','C4');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('005','a','R3');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('005','d','R3');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','51');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table52VersionMake: Boolean;
var
  stSql : string;
begin
  //카드발급테이블에 여기서 발급했는지 여부
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_KTCARDISSUEWriteAdd
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_KTCARDISSUEWriteAdd
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_KTCARDISSUEWriteAdd
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_KTCARDISSUEWriteAdd
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);

  //카드발급테이블에 발급일자
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_KTCARDISSUEWriteDateAdd
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_KTCARDISSUEWriteDateAdd
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_KTCARDISSUEWriteDateAdd
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_KTCARDISSUEWriteDateAdd
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);


  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTCOMPANYCODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTCOMPANYCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTCOMPANYCODE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTCOMPANYCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTEMCODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTEMCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTEMCODE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTEMCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTJIJUMCODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTJIJUMCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTJIJUMCODE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTJIJUMCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTDEPARTCODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTDEPARTCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTDEPARTCODE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTDEPARTCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTEMNAME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTEMNAME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTEMNAME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTEMNAME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','52');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table53VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','EMPLOYEE','0','0:사원별,1:카드별');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','53');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table54VersionMake: Boolean;
var
  stSql : string;
begin

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_MAPLOCATION
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_MAPLOCATION
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_MAPLOCATION
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_MAPLOCATION
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_MAPPOSITION
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_MAPPOSITION
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_MAPPOSITION
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_MAPPOSITION
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_MAPZONE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_MAPZONE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_MAPZONE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_MAPZONE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','54');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table55VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEUPDATE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEUPDATE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEUPDATE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEUPDATE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORUPDATE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORUPDATE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORUPDATE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORUPDATE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEUPDATE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEUPDATE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEUPDATE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEUPDATE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ZONEDEVICEUPDATE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ZONEDEVICEUPDATE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ZONEDEVICEUPDATE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ZONEDEVICEUPDATE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','55');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table56VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_FTPLISTRetryCount
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_FTPLISTRetryCount
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_FTPLISTRetryCount
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_FTPLISTRetryCount
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','56');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table57VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOOROPENMONI_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOOROPENMONI_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOOROPENMONI_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOOROPENMONI_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORSENDDOOR_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORSENDDOOR_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORSENDDOOR_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORSENDDOOR_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORALARMLONG_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORALARMLONG_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORALARMLONG_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORALARMLONG_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORDSOPEN_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORDSOPEN_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORDSOPEN_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORDSOPEN_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORREMOTEDOOR_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORREMOTEDOOR_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORREMOTEDOOR_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORREMOTEDOOR_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','57');
  DataModule1.ProcessExecSQL(stSql);


end;

function TfmMain.Table58VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','ATTYPE1','0'); //전사원 교대타입에 따른 출퇴근처리
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','58');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table59VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORControlTime_Change
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORControlTime_Change
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORControlTime_Change
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORControlTime_Change
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','59');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table5VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoAT_INCODE('101','정상출근','1','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_INCODE('102','외근후출근','1','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_INCODE('103','지각','2','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_INCODE('104','조기출근','4','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_INCODE('105','결근','3','N');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoAT_OUTCODE('101','정상퇴근','1','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_OUTCODE('102','외근후퇴근','1','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_OUTCODE('103','조퇴','2','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_OUTCODE('104','연장근무','3','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_OUTCODE('105','야간근무','4','N');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOE02r','MOREPORT','경보이력보고서','Y','42','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','5');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table60VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_FTPLIST set FL_RETRYCOUNT = 0 ';

  DataModule1.ProcessExecSQL(stSql);

  stSql := 'update TB_ACCESSDEVICE set SEND_ACK = ''Y'' ';

  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','60');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table61VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','cardServer','0','카드서버연동유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','PER_RELAY','0','사원정보연동유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','PER_SRELAY','0','보내는사원정보연동유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','SENT_RELAY','0','전문연동유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','CARDNOTYPE','0','카드번호Type(고정/가변)');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','CARDNUM','0','카드숫자인식Type');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','CAPOSINUM','0','카드위치사용유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','DUPCARD','0','1인당카드중복여부');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('FIRE','FIRERECUSE','1','화재복구사용유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('FIRE','FIREOPEN','0','화재감지시전체개방');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('FIRE','FIRESTATUS','FI','화재감지시상태값');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','ACEVENT','1','0.전체이력,1.카드이벤트만');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','CONTRLPORT','10001','제어포트');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','STATEPORT','10011','상태포트');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','EVENTPORT','10021','이벤트포트');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','MULTISOCK','0','멀티소켓');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','61');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table62VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTAlarmSound_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTAlarmSound_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMEVENTAlarmSound_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTAlarmSound_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTAlarmGRADE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTAlarmGRADE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMEVENTAlarmGRADE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTAlarmGRADE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTCheckUser_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTCheckUser_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMEVENTCheckUser_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTCheckUser_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','62');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table63VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','USEARMLEN','FALSE');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','ALARMLEN','10');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','63');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table64VersionMake: Boolean;
var
  stSql : string;
begin
  //tb_ACCESSEVENT 이름 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTEMCODEChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ACCESSEVENTEMCODEChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTEMCODEChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTEMCODEChange
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','64');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table65VersionMake: Boolean;
var
  stSql : string;
begin
  G_nDaemonServerVersion := DataModule1.GetDaemonVersion;
  if (G_nDaemonServerVersion > 0) and (G_nDaemonServerVersion < 4) then
  begin
    stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','SCHASYNC','0');
  end else
  begin
    stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','SCHASYNC','1');
  end;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','SCHDEVICE','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','65');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table66VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','COMMLOG','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','CARDLOG','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','66');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table67VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDeviceCode_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDeviceCode_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEDeviceCode_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDeviceCode_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICERegSend_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICERegSend_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICERegSend_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICERegSend_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICERegSend_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICERegSend_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICERegSend_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICERegSend_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORRegSend_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORRegSend_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORRegSend_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORRegSend_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_READERDoorPosi_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_READERDoorPosi_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_READERDoorPosi_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_READERDoorPosi_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_READERBuildPosi_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_READERBuildPosi_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_READERBuildPosi_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_READERBuildPosi_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_READERRegSend_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_READERRegSend_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_READERRegSend_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_READERRegSend_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ZONEDEVICEDelayUse_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ZONEDEVICEDelayUse_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ZONEDEVICEDelayUse_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ZONEDEVICEDelayUse_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ZONEDEVICEPortRecovery_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ZONEDEVICEPortRecovery_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ZONEDEVICEPortRecovery_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ZONEDEVICEPortRecovery_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ZONEDEVICERegSend_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ZONEDEVICERegSend_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ZONEDEVICERegSend_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ZONEDEVICERegSend_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);


  stSql := 'Insert Into TB_CURRENTDAEMON(CU_STATECODE,CU_STATEVALUE) ';
  stSql := stSql + ' Values( ''REGPW'',''' + MimeEncodeString('1234') + ''') ';
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','67');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table68VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTCardno_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTCardno_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMEVENTCardno_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTCardno_Add
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICETelNo_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICETelNo_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICETelNo_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICETelNo_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEmemo_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEmemo_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEmemo_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEmemo_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','68');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table69VersionMake: Boolean;
var
  stSql : string;
begin

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICELinkusSystemID_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICELinkusSystemID_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICELinkusSystemID_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICELinkusSystemID_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICELinkusTelNo_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICELinkusTelNo_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICELinkusTelNo_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICELinkusTelNo_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEArmControlRing_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEArmControlRing_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEArmControlRing_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEArmControlRing_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDisArmControlRing_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDisArmControlRing_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEDisArmControlRing_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDisArmControlRing_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDeviceType_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDeviceType_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEDeviceType_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDeviceType_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEPowerType_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEPowerType_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEPowerType_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEPowerType_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEOutDelay_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEOutDelay_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEOutDelay_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEOutDelay_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEInDelay_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEInDelay_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEInDelay_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEInDelay_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEJaejung_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEJaejung_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEJaejung_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEJaejung_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDoor1Type_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDoor1Type_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEDoor1Type_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDoor1Type_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDoor2Type_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDoor2Type_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEDoor2Type_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDoor2Type_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEReaderType_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEReaderType_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEReaderType_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEReaderType_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','69');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table6VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','LOGINTYPE','TRUE');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('MOSTYPE','ALARMVIEW','REAL');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','fdmsType','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','6');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table70VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_DOOR set DO_UPDATE = ''Y'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'update TB_ALARMDEVICE set AL_UPDATE = ''Y'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'update TB_ACCESSDEVICE set AC_PTTYPE = ''1'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','70');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table71VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CURRENTDAEMON(CU_STATECODE,CU_STATEVALUE) ';
  stSql := stSql + ' Values( ''DEVICESORT'',''00000000'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','71');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table72VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_READERReaderVer_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_READERReaderVer_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_READERReaderVer_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_READERReaderVer_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','72');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table73VersionMake: Boolean;
VAR
  stSql : string;
begin

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEReaderType_Delete
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEReaderType_Delete
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEReaderType_Delete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEReaderType_Delete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEOUTDELAY_Delete
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEOUTDELAY_Delete
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEOUTDELAY_Delete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEOUTDELAY_Delete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEINDELAY_Delete
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEINDELAY_Delete
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEINDELAY_Delete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEINDELAY_Delete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEALARMID_Delete
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEALARMID_Delete
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEALARMID_Delete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEALARMID_Delete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEMUXTEL_Delete
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEMUXTEL_Delete
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEMUXTEL_Delete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEMUXTEL_Delete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICERINGCOUNT_Delete
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICERINGCOUNT_Delete
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICERINGCOUNT_Delete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICERINGCOUNT_Delete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','73');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table74VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','fdmsEMCODE','FALSE'); //RUC 센터 때문에 추가 했는데... RUC 특화로 사용 안함
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','74');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table75VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_DEVICESETTINGINFO
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_DEVICESETTINGINFO
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_DEVICESETTINGINFO
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_DEVICESETTINGINFO
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','75');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table76VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_PERRELAYCONFIG(';
  stSql := stSql + 'PC_CONFIGCODE,';
  stSql := stSql + 'PC_CONFIGVALUE,';
  stSql := stSql + 'PC_CONFIGDETAIL) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''GETDATETIME'',';
  stSql := stSql + '''00000000000000'',';
  stSql := stSql + '''최종가져온시간'')';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','76');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table77VersionMake: Boolean;
var
  stSql : string;
begin
  Exit; //Event 테이블 변경 시 문제 소지 발생 해서 꼭 필요한 경우 유틸로 만들어서 작성

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTJijumCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTJijumCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTJijumCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTJijumCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTDepartCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTDepartCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTDepartCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTDepartCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINJijumCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINJijumCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINJijumCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINJijumCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINDepartCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINDepartCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINDepartCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINDepartCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINCOMPANYCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINCOMPANYCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINCOMPANYCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINCOMPANYCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINCOMPANYJijumCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINCOMPANYJijumCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINCOMPANYJijumCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINCOMPANYJijumCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINCOMPANYDepartCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINCOMPANYDepartCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINCOMPANYDepartCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINCOMPANYDepartCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATDAYSUMMARYCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATDAYSUMMARYCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATDAYSUMMARYCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATDAYSUMMARYCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATEMPEXTRACompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATEMPEXTRACompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATEMPEXTRACompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATEMPEXTRACompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATEVENTCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATEVENTCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATEVENTCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATEVENTCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATMONTHEXTRACompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATMONTHEXTRACompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATMONTHEXTRACompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATMONTHEXTRACompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATMONTHSUMMARYCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATMONTHSUMMARYCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATMONTHSUMMARYCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATMONTHSUMMARYCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATVACATIONCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATVACATIONCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATVACATIONCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATVACATIONCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_BASEPAYCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_BASEPAYCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_BASEPAYCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_BASEPAYCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_CARDCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_CARDCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_CARDCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_CARDCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_COMPANYCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_COMPANYCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_COMPANYCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_COMPANYCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_COMPANYJijumCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_COMPANYJijumCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_COMPANYJijumCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_COMPANYJijumCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_COMPANYDepartCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_COMPANYDepartCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_COMPANYDepartCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_COMPANYDepartCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEECompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEECompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEECompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEECompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEJijumCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEJijumCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEEJijumCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEJijumCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEDepartCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEDepartCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEEDepartCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEDepartCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEPosiCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEPosiCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEEPosiCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEPosiCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_FOODEVENTCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_FOODEVENTCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_FOODEVENTCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_FOODEVENTCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_FOODGRADECompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_FOODGRADECompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_FOODGRADECompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_FOODGRADECompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_POSICompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_POSICompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_POSICompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_POSICompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_POSIPosiCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_POSIPosiCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_POSIPosiCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_POSIPosiCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','77');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table78VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','PCSERVERTM','1','PCServerDelayTime');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','78');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table79VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','C_INTERVAL','5','ClientSendInterval(ms)');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','79');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table7VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_ALARMSHOW
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_ALARMSHOW
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_ALARMSHOW
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_ALARMSHOW
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','7');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table80VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','INOUTTYPE','0','외출-0:사용안함,1:리더,2:버튼');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','STARTWKNO','1','출근리더(버튼)번호');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','OFFWKNO','2','퇴근리더(버튼)번호');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','WKOUTNO','3','외출리더(버튼)번호');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','WKINNO','4','복귀리더(버튼)번호');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','80');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table81VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ALARMSTATUSCODE ';
  stSql := stSql + ' Where AL_ALARMSTATUSCODE = ''F1'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','81');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table82VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','ATPRSERVER','FALSE','근태전용서버');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','82');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table83VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSDBTYPE','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSDBIP','127.0.0.1');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSDBPORT','1433');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSUSER','sa');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSDBNAME','sh_fpsystem');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','83');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table84VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_ALARMGUBUNCODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_ALARMGUBUNCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_ALARMGUBUNCODE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_ALARMGUBUNCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertTB_ALARMGUBUNCODE('001','구분1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_ALARMGUBUNCODE('002','구분2');
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEARMGUBUN
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEARMGUBUN
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEARMGUBUN
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEARMGUBUN
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','84');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table85VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','KTTSUSES','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','KTTSIP','127.0.0.1');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','KTTSPORT','9999');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','KTTCPORT','9999');
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','85');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table86VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_ALARMMODENOTCARD('006','CtrlCenter');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('006','a','R3');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('006','d','R3');
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Update TB_ALARMEVENT set al_operator = ''CtrlCenter'' ';
  if DBTYPE = 'PG' then stSql := stsql + ' Where substr(al_operator,1,10) = ''.KTLinkUs.'' ';
  if DBTYPE = 'MSSQL' then stSql := stsql + ' Where substring(al_operator,1,10) = ''.KTLinkUs.'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','86');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table87VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','CLIENTSEQ','N');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','CLIENTTIME','5');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','87');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table8VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_EMPHIS
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_EMPHIS
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_EMPHIS
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_EMPHIS
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  if DBTYPE = 'FB' then
  begin
    stSql := 'CREATE SEQUENCE GEN_TB_EMPHIS_ID ';
    DataModule1.ProcessExecSQL(stSql);

    stSql := 'CREATE OR ALTER TRIGGER TB_EMPHIS_BI FOR TB_EMPHIS ';
    stSql := stSql + ' ACTIVE BEFORE INSERT POSITION 0 ';
    stSql := stSql + ' AS ';
    stSql := stSql + ' BEGIN ';
    stSql := stSql + '   IF (NEW.SEQ IS NULL) THEN ';
    stSql := stSql + '     NEW.SEQ = GEN_ID(GEN_TB_EMPHIS_ID,1); ';
    stSql := stSql + ' END ';
    DataModule1.ProcessExecSQL(stSql);
  end;

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','8');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table9VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_SERVERCARDRELAY
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_SERVERCARDRELAY
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_SERVERCARDRELAY
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_SERVERCARDRELAY
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_SERVERCARDRELAYHIS
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_SERVERCARDRELAYHIS
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_SERVERCARDRELAYHIS
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_SERVERCARDRELAYHIS
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_PERRELAYCONFIG
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_PERRELAYCONFIG
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_PERRELAYCONFIG
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_PERRELAYCONFIG
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','9');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.PositionNumberValueSetting: Boolean;
var
  stSql : string;
  nPositionNumber : integer;
begin
  stSql := 'Select * from TB_CARD ';
  nPositionNumber := 1;

  with targetSearchADOQuery do
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
    While Not Eof do
    begin
      UpdateTB_CARDPoitionNum(FindField('GROUP_CODE').AsString,FindField('CA_CARDNO').AsString,nPositionNumber);
      inc(nPositionNumber);
      Next;
    end;
  end;

end;

function TfmMain.UpdateTB_CARDPoitionNum(aGroupCode, aCardNo: string;
  aPositionNumber: integer): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_CARD ';
  stSql := stSql + ' Set POSITIONNUM = ' + inttostr(aPositionNumber) ;
  stSql := stSql + ' Where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.CheckPersonRelay: string;
var
  stSql : string;
begin
  result := '0';
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''RELAY'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''PER_RELAY'' ';
  with targetSearchADOQuery do
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
    Try
      result := FindField('CO_CONFIGVALUE').AsString;
    Except
      Exit;
    End;
  end;
end;

function TfmMain.CheckFdms: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''RELAY'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''fdmsUSE'' ';
  with targetSearchADOQuery do
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
    Try
      if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then result := True;
    Except
      Exit;
    End;
  end;
end;

function TfmMain.CheckSamyuk: Boolean;
var
  stSql : string;
begin
  result := False;
  if CheckPersonRelay = '1' then result := True;  //삼육대연동이면 True

end;

function TfmMain.DeleteTable(aTableName: string): Boolean;
var
  stsql : string;
begin

  stSql := 'Delete From ' + aTableName ;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table100VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_ATWORKTYPE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_ATWORKTYPE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_ATWORKTYPE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_ATWORKTYPE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','100');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table101VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ZONEDEVICENameChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ZONEDEVICENameChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ZONEDEVICENameChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ZONEDEVICENameChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','101');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table102VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','AUTOFCARD','N');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','102');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table103VersionMake: Boolean;
var
  stSql : string;
  stTemp : string;
  stAW_YESTERDAYTIME : string; //어제 날짜 기준 시간
  stAW_SATURDAYTYPE : string; //토요일근무타입 0:공휴일,1:반휴일,2:평일
  stAW_DEVICETYPE : string; //0:업데이트,1:카드리더,2:버튼방식
  stAW_FIXATTYPE : string; //0:정상,1:전직원 정상 출퇴근
  stAW_NOTBACKUPTYPE : string; //0:미복귀시조퇴처리,1:미복귀시정상퇴근
  stAW_ATSTARTBUTTON : string; //출근조작버튼
  stAW_ATOFFBUTTON : string; //퇴근조작버튼
  stAW_INOUTDEVICETYPE : string; //외출-0:사용안함,1:리더,2:버튼
  stAW_WORKOUTBUTTON : string; //외출조작버튼
  stAW_WORKINBUTTON : string; //복귀조작버튼
begin
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','103');
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''ATTEND'' ';

  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    While Not Eof do
    begin
      if FindField('CO_CONFIGCODE').AsString = 'ATTYPE1' then stAW_FIXATTYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'DEVICETYPE' then stAW_DEVICETYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'INOUTTYPE' then stAW_INOUTDEVICETYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'OFFWKNO' then stAW_ATOFFBUTTON := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'OUTTIME' then stAW_NOTBACKUPTYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'SATURDAY' then stAW_SATURDAYTYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'STARTWKNO' then stAW_ATSTARTBUTTON := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'WKINNO' then stAW_WORKINBUTTON := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'WKOUTNO' then stAW_WORKOUTBUTTON := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'YTIME' then stAW_YESTERDAYTIME := FindField('CO_CONFIGVALUE').AsString ;

      Next;
    end;
    stTemp := 'Insert Into TB_ATWORKTYPE(';
    stTemp := stTemp + 'AW_CODE,';
    stTemp := stTemp + 'AW_NAME,';
    stTemp := stTemp + 'AW_YESTERDAYTIME,';
    stTemp := stTemp + 'AW_SATURDAYTYPE,';
    stTemp := stTemp + 'AW_DEVICETYPE,';
    stTemp := stTemp + 'AW_FIXATTYPE,';
    stTemp := stTemp + 'AW_NOTBACKUPTYPE,';
    stTemp := stTemp + 'AW_ATSTARTBUTTON,';
    stTemp := stTemp + 'AW_ATOFFBUTTON,';
    stTemp := stTemp + 'AW_INOUTDEVICETYPE,';
    stTemp := stTemp + 'AW_WORKOUTBUTTON,';
    stTemp := stTemp + 'AW_WORKINBUTTON) ';
    stTemp := stTemp + ' Values( ';
    stTemp := stTemp + '''001'',';
    stTemp := stTemp + '''상시근무자'',';
    stTemp := stTemp + '''' + stAW_YESTERDAYTIME + ''',';
    stTemp := stTemp + '''' + stAW_SATURDAYTYPE + ''',';
    stTemp := stTemp + '''' + stAW_DEVICETYPE + ''',';
    stTemp := stTemp + '''' + stAW_FIXATTYPE + ''',';
    stTemp := stTemp + '''' + stAW_NOTBACKUPTYPE + ''',';
    stTemp := stTemp + '''' + stAW_ATSTARTBUTTON + ''',';
    stTemp := stTemp + '''' + stAW_ATOFFBUTTON + ''',';
    stTemp := stTemp + '''' + stAW_INOUTDEVICETYPE + ''',';
    stTemp := stTemp + '''' + stAW_WORKOUTBUTTON + ''',';
    stTemp := stTemp + '''' + stAW_WORKINBUTTON + ''') ';

    DataModule1.ProcessExecSQL(stTemp);
  end;
end;

function TfmMain.Table104VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATCODEAWCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATCODEAWCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATCODEAWCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATCODEAWCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_ATCODE set AW_CODE = ''001'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','104');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table105VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEAWCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEAWCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEEAWCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEAWCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_EMPLOYEE set AW_CODE = ''001'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','105');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table106VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMSTATUSCODEGubun_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMSTATUSCODEGubun_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMSTATUSCODEGubun_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMSTATUSCODEGubun_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMSTATUSCODEColor_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMSTATUSCODEColor_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMSTATUSCODEColor_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMSTATUSCODEColor_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Update TB_ALARMSTATUSCODE set AL_COLOR = 255 ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Update TB_ALARMSTATUSCODE set AL_GUBUN = ''001'' ';
  stSql := stSql + ' Where AL_ALARMSTATUSCODE = ''00'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''AF'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''AN'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''BF'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''CC'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''CO'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''CR'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''DF'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''DL'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''DR'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''E1'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''EM'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''FI'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''G1'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''NF'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''NR'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''PF'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''Q1'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S1'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S2'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S3'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S4'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S5'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S6'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S7'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S8'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''WR'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Update TB_ALARMSTATUSCODE set AL_GUBUN = ''002'' ';
  stSql := stSql + ' Where AL_GUBUN IS NULL ';
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','106');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table107VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CURRENTDAEMON(CU_STATECODE,CU_STATEVALUE) ';
  stSql := stSql + ' Values(''FDMSCARD'',''30'')';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','107');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table108VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_FIREGUBUN
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_FIREGUBUN
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_FIREGUBUN
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_FIREGUBUN
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert Into TB_FIREGUBUN(FG_CODE,FG_NAME) ';
  stSql := stSql + ' Values(''001'',''전체'')';
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_FIREGROUP
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_FIREGROUP
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_FIREGROUP
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_FIREGROUP
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert into TB_FIREGROUP select ''1234567890'',AC_NODENO,''001'' from TB_ACCESSDEVICE where AC_ECUID = ''00'' ';
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','108');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table109VersionMake: Boolean;
var
  stSql : string;
begin

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATCODEATOUTRANGE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATCODEATOUTRANGE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATCODEATOUTRANGE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATCODEATOUTRANGE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATCODEATSOUTRANGE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATCODEATSOUTRANGE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATCODEATSOUTRANGE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATCODEATSOUTRANGE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATCODEATHOUTRANGE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATCODEATHOUTRANGE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATCODEATHOUTRANGE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATCODEATHOUTRANGE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','109');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table110VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_ATLISTEVENT
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_ATLISTEVENT
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_ATLISTEVENT
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_ATLISTEVENT
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','110');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table111VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_CLIENTSOCK
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_CLIENTSOCK
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_CLIENTSOCK
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_CLIENTSOCK
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','CSOCKTYPE','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','111');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table112VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICE_JAVARATYPEAdd
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ACCESSDEVICE_JAVARATYPEAdd
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICE_JAVARATYPEAdd
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICE_JAVARATYPEAdd
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_ACCESSDEVICE set AC_JAVARATYPE = ''0'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','112');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table113VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_NOTCARDALARMCODE set AL_STATUSCODE2 = ''A2'' ';
  stSql := stsql + ' Where AN_CODE = ''006'' ';
  stSql := stSql + ' AND AN_MODE = ''a'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Update TB_NOTCARDALARMCODE set AL_STATUSCODE2 = ''C2'' ';
  stSql := stsql + ' Where AN_CODE = ''006'' ';
  stSql := stSql + ' AND AN_MODE = ''d'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','113');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table114VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_JAVARASCHEDULE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_JAVARASCHEDULE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_JAVARASCHEDULE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_JAVARASCHEDULE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','114');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table115VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICE_CARDTYPEChange
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICE_CARDTYPEChange
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICE_CARDTYPEChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICE_CARDTYPEChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','115');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table116VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEE_COPHONEChange
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEE_COPHONEChange
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEE_COPHONEChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEE_COPHONEChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','116');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table117VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','LONGTIMECD','');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','117');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table118VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_INOUTREADERGROUP
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_INOUTREADERGROUP
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_INOUTREADERGROUP
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_INOUTREADERGROUP
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_READER_INOUTGROUPCODEAdd
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_READER_INOUTGROUPCODEAdd
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_READER_INOUTGROUPCODEAdd
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_READER_INOUTGROUPCODEAdd
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','118');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table119VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_INOUTGROUPLIST
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_INOUTGROUPLIST
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_INOUTGROUPLIST
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_INOUTGROUPLIST
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','119');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table120VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_INOUTGROUPLISTNodeNo_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_INOUTGROUPLISTNodeNo_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_INOUTGROUPLISTNodeNo_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_INOUTGROUPLISTNodeNo_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_INOUTGROUPLISTEcuID_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_INOUTGROUPLISTEcuID_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_INOUTGROUPLISTEcuID_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_INOUTGROUPLISTEcuID_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_INOUTGROUPLISTReaderNo_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_INOUTGROUPLISTReaderNo_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_INOUTGROUPLISTReaderNo_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_INOUTGROUPLISTReaderNo_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_INOUTGROUPLISTTime_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_INOUTGROUPLISTTime_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_INOUTGROUPLISTTime_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_INOUTGROUPLISTTime_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','120');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table121VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','ASCIITOHEX','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','121');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table122VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_DEVICECARDGROUPCODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_DEVICECARDGROUPCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_DEVICECARDGROUPCODE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_DEVICECARDGROUPCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEE_DGCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEE_DGCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEE_DGCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEE_DGCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEE_DGAPPLY_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEE_DGAPPLY_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEE_DGAPPLY_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEE_DGAPPLY_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','122');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table123VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_PERMITCODE(';
  stSql := stSql + 'PE_PERMITCODE,';
  stSql := stSql + 'PE_PERMITNAME)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''G'',';
  stSql := stSql + '''근태'')';
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','123');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table124VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_ACCESSINPUTTYPE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_ACCESSINPUTTYPE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_ACCESSINPUTTYPE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_ACCESSINPUTTYPE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert Into TB_ACCESSINPUTTYPE(';
  stSql := stSql + 'AC_INPUTTYPE,';
  stSql := stSql + 'AC_INPUTTYPENAME)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''R'',';
  stSql := stSql + '''원격제어'')';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert Into TB_ACCESSINPUTTYPE(';
  stSql := stSql + 'AC_INPUTTYPE,';
  stSql := stSql + 'AC_INPUTTYPENAME)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''P'',';
  stSql := stSql + '''전화'')';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert Into TB_ACCESSINPUTTYPE(';
  stSql := stSql + 'AC_INPUTTYPE,';
  stSql := stSql + 'AC_INPUTTYPENAME)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''B'',';
  stSql := stSql + '''퇴실버튼'')';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert Into TB_ACCESSINPUTTYPE(';
  stSql := stSql + 'AC_INPUTTYPE,';
  stSql := stSql + 'AC_INPUTTYPENAME)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''S'',';
  stSql := stSql + '''스케줄'')';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert Into TB_ACCESSINPUTTYPE(';
  stSql := stSql + 'AC_INPUTTYPE,';
  stSql := stSql + 'AC_INPUTTYPENAME)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''F'',';
  stSql := stSql + '''화재발생'')';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert Into TB_ACCESSINPUTTYPE(';
  stSql := stSql + 'AC_INPUTTYPE,';
  stSql := stSql + 'AC_INPUTTYPENAME)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''f'',';
  stSql := stSql + '''원격화재'')';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert Into TB_ACCESSINPUTTYPE(';
  stSql := stSql + 'AC_INPUTTYPE,';
  stSql := stSql + 'AC_INPUTTYPENAME)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''C'',';
  stSql := stSql + '''카드'')';
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_DOORPOSICODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_DOORPOSICODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_DOORPOSICODE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_DOORPOSICODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert Into TB_DOORPOSICODE(';
  stSql := stSql + 'AC_DOORPOSI,';
  stSql := stSql + 'AC_DOORPOSINAME)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''0'',';
  stSql := stSql + '''내부'')';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert Into TB_DOORPOSICODE(';
  stSql := stSql + 'AC_DOORPOSI,';
  stSql := stSql + 'AC_DOORPOSINAME)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''1'',';
  stSql := stSql + '''외부'')';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','124');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table125VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENT_COMPANYCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENT_COMPANYCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMEVENT_COMPANYCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENT_COMPANYCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENT_EMCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENT_EMCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMEVENT_EMCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENT_EMCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','125');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table126VersionMake: Boolean;
var
  stSql : string;
begin
  Exit;
  //현재 TB_DEVICETYPE 은 미사용 ==> TB_ALARMDEVICETYPE 테이블을 사용중
  stSql := 'Insert Into TB_DEVICETYPE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DE_DEVICETYPE,';
  stSql := stSql + ' DE_TYPENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''MN'', ';
  stSql := stSql + '''메인컨트롤러'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_DEVICETYPE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DE_DEVICETYPE,';
  stSql := stSql + ' DE_TYPENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''EX'', ';
  stSql := stSql + '''로컬컨트롤러'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_DEVICETYPE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DE_DEVICETYPE,';
  stSql := stSql + ' DE_TYPENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''JP'', ';
  stSql := stSql + '''조작표시기'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_DEVICETYPE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DE_DEVICETYPE,';
  stSql := stSql + ' DE_TYPENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''PT'', ';
  stSql := stSql + '''포인터'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_DEVICETYPE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DE_DEVICETYPE,';
  stSql := stSql + ' DE_TYPENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''PR'', ';
  stSql := stSql + '''프린터'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_DEVICETYPE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DE_DEVICETYPE,';
  stSql := stSql + ' DE_TYPENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''PC'', ';
  stSql := stSql + '''PC'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_DEVICETYPE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DE_DEVICETYPE,';
  stSql := stSql + ' DE_TYPENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''AD'', ';
  stSql := stSql + '''알람표시기'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_DEVICETYPE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DE_DEVICETYPE,';
  stSql := stSql + ' DE_TYPENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''WR'', ';
  stSql := stSql + '''무선중계기'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_DEVICETYPE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DE_DEVICETYPE,';
  stSql := stSql + ' DE_TYPENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''CD'', ';
  stSql := stSql + '''카드리더'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','126');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table127VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ALARMMODECODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AL_ALARMMODECODE,';
  stSql := stSql + ' AL_ALARMMODENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''a'', ';
  stSql := stSql + '''경계모드'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_ALARMMODECODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AL_ALARMMODECODE,';
  stSql := stSql + ' AL_ALARMMODENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''A'', ';
  stSql := stSql + '''경계모드'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_ALARMMODECODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AL_ALARMMODECODE,';
  stSql := stSql + ' AL_ALARMMODENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''d'', ';
  stSql := stSql + '''해제모드'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_ALARMMODECODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AL_ALARMMODECODE,';
  stSql := stSql + ' AL_ALARMMODENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''D'', ';
  stSql := stSql + '''해제모드'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','127');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table128VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_LOCATION_TOTWIDTH_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_LOCATION_TOTWIDTH_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_LOCATION_TOTWIDTH_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_LOCATION_TOTWIDTH_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_LOCATION_TOTHEIGHT_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_LOCATION_TOTHEIGHT_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_LOCATION_TOTHEIGHT_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_LOCATION_TOTHEIGHT_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_LOCATION_CURX_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_LOCATION_CURX_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_LOCATION_CURX_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_LOCATION_CURX_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_LOCATION_CURY_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_LOCATION_CURY_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_LOCATION_CURY_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_LOCATION_CURY_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','125');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table129VersionMake: Boolean;
var
  stSql : string;
begin
  //tb_employee 이름 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEEmNameChange('100')
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_EMPLOYEEEmNameChange('100')
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEEmNameChange('100')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEEmNameChange('100')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','129');
  DataModule1.ProcessExecSQL(stSql);  

end;

function TfmMain.Table130VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('CARD','READERTYPE','0','0.일반,1.스마트원');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','130');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table131VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISEMNAME_Change(100)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISEMNAME_Change(100)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISEMNAME_Change(100)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISEMNAME_Change(100)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','131');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table132VersionMake: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'update tb_alarmdevice set al_zonenum = ''00'' '; //AL_ZONENUM 에 데이터 값을 입력 한다
  DataModule1.ProcessExecSQL(stSql);
  stSql := 'update TB_ALARMEVENT set AL_ZONECODE = ''00'' where AL_ZONECODE is null '; //AL_ZONECODE 에 데이터 값을 입력 한다
  DataModule1.ProcessExecSQL(stSql);
  if DBTYPE = 'MDB' then
  begin
    stSql := 'alter table tb_alarmdevice alter column al_zonenum  text(2) NOT NULL ';
    DataModule1.ProcessExecSQL(stSql);
  end else if DBTYPE = 'PG' then
  begin
    stSql := 'ALTER TABLE tb_alarmdevice ALTER COLUMN al_zonenum SET DEFAULT ''00'' ';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'ALTER TABLE tb_alarmdevice ALTER COLUMN al_zonenum SET NOT NULL ';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'alter table tb_alarmdevice drop constraint tb_alarmdevice_pkey ';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'alter table tb_alarmdevice add primary key (GROUP_CODE,AC_NODENO,AC_ECUID,AL_ZONENUM)';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'ALTER TABLE TB_ALARMEVENT ALTER COLUMN AL_ZONECODE SET DEFAULT ''00'' ';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'ALTER TABLE TB_ALARMEVENT ALTER COLUMN AL_ZONECODE SET NOT NULL ';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'alter table TB_ALARMEVENT drop constraint tb_alarmevent_pkey ';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'alter table TB_ALARMEVENT add primary key (group_code, al_date, al_time, ac_nodeno, ac_ecuid, al_msgno,AL_ZONECODE)';
    DataModule1.ProcessExecSQL(stSql);
  end else if DBTYPE = 'MSSQL' then
  begin
    stSql := 'alter table tb_alarmdevice alter column al_zonenum varchar(2) NOT NULL ';
    DataModule1.ProcessExecSQL(stSql);
    stSql := ' ALTER TABLE TB_ALARMDEVICE ADD DEFAULT ''00'' FOR AL_ZONENUM ';
    DataModule1.ProcessExecSQL(stSql);

    stSql := 'alter table TB_ALARMEVENT alter column AL_ZONECODE varchar(2) NOT NULL ';
    DataModule1.ProcessExecSQL(stSql);
    stSql := ' ALTER TABLE TB_ALARMEVENT ADD DEFAULT ''00'' FOR AL_ZONECODE ';
    DataModule1.ProcessExecSQL(stSql);

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := targetADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        stSql := 'select name from sysobjects where xtype= ''PK'' and parent_obj=(select id from sysobjects where name = ''tb_alarmdevice'')';
        sql.Text := stSql;
        Try
          Open;
        Except
          //에러처리
          Exit;
        End;
        if recordcount > 0 then
        begin
          stSql := 'ALTER TABLE tb_alarmdevice DROP ' + FindField('name').AsString ;
          DataModule1.ProcessExecSQL(stSql);
        end;
        Close;
        //sql.Clear;
        stSql := 'select name from sysobjects where xtype= ''PK'' and parent_obj=(select id from sysobjects where name = ''tb_alarmevent'')';
        sql.Text := stSql;
        Try
          Open;
        Except
          //에러처리
          Exit;
        End;
        if recordcount > 0 then
        begin
          stSql := 'ALTER TABLE tb_alarmevent DROP ' + FindField('name').AsString ;
          DataModule1.ProcessExecSQL(stSql);
        end;
      End;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
    stSql := 'alter table tb_alarmdevice add constraint PK_alarmdevice PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID,AL_ZONENUM)';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'alter table tb_alarmevent add constraint PK_alarmevent PRIMARY KEY (group_code, al_date, al_time, ac_nodeno, ac_ecuid, al_msgno,AL_ZONECODE)';
    DataModule1.ProcessExecSQL(stSql);
  end else if DBTYPE = 'FB' then
  begin
    stSql := 'alter table tb_alarmdevice alter column  al_zonenum varchar(2) DEFAULT ''00''  NOT NULL ';
    DataModule1.ProcessExecSQL(stSql);
  end else Exit;
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','132');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table133VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISEMNAME_Change(100)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISEMNAME_Change(100)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISEMNAME_Change(100)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISEMNAME_Change(100)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','133');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table134VersionMake: Boolean;
var
  stSql : string;
begin

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_TIMECODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_TIMECODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_TIMECODE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_TIMECODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_TIMECODEDEVICE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_TIMECODEDEVICE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_TIMECODEDEVICE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_TIMECODEDEVICE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORTIMECODEUSE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORTIMECODEUSE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORTIMECODEUSE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORTIMECODEUSE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEETIMECODEUSE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEETIMECODEUSE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEETIMECODEUSE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEETIMECODEUSE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEETIMEGROUP_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEETIMEGROUP_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEETIMEGROUP_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEETIMEGROUP_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEETIME1_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEETIME1_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEETIME1_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEETIME1_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEETIME2_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEETIME2_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEETIME2_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEETIME2_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEETIME3_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEETIME3_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEETIME3_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEETIME3_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEETIME4_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEETIME4_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEETIME4_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEETIME4_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEWEEKCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEWEEKCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEEWEEKCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEWEEKCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_TIMECODE_Value('0','00000000','00000000','00000000','00000000','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_TIMECODE_Value('1','00000000','00000000','00000000','00000000','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','134');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table135VersionMake: Boolean;
var
  stSql : string;
begin

{  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICETimeCodeSend_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICETimeCodeSend_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICETimeCodeSend_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICETimeCodeSend_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
}
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICETIMECODEASYNC_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICETIMECODEASYNC_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICETIMECODEASYNC_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICETIMECODEASYNC_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','135');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table136VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','TIMEUSE','FALSE','타임코드 사용유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','136');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table137VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSDEPART','FALSE','부서코드연동유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','137');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table138VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNODoor3_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNODoor3_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNODoor3_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNODoor3_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNODoor4_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNODoor4_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNODoor4_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNODoor4_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNODoor5_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNODoor5_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNODoor5_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNODoor5_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNODoor6_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNODoor6_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNODoor6_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNODoor6_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNODoor7_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNODoor7_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNODoor7_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNODoor7_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNODoor8_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNODoor8_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNODoor8_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNODoor8_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNOAlarm0_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNOAlarm0_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNOAlarm0_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNOAlarm0_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNOAlarm1_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNOAlarm1_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNOAlarm1_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNOAlarm1_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNOAlarm2_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNOAlarm2_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNOAlarm2_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNOAlarm2_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNOAlarm3_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNOAlarm3_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNOAlarm3_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNOAlarm3_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNOAlarm4_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNOAlarm4_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNOAlarm4_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNOAlarm4_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNOAlarm5_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNOAlarm5_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNOAlarm5_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNOAlarm5_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNOAlarm6_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNOAlarm6_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNOAlarm6_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNOAlarm6_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNOAlarm7_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNOAlarm7_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNOAlarm7_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNOAlarm7_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNOAlarm8_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNOAlarm8_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNOAlarm8_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNOAlarm8_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','138');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table139VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATEVENT_JIJUMCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATEVENT_JIJUMCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATEVENT_JIJUMCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATEVENT_JIJUMCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATEVENT_DEPARTCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATEVENT_DEPARTCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATEVENT_DEPARTCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATEVENT_DEPARTCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATEVENT_EMNAME_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATEVENT_EMNAME_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATEVENT_EMNAME_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATEVENT_EMNAME_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_FOODEVENT_JIJUMCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_FOODEVENT_JIJUMCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_FOODEVENT_JIJUMCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_FOODEVENT_JIJUMCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_FOODEVENT_DEPARTCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_FOODEVENT_DEPARTCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_FOODEVENT_DEPARTCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_FOODEVENT_DEPARTCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_FOODEVENT_EMNAME_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_FOODEVENT_EMNAME_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_FOODEVENT_EMNAME_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_FOODEVENT_EMNAME_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','139');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table140VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.UpdateTB_ATEVENT_EmInfo
  else if DBTYPE = 'PG' then stSql := PostGreSql.UpdateTB_ATEVENT_EmInfo
  else if DBTYPE = 'MSSQL' then stSql := MSSql.UpdateTB_ATEVENT_EmInfo
  else if DBTYPE = 'FB' then stSql := FireBird.UpdateTB_ATEVENT_EmInfo
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.UpdateTB_FOODEVENT_EmInfo
  else if DBTYPE = 'PG' then stSql := PostGreSql.UpdateTB_FOODEVENT_EmInfo
  else if DBTYPE = 'MSSQL' then stSql := MSSql.UpdateTB_FOODEVENT_EmInfo
  else if DBTYPE = 'FB' then stSql := FireBird.UpdateTB_FOODEVENT_EmInfo
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','140');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table141VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','COMPANYCD','1','0:회사코드미사용,1:회사코드사용');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','141');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table142VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATDAYSUMMARY_JIJUMCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATDAYSUMMARY_JIJUMCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATDAYSUMMARY_JIJUMCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATDAYSUMMARY_JIJUMCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATDAYSUMMARY_DEPARTCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATDAYSUMMARY_DEPARTCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATDAYSUMMARY_DEPARTCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATDAYSUMMARY_DEPARTCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATDAYSUMMARY_EMNAME_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATDAYSUMMARY_EMNAME_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATDAYSUMMARY_EMNAME_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATDAYSUMMARY_EMNAME_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATMONTHSUMMARY_JIJUMCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATMONTHSUMMARY_JIJUMCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATMONTHSUMMARY_JIJUMCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATMONTHSUMMARY_JIJUMCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATMONTHSUMMARY_DEPARTCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATMONTHSUMMARY_DEPARTCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATMONTHSUMMARY_DEPARTCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATMONTHSUMMARY_DEPARTCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATMONTHSUMMARY_EMNAME_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATMONTHSUMMARY_EMNAME_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATMONTHSUMMARY_EMNAME_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATMONTHSUMMARY_EMNAME_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','142');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table143VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_TIMECODEDEVICE_EACHCHANGE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_TIMECODEDEVICE_EACHCHANGE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_TIMECODEDEVICE_EACHCHANGE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_TIMECODEDEVICE_EACHCHANGE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','143');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table144VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MSSQL' then
  begin
    stSql := 'CREATE VIEW Vw_SMS_EVENT AS ';
    stSql := stSql + 'select b.AL_ZONENAME as v_DEVICE_NAME, ' ;
    stSql := stSql + ' c.AL_ZONENAME as v_ZONE_NAME, ' ;
    stSql := stSql + ' a.AL_ALARMSTATUSCODE as v_EVENT_CODE, ' ;
    stSql := stSql + ' a.AL_ZONESTATE as v_ZONE_STATE, ' ;
    stSql := stSql + ' d.AL_ALARMNAME as v_EVENT_NAME, ' ;
    stSql := stSql + ' a.AL_DATE + a.AL_TIME  as v_EVENT_TIME, ' ;
    stSql := stSql + ' a.AL_INPUTTIME  as v_INSERT_TIME,';
    stSql := stSql + ' a.AL_MSGNO as v_MSG_ID ' ;
    stSql := stSql + ' FROM TB_ALARMEVENT a  ' ;
    stSql := stSql + ' Left Join TB_ALARMDEVICE b  ' ;
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID) ';
    stSql := stSql + ' Left Join TB_ZONEDEVICE c  ' ;
    stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
    stSql := stSql + ' AND a.AL_ZONENO = ''0'' + c.AL_ZONENUM )';
    stSql := stSql + ' Left Join TB_ALARMSTATUSCODE d  ' ;
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND a.AL_ALARMSTATUSCODE = d.AL_ALARMSTATUSCODE )';

    DataModule1.ProcessExecSQL(stSql);

    stSql := 'CREATE LOGIN [sms] WITH PASSWORD=N''smspass'', DEFAULT_DATABASE=[zmos], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'CREATE USER [sms] FOR LOGIN [sms]';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'ALTER LOGIN [sms] WITH PASSWORD=N''smspass''';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'EXEC sp_addrolemember ''db_datareader'', ''sms''';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'EXEC sp_addrolemember ''db_accessadmin'', ''sms''';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'GRANT SELECT ON [dbo].[Vw_SMS_EVENT] TO [sms] ' ;
    DataModule1.ProcessExecSQL(stSql);
  end;
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','144');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table146VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FACECOP','0','FACECOP연동유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert Into TB_CARDTYPE(CT_CODE,CT_NAME) ';
  stSql := stSql + ' VALUES(''3'',''FACECOP'')';
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_FACECOP
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_FACECOP
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_FACECOP
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_FACECOP
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','146');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table147VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATLISTEVENTCARDNOChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ATLISTEVENTCARDNOChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATLISTEVENTCARDNOChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATLISTEVENTCARDNOChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','147');
  DataModule1.ProcessExecSQL(stSql);


end;

function TfmMain.Table148VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICETIMETYPE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ACCESSDEVICETIMETYPE_Add
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICETIMETYPE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICETIMETYPE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','148');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table149VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','REALREPORT','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','149');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table150VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_FORMNAME('107','핸드폰','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('108','주소1','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('109','주소2','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','150');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table151VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSDELETE','FALSE');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','151');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table152VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('FOOD','YSDAYTIME','0400');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','152');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table153VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','EVENTDB','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','153');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table154VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ZONEDEVICE_View_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ZONEDEVICE_View_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ZONEDEVICE_View_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ZONEDEVICE_View_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_ZONEDEVICE set AL_VIEW =''Y'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','154');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table88VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSNOAUTO','Y','지문번호자동생성유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','88');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table89VersionMake: Boolean;
var
  stSql : string;
begin

  //TB_CONFIG
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_CONFIG_ValueChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_CONFIG_ValueChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_CONFIG_ValueChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_CONFIG_ValueChange
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','89');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table90VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_PERMITCODE( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' PE_PERMITCODE,' ;
  stSql := stSql + ' PE_PERMITNAME) ';
  stSql := stSql + ' Values( ' ;
  stSql := stSql + '''' + GROUPCODE + ''',' ;
  stSql := stSql + '''3'',';
  stSql := stSql + '''방범경계승인'')'  ;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_PERMITCODE( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' PE_PERMITCODE,';
  stSql := stSql + ' PE_PERMITNAME) '  ;
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',' ;
  stSql := stSql + '''4'',';
  stSql := stSql + '''방범해제승인'')';
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','90');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table91VersionMake: Boolean;
var
  stSql : string;
begin
//  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','ALARMCOUNT','50');
//  DataModule1.ProcessExecSQL(stSql);

  //기기 테이블에 MUXID 추가
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEMuxID_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ACCESSDEVICEMuxID_Add
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEMuxID_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEMuxID_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_ACCESSDEVICE set AC_MUXID = ''00'' ';
  DataModule1.ProcessExecSQL(stSql);

  //기기 테이블에 데코더아이디 추가
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDecoderID_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ACCESSDEVICEDecoderID_Add
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDecoderID_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDecoderID_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_ACCESSDEVICE set AC_DECODERID = ''KTT00'' ';
  DataModule1.ProcessExecSQL(stSql);

  //알람 이벤트신호 Count
  stSql := 'Insert Into TB_CURRENTDAEMON(CU_STATECODE,CU_STATEVALUE) ';
  stSql := stSql + ' Values( ''KTALARMSEQ'',''0'') ';
  DataModule1.ProcessExecSQL(stSql);

  //PAM Cycle Time - Pre Alive Manager  회선체크
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','KTTPCYCLE','30');
  DataModule1.ProcessExecSQL(stSql);

  //관제이벤트 매핑 코드 테이블 생성
  if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_KTTMAPPINGCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_KTTMAPPINGCODE
  else if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_KTTMAPPINGCODE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_KTTMAPPINGCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  //가입자확장기 단선
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','21','11','E701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','21','11','E701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','21','11','E701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','NF','11','E701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','NF','11','E701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','NF','11','E701');
  DataModule1.ProcessExecSQL(stSql);
  //가입자확장기 복구
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','22','11','R701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','22','11','R701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','22','11','R701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','NR','11','R701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','NR','11','R701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','NR','11','R701');
  DataModule1.ProcessExecSQL(stSql);
  //가입자확장기 열림
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','23','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','23','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','23','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','CO','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','CO','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','CO','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','23','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','23','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','23','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','CO','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','CO','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','CO','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  //가입자확장기 닫힘
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','24','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','24','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','24','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','CC','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','CC','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','CC','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','24','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','24','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','24','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','CC','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','CC','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','CC','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  //카드리더 단선
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','31','11','E138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','31','11','E138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','31','11','E138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','NF','11','E138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','NF','11','E138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','NF','11','E138');
  DataModule1.ProcessExecSQL(stSql);
  //카드리더 복구
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','32','11','R138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','32','11','R138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','32','11','R138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','NR','11','R138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','NR','11','R138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','NR','11','R138');
  DataModule1.ProcessExecSQL(stSql);
  //카드리더 열림
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','33','11','E136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','33','11','E136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','33','11','E136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','CO','11','E136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','CO','11','E136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','CO','11','E136');
  DataModule1.ProcessExecSQL(stSql);
  //카드리더 닫힘
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','34','11','R136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','34','11','R136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','34','11','R136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','CC','11','R136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','CC','11','R136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','CC','11','R136');
  DataModule1.ProcessExecSQL(stSql);
  //AC 단선
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','AF','11','E301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','AF','11','E301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','AF','11','E301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','AF','11','E301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','AF','11','E301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','AF','11','E301');
  DataModule1.ProcessExecSQL(stSql);
  //AC 복구
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','AN','11','R301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','AN','11','R301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','AN','11','R301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','AN','11','R301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','AN','11','R301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','AN','11','R301');
  DataModule1.ProcessExecSQL(stSql);
  //카드경계모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','A1','11','E400');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','A1','11','E400');
  DataModule1.ProcessExecSQL(stSql);
  //카드해제모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','C1','11','R400');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','C1','11','R400');
  DataModule1.ProcessExecSQL(stSql);
  //강제경계모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','A3','11','E300');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','A3','11','E300');
  DataModule1.ProcessExecSQL(stSql);
  //강제해제모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','C3','11','R300');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','C3','11','R300');
  DataModule1.ProcessExecSQL(stSql);
  //PC경계모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','A4','11','E620');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','A4','11','E620');
  DataModule1.ProcessExecSQL(stSql);
  //PC해제모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','C4','11','R620');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','C4','11','R620');
  DataModule1.ProcessExecSQL(stSql);
  //관제경계모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','A2','11','E610');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','A2','11','E610');
  DataModule1.ProcessExecSQL(stSql);
  //관제해제모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','C2','11','R610');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','C2','11','R610');
  DataModule1.ProcessExecSQL(stSql);
  //전원리셋
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','R1','01','E305');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','R2','01','E305');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','R2','01','E305');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','R1','01','E305');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','R2','01','E305');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','R2','01','E305');
  DataModule1.ProcessExecSQL(stSql);
  //국선체크
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','PC','11','E600');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','PC','11','E600');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','PC','11','E600');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','PC','11','E600');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','PC','11','E600');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','PC','11','E600');
  DataModule1.ProcessExecSQL(stSql);
  //프로그램댐퍼
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','EM','11','E306');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','EM','11','E306');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','EM','11','E306');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','EM','11','E306');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','EM','11','E306');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','EM','11','E306');
  DataModule1.ProcessExecSQL(stSql);
  //TF단말확인
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','PF','11','E139');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','PF','11','E139');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','PF','11','E139');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','PF','11','E139');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','PF','11','E139');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','PF','11','E139');
  DataModule1.ProcessExecSQL(stSql);
  //DC 단선
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','DL','11','E302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','DL','11','E302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','DL','11','E302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','DL','11','E302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','DL','11','E302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','DL','11','E302');
  DataModule1.ProcessExecSQL(stSql);
  //DC 복구
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','DR','11','R302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','DR','11','R302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','DR','11','R302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','DR','11','R302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','DR','11','R302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','DR','11','R302');
  DataModule1.ProcessExecSQL(stSql);
  //침입
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','ZP','11','E130');  //오픈
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','ZS','11','E130');  //쇼트
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','ZP','11','E130');  //오픈
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','ZS','11','E130');  //쇼트
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','FI','11','E130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','E1','11','E130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','G1','11','E130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','Q1','11','E130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','FI','11','E130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','E1','11','E130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','G1','11','E130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','Q1','11','E130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','ZP','11','E130');  //오픈
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','ZS','11','E130');  //쇼트
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','ZP','11','E130');  //오픈
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','ZS','11','E130');  //쇼트
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','FI','11','E130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','E1','11','E130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','G1','11','E130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','Q1','11','E130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','FI','11','E130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','E1','11','E130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','G1','11','E130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','Q1','11','E130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  //침입복구
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','ZN','11','R130');  //정상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','ZN','11','R130');  //정상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','F2','11','R130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','E2','11','R130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','G2','11','R130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','Q2','11','R130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','F2','11','R130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','E2','11','R130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','G2','11','R130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','Q2','11','R130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','ZN','11','R130');  //정상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','ZN','11','R130');  //정상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','F2','11','R130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','E2','11','R130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','G2','11','R130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','Q2','11','R130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','F2','11','R130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','E2','11','R130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','G2','11','R130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','Q2','11','R130');  //설비
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('21','가입자확장기단선','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('22','가입자확장기복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('31','카드리더단선','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('32','카드리더복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('41','감지기확장기단선','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('42','감지기확장기복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('23','기계열림','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('24','기계닫힘','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('33','카드리더열림','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('34','카드리더닫힘','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('43','감지기확장기열림','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('44','감지기확장기닫힘','0','0','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_ALARMSTATUSCODE set AL_ALARMNAME = ''화재알람'' where AL_ALARMSTATUSCODE = ''FI'' ';
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('F2','화재존복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('E2','비상존복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('G2','가스존복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('Q2','설비존복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('EM','프로그램댐퍼','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('PF','TF단말확인','0','0','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','21');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','22');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','31');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','32');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','41');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','42');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','23');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','24');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','33');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','34');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','43');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','44');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','91');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table92VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','DDNSUSES','0');
  DataModule1.ProcessExecSQL(stSql);
  //DDNS Server IP
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','DDNS_SIP','121.170.197.180');
  DataModule1.ProcessExecSQL(stSql);
  //DDNS Server PORT
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','DDNS_SPORT','9300');
  DataModule1.ProcessExecSQL(stSql);
  //DDNS Query Server IP
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','DDNS_QIP','121.170.197.180');
  DataModule1.ProcessExecSQL(stSql);
  //DDNS Query Server PORT
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','DDNS_QPORT','9301');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','92');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Table93VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('FIRE','RELAYUSE','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('FIRE','RELAYNO','6');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('FIRE','RELAYTIME','2');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','93');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table94VersionMake: Boolean;
var
  stSql : string;
begin
  //TB_ALARMDEVIC 이름 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICENameChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ALARMDEVICENameChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICENameChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICENameChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  //TB_ACCESSDEVIC 이름 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICENameChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ACCESSDEVICENameChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICENameChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICENameChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  //TB_DOOR 이름 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORNameChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_DOORNameChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORNameChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORNameChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  //TB_FOOD 이름 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_FOODNameChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_FOODNameChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_FOODNameChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_FOODNameChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','94');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table95VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := CommonSql.InsertIntoTB_CONFIG('FOOD','DUPEVENT','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','95');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table96VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_RELAYUNIVERCITY
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_RELAYUNIVERCITY
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_RELAYUNIVERCITY
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_RELAYUNIVERCITY
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','96');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table97VersionMake: Boolean;
var
  stSql : string;
begin    {
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNO_downseq
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNO_downseq
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNO_downseq
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNO_downseq
  else Exit;
  DataModule1.ProcessExecSQL(stSql);  }

  //dmAdoQuery.NotGradePermitDelete;

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','97');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table98VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_KTTMAPPINGCODE_SendUse
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_KTTMAPPINGCODE_SendUse
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_KTTMAPPINGCODE_SendUse
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_KTTMAPPINGCODE_SendUse
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' update TB_KTTMAPPINGCODE set senduse = ''Y'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','98');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Table99VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','DELCARDUSE','N');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','DCARDSTART','11');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','DELCARDLEN','3');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','99');
  DataModule1.ProcessExecSQL(stSql);

end;

end.
