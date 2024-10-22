unit uCompanyCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  Gauges,ADODB, uSubForm, CommandArray,ActiveX, DB, AdvObj;

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
    lb_CompanyCode: TLabel;
    lb_CompanyName: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ed_CompanyCode: TEdit;
    ed_CompanyName: TEdit;
    ed_CompanyCharge: TEdit;
    ed_companyTelnum: TEdit;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    lb_CompanyCode4: TLabel;
    lb_DepartName: TLabel;
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
    lb_CompanyCode3: TLabel;
    cmb_CompanyCode2: TComboBox;
    cmb_sCompanyCode2: TComboBox;
    lb_DepartCode: TLabel;
    Panel6: TPanel;
    GroupBox5: TGroupBox;
    lb_PosiCode: TLabel;
    lb_PosiName: TLabel;
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
    lb_CompanyCode1: TLabel;
    cmb_CompanyCode1: TComboBox;
    Panel11: TPanel;
    GroupBox7: TGroupBox;
    lb_CompanyCode2: TLabel;
    lb_JijumName: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    lb_JijumCode: TLabel;
    ed_jijumcode: TEdit;
    ed_jijumname: TEdit;
    ed_jijumCharge: TEdit;
    ed_jijumTelnum: TEdit;
    cmb_sCompanyCode1: TComboBox;
    Splitter4: TSplitter;
    cmb_sjijumCode2: TComboBox;
    lb_JijumCode2: TLabel;
    lb_JijumCode1: TLabel;
    cmb_jijumCode2: TComboBox;
    lb_CompanyCode6: TLabel;
    cmb_sCompanyCode3: TComboBox;
    GroupBox8: TGroupBox;
    lb_CompanyCode5: TLabel;
    cmb_CompanyCode3: TComboBox;
    chk_AutoCompanyCode: TCheckBox;
    ADOQuery: TADOQuery;
    chk_AutoJijumCode: TCheckBox;
    chk_AutoDepartCode: TCheckBox;
    chk_AutoPosiCode: TCheckBox;
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
    procedure cmb_CompanyCode2Change(Sender: TObject);
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
    procedure cmb_CompanyCode1Change(Sender: TObject);
    procedure sg_jijumCodeClick(Sender: TObject);
    procedure cmb_sCompanyCode2Change(Sender: TObject);
    procedure cmb_CompanyCode3Change(Sender: TObject);
    procedure ed_CompanyCodeChange(Sender: TObject);
    procedure chk_AutoCompanyCodeClick(Sender: TObject);
    procedure chk_AutoJijumCodeClick(Sender: TObject);
    procedure ed_jijumcodeChange(Sender: TObject);
    procedure chk_AutoDepartCodeClick(Sender: TObject);
    procedure ed_DepartCodeChange(Sender: TObject);
    procedure chk_AutoPosiCodeClick(Sender: TObject);
    procedure ed_posicodeChange(Sender: TObject);
    procedure cmb_sCompanyCode1Change(Sender: TObject);
    procedure cmb_sjijumCode2Change(Sender: TObject);
    procedure cmb_jijumCode2Change(Sender: TObject);
    procedure cmb_sCompanyCode3Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    L_nTopRow : integer;
    State:string;
    CompanyCodeList : TStringList;
    sCompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    sJijumCodeList : TStringList;

    procedure FormNameSet;
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
    Function CheckTB_EMPLOYEECompanyCode(aCompanyCode:string):Boolean;

    procedure ShowCompanyCode(aCode:string;aTopRow:integer=0);
    procedure ShowJijumCode(aCode:string;aTopRow:integer=0);
    procedure ShowDepartCode(aCode:string;aTopRow:integer=0);
    procedure ShowPosiCode(aCode:string;aTopRow:integer=0);
    procedure ShowZipCode(aCode:string;aTopRow:integer=0);
    procedure LoadCompany;

    Function GetAutoCompanyCode:string;
    Function GetAutoJijumCode(aCompanyCode:string):string;
    Function GetAutoDepartCode(aCompanyCode,aJijumCode:string):string;
    Function GetAutoPosiCode(aCompanyCode:string):string;
  public
    { Public declarations }
    WorkCode : integer;
  end;

var
  fmCompanyCode: TfmCompanyCode;
  ZipList : TStringList;

implementation

uses
  uDataModule1,
  uLomosUtil,
  uCommonSql,
  uCompanyCodeLoad;
{$R *.dfm}

procedure TfmCompanyCode.FormShow(Sender: TObject);
begin

  if (WorkCode < 0) or (workCode > 4) then WorkCode := 0;
  pc_Work.ActivePageIndex := WorkCode;

  //fmCompanyCode.Caption := pc_Work.ActivePage.Caption;
  Panel12.Caption := pc_Work.ActivePage.Caption;

  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;

    if strtoint(CompanyGrade) > 0 then
    begin
      CompanyTab.TabVisible := False;
    end;
    if strtoint(CompanyGrade) > 1 then
    begin
      JijumTab.TabVisible := False;
    end;
  end;

  if UseStateShow then
  begin
    CompanyTab.TabVisible := False;
    JijumTab.TabVisible := False;
    PosiTab.TabVisible := False;
    ZipTab.TabVisible := False;
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
  LoadCompany;
  ShowPosiCode('');
end;

procedure TfmCompanyCode.ShowPosiCode(aCode:string;aTopRow:integer=0);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(sg_Posi,2); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_POSI ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if cmb_CompanyCode3.ItemIndex > -1 then
  begin
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_CompanyCode3.ItemIndex] + ''' ';
  end;
  stSql := stSql + ' order by CO_COMPANYCODE,PO_POSICODE ';

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
      if aTopRow = 0 then
      begin
        if Row > 8 then TopRow := Row - 7;
      end else
      begin
        TopRow := aTopRow;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_Posiclick(sg_Posi);
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
    for i := 0 to cmb_sCompanyCode3.Items.Count - 1 do
    begin
      if sCompanyCodeList.Strings[i] = cells[2,Row] then
      begin
        cmb_sCompanyCode3.ItemIndex := i;
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
  if aPosiCode = '' then aPosiCode := '0';
  if Length(aPosiCode) <> 3 then aPosiCode := FillZeroNumber(strtoint(aPosiCode),3);
  result := False;
  stSql := ' Insert Into TB_POSI( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' PO_NAME,';
  stSql := stSql + ' PO_UPDATECHECK )';
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aPosiName + ''',';
  stSql := stSql + '''N'' ';
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
  if Length(aCompanyCode) <> 3 then aCompanyCode := FillSpace(aCompanyCode,3,True);
  if Length(aPosiCode) <> 3 then aPosiCode := FillSpace(aPosiCode,3,True);
  result := False;
  stSql := ' Update TB_POSI set ';
  stSql := stSql + ' PO_NAME = ''' + aPosiName + ''',';
  stSql := stSql + ' PO_UPDATECHECK = ''N'' ';
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
  if Length(aCompanyCode) <> 3 then aCompanyCode := FillSpace(aCompanyCode,3,True);
  if Length(aPosiCode) <> 3 then aPosiCode := FillSpace(aPosiCode,3,True);
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

procedure TfmCompanyCode.ShowCompanyCode(aCode:string;aTopRow:integer=0);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin

  GridInit(sg_CompanyCode,2); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''1'' ';
  stSql := stSql + ' order by CO_COMPANYCODE ';

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
      if aTopRow = 0 then
      begin
        if Row > 11 then TopRow := Row - 10;
      end else
      begin
        TopRow := aTopRow;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_CompanyCodeClick(sg_CompanyCode);
end;

procedure TfmCompanyCode.CompanyTabShow(Sender: TObject);
begin
  LoadCompany;
  ShowCompanyCode('');
end;

procedure TfmCompanyCode.btn_InsertClick(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
  nIndex : integer;
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  if pc_Work.ActivePage.Name = 'CompanyTab' then
  begin
    with sg_CompanyCode do
    begin
      L_nTopRow := TopRow;
      if Cells[0,1] <> '' then
      begin
        AddRow;
        SelectRows(RowCount - 1,1);
        Enabled := True;
        if RowCount > 11 then TopRow := RowCount - 11;
        Enabled := False;
      end;
    end;
    ed_Companycode.SetFocus;
    if chk_AutoCompanyCode.Checked then chk_AutoCompanyCodeClick(self);
  end
  else if pc_Work.ActivePage.Name = 'JijumTab' then
  begin
    with sg_JijumCode do
    begin
      L_nTopRow := TopRow;
      if Cells[0,1] <> '' then
      begin
        AddRow;
        SelectRows(RowCount - 1,1);
        Enabled := True;
        if RowCount > 8 then TopRow := RowCount - 8;
        Enabled := False;
      end;
    end;
    stCompanyCode := '000';
    if cmb_CompanyCode1.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode1.ItemIndex];
    nIndex := sCompanyCodeList.IndexOf(stCompanyCode);
    if nIndex > -1 then
      cmb_sCompanyCode1.ItemIndex := nIndex;
    ed_jijumcode.SetFocus;
    if chk_AutoJijumCode.Checked then chk_AutoJijumCodeClick(self);
  end
  else if pc_Work.ActivePage.Name = 'DepartTab' then
  begin
    with sg_DepartCode do
    begin
      L_nTopRow := TopRow;
      if Cells[0,1] <> '' then
      begin
        AddRow;
        SelectRows(RowCount - 1,1);
        Enabled := True;
        if RowCount > 7 then TopRow := RowCount - 7;
        Enabled := False;
      end;
    end;

    stCompanyCode := '000';
    if cmb_CompanyCode2.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode2.ItemIndex];
    nIndex := sCompanyCodeList.IndexOf(stCompanyCode);
    if nIndex > -1 then
      cmb_sCompanyCode2.ItemIndex := nIndex;

    if cmb_sCompanyCode2.ItemIndex > 0 then
    begin
      stCompanyCode := '000';
      stCompanyCode := sCompanyCodeList.Strings[cmb_sCompanyCode2.ItemIndex];
      LoadJijumCode(stCompanyCode,sJijumCodeList,cmb_sjijumCode2);

      stJijumCode := '000';
      if cmb_jijumCode2.ItemIndex > 0 then stJijumCode := JijumCodeList.Strings[cmb_jijumCode2.ItemIndex];
      nIndex := sjijumCodeList.IndexOf(stJijumCode);
      if nIndex > -1 then
        cmb_sjijumCode2.ItemIndex := nIndex;
    end;
    ed_Departcode.SetFocus;
    if chk_AutoDepartCode.Checked then chk_AutoDepartCodeClick(self);
  end
  else if pc_Work.ActivePage.Name = 'PosiTab' then
  begin
    with sg_Posi do
    begin
      L_nTopRow := TopRow;
      if Cells[0,1] <> '' then
      begin
        AddRow;
        SelectRows(RowCount - 1,1);
        Enabled := True;
        if RowCount > 8 then TopRow := RowCount - 8;
        Enabled := False;
      end;
    end;
    stCompanyCode := '000';
    if cmb_CompanyCode3.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode3.ItemIndex];
    nIndex := sCompanyCodeList.IndexOf(stCompanyCode);
    if nIndex > -1 then
      cmb_sCompanyCode3.ItemIndex := nIndex;
    ed_posicode.SetFocus;
    if chk_AutoPosiCode.Checked then chk_AutoPosiCodeClick(self);
  end
  else if pc_Work.ActivePage.Name = 'ZipTab' then
  begin
    with sg_Zipcode do
    begin
      L_nTopRow := TopRow;
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
  if pc_Work.ActivePage.Name = 'CompanyTab' then
  begin
    ed_Companyname.SetFocus;
    L_nTopRow := sg_CompanyCode.TopRow;
  end  else if pc_Work.ActivePage.Name = 'JijumTab' then
  begin
    ed_Jijumname.SetFocus;
    L_nTopRow := sg_jijumCode.TopRow;
  end  else if pc_Work.ActivePage.Name = 'DepartTab' then
  begin
    ed_Departname.SetFocus;
    L_nTopRow := sg_DepartCode.TopRow;
  end  else if pc_Work.ActivePage.Name = 'PosiTab' then
  begin
    ed_posiname.SetFocus;
    L_nTopRow := sg_Posi.TopRow;
  end  else if pc_Work.ActivePage.Name = 'ZipTab' then
  begin
    ed_sido.SetFocus;
    L_nTopRow := sg_Zipcode.TopRow; 
  end;

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
    if Trim(ed_Companycode.Text) = '' then
    begin
      showmessage('회사코드를 입력하세요.');
      ed_Companycode.SetFocus;
      Exit;
    end;
    if Not isDigit(ed_Companycode.Text) then
    begin
      showmessage('코드는 숫자만 입력하세요.');
      ed_Companycode.SetFocus;
      Exit;
    end;
    if UpperCase(State) = 'INSERT' then
      bResult := InsertTB_Company(ed_Companycode.Text,'000','000',ed_Companyname.Text,ed_CompanyCharge.Text,ed_CompanyTelNum.Text,'1')
    else if UpperCase(State) = 'UPDATE' then
      bResult := UpdateTB_Company(ed_Companycode.Text,'000','000',ed_Companyname.Text,ed_CompanyCharge.Text,ed_CompanyTelNum.Text,'1');

    if bResult then
    begin
      if UpperCase(State) = 'INSERT' then
        ShowCompanyCode(ed_Companycode.Text)
      else ShowCompanyCode(ed_Companycode.Text,sg_CompanyCode.TopRow);
    end else showmessage('저장실패');
  end else if pc_Work.ActivePage.Name = 'JijumTab' then
  begin
    if Trim(ed_jijumcode.Text) = '' then
    begin
      showmessage('지점코드를 입력하세요.');
      ed_jijumcode.SetFocus;
      Exit;
    end;
    if Not isDigit(ed_jijumcode.Text) then
    begin
      showmessage('코드는 숫자만 입력하세요.');
      ed_jijumcode.SetFocus;
      Exit;
    end;
    if cmb_sCompanyCode1.ItemIndex < 1 then
    begin
      showmessage('회사코드를 선택해 주셔야 합니다.');
      Exit;
    end;
    stCompanyCode := sCompanyCodeList.Strings[cmb_sCompanyCode1.ItemIndex];
    if UpperCase(State) = 'INSERT' then
      bResult := InsertTB_Company(stCompanyCode,ed_JijumCode.Text,'000',ed_jijumname.Text,ed_jijumCharge.Text,ed_jijumTelNum.Text,'2')
    else if UpperCase(State) = 'UPDATE' then
      bResult := UpdateTB_Company(stCompanyCode,ed_JijumCode.Text,'000',ed_jijumname.Text,ed_jijumCharge.Text,ed_jijumTelNum.Text,'2');

    if bResult then
    begin
      if UpperCase(State) = 'INSERT' then
        ShowJijumCode(stCompanyCode + ed_jijumcode.Text)
      else
        ShowJijumCode(stCompanyCode + ed_jijumcode.Text,sg_jijumCode.TopRow);
    end else showmessage('저장실패');
  end else if pc_Work.ActivePage.Name = 'DepartTab' then
  begin
    if cmb_sCompanyCode2.ItemIndex < 1 then
    begin
      showmessage('회사코드를 선택해 주셔야 합니다.');
      Exit;
    end;
    stCompanyCode := sCompanyCodeList.Strings[cmb_sCompanyCode2.ItemIndex];
    if cmb_sjijumCode2.ItemIndex < 1 then
    begin
      showmessage('지점코드를 선택해 주셔야 합니다.');
      Exit;
    end;
    if Trim(ed_DepartCode.Text) = '' then
    begin
      showmessage('부서코드를 입력하세요.');
      ed_DepartCode.SetFocus;
      Exit;
    end;
    if Not isDigit(ed_DepartCode.Text) then
    begin
      showmessage('코드는 숫자만 입력하세요.');
      ed_DepartCode.SetFocus;
      Exit;
    end;
    stJijumCode := '000';
    if cmb_sjijumCode2.ItemIndex > 0 then
      stJijumCode := copy(sJijumCodeList.Strings[cmb_sjijumCode2.ItemIndex],4,3);
    if UpperCase(State) = 'INSERT' then
      bResult := InsertTB_Company(stCompanyCode,stJijumCode,ed_DepartCode.Text,ed_Departname.Text,ed_DepartCharge.Text,ed_DepartTelNum.Text,'3')
    else if UpperCase(State) = 'UPDATE' then
      bResult := UpdateTB_Company(stCompanyCode,stJijumCode,ed_DepartCode.Text,ed_Departname.Text,ed_DepartCharge.Text,ed_DepartTelNum.Text,'3');

    if bResult then
    begin
      if UpperCase(State) = 'INSERT' then
        ShowDepartCode(stCompanyCode + stJijumCode + ed_DepartCode.Text)
      else
        ShowDepartCode(stCompanyCode + stJijumCode + ed_DepartCode.Text,sg_DepartCode.TopRow);
    end else showmessage('저장실패');
  end else if pc_Work.ActivePage.Name = 'PosiTab' then
  begin
    if cmb_sCompanyCode3.ItemIndex < 1 then
    begin
      showmessage('회사코드를 선택해 주셔야 합니다.');
      Exit;
    end;
    if Trim(ed_posicode.Text) = '' then
    begin
      showmessage('직위코드를 입력하세요.');
      ed_posicode.SetFocus;
      Exit;
    end;
    if Not isDigit(ed_posicode.Text) then
    begin
      showmessage('코드는 숫자만 입력하세요.');
      ed_posicode.SetFocus;
      Exit;
    end;
    stCompanyCode := sCompanyCodeList.Strings[cmb_sCompanyCode3.ItemIndex];
    if UpperCase(State) = 'INSERT' then bResult := InsertTB_Posi(stCompanyCode,ed_posicode.Text,ed_posiname.Text)
    else if UpperCase(State) = 'UPDATE' then bResult := UpdateTB_Posi(stCompanyCode,ed_posicode.Text,ed_posiname.Text);

    if bResult then
    begin
      if UpperCase(State) = 'INSERT' then
        ShowPosiCode(stCompanyCode + ed_posicode.Text)
      else
        ShowPosiCode(stCompanyCode + ed_posicode.Text,sg_Posi.TopRow);
    end else showmessage('저장실패');
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
    if UpperCase(State) = 'INSERT' then
      ShowZipCode(ed_zipcode.Text)
    else ShowZipCode(ed_zipcode.Text,sg_Zipcode.TopRow);
  end;

end;

function TfmCompanyCode.InsertTB_Company(aCompanyCode,aJijumCode,aDepartCode, aCompanyName,
  aCompanyCharge, aCompanyTelnum,aGubun: string): Boolean;
var
  stSql : string;
begin
  if aCompanyCode = '' then aCompanyCode := '0';
  if aJijumCode = '' then aJijumCode := '0';
  if aDepartCode = '' then aDepartCode := '0';
  if Length(aCompanyCode) <> 3 then aCompanyCode := FillZeroNumber(strtoint(aCompanyCode),3);
  if Length(aJijumCode) <> 3 then aJijumCode := FillZeroNumber(strtoint(aJijumCode),3);
  if Length(aDepartCode) <> 3 then aDepartCode := FillZeroNumber(strtoint(aDepartCode),3);
  result := False;
  stSql := ' Insert Into TB_COMPANY( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_JIJUMCODE,';
  stSql := stSql + ' CO_DEPARTCODE,';
  stSql := stSql + ' CO_NAME,';
  stSql := stSql + ' CO_GUBUN,';
  stSql := stSql + ' CO_CHARGE,';
  stSql := stSql + ' CO_TELNUM,';
  stSql := stSql + ' CO_UPDATECHECK )';
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aCompanyName + ''',';
  stSql := stSql + '''' + aGubun + ''',';
  stSql := stSql + '''' + aCompanyCharge + ''',';
  stSql := stSql + '''' + aCompanyTelnum + ''',';
  stSql := stSql + '''N'' ';
  stSql := stSql + ')';

  result := DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert into tb_posi(GROUP_CODE,co_companycode,po_posicode,po_name) ';
  stSql := stSql + ' select ''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',po_posicode,po_name from tb_posi ';
  stSql := stSql + ' where co_companycode = ''001'' ';
  DataModule1.ProcessExecSQL(stSql);

   {
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

  end; }

  result := True;
end;

function TfmCompanyCode.UpdateTB_Company(aCompanyCode,aJijumCode,aDepartCode, aCompanyName,
  aCompanyCharge, aCompanyTelnum,aGubun: string): Boolean;
var
  stSql : string;
begin
  if Length(aCompanyCode) <> 3 then aCompanyCode := FillSpace(aCompanyCode,3,True);
  if Length(aJijumCode) <> 3 then aJijumCode := FillSpace(aJijumCode,3,True);
  if Length(aDepartCode) <> 3 then aDepartCode := FillSpace(aDepartCode,3,True);
  result := False;
  stSql := ' Update TB_COMPANY set ';
  stSql := stSql + ' CO_NAME = ''' + aCompanyName + ''',';
  stSql := stSql + ' CO_CHARGE = ''' + aCompanyCharge + ''',';
  stSql := stSql + ' CO_TELNUM = ''' + aCompanyTelnum + ''', ';
  stSql := stSql + ' CO_UPDATECHECK = ''N'' ';
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
    if CheckTB_EMPLOYEECompanyCode(ed_Companycode.Text) then
    begin
      showmessage(ed_CompanyName.Text + ' 소속의 사원정보를 정리 후 삭제 가능합니다.');
      Exit;
    end;
    bResult := DeleteTB_Company(ed_Companycode.Text,'000','000','1');
    bResult := DeleteTB_Posi(ed_Companycode.Text,'');

    if bResult then ShowCompanyCode('',sg_CompanyCode.TopRow)
    else showmessage('삭제실패.');
  end else if pc_Work.ActivePage.Name = 'JijumTab' then
  begin
    stCompanyCode := '000';
    if cmb_sCompanyCode1.ItemIndex > 0 then
      stCompanyCode := sCompanyCodeList.Strings[cmb_sCompanyCode1.ItemIndex];
    bResult := DeleteTB_Company(stCompanyCode,ed_jijumCode.Text,'000','2');

    if bResult then ShowJijumCode('',sg_jijumCode.TopRow)
    else showmessage('삭제실패.');
  end else if pc_Work.ActivePage.Name = 'DepartTab' then
  begin
    stCompanyCode := '000';
    if cmb_sCompanyCode2.itemIndex > 0 then
      stCompanyCode := sCompanyCodeList.Strings[cmb_sCompanyCode2.itemIndex];
    stJijumCode := '000';
    if cmb_sJijumCode2.itemIndex > 0 then
      stJijumCode := copy(sJijumCodeList.Strings[cmb_sJijumCode2.itemIndex],4,3);
    bResult := DeleteTB_Company(stCompanyCode,stJijumCode,ed_DepartCode.Text,'3');

    if bResult then ShowDepartCode('',sg_DepartCode.TopRow)
    else showmessage('삭제실패.');
  end else if pc_Work.ActivePage.Name = 'PosiTab' then
  begin
    if cmb_sCompanyCode3.ItemIndex > 0 then
      stCompanyCode := sCompanyCodeList.Strings[cmb_sCompanyCode3.ItemIndex];
    if ed_posicode.Text = '' then
    begin
      showmessage('삭제할 직위코드가 없습니다.');
      Exit;
    end;
    bResult := DeleteTB_Posi(stCompanyCode,ed_posicode.Text);

    if bResult then ShowPosiCode('',sg_Posi.TopRow)
    else showmessage('삭제실패.');
  end else if pc_Work.ActivePage.Name = 'ZipTab' then
  begin
    btn_delete.Enabled := False;

    bResult := DeleteTB_ZIPCODE(ed_zipcode.Text);

    if bResult then ShowZipCode('',sg_Zipcode.TopRow)
    else showmessage('삭제실패.');
  end;

end;

function TfmCompanyCode.DeleteTB_Company(aCompanyCode,aJijumCode, aDepartCode,
  aGubun: string): Boolean;
var
  stSql : string;
begin
  if Length(aCompanyCode) <> 3 then aCompanyCode := FillSpace(aCompanyCode,3,True);
  if Length(aJijumCode) <> 3 then aJijumCode := FillSpace(aJijumCode,3,True);
  if Length(aDepartCode) <> 3 then aDepartCode := FillSpace(aDepartCode,3,True);
  result := False;
  stSql := 'Delete From TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And CO_COMPANYCODE = ''' + aCompanyCode + '''';
  if aGubun <> '1' then    //회사코드 삭제가 아니면
  begin
    stSql := stSql + ' And CO_JIJUMCODE = ''' + aJijumCode + '''';
    if aGubun <> '2' then  //지점코드 삭제가 아니면
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
var
  stCompanyCode : string;
begin
  LoadCompany;
  stCompanyCode := '000';
  if cmb_CompanyCode2.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode2.itemIndex];
  LoadJijumCode(stCompanyCode,JijumCodeList,cmb_jijumCode2);
  ShowDepartCode('');
end;

procedure TfmCompanyCode.LoadCompany;
//var
//  stSql : string;
//  stStr : string;
//  TempAdoQuery : TADOQuery;
begin
  LoadCompanyCode(CompanyCodeList,cmb_CompanyCode1);
  LoadCompanyCode(CompanyCodeList,cmb_CompanyCode2);
  LoadCompanyCode(CompanyCodeList,cmb_CompanyCode3);
  LoadsCompanyCode(sCompanyCodeList,cmb_sCompanyCode1);
  LoadsCompanyCode(sCompanyCodeList,cmb_sCompanyCode2);
  LoadsCompanyCode(sCompanyCodeList,cmb_sCompanyCode3);
  if Not IsMaster then
  begin
    if strtoint(CompanyGrade) > 0 then
    begin
      cmb_CompanyCode1.Enabled := False;
      cmb_CompanyCode2.Enabled := False;
      cmb_CompanyCode3.Enabled := False;
      cmb_sCompanyCode1.Enabled := False;
      cmb_sCompanyCode2.Enabled := False;
      cmb_sCompanyCode3.Enabled := False;
    end;
    if strtoint(CompanyGrade) > 1 then
    begin
      cmb_jijumCode2.Enabled := False;
      cmb_sjijumCode2.Enabled := False;
    end;
  end;
{  cmb_Company1.Clear;
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
  CoUninitialize; }
end;

procedure TfmCompanyCode.ShowDepartCode(aCode:string;aTopRow:integer=0);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
  stCompanyCode : string;
  stJijumCode : string;
begin
  GridInit(sg_DepartCode,2); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stCompanyCode := '000';
  if cmb_CompanyCode2.ItemIndex > 0 then
    stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode2.ItemIndex];
  stJijumCode := '000';
  if cmb_jijumCode2.ItemIndex > 0 then
    stJijumCode := copy(JijumCodeList.Strings[cmb_jijumCode2.ItemIndex],4,3);

  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''3'' ';
  if stCompanyCode <> '000' then
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + stCompanyCode + ''' ';
  if cmb_jijumCode2.ItemIndex > 0 then
    stSql := stSql + ' AND CO_JIJUMCODE = ''' + stJijumCode + ''' ';
  stSql := stSql + ' order by CO_COMPANYCODE,CO_JIJUMCODE,CO_DEPARTCODE ';

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
      if aTopRow = 0 then
      begin
        if Row > 7 then TopRow := Row - 6;
      end else
      begin
        TopRow := aTopRow;
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

  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_Departcode.Text := cells[0,Row];
    ed_Departname.Text := cells[1,Row];
    ed_DepartCharge.Text := cells[4,Row];
    ed_DepartTelnum.Text := cells[5,Row];

    bResult := False;
    for i:= 1 to cmb_sCompanyCode2.Items.Count - 1 do
    begin
      if sCompanyCodeList.Strings[i] = cells[2,Row] then
      begin
        bResult := True;
        break;
      end;
    end;

    if bResult then cmb_sCompanyCode2.ItemIndex := i
    else cmb_sCompanyCode2.ItemIndex := 0;

    if cmb_sCompanyCode2.ItemIndex > 0 then
    begin
      LoadJijumCode(cells[2,Row],sJijumCodeList,cmb_sjijumCode2);
      nIndex := sJijumCodeList.IndexOf(cells[2,Row] + cells[3,Row]);
      if nIndex >= 0 then cmb_sjijumCode2.ItemIndex := nIndex;
    end;

  end;

end;

procedure TfmCompanyCode.cmb_CompanyCode2Change(Sender: TObject);
var
  stCompanyCode : string;
begin
  stCompanyCode := '000';
  if cmb_CompanyCode2.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode2.itemIndex];
  LoadJijumCode(stCompanyCode,JijumCodeList,cmb_jijumCode2);
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
{  sg_CompanyCode.OnDrawCell:=StringGrideDrawCell;
  sg_DepartCode.OnDrawCell:=StringGrideDrawCell;
  sg_Posi.OnDrawCell:=StringGrideDrawCell;
  sg_zipCode.OnDrawCell:=StringGrideDrawCell;
}
  CompanyCodeList := TStringList.Create;
  sCompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  sJijumCodeList := TStringList.Create;

  L_nTopRow := 1;

end;

procedure TfmCompanyCode.FormActivate(Sender: TObject);
begin
  sg_CompanyCode.ColWidths[2] := 0;
  sg_CompanyCode.ColWidths[3] := 0;
  sg_DepartCode.ColWidths[2] := 0;
  sg_DepartCode.ColWidths[3] := 0;
  sg_DepartCode.ColWidths[4] := 0;
  LoadCompany;
  btn_CancelClick(self);
  FormNameSet;
  Panel12.Caption := fmCompanyCode.Caption;
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
  cmb_sCompanyCode1.ItemIndex := 0;
  ed_jijumcode.Text := '';
  ed_jijumname.Text := '';
  ed_jijumCharge.Text := '';
  ed_jijumTelnum.Text := '';

  //부서코드 Clear
  cmb_sCompanyCode2.ItemIndex := 0;
  cmb_sjijumCode2.ItemIndex := 0;
  ed_Departcode.Text := '';
  ed_Departname.Text := '';
  ed_DepartCharge.Text := '';
  ed_DepartTelnum.Text := '';

  //직위코드 Clear
  cmb_sCompanyCode3.ItemIndex := 0;
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
    chk_AutoCompanyCode.Enabled := True;
    ed_Companycode.Enabled := true;
    ed_Companyname.Enabled  := true;
    ed_CompanyCharge.Enabled  := true;
    ed_companyTelnum.Enabled  := true;
    //지점코드
    sg_jijumCode.Enabled := False;
    if IsMaster or (strtoint(CompanyGrade) < 1) then
      cmb_sCompanyCode1.Enabled := True;
    chk_AutoJijumCode.Enabled := True;
    ed_jijumcode.Enabled := true;
    ed_jijumname.Enabled  := true;
    ed_jijumCharge.Enabled  := true;
    ed_jijumTelnum.Enabled  := true;
    //부서코드
    sg_DepartCode.Enabled := False;
    if IsMaster or (strtoint(CompanyGrade) < 1) then
      cmb_sCompanyCode2.Enabled := True;
    if IsMaster or (strtoint(CompanyGrade) < 2) then
      cmb_sjijumCode2.Enabled := True;
    ed_Departcode.Enabled := true;
    chk_AutoDepartCode.Enabled := True;
    ed_Departname.Enabled  := true;
    ed_DepartCharge.Enabled  := true;
    ed_DepartTelnum.Enabled  := true;
    //직위코드
    sg_Posi.Enabled := False;
    if IsMaster or (strtoint(CompanyGrade) < 1) then
      cmb_sCompanyCode3.Enabled := true;
    ed_posicode.Enabled := true;
    chk_AutoPosiCode.Enabled := True;
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
    chk_AutoCompanyCode.Enabled := false;
    ed_Companycode.Enabled := False;
    ed_Companyname.Enabled  := False;
    ed_CompanyCharge.Enabled  := False;
    ed_companyTelnum.Enabled  := False;
    //지점코드
    sg_jijumCode.Enabled := True;
    cmb_sCompanyCode1.Enabled := False;
    chk_AutoJijumCode.Enabled := False;
    ed_jijumcode.Enabled := False;
    ed_jijumname.Enabled  := False;
    ed_jijumCharge.Enabled  := False;
    ed_jijumTelnum.Enabled  := False;
    //부서코드
    sg_DepartCode.Enabled := True;
    cmb_sCompanyCode2.Enabled := False;
    cmb_sjijumCode2.Enabled := False;
    ed_Departcode.Enabled := False;
    chk_AutoDepartCode.Enabled := False;
    ed_Departname.Enabled  := False;
    ed_DepartCharge.Enabled  := False;
    ed_DepartTelnum.Enabled  := False;
    //직위코드
    sg_Posi.Enabled := True;
    cmb_sCompanyCode3.Enabled := False;
    ed_posicode.Enabled := False;
    chk_AutoPosiCode.Enabled := False;
    ed_posiname.Enabled := False;
    //우편번호
    sg_Zipcode.Enabled := True;
    ed_bunji.Enabled := False;
    ed_dong.Enabled := False;
    ed_gugun.Enabled := False;
    ed_sido.Enabled := False;
    ed_zipcode.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    // 회사코드
    sg_CompanyCode.Enabled := True;
    chk_AutoCompanyCode.Enabled := false;
    ed_Companycode.Enabled := False;
    ed_Companyname.Enabled  := False;
    ed_CompanyCharge.Enabled  := False;
    ed_companyTelnum.Enabled  := False;
    //지점코드
    sg_jijumCode.Enabled := True;
    cmb_sCompanyCode1.Enabled := False;
    chk_AutoJijumCode.Enabled := False;
    ed_jijumcode.Enabled := False;
    ed_jijumname.Enabled  := False;
    ed_jijumCharge.Enabled  := False;
    ed_jijumTelnum.Enabled  := False;
    //부서코드
    sg_DepartCode.Enabled := True;
    cmb_sCompanyCode2.Enabled := False;
    cmb_sjijumCode2.Enabled := False;
    ed_Departcode.Enabled := False;
    chk_AutoDepartCode.Enabled := False;
    ed_Departname.Enabled  := False;
    ed_DepartCharge.Enabled  := False;
    ed_DepartTelnum.Enabled  := False;
    //직위코드
    sg_Posi.Enabled := True;
    cmb_sCompanyCode3.Enabled := False;
    ed_posicode.Enabled := False;
    chk_AutoPosiCode.Enabled := False;
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
    chk_AutoCompanyCode.Enabled := false;
    ed_Companyname.Enabled  := true;
    ed_CompanyCharge.Enabled  := true;
    ed_companyTelnum.Enabled  := true;
    //지점코드
    sg_jijumCode.Enabled := False;
    cmb_sCompanyCode1.Enabled := False;
    ed_jijumcode.Enabled := False;
    chk_AutoJijumCode.Enabled := False;
    ed_jijumname.Enabled  := true;
    ed_jijumCharge.Enabled  := true;
    ed_jijumTelnum.Enabled  := true;
    //부서코드
    sg_DepartCode.Enabled := False;
    cmb_sCompanyCode2.Enabled := False;
    cmb_sjijumCode2.Enabled := False;
    ed_Departcode.Enabled := False;
    chk_AutoDepartCode.Enabled := False;
    ed_Departname.Enabled  := true;
    ed_DepartCharge.Enabled  := true;
    ed_DepartTelnum.Enabled  := true;
    //직위코드
    sg_Posi.Enabled := False;
    cmb_sCompanyCode3.Enabled := False;
    ed_posicode.Enabled := False;
    chk_AutoPosiCode.Enabled := False;
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
  if pc_Work.ActivePage.Name = 'CompanyTab' then
  begin
    ShowCompanyCode(ed_CompanyCode.text,L_nTopRow);
  end else if pc_Work.ActivePage.Name = 'JijumTab' then
  begin
    stCode := '000';
    if cmb_sCompanyCode1.ItemIndex > 0 then stCode := sCompanyCodeList.Strings[cmb_sCompanyCode1.itemIndex];
    stCode := stCode + ed_jijumcode.Text;
    ShowJijumCode(stCode,L_nTopRow);
  end
  else if pc_Work.ActivePage.Name = 'DepartTab' then
  begin
    stCode := '000';
    if cmb_sCompanyCode2.ItemIndex > 0 then stCode := sCompanyCodeList.Strings[cmb_sCompanyCode2.ItemIndex];
    if cmb_sjijumCode2.ItemIndex > 0 then stCode := sjijumCodeList.Strings[cmb_sjijumCode2.ItemIndex]
    else stCode := stCode + '000';
    stCode := stCode + ed_DepartCode.Text;
    ShowDepartCode(stCode,L_nTopRow);
  end
  else if pc_Work.ActivePage.Name = 'PosiTab' then
  begin
    stCode := '000';
    if cmb_sCompanyCode3.ItemIndex > 0 then stCode := sCompanyCodeList.Strings[cmb_sCompanyCode3.itemIndex];
    ShowPosiCode(stCode + ed_posicode.text,L_nTopRow)
  end else if pc_Work.ActivePage.Name = 'ZipTab' then ShowZipCode(ed_zipcode.text,L_nTopRow);

end;

procedure TfmCompanyCode.ShowZipCode(aCode:string;aTopRow:integer=0);
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
    if aTopRow = 0 then
    begin
      if sg_Zipcode.Row > 5 then sg_Zipcode.TopRow := sg_Zipcode.Row - 4;
    end else
    begin
      sg_Zipcode.TopRow := aTopRow;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_ZipcodeClick(sg_Zipcode);
end;

procedure TfmCompanyCode.ShowJijumCode(aCode: string;aTopRow:integer=0);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
  stCompanyCode : string;
begin
  GridInit(sg_jijumCode,2); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stCompanyCode := '000';
  if cmb_CompanyCode1.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode1.ItemIndex];

  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';
  if stCompanyCode <> '000' then
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + stCompanyCode + ''' ';
  stSql := stSql + ' order by CO_COMPANYCODE,CO_JIJUMCODE ';

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

      if aTopRow = 0 then
      begin
        if Row > 8 then TopRow := Row - 7;
      end else
      begin
        TopRow := aTopRow;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_JijumCodeClick(sg_JijumCode);
end;



procedure TfmCompanyCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  sCompanyCodeList.Free;
  JijumCodeList.Free;
  sJijumCodeList.Free;
end;

procedure TfmCompanyCode.JijumTabShow(Sender: TObject);
begin
  LoadCompany;
  ShowJijumCode('');
end;



procedure TfmCompanyCode.cmb_CompanyCode1Change(Sender: TObject);
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
    for i:= 1 to cmb_sCompanyCode1.Items.Count - 1 do
    begin
      if sCompanyCodeList.Strings[i] = cells[2,Row] then
      begin
        bResult := True;
        break;
      end;
    end;
    
    if bResult then cmb_sCompanyCode1.ItemIndex := i
    else cmb_sCompanyCode1.ItemIndex := 0;

  end;

end;

procedure TfmCompanyCode.cmb_sCompanyCode2Change(Sender: TObject);
var
  stCompanyCode : string;
begin
  stCompanyCode := '000';
  if cmb_sCompanyCode2.ItemIndex > 0 then stCompanyCode := sCompanyCodeList.Strings[cmb_sCompanyCode2.ItemIndex];

  LoadJijumCode(stCompanyCode,sJijumCodeList,cmb_sjijumCode2);

  if chk_AutoDepartCode.Checked then chk_AutoDepartCodeClick(self);
end;

procedure TfmCompanyCode.cmb_CompanyCode3Change(Sender: TObject);
begin
  ShowPosiCode('');
end;

procedure TfmCompanyCode.FormNameSet;
begin
  CompanyTab.Caption := FM001 + '관리';
  JijumTab.Caption := FM011 + '관리';
  DepartTab.Caption := FM021 + '관리';
  PosiTab.Caption := FM031 + '관리';

  with sg_CompanyCode do
  begin
    Cells[0,0] := FM001;
    Cells[1,0] := FM002;
  end;
  with sg_jijumCode do
  begin
    Cells[0,0] := FM011;
    Cells[1,0] := FM012;
    Cells[2,0] := FM001;
  end;
  with sg_DepartCode do
  begin
    Cells[0,0] := FM021;
    Cells[1,0] := FM022;
    Cells[2,0] := FM001;
    Cells[3,0] := FM011;
  end;
  with sg_Posi do
  begin
    Cells[0,0] := FM031;
    Cells[1,0] := FM032;
    Cells[2,0] := FM001;
  end;

  lb_CompanyCode.Caption := FM001;
  lb_CompanyCode1.Caption := FM001;
  lb_CompanyCode2.Caption := FM001;
  lb_CompanyCode3.Caption := FM001;
  lb_CompanyCode4.Caption := FM001;
  lb_CompanyCode5.Caption := FM001;
  lb_CompanyCode6.Caption := FM001;

  lb_CompanyName.Caption := FM002;

  lb_JijumCode.Caption := FM011;
  lb_JijumCode1.Caption := FM011;
  lb_JijumCode2.Caption := FM011;

  lb_JijumName.Caption := FM012;

  lb_DepartCode.Caption := FM021;
  lb_DepartName.Caption := FM022;

  lb_PosiCode.Caption := FM031;
  lb_PosiName.Caption := FM032;
end;

procedure TfmCompanyCode.ed_CompanyCodeChange(Sender: TObject);
begin
  if ed_CompanyCode.Text = '' then exit;
  if Not isDigit(ed_CompanyCode.Text) then
  begin
    showmessage('코드는 숫자로만 등록하세요');
    Exit;
  end;
end;

procedure TfmCompanyCode.chk_AutoCompanyCodeClick(Sender: TObject);
begin
  if chk_AutoCompanyCode.Checked then ed_CompanyCode.Text := GetAutoCompanyCode;
end;

function TfmCompanyCode.GetAutoCompanyCode: string;
var
  stSql : string;
  nSeq : integer;
begin
  nSeq := 1;
  stSql := CommonSql.GetMaxCompanyCode;
  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      result := FillZeroNumber(nSeq,3);
      Exit;
    End;
    if recordCount > 0 then
    begin
      if IsDigit(FindField('CO_COMPANYCODE').AsString) then
      begin
        nSeq := strtoint(FindField('CO_COMPANYCODE').AsString) + 1;
      end;
    end;
  end;
  result := FillZeroNumber(nSeq,3);
end;

function TfmCompanyCode.GetAutoDepartCode(aCompanyCode,
  aJijumCode: string): string;
var
  stSql : string;
  nSeq : integer;
begin
  result := '';
  if (aCompanyCode = '') or (aCompanyCode = '000') then Exit;
  if (aJijumCode = '') or (aJijumCode = '000') then Exit;
  nSeq := 1;
  stSql := CommonSql.GetMaxDepartCode(aCompanyCode,aJijumCode);
  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      result := FillZeroNumber(nSeq,3);
      Exit;
    End;
    if recordCount > 0 then
    begin
      if IsDigit(FindField('CO_DEPARTCODE').AsString) then
      begin
        nSeq := strtoint(FindField('CO_DEPARTCODE').AsString) + 1;
      end;
    end;
  end;
  result := FillZeroNumber(nSeq,3);
end;

function TfmCompanyCode.GetAutoJijumCode(aCompanyCode: string): string;
var
  stSql : string;
  nSeq : integer;
begin
  result := '';
  if (aCompanyCode = '') or (aCompanyCode = '000') then Exit;
  nSeq := 1;
  stSql := CommonSql.GetMaxJijumCode(aCompanyCode);
  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      result := FillZeroNumber(nSeq,3);
      Exit;
    End;
    if recordCount > 0 then
    begin
      if IsDigit(FindField('CO_JIJUMCODE').AsString) then
      begin
        nSeq := strtoint(FindField('CO_JIJUMCODE').AsString) + 1;
      end;
    end;
  end;
  result := FillZeroNumber(nSeq,3);
end;

function TfmCompanyCode.GetAutoPosiCode(aCompanyCode: string): string;
var
  stSql : string;
  nSeq : integer;
begin
  result := '';
  if (aCompanyCode = '') or (aCompanyCode = '000') then Exit;
  nSeq := 1;
  stSql := CommonSql.GetMaxPosiCode(aCompanyCode);
  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      result := FillZeroNumber(nSeq,3);
      Exit;
    End;
    if recordCount > 0 then
    begin
      if IsDigit(FindField('PO_POSICODE').AsString) then
      begin
        nSeq := strtoint(FindField('PO_POSICODE').AsString) + 1;
      end;
    end;
  end;
  result := FillZeroNumber(nSeq,3);
end;

procedure TfmCompanyCode.chk_AutoJijumCodeClick(Sender: TObject);
var
  stCompanyCode:string;
begin
  stCompanyCode := '';
  if cmb_sCompanyCode1.ItemIndex > 0 then stCompanyCode := sCompanyCodeList.Strings[cmb_sCompanyCode1.ItemIndex];
  if chk_AutoJijumCode.Checked then ed_jijumcode.Text := GetAutoJijumCode(stCompanyCode);

end;

procedure TfmCompanyCode.ed_jijumcodeChange(Sender: TObject);
begin
  if ed_jijumcode.Text = '' then exit;
  if Not isDigit(ed_jijumcode.Text) then
  begin
    showmessage('코드는 숫자로만 등록하세요');
    Exit;
  end;
end;

procedure TfmCompanyCode.chk_AutoDepartCodeClick(Sender: TObject);
var
  stCompanyCode:string;
  stJijumCode : string;
begin
  stCompanyCode := '000';
  stJijumCode := '000';
  if cmb_sCompanyCode2.ItemIndex > 0 then stCompanyCode := sCompanyCodeList.Strings[cmb_sCompanyCode2.ItemIndex];
  if cmb_sjijumCode2.ItemIndex > 0 then stJijumCode := copy(sJijumCodeList.Strings[cmb_sjijumCode2.itemIndex],4,3);
  if chk_AutoDepartCode.Checked then ed_DepartCode.Text := GetAutoDepartCode(stCompanyCode,stJijumCode);

end;

procedure TfmCompanyCode.ed_DepartCodeChange(Sender: TObject);
begin
  if ed_DepartCode.Text = '' then exit;
  if Not isDigit(ed_DepartCode.Text) then
  begin
    showmessage('코드는 숫자로만 등록하세요');
    Exit;
  end;
end;

procedure TfmCompanyCode.chk_AutoPosiCodeClick(Sender: TObject);
var
  stCompanyCode:string;
begin
  stCompanyCode := '';
  if cmb_sCompanyCode3.ItemIndex > 0 then stCompanyCode := sCompanyCodeList.Strings[cmb_sCompanyCode3.ItemIndex];
  if chk_AutoPosiCode.Checked then ed_posicode.Text := GetAutoPosiCode(stCompanyCode);

end;

procedure TfmCompanyCode.ed_posicodeChange(Sender: TObject);
begin
  if ed_posicode.Text ='' then Exit;
  if Not isDigit(ed_posicode.Text) then
  begin
    showmessage('코드는 숫자로만 등록하세요');
    Exit;
  end;
end;

procedure TfmCompanyCode.cmb_sCompanyCode1Change(Sender: TObject);
begin
  if chk_AutoJijumCode.Checked then chk_AutoJijumCodeClick(self);
end;

procedure TfmCompanyCode.cmb_sjijumCode2Change(Sender: TObject);
begin
  if chk_AutoDepartCode.Checked then chk_AutoDepartCodeClick(self);
end;

procedure TfmCompanyCode.cmb_jijumCode2Change(Sender: TObject);
begin
  ShowDepartCode('');
end;

procedure TfmCompanyCode.cmb_sCompanyCode3Change(Sender: TObject);
begin
  if chk_AutoPosiCode.Checked then chk_AutoPosiCodeClick(self);
end;

procedure TfmCompanyCode.FormResize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := fmCompanyCode.Width;
  nBlock := (nWidth - 50) div 6; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;
  nLeft := nCenter - (btn_Insert.Width div 2);

  btn_Insert.Left := 25 + nLeft;
  btn_Update.Left := 25 + nBlock + nLeft;
  btn_Save.Left := 25 + (nBlock * 2) + nLeft;
  btn_Delete.Left := 25 + (nBlock * 3) + nLeft;
  btn_Cancel.Left := 25 + (nBlock * 4) + nLeft;
  btn_Close.Left := 25 + (nBlock * 5) + nLeft;

end;

function TfmCompanyCode.CheckTB_EMPLOYEECompanyCode(
  aCompanyCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  result := False;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

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
      result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

end.
