unit uDataBaseConvert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Gauges, DB, ADODB, FolderDialog,
  Grids, DBGrids, FindFile, ComCtrls,IniFiles;

type
  TForm1 = class(TForm)
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

    { Private declarations }
    Function targetAdoConnect : Boolean;
    procedure SetDBType(const Value: string);

  private
    property DBTYPE : string read FDBTYPE write SetDBType;

  public
    BackupFileList : TStringList;
    L_bStop : Boolean;
    { Public declarations }
    procedure BackupFileLoad;
    Function FileDBRestor(aImportFileName:string):Boolean;
    Function CreateTable(aTableName:string):Boolean;
    Function DropTable(aTableName:string):Boolean;
  end;

var
  Form1: TForm1;

implementation

uses
  uLomosUtil;
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

procedure TForm1.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.rg_targetDBTypeClick(Sender: TObject);
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
    ed_targetUserPw.Text := 'postgres';
  end;

end;

function TForm1.targetAdoConnect: Boolean;
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

procedure TForm1.btn_FolderClick(Sender: TObject);
var
  ini_fun : TiniFile;
  nVer : integer;
begin
  FolderDialog1.Title := '백업 폴더 찾기';

  if FolderDialog1.Execute then
  begin
    ed_BackupDir.Text := FolderDialog1.Directory;
    BackupFileList.Clear;
    ini_fun := TiniFile.Create(ed_BackupDir.Text + '\Backup.INI');
    DBTYPE := ini_fun.ReadString('Config','DBTYPE','');
    nVer := ini_fun.ReadInteger('Config','VER',0);
    ini_fun.Free;

    if DBTYPE = '' then
    begin
      showmessage('이 프로그램에서 지원하지 않는 버젼의 백업파일입니다. 수작업으로 복구하셔야 합니다.');
      Exit;
    end;

    if UpperCase(DBTYPE) = 'PG' then
    begin
      if nVer < 1 then
      begin
        showmessage('테이블 생성 쿼리가 잘못 되었습니다. 수정 후 작업하셔야 합니다.');
        Exit;
      end;
    end;

    BackupFileLoad;
  end;

end;


procedure TForm1.FindFileFolderChange(Sender: TObject;
  const Folder: String; var IgnoreFolder: TFolderIgnore);
begin
  if not FindFile.Threaded then
    Application.ProcessMessages;
end;

procedure TForm1.BackupFileLoad;
begin
  // Sets FileFile properties
  FindFile.Threaded := True;
  // - Name & Location
  with FindFile.Criteria.Files do
  begin
    FileName := '*.BAK';
    Location := ed_BackupDir.Text;
    Subfolders := False;
  end;
  // - Containing Text
  with FindFile.Criteria.Content do
  begin
    Phrase := '';
    Options := [];
    if Self.CaseSenstitive.Checked then
      Options := Options + [csoCaseSensitive];
    if Self.WholeWord.Checked then
      Options := Options + [csoWholeWord];
  end;
  // - Attributes
  with FindFile.Criteria.Attributes do
  begin
    Archive := GetAttributeStatus(Self.Archive);
    Readonly := GetAttributeStatus(Self.Readonly);
    Hidden := GetAttributeStatus(Self.Hidden);
    System := GetAttributeStatus(Self.System);
    Directory := GetAttributeStatus(Self.Directory);
    Compressed := GetAttributeStatus(Self.Compressed);
    Encrypted := GetAttributeStatus(Self.Encrypted);
    Offline := GetAttributeStatus(Self.Offline);
    ReparsePoint := GetAttributeStatus(Self.ReparsePoint);
    SparseFile := GetAttributeStatus(Self.SparseFile);
    Temporary := GetAttributeStatus(Self.Temporary);
    Device := GetAttributeStatus(Self.Device);
    Normal := GetAttributeStatus(Self.Normal);
    Virtual := GetAttributeStatus(Self.Virtual);
    NotContentIndexed := GetAttributeStatus(Self.NotContentIndexed);
  end;
  // - Size ranges
  with FindFile.Criteria.Size do
  begin
    Min := Self.SizeMin.Position;
    case Self.SizeMinUnit.ItemIndex of
      1: Min := Min * 1024;
      2: Min := Min * 1024 * 1024;
      3: Min := Min * 1024 * 1024 * 1024;
    end;
    Max := Self.SizeMax.Position;
    case Self.SizeMaxUnit.ItemIndex of
      1: Max := Max * 1024;
      2: Max := Max * 1024 * 1024;
      3: Max := Max * 1024 * 1024 * 1024;
    end;
  end;
  // - TimeStamp ranges
  with FindFile.Criteria.TimeStamp do
  begin
    Clear;
    // Created on
    if Self.CBD.Checked then
      CreatedBefore := Self.CreatedBeforeDate.Date;
    if Self.CBT.Checked then
      CreatedBefore := CreatedBefore + Self.CreatedBeforeTime.Time;
    if Self.CAD.Checked then
      CreatedAfter := Self.CreatedAfterDate.Date;
    if Self.CAT.Checked then
      CreatedAfter := CreatedAfter + Self.CreatedAfterTime.Time;
    // Modified on
    if Self.MBD.Checked then
      ModifiedBefore := Self.ModifiedBeforeDate.Date;
    if Self.MBT.Checked then
      ModifiedBefore := ModifiedBefore + Self.ModifiedBeforeTime.Time;
    if Self.MAD.Checked then
      ModifiedAfter := Self.ModifiedAfterDate.Date;
    if Self.MAT.Checked then
      ModifiedAfter := ModifiedAfter + Self.ModifiedAfterTime.Time;
    // Accessed on
    if Self.ABD.Checked then
      AccessedBefore := Self.AccessedBeforeDate.Date;
    if Self.ABT.Checked then
      AccessedBefore := AccessedBefore + Self.AccessedBeforeTime.Time;
    if Self.AAD.Checked then
      AccessedAfter := Self.AccessedAfterDate.Date;
    if Self.AAT.Checked then
      AccessedAfter := AccessedAfter + Self.AccessedAfterTime.Time;
  end;
  // Begins search
  FindFile.Execute;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  BackupFileList := TStringList.Create;
  BackupFileList.Clear;

  L_bStop := False;
end;

procedure TForm1.FindFileFileMatch(Sender: TObject;
  const FileInfo: TFileDetails);
begin
  BackupFileList.Add(FileInfo.name);
end;

procedure TForm1.FindFileSearchFinish(Sender: TObject);
var
  i : integer;

begin
  cmb_FileList.Items.Clear;
  cmb_FileList.Items.Add('전체');
  cmb_FileList.ItemIndex := 0;
  BackupFileList.Sort;
  for i := 0 to BackupFileList.Count - 1 do
  begin
    cmb_FileList.Items.Add(BackupFileList.Strings[i]);
  end;

end;

function TForm1.FileDBRestor(aImportFileName: string): Boolean;
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

  if (UpperCase(targetName) = 'TB_ZIPCODE')  then
  begin
    ga_Table.Progress := ga_Table.MaxValue;
    Ga_Tot.Progress := Ga_Tot.Progress + 1;
    result := True;
    Exit;
  end;

  if UpperCase(targetName) = 'TB_EMPHIS' then
  begin
    ga_Table.Progress := ga_Table.MaxValue;
    Ga_Tot.Progress := Ga_Tot.Progress + 1;
    result := True; //TB_EMPHIS 테이블은 복구 하지 말자. Serial 부분 때문에 문제 발생함
    Exit;
  end;
  if UpperCase(targetName) = 'TB_CLIENTSOCK' then
  begin
    ga_Table.Progress := ga_Table.MaxValue;
    Ga_Tot.Progress := Ga_Tot.Progress + 1;
    result := True; //TB_CLIENTSOCK 테이블은 복구 하지 말자. Serial 부분 때문에 문제 발생함
    Exit;
  end;
  if UpperCase(targetName) = 'TB_FACECOP' then
  begin
    ga_Table.Progress := ga_Table.MaxValue;
    Ga_Tot.Progress := Ga_Tot.Progress + 1;
    result := True; //TB_FACECOP 테이블은 복구 하지 말자. Serial 부분 때문에 문제 발생함
    Exit;
  end;
  if UpperCase(targetName) = 'TB_MAPPOSITION' then
  begin
    ga_Table.Progress := ga_Table.MaxValue;
    Ga_Tot.Progress := Ga_Tot.Progress + 1;
    result := True; //TB_FACECOP 테이블은 복구 하지 말자. Serial 부분 때문에 문제 발생함
    Exit;
  end;

//  targetName := copy(targetName,9,Length(targetName) - 8);
  lbl_Table.Caption := '[' + targetName + '] 테이블 복구중...';
  Screen.Cursor              := crSQLWait;

{  if Not DropTable(targetName) then
  begin
    showmessage(targetName + ' 테이블 삭제 오류입니다.');
    Exit;
  end; }
  DropTable(targetName);
  if Not CreateTable(targetName) then
  begin
    //showmessage(targetName +' 테이블 생성 오류입니다.');
    Exit;
  end;


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

procedure TForm1.btn_DBRecoveryClick(Sender: TObject);
var
  i : integer;
  stSql : string;
begin
  if Application.MessageBox(PChar('데이터 복구시 현재 데이터는 모두 사라집니다.복구를 진행하시겠습니까?'),PChar('경고'),MB_YESNO) = IDNO then Exit;
  if Not targetAdoConnect then
  begin
    showmessage('타겟데이터베이스 접속환경을 확인하세요.');
    Exit;
  end;
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
          //break;
        end;
      end;
    end;
    stSql := ' Update TB_CONFIG set CO_CONFIGVALUE = ''1'' where CO_CONFIGGROUP = ''COMMON'' AND CO_CONFIGCODE = ''TABLE_VER'' ';
    with targetADOQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;

  end else
  begin
    Ga_Tot.MaxValue := 1;
    Ga_Tot.Progress := 0;
    FileDBRestor(ed_BackupDir.Text + '\' + cmb_FileList.Text);
  end;
  lbl_Table.Caption := '데이터 복구 완료';
  showmessage('복구완료');
  btn_DBRecovery.Enabled := True;
  btn_Stop.Enabled := False;

end;

procedure TForm1.btn_StopClick(Sender: TObject);
begin
  L_bStop := True;
end;

procedure TForm1.SetDBType(const Value: string);
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

function TForm1.CreateTable(aTableName: string): Boolean;
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
        stSql := StringReplace(stSql,'seq INTEGER NOT NULL  DEFAULT nextval(''tb_clientsock_seq_seq''::regclass)','seq serial NOT NULL',[rfReplaceAll]);
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

function TForm1.DropTable(aTableName: string): Boolean;
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

end.
