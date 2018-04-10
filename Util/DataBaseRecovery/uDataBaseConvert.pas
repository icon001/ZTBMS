unit uDataBaseConvert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Gauges, DB, ADODB, FolderDialog,
  Grids, DBGrids, FindFile, ComCtrls;

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

    { Private declarations }
    Function targetAdoConnect : Boolean;


  public
    BackupFileList : TStringList;
    L_bStop : Boolean;
    { Public declarations }
    procedure BackupFileLoad;
    Function FileDBRestor(aImportFileName:string):Boolean;
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
    ed_targetUserPw.Text := '1';
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
begin
  FolderDialog1.Title := '백업 폴더 찾기';

  if FolderDialog1.Execute then
  begin
    ed_BackupDir.Text := FolderDialog1.Directory;
    BackupFileList.Clear;
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
    FileName := '*.*';
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
begin
  result := False;
  if Not FileExists(aImportFileName) then Exit;
  targetName := ExtractFileName(aImportFileName);
  targetName := ChangeFileExt(targetName,'');
//  targetName := copy(targetName,9,Length(targetName) - 8);
  lbl_Table.Caption := '[' + targetName + '] 테이블 복구중...';
  Screen.Cursor              := crSQLWait;

  if rg_targetDBType.ItemIndex = 0 then
  begin
    q:= '''';
    fldStr     := '';
    ValStr     := '';
    QryList    := TstringList.Create;
    QryList.Clear;
    TblImport.Close;
    TblImport.LoadFromFile(aImportFileName);
    if TblImport.IsEmpty() then begin
      QryList.Free;
      Exit;
    end;
    ga_Table.MaxValue := TblImport.RecordCount;
    ga_Table.Progress := 0;

    delStr:='';
    for i := 0 to (TblImport.FieldCount - 1)  do begin
      if L_bStop then Exit;
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
    QryList.Free;
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

end;

procedure TForm1.btn_DBRecoveryClick(Sender: TObject);
var
  i : integer;
begin
  if Not targetAdoConnect then
  begin
    showmessage('타겟데이터베이스 접속환경을 확인하세요.');
    Exit;
  end;
  L_bStop := False;

  btn_DBRecovery.Enabled := False;

  if cmb_FileList.ItemIndex = 0 then
  begin
    Ga_Tot.MaxValue := BackupFileList.Count;
    Ga_Tot.Progress := 0;
    for i := 0 to BackupFileList.Count - 1 do
    begin
      if Not L_bStop then
        FileDBRestor(ed_BackupDir.Text + '\' + BackupFileList.Strings[i]);
    end;
  end else
  begin
    Ga_Tot.MaxValue := 1;
    Ga_Tot.Progress := 0;
    FileDBRestor(ed_BackupDir.Text + '\' + cmb_FileList.Text);
  end;

  btn_DBRecovery.Enabled := True;

end;

procedure TForm1.btn_StopClick(Sender: TObject);
begin
  L_bStop := True;
end;

end.
