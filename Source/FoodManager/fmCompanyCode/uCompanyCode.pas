unit uCompanyCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  Gauges,ADODB, uSubForm, CommandArray,ActiveX;

type
  TfmCompanyCode = class(TfmASubForm)
    pc_Work: TPageControl;
    CompanyTab: TTabSheet;
    DepartTab: TTabSheet;
    PosiTab: TTabSheet;
    Panel2: TPanel;
    sg_CompanyCode: TAdvStringGrid;
    Splitter1: TSplitter;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ed_CompanyCode: TEdit;
    ed_CompanyName: TEdit;
    ed_CompanyCharge: TEdit;
    ed_companyTelnum: TEdit;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ed_DepartCode: TEdit;
    ed_DepartName: TEdit;
    ed_DepartCharge: TEdit;
    ed_DepartTelnum: TEdit;
    Splitter2: TSplitter;
    Panel5: TPanel;
    sg_DepartCode: TAdvStringGrid;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    cmb_Company2: TComboBox;
    cmb_CompanyCode2: TComboBox;
    Label10: TLabel;
    Panel6: TPanel;
    GroupBox5: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    ed_posicode: TEdit;
    ed_posiname: TEdit;
    Splitter3: TSplitter;
    Panel7: TPanel;
    sg_Posi: TAdvStringGrid;
    ZipTab: TTabSheet;
    Panel8: TPanel;
    StaticText1: TStaticText;
    ed_Sdong: TEdit;
    btn_zipcodesearch: TSpeedButton;
    Panel9: TPanel;
    sg_Zipcode: TAdvStringGrid;
    Panel10: TPanel;
    StaticText2: TStaticText;
    ed_sido: TEdit;
    StaticText3: TStaticText;
    ed_gugun: TEdit;
    StaticText4: TStaticText;
    ed_dong: TEdit;
    StaticText5: TStaticText;
    ed_bunji: TEdit;
    RzOpenDialog1: TOpenDialog;
    Gauge1: TGauge;
    StaticText6: TStaticText;
    ed_zipcode: TEdit;
    StatusBar1: TStatusBar;
    GroupBox6: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_ZipFileUpload: TSpeedButton;
    Panel12: TPanel;
    btn_Cancel: TSpeedButton;
    JijumTab: TTabSheet;
    Panel1: TPanel;
    sg_jijumCode: TAdvStringGrid;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    cmb_Company1: TComboBox;
    Panel11: TPanel;
    GroupBox7: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    ed_jijumcode: TEdit;
    ed_jijumname: TEdit;
    ed_jijumCharge: TEdit;
    ed_jijumTelnum: TEdit;
    cmb_CompanyCode1: TComboBox;
    Splitter4: TSplitter;
    cmb_jijumCode2: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    cmb_jijum2: TComboBox;
    Label21: TLabel;
    cmb_CompanyCode3: TComboBox;
    GroupBox8: TGroupBox;
    Label22: TLabel;
    cmb_Company3: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure pc_WorkChange(Sender: TObject);
    procedure btn_ZipFileUploadClick(Sender: TObject);
    procedure btn_zipcodesearchClick(Sender: TObject);
    procedure sg_ZipcodeClick(Sender: TObject);
    procedure ed_SdongKeyPress(Sender: TObject; var Key: Char);
    procedure ed_zipcodeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_sidoKeyPress(Sender: TObject; var Key: Char);
    procedure ed_gugunKeyPress(Sender: TObject; var Key: Char);
    procedure ed_dongKeyPress(Sender: TObject; var Key: Char);
    procedure ed_bunjiKeyPress(Sender: TObject; var Key: Char);
    procedure PosiTabShow(Sender: TObject);
    procedure sg_PosiClick(Sender: TObject);
    procedure CompanyTabShow(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure sg_CompanyCodeClick(Sender: TObject);
    procedure DepartTabShow(Sender: TObject);
    procedure sg_DepartCodeClick(Sender: TObject);
    procedure cmb_Company2Change(Sender: TObject);
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure ed_CompanyCodeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_CompanyNameKeyPress(Sender: TObject; var Key: Char);
    procedure ed_CompanyChargeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_companyTelnumKeyPress(Sender: TObject; var Key: Char);
    procedure ed_DepartCodeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_DepartNameKeyPress(Sender: TObject; var Key: Char);
    procedure ed_DepartChargeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_DepartTelnumKeyPress(Sender: TObject; var Key: Char);
    procedure ed_posicodeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_posinameKeyPress(Sender: TObject; var Key: Char);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JijumTabShow(Sender: TObject);
    procedure cmb_Company1Change(Sender: TObject);
    procedure sg_jijumCodeClick(Sender: TObject);
    procedure cmb_CompanyCode2Change(Sender: TObject);
    procedure cmb_Company3Change(Sender: TObject);
  private
    { Private declarations }
    State:string;
    JijumCodeList : TStringList;

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    Function InsertTB_Company(aCompanyCode,aJijumCode,aDepartCode,aCompanyName,aCompanyCharge,aCompanyTelnum,aGubun:string):Boolean;
    Function UpdateTB_Company(aCompanyCode,aJijumCode,aDepartCode,aCompanyName,aCompanyCharge,aCompanyTelnum,aGubun:string):Boolean;
    Function DeleteTB_Company(aCompanyCode,aJijumCode,aDepartCode,aGubun:string):Boolean;
    Function InsertTB_Posi(aCompanyCode,aPosiCode,aPosiName:string):Boolean;
    Function UpdateTB_Posi(aCompanyCode,aPosiCode,aPosiName:string):Boolean;
    Function DeleteTB_Posi(aCompanyCode,aPosiCode:string):Boolean;
    Function InsertTB_ZIPCODE(aZipData:string):Boolean;
    Function UpdateTB_ZIPCODE(aZipData:string):Boolean;
    Function DeleteTB_ZIPCODE(aZipCode:string):Boolean;
    procedure StringGrideClear(StringGrid : TStringGrid);

    procedure ShowCompanyCode(aCode:string);
    procedure ShowPosiCode(aCode:string);
    procedure ShowJijumCode(aCode:string);
    procedure LoadCompanyCode;
    procedure LoadJijum(aCompanyCode:string);
    procedure LoadJijumCode;
    procedure ShowDepartCode(aCode:string);
    procedure ShowZipCode(aCode:string);

  public
    { Public declarations }
    WorkCode : integer;
  end;

var
  fmCompanyCode: TfmCompanyCode;
  ZipList : TStringList;

implementation

uses
  uDataModule1;
{$R *.dfm}

procedure TfmCompanyCode.FormShow(Sender: TObject);
begin

  if (WorkCode < 0) or (workCode > 4) then WorkCode := 0;
  pc_Work.ActivePageIndex := WorkCode;

  fmCompanyCode.Caption := pc_Work.ActivePage.Caption;
  Panel12.Caption := pc_Work.ActivePage.Caption;

  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;

end;

procedure TfmCompanyCode.pc_WorkChange(Sender: TObject);
begin
  fmCompanyCode.Caption := pc_Work.ActivePage.Caption;
  Panel12.Caption := pc_Work.ActivePage.Caption;
end;

procedure TfmCompanyCode.btn_ZipFileUploadClick(Sender: TObject);
var
  nLoop : integer;
begin
  ZipList := TStringList.Create;
  ZipList.Clear;

  RzOpenDialog1.Title:= '우편번호데이터 찾기';
  RzOpenDialog1.DefaultExt:= 'csv';
  RzOpenDialog1.Filter := 'CSV files (*.csv)|*.CSV';
  if RzOpenDialog1.Execute then
  begin
    ZipList.Clear;
    ZipList.LoadFromFile(RzOpenDialog1.FileName)
  end else
  begin
    ZipList.Free;
    Exit;
  end;

  gauge1.Visible := True;
  gauge1.MaxValue := ZipList.Count - 1;

  for nLoop := 1 to ZipList.Count - 1 do
  begin
    gauge1.Progress := nLoop;
    Application.ProcessMessages;
    
    if Not InsertTB_ZIPCODE(ZipList.Strings[nLoop]) then
      UpdateTB_ZIPCODE(ZipList.Strings[nLoop]);

  end;

  gauge1.Visible := False;
  ZipList.Free;
end;

function TfmCompanyCode.InsertTB_ZIPCODE(aZipData: string): Boolean;
var
  zipcodeList : TStringList;
  stSql : string;
begin
  result := False;

  zipcodeList := TStringList.Create;
  zipcodeList.Delimiter := ',';
  zipcodeList.DelimitedText := aZipData;

  stSql := 'Insert Into TB_ZIPCODE ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ZI_ZIPCODE,';
  stSql := stSql + ' ZI_SIDO,';
  stSql := stSql + ' ZI_GUGUN,';
  stSql := stSql + ' ZI_DONG,';
  stSql := stSql + ' ZI_BUNJI) ';
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + zipcodeList.Strings[0] + ''',';
  stSql := stSql + '''' + zipcodeList.Strings[1] + ''',';
  stSql := stSql + '''' + zipcodeList.Strings[2] + ''',';
  stSql := stSql + '''' + zipcodeList.Strings[3] + ''',';
  stSql := stSql + '''' + zipcodeList.Strings[4] + ''')';

  with DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSQL;
    Except
      zipcodeList.Free;
      Exit;
    End;
  end;

  zipcodeList.Free;
  result := True;
end;

function TfmCompanyCode.UpdateTB_ZIPCODE(aZipData: string): Boolean;
var
  zipcodeList : TStringList;
  stSql : string;
begin
  result := False;
  zipcodeList := TStringList.Create;
  zipcodeList.Delimiter := ',';
  zipcodeList.DelimitedText := aZipData;

  stSql := 'Update TB_ZIPCODE ';
  stSql := stSql + ' Set ';
  stSql := stSql + ' ZI_SIDO = ''' + zipcodeList.Strings[1] + ''',';
  stSql := stSql + ' ZI_GUGUN = ''' + zipcodeList.Strings[2] + ''',';
  stSql := stSql + ' ZI_DONG = ''' + zipcodeList.Strings[3] + ''',';
  stSql := stSql + ' ZI_BUNJI = ''' + zipcodeList.Strings[4] + ''' ';
  stSql := stSql + ' where ZI_ZIPCODE = ''' + zipcodeList.Strings[0] + '''';

  with DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSQL;
    Except
      zipcodeList.Free;
      Exit;
    End;
  end;

  zipcodeList.Free;
  result := True;
end;

procedure TfmCompanyCode.btn_zipcodesearchClick(Sender: TObject);

begin
  ShowZipCode('');
end;

procedure TfmCompanyCode.StringGrideClear(StringGrid: TStringGrid);
var
  i : integer;
begin
  StringGrid.RowCount := 2;
  for i:= 0 to StringGrid.ColCount - 1 do
  begin
    StringGrid.Cells[i,1] := '';
  end;
end;

procedure TfmCompanyCode.sg_ZipcodeClick(Sender: TObject);
var
  stString : string;
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_zipcode.Text := cells[0,Row];
    ed_sido.Text := cells[1,Row];
    ed_gugun.Text := cells[2,Row];
    ed_dong.Text := cells[3,Row];
    ed_bunji.Text := cells[4,Row];
  end;

end;

function TfmCompanyCode.DeleteTB_ZIPCODE(aZipCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete from TB_ZIPCODE ';
  stSql := stSql + ' where ZI_ZIPCODE = ''' + aZipCode + ''' ';

  with DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;


  result := True;
end;

procedure TfmCompanyCode.ed_SdongKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    btn_zipcodesearchClick(self);
  end;
end;

procedure TfmCompanyCode.ed_zipcodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    ed_sido.SetFocus;
  end;

end;

procedure TfmCompanyCode.ed_sidoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    ed_gugun.SetFocus;
  end;

end;

procedure TfmCompanyCode.ed_gugunKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    ed_dong.SetFocus;
  end;

end;

procedure TfmCompanyCode.ed_dongKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    ed_bunji.SetFocus;
  end;

end;

procedure TfmCompanyCode.ed_bunjiKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
  end;

end;

procedure TfmCompanyCode.PosiTabShow(Sender: TObject);
begin
  LoadCompanyCode;
  ShowPosiCode('');
end;

procedure TfmCompanyCode.ShowPosiCode(aCode:string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_Posi); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_POSI ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if cmb_Company3.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + copy(cmb_Company3.Text,1,3) + ''' ';
  end;

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    with sg_Posi do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('PO_POSICODE').AsString;
        cells[1,nRow] := FindField('PO_NAME').AsString;
        cells[2,nRow] := FindField('CO_COMPANYCODE').AsString;
        if (FindField('CO_COMPANYCODE').AsString + FindField('PO_POSICODE').AsString )  = aCode then
        begin
          SelectRows(nRow,1);
        end;

        nRow := nRow + 1;
        Next;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_PosiClick(sg_Posi);
end;

procedure TfmCompanyCode.sg_PosiClick(Sender: TObject);
var
  i : integer;
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    for i := 0 to cmb_CompanyCode3.Items.Count - 1 do
    begin
      if copy(cmb_CompanyCode3.Items.Strings[i],1,3) = cells[2,Row] then
      begin
        cmb_CompanyCode3.ItemIndex := i;
        break;
      end;
    end;
    ed_posicode.Text := cells[0,Row];
    ed_posiname.Text := cells[1,Row];
  end;

end;

function TfmCompanyCode.InsertTB_Posi(aCompanyCode,aPosiCode,
  aPosiName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_POSI( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' PO_NAME )';
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aPosiName + '''';
  stSql := stSql + ')';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;

  result := True;

end;

function TfmCompanyCode.UpdateTB_Posi(aCompanyCode,aPosiCode,
  aPosiName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_POSI set ';
  stSql := stSql + ' PO_NAME = ''' + aPosiName + '''';
  stSql := stSql + ' where PO_POSICODE =''' + aPosiCode + '''';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + '''';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;

  result := True;
end;

function TfmCompanyCode.DeleteTB_Posi(aCompanyCode,aPosiCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_POSI ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And CO_COMPANYCODE = ''' + aCompanyCode + '''';
  if aPosiCode <> '' then
    stSql := stSql + ' And PO_POSICODE = ''' + aPosiCode + '''';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;


  end;
  result := True;
end;

procedure TfmCompanyCode.ShowCompanyCode(aCode:string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin

  GridInitialize(sg_CompanyCode); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''1'' ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    with sg_CompanyCode do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[1,nRow] := FindField('CO_NAME').AsString;
        cells[2,nRow] := FindField('CO_CHARGE').AsString;
        cells[3,nRow] := FindField('CO_TELNUM').AsString;
        if (FindField('CO_COMPANYCODE').AsString )  = aCode then
        begin
          SelectRows(nRow,1);
        end;

        nRow := nRow + 1;
        Next;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_CompanyCodeClick(sg_CompanyCode);
end;

procedure TfmCompanyCode.CompanyTabShow(Sender: TObject);
begin
  LoadCompanyCode;

  ShowCompanyCode('');
end;

procedure TfmCompanyCode.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  if pc_Work.ActivePage.Name = 'CompanyTab' then
  begin
    with sg_CompanyCode do
    begin
      if Cells[0,1] <> '' then
      begin
        AddRow;
        SelectRows(RowCount - 1,1);
        Enabled := True;
        if RowCount > 5 then TopRow := RowCount - 5;
        Enabled := False;
      end;
    end;
    ed_Companycode.SetFocus;
  end
  else if pc_Work.ActivePage.Name = 'JijumTab' then
  begin
    with sg_JijumCode do
    begin
      if Cells[0,1] <> '' then
      begin
        AddRow;
        SelectRows(RowCount - 1,1);
        Enabled := True;
        if RowCount > 5 then TopRow := RowCount - 5;
        Enabled := False;
      end;
    end;
    ed_jijumcode.SetFocus;
  end
  else if pc_Work.ActivePage.Name = 'DepartTab' then
  begin
    with sg_DepartCode do
    begin
      if Cells[0,1] <> '' then
      begin
        AddRow;
        SelectRows(RowCount - 1,1);
        Enabled := True;
        if RowCount > 5 then TopRow := RowCount - 5;
        Enabled := False;
      end;
    end;
    ed_Departcode.SetFocus;
  end
  else if pc_Work.ActivePage.Name = 'PosiTab' then
  begin
    with sg_Posi do
    begin
      if Cells[0,1] <> '' then
      begin
        AddRow;
        SelectRows(RowCount - 1,1);
        Enabled := True;
        if RowCount > 5 then TopRow := RowCount - 5;
        Enabled := False;
      end;
    end;
    ed_posicode.SetFocus;
  end
  else if pc_Work.ActivePage.Name = 'ZipTab' then
  begin
    with sg_Posi do
    begin
      if Cells[0,1] <> '' then
      begin
        AddRow;
        SelectRows(RowCount - 1,1);
        Enabled := True;
        if RowCount > 5 then TopRow := RowCount - 5;
        Enabled := False;
      end;
    end;
    ed_zipcode.SetFocus;
  end;

end;

procedure TfmCompanyCode.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);
  if pc_Work.ActivePage.Name = 'CompanyTab' then ed_Companyname.SetFocus
  else if pc_Work.ActivePage.Name = 'JijumTab' then ed_Jijumname.SetFocus
  else if pc_Work.ActivePage.Name = 'DepartTab' then ed_Departname.SetFocus
  else if pc_Work.ActivePage.Name = 'PosiTab' then ed_posiname.SetFocus
  else if pc_Work.ActivePage.Name = 'ZipTab' then ed_sido.SetFocus;

end;

procedure TfmCompanyCode.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
  stCompanyCode : string;
  stJijumCode : string;
  stZipData : string;
begin
  if pc_Work.ActivePage.Name = 'CompanyTab' then
  begin
    if Length(ed_Companycode.Text) <> 3 then
    begin
      showmessage('회사코드는 3자리 고정입니다.');
      Exit;
    end;
    if UpperCase(State) = 'INSERT' then
      bResult := InsertTB_Company(ed_Companycode.Text,'000','000',ed_Companyname.Text,ed_CompanyCharge.Text,ed_CompanyTelNum.Text,'1')
    else if UpperCase(State) = 'UPDATE' then
      bResult := UpdateTB_Company(ed_Companycode.Text,'000','000',ed_Companyname.Text,ed_CompanyCharge.Text,ed_CompanyTelNum.Text,'1');

    if bResult then ShowCompanyCode(ed_Companycode.Text)
    else showmessage('저장실패');
  end else if pc_Work.ActivePage.Name = 'JijumTab' then
  begin
    if Length(ed_JijumCode.Text) <> 3 then
    begin
      showmessage('지점코드는 3자리 고정입니다.');
      Exit;
    end;
    if Trim(cmb_CompanyCode1.Text) = '' then
    begin
      showmessage('회사코드를 선택해 주셔야 합니다.');
      Exit;
    end;
    stCompanyCode := copy(cmb_CompanyCode1.Text,1,3);
    if UpperCase(State) = 'INSERT' then
      bResult := InsertTB_Company(stCompanyCode,ed_JijumCode.Text,'000',ed_jijumname.Text,ed_jijumCharge.Text,ed_jijumTelNum.Text,'2')
    else if UpperCase(State) = 'UPDATE' then
      bResult := UpdateTB_Company(stCompanyCode,ed_JijumCode.Text,'000',ed_jijumname.Text,ed_jijumCharge.Text,ed_jijumTelNum.Text,'2');

    if bResult then ShowJijumCode(stCompanyCode + ed_jijumcode.Text)
    else showmessage('저장실패');
  end else if pc_Work.ActivePage.Name = 'DepartTab' then
  begin
    if Length(ed_DepartCode.Text) <> 3 then
    begin
      showmessage('부서코드는 3자리 고정입니다.');
      Exit;
    end;
    if Trim(cmb_CompanyCode2.Text) = '' then
    begin
      showmessage('회사코드를 선택해 주셔야 합니다.');
      Exit;
    end;
    stCompanyCode := copy(cmb_CompanyCode2.Text,1,3);
    if Trim(cmb_jijumCode2.Text) = '' then
    begin
      showmessage('지점코드를 선택해 주셔야 합니다.');
      Exit;
    end;
    stJijumCode := copy(cmb_jijumCode2.Text,1,3);
    if UpperCase(State) = 'INSERT' then
      bResult := InsertTB_Company(stCompanyCode,stJijumCode,ed_DepartCode.Text,ed_Departname.Text,ed_DepartCharge.Text,ed_DepartTelNum.Text,'3')
    else if UpperCase(State) = 'UPDATE' then
      bResult := UpdateTB_Company(stCompanyCode,stJijumCode,ed_DepartCode.Text,ed_Departname.Text,ed_DepartCharge.Text,ed_DepartTelNum.Text,'3');

    if bResult then ShowDepartCode(stCompanyCode + stJijumCode + ed_DepartCode.Text)
    else showmessage('저장실패');
  end else if pc_Work.ActivePage.Name = 'PosiTab' then
  begin
    if Trim(cmb_CompanyCode3.Text) = '' then
    begin
      showmessage('회사코드를 선택해 주셔야 합니다.');
      Exit;
    end;
    stCompanyCode := copy(cmb_CompanyCode3.Text,1,3);
    if UpperCase(State) = 'INSERT' then bResult := InsertTB_Posi(stCompanyCode,ed_posicode.Text,ed_posiname.Text)
    else if UpperCase(State) = 'UPDATE' then bResult := UpdateTB_Posi(stCompanyCode,ed_posicode.Text,ed_posiname.Text);

    if bResult then ShowPosiCode(ed_posicode.Text)
    else showmessage('저장실패');
  end else if pc_Work.ActivePage.Name = 'ZipTab' then
  begin
    btn_update.Enabled := False;
    stZipData := ed_zipcode.Text + ',' + ed_sido.Text + ','  +
                 ed_gugun.Text + ',' + ed_dong.Text + ','  +
                 ed_bunji.Text ;
    if UpperCase(State) = 'INSERT' then  bResult := InsertTB_ZIPCODE(stZipData)
    else if UpperCase(State) = 'UPDATE' then bResult := UpdateTB_ZIPCODE(stZipData);

    if Not bResult then
    begin
      showmessage('저장실패');
      exit;
    end;
    btn_zipcodeSearchClick(self);
  end;

end;

function TfmCompanyCode.InsertTB_Company(aCompanyCode,aJijumCode,aDepartCode, aCompanyName,
  aCompanyCharge, aCompanyTelnum,aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_COMPANY( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_JIJUMCODE,';
  stSql := stSql + ' CO_DEPARTCODE,';
  stSql := stSql + ' CO_NAME,';
  stSql := stSql + ' CO_GUBUN,';
  stSql := stSql + ' CO_CHARGE,';
  stSql := stSql + ' CO_TELNUM )';
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aCompanyName + ''',';
  stSql := stSql + '''' + aGubun + ''',';
  stSql := stSql + '''' + aCompanyCharge + ''',';
  stSql := stSql + '''' + aCompanyTelnum + '''';
  stSql := stSql + ')';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;

  result := True;
end;

function TfmCompanyCode.UpdateTB_Company(aCompanyCode,aJijumCode,aDepartCode, aCompanyName,
  aCompanyCharge, aCompanyTelnum,aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_COMPANY set ';
  stSql := stSql + ' CO_NAME = ''' + aCompanyName + ''',';
  stSql := stSql + ' CO_CHARGE = ''' + aCompanyCharge + ''',';
  stSql := stSql + ' CO_TELNUM = ''' + aCompanyTelnum + ''' ';
  stSql := stSql + ' where GROUP_CODE =''' + GROUPCODE + '''';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + '''';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + '''';
  stSql := stSql + ' AND CO_DEPARTCODE = ''' + aDepartCode + '''';
  stSql := stSql + ' AND CO_GUBUN = ''' + aGubun + '''' ;

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;

  result := True;
end;

procedure TfmCompanyCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
  stCompanyCode : string;
  stJijumCode : string;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  if pc_Work.ActivePage.Name = 'CompanyTab' then
  begin
    bResult := DeleteTB_Company(ed_Companycode.Text,'000','000','1');
    bResult := DeleteTB_Posi(ed_Companycode.Text,'');

    if bResult then ShowCompanyCode('')
    else showmessage('삭제실패.');
  end else if pc_Work.ActivePage.Name = 'JijumTab' then
  begin
    stCompanyCode := copy(cmb_CompanyCode1.Text,1,3);
    bResult := DeleteTB_Company(stCompanyCode,ed_jijumCode.Text,'000','2');

    if bResult then ShowJijumCode('')
    else showmessage('삭제실패.');
  end else if pc_Work.ActivePage.Name = 'DepartTab' then
  begin
    stCompanyCode := copy(cmb_CompanyCode2.Text,1,3);
    stJijumCode := copy(cmb_JijumCode2.Text,1,3);
    bResult := DeleteTB_Company(stCompanyCode,stJijumCode,ed_DepartCode.Text,'3');

    if bResult then ShowDepartCode('')
    else showmessage('삭제실패.');
  end else if pc_Work.ActivePage.Name = 'PosiTab' then
  begin
    stCompanyCode := copy(cmb_CompanyCode3.Text,1,3);
    if ed_posicode.Text = '' then
    begin
      showmessage('삭제할 직위코드가 없습니다.');
      Exit;
    end;
    bResult := DeleteTB_Posi(stCompanyCode,ed_posicode.Text);

    if bResult then ShowPosiCode('')
    else showmessage('삭제실패.');
  end else if pc_Work.ActivePage.Name = 'ZipTab' then
  begin
    btn_delete.Enabled := False;

    bResult := DeleteTB_ZIPCODE(ed_zipcode.Text);

    if bResult then ShowZipCode('')
    else showmessage('삭제실패.');
  end;

end;

function TfmCompanyCode.DeleteTB_Company(aCompanyCode,aJijumCode, aDepartCode,
  aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And CO_COMPANYCODE = ''' + aCompanyCode + '''';
  if aGubun <> '1' then
  begin
    stSql := stSql + ' And CO_JIJUMCODE = ''' + aJijumCode + '''';
    if aGubun <> '2' then
    stSql := stSql + ' And CO_DEPARTCODE = ''' + aDepartCode + '''';
  end;
  //stSql := stSql + ' And CO_GUBUN = ''' + aGubun + '''';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;


  end;
  result := True;
end;

procedure TfmCompanyCode.sg_CompanyCodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_Companycode.Text := cells[0,Row];
    ed_Companyname.Text := cells[1,Row];
    ed_CompanyCharge.Text := cells[2,Row];
    ed_CompanyTelnum.Text := cells[3,Row];
  end;

end;

procedure TfmCompanyCode.DepartTabShow(Sender: TObject);
begin
  LoadCompanyCode;
  LoadJijumCode;
  ShowDepartCode('');
end;

procedure TfmCompanyCode.LoadCompanyCode;
var
  stSql : string;
  stStr : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Company1.Clear;
  cmb_Company2.Clear;
  cmb_Company3.Clear;
  cmb_CompanyCode1.Clear;
  cmb_CompanyCode2.Clear;
  cmb_CompanyCode3.Clear;

  stSql := 'Select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND CO_GUBUN = ''1'' ';

  cmb_Company1.Items.Add('000.전체');
  cmb_Company2.Items.Add('000.전체');
  cmb_Company3.Items.Add('000.전체');
  cmb_CompanyCode1.Items.Add('');
  cmb_CompanyCode2.Items.Add('');
  cmb_CompanyCode3.Items.Add('');

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    First;
    While Not Eof do
    begin
      stStr := FindField('CO_COMPANYCODE').AsString + '.' + FindField('CO_NAME').AsString;

      cmb_Company1.Items.Add(stStr);
      cmb_Company2.Items.Add(stStr);
      cmb_Company3.Items.Add(stStr);
      cmb_CompanyCode1.Items.Add(stStr);
      cmb_CompanyCode2.Items.Add(stStr);
      cmb_CompanyCode3.Items.Add(stStr);
      Next;
    end;
    cmb_Company1.ItemIndex := 0;
    cmb_Company2.ItemIndex := 0;
    cmb_Company3.ItemIndex := 0;
    cmb_CompanyCode1.ItemIndex := 0;
    cmb_CompanyCode2.ItemIndex := 0;
    cmb_CompanyCode3.ItemIndex := 0;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmCompanyCode.ShowDepartCode(aCode:string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_DepartCode); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''3'' ';
  if copy(cmb_Company2.Text,1,3) <> '000' then
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + copy(cmb_Company2.Text,1,3) + ''' ';
  if cmb_Jijum2.ItemIndex > 0 then
    stSql := stSql + ' AND CO_JIJUMCODE = ''' + copy(cmb_Jijum2.Text,1,3) + ''' ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    First;
    with sg_DepartCode do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('CO_DEPARTCODE').AsString;
        cells[1,nRow] := FindField('CO_NAME').AsString;
        cells[2,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[3,nRow] := FindField('CO_JIJUMCODE').AsString;
        cells[4,nRow] := FindField('CO_CHARGE').AsString;
        cells[5,nRow] := FindField('CO_TELNUM').AsString;
        if (FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString + FindField('CO_DEPARTCODE').AsString)  = aCode then
        begin
          SelectRows(nRow,1);
        end;

        nRow := nRow + 1;
        Next;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_DepartCodeClick(sg_DepartCode);
end;

procedure TfmCompanyCode.sg_DepartCodeClick(Sender: TObject);
var
  i : integer;
  stStr : string;
  bResult : Boolean;
  nIndex : integer;
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  LoadJijumCode;
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_Departcode.Text := cells[0,Row];
    ed_Departname.Text := cells[1,Row];
    ed_DepartCharge.Text := cells[4,Row];
    ed_DepartTelnum.Text := cells[5,Row];
    nIndex := JijumCodeList.IndexOf(cells[2,Row] + cells[3,Row]);
    if nIndex >= 0 then cmb_jijumCode2.ItemIndex := nIndex;

    bResult := False;
    for i:= 1 to cmb_CompanyCode2.Items.Count - 1 do
    begin
      if copy(cmb_CompanyCode2.Items.Strings[i],1,3) = cells[2,Row] then
      begin
        bResult := True;
        break;
      end;
    end;
    
    if bResult then cmb_CompanyCode2.ItemIndex := i
    else cmb_CompanyCode2.ItemIndex := 0;

  end;

end;

procedure TfmCompanyCode.cmb_Company2Change(Sender: TObject);
begin
  LoadJijum(copy(cmb_Company2.Text,1,3));
  ShowDepartCode('');
end;

procedure TfmCompanyCode.StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  DataInCell : string;
  nLeft,nTop : integer;
begin
  if (AROW < (Sender as TStringGrid).FixedRows) then
  begin

    DataInCell := (Sender as TStringGrid).Cells[Acol,Arow];

    with (Sender as TStringGrid).Canvas do
    begin
      FillRect(Rect);  //켄버스를 칠한다.(기본값은 흰색)

      if DataInCell <> '' then
      begin
        nLeft := ((Rect.Right-Rect.Left) - TextWidth(DataInCell)) div 2;
        nTop := ((Rect.Bottom-Rect.Top) - TextHeight(DataInCell)) div 2;
        TextRect(Rect, Rect.Left + nLeft, Rect.Top + nTop, DataInCell);  //문자를 뿌려준다.. 기본은 검정색
      end;

    End;
  End;

end;

procedure TfmCompanyCode.FormCreate(Sender: TObject);
begin
  sg_CompanyCode.OnDrawCell:=StringGrideDrawCell;
  sg_DepartCode.OnDrawCell:=StringGrideDrawCell;
  sg_Posi.OnDrawCell:=StringGrideDrawCell;
  sg_zipCode.OnDrawCell:=StringGrideDrawCell;

  JijumCodeList := TStringList.Create;

end;

procedure TfmCompanyCode.FormActivate(Sender: TObject);
begin
  sg_CompanyCode.ColWidths[2] := 0;
  sg_CompanyCode.ColWidths[3] := 0;
  sg_DepartCode.ColWidths[2] := 0;
  sg_DepartCode.ColWidths[3] := 0;
  sg_DepartCode.ColWidths[4] := 0;
  LoadCompanyCode;
  btn_CancelClick(self);
end;

procedure TfmCompanyCode.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCompanyCode.ed_CompanyCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_CompanyName.SetFocus;
  end;
end;

procedure TfmCompanyCode.ed_CompanyNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_CompanyCharge.SetFocus;
  end;

end;

procedure TfmCompanyCode.ed_CompanyChargeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_companyTelnum.SetFocus;
  end;

end;

procedure TfmCompanyCode.ed_companyTelnumKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btn_SaveClick(Self);
  end;

end;

procedure TfmCompanyCode.ed_DepartCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_DepartName.SetFocus;
  end;

end;

procedure TfmCompanyCode.ed_DepartNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_DepartCharge.SetFocus;
  end;

end;

procedure TfmCompanyCode.ed_DepartChargeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_DepartTelnum.SetFocus;
  end;

end;

procedure TfmCompanyCode.ed_DepartTelnumKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btn_SaveClick(self);
  end;

end;

procedure TfmCompanyCode.ed_posicodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_posiname.SetFocus;
  end;

end;

procedure TfmCompanyCode.ed_posinameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btn_SaveClick(self);
  end;

end;

procedure TfmCompanyCode.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_Insert.Enabled := False;
    btn_update.Enabled := false;
    btn_Save.Enabled := True;
    btn_delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    if IsInsertGrade then  btn_Insert.Enabled := True;
    btn_Update.Enabled := False;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Insert.Enabled := False;
    btn_Update.Enabled := False;
    btn_Save.Enabled := True;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    if IsInsertGrade then  btn_Insert.Enabled := True;
    if IsUpdateGrade then btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;

end;

procedure TfmCompanyCode.FormClear;
begin
  //회사코드 Clear
  ed_Companycode.Text := '';
  ed_Companyname.Text := '';
  ed_CompanyCharge.Text := '';
  ed_companyTelnum.Text := '';

  //지점코드 Clear
  cmb_CompanyCode1.ItemIndex := 0;
  ed_jijumcode.Text := '';
  ed_jijumname.Text := '';
  ed_jijumCharge.Text := '';
  ed_jijumTelnum.Text := '';

  //부서코드 Clear
  cmb_CompanyCode2.ItemIndex := 0;
  cmb_jijumCode2.ItemIndex := 0;
  ed_Departcode.Text := '';
  ed_Departname.Text := '';
  ed_DepartCharge.Text := '';
  ed_DepartTelnum.Text := '';

  //직위코드 Clear
  cmb_CompanyCode3.ItemIndex := 0;
  ed_posicode.Text := '';
  ed_posiname.Text := '';

  //우편번호 Clear
  ed_zipcode.Text := '';
  ed_sido.Text := '';
  ed_gugun.Text := '';
  ed_dong.Text := '';
  ed_bunji.Text := '';

end;

procedure TfmCompanyCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    // 회사코드
    sg_CompanyCode.Enabled := False;
    ed_Companycode.Enabled := true;
    ed_Companyname.Enabled  := true;
    ed_CompanyCharge.Enabled  := true;
    ed_companyTelnum.Enabled  := true;
    //지점코드
    sg_jijumCode.Enabled := False;
    cmb_CompanyCode1.Enabled := True;
    ed_jijumcode.Enabled := true;
    ed_jijumname.Enabled  := true;
    ed_jijumCharge.Enabled  := true;
    ed_jijumTelnum.Enabled  := true;
    //부서코드
    sg_DepartCode.Enabled := False;
    cmb_CompanyCode2.Enabled := True;
    cmb_jijumCode2.Enabled := True;
    ed_Departcode.Enabled := true;
    ed_Departname.Enabled  := true;
    ed_DepartCharge.Enabled  := true;
    ed_DepartTelnum.Enabled  := true;
    //직위코드
    sg_Posi.Enabled := False;
    cmb_CompanyCode3.Enabled := true;
    ed_posicode.Enabled := true;
    ed_posiname.Enabled := true;
    //우편번호
    sg_Zipcode.Enabled := False;
    ed_bunji.Enabled := true;
    ed_dong.Enabled := true;
    ed_gugun.Enabled := True;
    ed_sido.Enabled := true;
    ed_zipcode.Enabled := true;

  end else if upperCase(aState) = 'SEARCH' then
  begin
    // 회사코드
    sg_CompanyCode.Enabled := True;
    ed_Companycode.Enabled := False;
    ed_Companyname.Enabled  := False;
    ed_CompanyCharge.Enabled  := False;
    ed_companyTelnum.Enabled  := False;
    //지점코드
    sg_jijumCode.Enabled := True;
    cmb_CompanyCode1.Enabled := False;
    ed_jijumcode.Enabled := False;
    ed_jijumname.Enabled  := False;
    ed_jijumCharge.Enabled  := False;
    ed_jijumTelnum.Enabled  := False;
    //부서코드
    sg_DepartCode.Enabled := True;
    cmb_CompanyCode2.Enabled := False;
    cmb_jijumCode2.Enabled := False;
    ed_Departcode.Enabled := False;
    ed_Departname.Enabled  := False;
    ed_DepartCharge.Enabled  := False;
    ed_DepartTelnum.Enabled  := False;
    //직위코드
    sg_Posi.Enabled := True;
    cmb_CompanyCode3.Enabled := False;
    ed_posicode.Enabled := False;
    ed_posiname.Enabled := False;
    //우편번호
    sg_Zipcode.Enabled := True;
    ed_bunji.Enabled := False;
    ed_dong.Enabled := False;
    ed_gugun.Enabled := False;
    ed_sido.Enabled := False;
    ed_zipcode.Enabled := False;

  end else if upperCase(aState) = 'UPDATE' then
  begin
    // 회사코드
    sg_CompanyCode.Enabled := False;
    ed_Companycode.Enabled := False;
    ed_Companyname.Enabled  := true;
    ed_CompanyCharge.Enabled  := true;
    ed_companyTelnum.Enabled  := true;
    //지점코드
    sg_jijumCode.Enabled := False;
    cmb_CompanyCode1.Enabled := False;
    ed_jijumcode.Enabled := False;
    ed_jijumname.Enabled  := true;
    ed_jijumCharge.Enabled  := true;
    ed_jijumTelnum.Enabled  := true;
    //부서코드
    sg_DepartCode.Enabled := False;
    cmb_CompanyCode2.Enabled := False;
    cmb_jijumCode2.Enabled := False;
    ed_Departcode.Enabled := False;
    ed_Departname.Enabled  := true;
    ed_DepartCharge.Enabled  := true;
    ed_DepartTelnum.Enabled  := true;
    //직위코드
    sg_Posi.Enabled := False;
    cmb_CompanyCode3.Enabled := False;
    ed_posicode.Enabled := False;
    ed_posiname.Enabled := true;
    //우편번호
    sg_Zipcode.Enabled := False;
    ed_bunji.Enabled := true;
    ed_dong.Enabled := true;
    ed_gugun.Enabled := True;
    ed_sido.Enabled := true;
    ed_zipcode.Enabled := False;
  end;
end;

procedure TfmCompanyCode.btn_CancelClick(Sender: TObject);
var
  stCode : string;
begin
  if pc_Work.ActivePage.Name = 'CompanyTab' then ShowCompanyCode(ed_CompanyCode.text)
  else if pc_Work.ActivePage.Name = 'JijumTab' then
  begin
    stCode := '';
    if cmb_CompanyCode1.ItemIndex > 0 then stCode := copy(cmb_Company1.Text,1,3);
    stCode := stCode + ed_jijumcode.Text;
    ShowJijumCode(stCode);
  end
  else if pc_Work.ActivePage.Name = 'DepartTab' then
  begin
    stCode := '';
    if cmb_CompanyCode2.ItemIndex > 0 then stCode := copy(cmb_Company2.Text,1,3);
    if cmb_jijumCode2.ItemIndex > 0 then stCode := jijumCodeList.Strings[cmb_jijumCode2.ItemIndex]
    else stCode := stCode + '000';
    stCode := stCode + ed_DepartCode.Text;
    ShowDepartCode(stCode);
  end
  else if pc_Work.ActivePage.Name = 'PosiTab' then ShowPosiCode(ed_posicode.text)
  else if pc_Work.ActivePage.Name = 'ZipTab' then ShowZipCode(ed_zipcode.text);

end;

procedure TfmCompanyCode.ShowZipCode(aCode:string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_Zipcode); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);


  stSql := 'select * from TB_ZIPCODE ';
  if Trim(ed_Sdong.Text) <> '' then
    stSql := stSql + ' where ZI_DONG Like ''' + Trim(ed_Sdong.Text) + '%''';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    sg_Zipcode.RowCount := RecordCount + 1;
    nRow := 1;
    while Not Eof do
    begin
      with sg_Zipcode do
      begin
        Cells[0,nRow] := FindField('ZI_ZIPCODE').AsString;
        Cells[1,nRow] := FindField('ZI_SIDO').AsString;
        Cells[2,nRow] := FindField('ZI_GUGUN').AsString;
        Cells[3,nRow] := FindField('ZI_DONG').AsString;
        Cells[4,nRow] := FindField('ZI_BUNJI').AsString;
        if (FindField('ZI_ZIPCODE').AsString)  = aCode then
        begin
          SelectRows(nRow,1);
        end;
      end;
      nRow := nRow + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_ZipcodeClick(sg_Zipcode);
end;

procedure TfmCompanyCode.ShowJijumCode(aCode: string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_jijumCode); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';
  if copy(cmb_Company1.Text,1,3) <> '000' then
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + copy(cmb_Company1.Text,1,3) + ''' ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    First;
    with sg_JijumCode do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('CO_JijumCODE').AsString;
        cells[1,nRow] := FindField('CO_NAME').AsString;
        cells[2,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[3,nRow] := FindField('CO_departCODE').AsString;
        cells[4,nRow] := FindField('CO_CHARGE').AsString;
        cells[5,nRow] := FindField('CO_TELNUM').AsString;
        if (FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString)  = aCode then
        begin
          SelectRows(nRow,1);
        end;

        nRow := nRow + 1;
        Next;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_JijumCodeClick(sg_JijumCode);
end;

procedure TfmCompanyCode.LoadJijumCode;
var
  stSql : string;
  stStr : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_jijumCode2.Clear;
  JijumCodeList.Clear;

  stSql := 'Select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';
  if cmb_CompanyCode2.ItemIndex > 0 then stSql := stSql + ' AND CO_COMPANYCODE = ''' + copy(cmb_CompanyCode2.Text,1,3) + ''' ';

  cmb_jijumCode2.Items.Add('');
  JijumCodeList.Add('');

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    First;
    While Not Eof do
    begin
      stStr := FindField('CO_JijumCODE').AsString + '.' + FindField('CO_NAME').AsString;

      JijumCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JijumCODE').AsString);
      cmb_jijumCode2.Items.Add(stStr);
      Next;
    end;
    cmb_jijumCode2.ItemIndex := 0;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmCompanyCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  JijumCodeList.Free;
end;

procedure TfmCompanyCode.JijumTabShow(Sender: TObject);
begin
  LoadCompanyCode;
  ShowJijumCode('');
end;

procedure TfmCompanyCode.LoadJijum(aCompanyCode: string);
var
  stSql : string;
  stStr : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_jijum2.Clear;
  if aCompanyCode = '000' then Exit;

  stSql := 'Select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';

  cmb_jijum2.Items.Add('000.전체');

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    First;
    While Not Eof do
    begin
      stStr := FindField('CO_JijumCODE').AsString + '.' + FindField('CO_NAME').AsString;

      cmb_jijum2.Items.Add(stStr);
      Next;
    end;
    cmb_jijum2.ItemIndex := 0;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmCompanyCode.cmb_Company1Change(Sender: TObject);
begin
  ShowJijumCode('');

end;

procedure TfmCompanyCode.sg_jijumCodeClick(Sender: TObject);
var
  i : integer;
  stStr : string;
  bResult : Boolean;
  nIndex : integer;
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_jijumcode.Text := cells[0,Row];
    ed_jijumname.Text := cells[1,Row];
    ed_jijumCharge.Text := cells[4,Row];
    ed_jijumTelnum.Text := cells[5,Row];

    bResult := False;
    for i:= 1 to cmb_CompanyCode1.Items.Count - 1 do
    begin
      if copy(cmb_CompanyCode1.Items.Strings[i],1,3) = cells[2,Row] then
      begin
        bResult := True;
        break;
      end;
    end;
    
    if bResult then cmb_CompanyCode1.ItemIndex := i
    else cmb_CompanyCode1.ItemIndex := 0;
    //cmb_CompanyCode1.Refresh;
  end;

end;

procedure TfmCompanyCode.cmb_CompanyCode2Change(Sender: TObject);
begin
LoadJijumCode;
end;

procedure TfmCompanyCode.cmb_Company3Change(Sender: TObject);
begin
  ShowPosiCode('');

end;

end.
