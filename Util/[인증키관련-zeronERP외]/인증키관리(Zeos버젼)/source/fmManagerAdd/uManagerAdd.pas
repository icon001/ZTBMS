unit uManagerAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, Buttons, StdCtrls, ExtCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uSubForm, CommandArray;

type
  TfmManagerAdd = class(TfmASubForm)
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    cmb_Company: TComboBox;
    ed_PersonID: TEdit;
    ed_UserName: TEdit;
    ed_Email1: TEdit;
    ed_Email2: TEdit;
    mem_etc: TMemo;
    GroupBox2: TGroupBox;
    Panel5: TPanel;
    btn_PhoneAdd: TSpeedButton;
    Label2: TLabel;
    cmb_PhoneGubun: TComboBox;
    ed_AddPhone: TEdit;
    sg_Phone: TAdvStringGrid;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmbPosiName: TComboBox;
    Panel1: TPanel;
    TempQuery: TZQuery;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    ed_Zip: TEdit;
    Label3: TLabel;
    ed_Addr: TEdit;
    Label4: TLabel;
    pan_Customer: TPanel;
    sg_Customer: TAdvStringGrid;
    btn_add: TButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_CompanyExit(Sender: TObject);
    procedure cmb_CompanyKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_JijumExit(Sender: TObject);
    procedure cmb_JijumKeyPress(Sender: TObject; var Key: Char);
    procedure ed_UserNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_addClick(Sender: TObject);
    procedure sg_CustomerDblClick(Sender: TObject);
    procedure btn_PhoneAddClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure ed_AddPhoneKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    CompanyCodeList :TStringList;
    JijumCodeList :TStringList;
    DepartCodeList :TStringList;
    PhoneGubunList :TStringList;
    { Private declarations }
    procedure LoadCompanyCode(cmb_Box:TComboBox;aCompanyGubunCode:string;TempList:TStringList;bAll:Boolean = True);
    procedure LoadJijumCode(cmb_Box:TComboBox;aCompanyCode:string;TempList:TStringList;bAll:Boolean = True);
    procedure LoadDepartCode(cmb_Box:TComboBox;aCompanyCode,aJijumCode:string;TempList:TStringList;bAll:Boolean = True);
    procedure LoadPosiName;
    procedure LoadPoneGubun;
    procedure PhoneTypeCheck;
  private
    L_nSelectCompanyIndex : integer;
    L_nSelectJijumIndex : integer;
    L_bKeyPress : Boolean;

    procedure searchPhoneList(aPersonID:string);
    function GetMaxPersonID:string;
    function InsertTB_PERSON(aPersonID,aUserName,aCompanyCode,aJijumCode,aDepartCode,aPosiName,aEmail1,aEmail2,aZip,aAddr,aEtc:string):Boolean;
    function UpdateTB_PERSON(aPersonID,aUserName,aCompanyCode,aJijumCode,aDepartCode,aPosiName,aEmail1,aEmail2,aZip,aAddr,aEtc:string):Boolean;
    function CheckPhonList(aPersonID,aPhoneNum:string):Boolean;
    function GetMaxTelView(aPhoneNum:string):integer;
    function InsertIntoTelNumber(aPhoneNum,aPersonID,aTelGubun,aTelViewSeq:string):Boolean;
    function UpdateTelNumber(aPhoneNum,aPersonID,aTelGubun,aTelViewSeq:string):Boolean;
    function DeleteTB_TELNUM(aPersonID,aPhoneNum:string):Boolean;
    function DeleteTB_TELNUMUSERID(aPersonID:string):Boolean;

    function GetUserName:Boolean;
    function CheckTB_PERSON(aPersonID:string):Boolean;
  public
    L_TelNumber : string;
    L_CustomerName : string;
    L_stCustomerCode : string;
    L_bSave : Boolean;
    { Public declarations }
  end;

var
  fmManagerAdd: TfmManagerAdd;

implementation
uses
  uDataModule,
  uLomosUtil;
  
{$R *.dfm}

{ TfmManagerAdd }

function TfmManagerAdd.CheckPhonList(aPersonID,
  aPhoneNum: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_TELNUM ';
  stSql := stSql + ' Where PE_CODE = ''' + aPersonID + ''' ';
  stSql := stSql + ' AND TE_TELNUMBER = ''' + aPhoneNum + ''' ';

  With TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount > 0 then result := True;
  end;
end;

function TfmManagerAdd.DeleteTB_TELNUM(aPersonID,
  aPhoneNum: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete from TB_TELNUM ';
  stSql := stSql + ' where TE_TELNUMBER = ''' + aPhoneNum + ''' ';
  stSql := stSql + ' AND PE_CODE = ''' + aPersonID + ''' ';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmManagerAdd.DeleteTB_TELNUMUSERID(aPersonID: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_TELNUM ';
  stSql := stSql + ' Where PE_CODE = ''' + aPersonID + ''' ';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmManagerAdd.GetMaxPersonID: string;
var
  stSql : string;
  nPersonID : int64;
begin
  nPersonID := 1;
  stSql := ' Select Max(PE_CODE) as PE_CODE from TB_PERSON ';

  Try
    with TempQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      if isDigit(FindField('PE_CODE').AsString) then
      begin
        nPersonID := strtoint(FindField('PE_CODE').AsString) + 1;
      end;
    end;
  Finally
    result := FillZeroNumber2(nPersonID,10);
  End;

end;

function TfmManagerAdd.GetMaxTelView(aPhoneNum: string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'Select Max(TE_VIEWSEQ) as TE_VIEWSEQ from TB_TELNUM ';
  stSql := stSql + ' Where TE_TELNUMBER = ''' + aPhoneNum + ''' ';

  With TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if Not FindField('TE_VIEWSEQ').IsNull then result := FindField('TE_VIEWSEQ').AsInteger + 1;
  end;
end;

function TfmManagerAdd.InsertIntoTelNumber(aPhoneNum, aPersonID, aTelGubun,
  aTelViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_TELNUM( ';
  stSql := stSql + ' TE_TELNUMBER,';
  stSql := stSql + ' TE_GUBUN,';
  stSql := stSql + ' PE_CODE,';
  stSql := stSql + ' TE_VIEWSEQ)';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aPhoneNum + ''',';
  stSql := stSql + '''' + aTelGubun + ''',';
  stSql := stSql + '''' + aPersonID + ''',';
  stSql := stSql + '' + aTelViewSeq + ')';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmManagerAdd.InsertTB_PERSON(aPersonID, aUserName, aCompanyCode,
  aJijumCode, aDepartCode, aPosiName, aEmail1, aEmail2,aZip,aAddr,
  aEtc: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_PERSON( ';
  stSql := stSql + ' PE_CODE,';
  stSql := stSql + ' PE_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_JIJUMCODE,';
  stSql := stSql + ' CO_DEPARTCODE,';
  stSql := stSql + ' PE_POSITIONNAME,';
  stSql := stSql + ' PE_EMAIL1,';
  stSql := stSql + ' PE_EMAIL2,';
  stSql := stSql + ' PE_ZIPCODE,';
  stSql := stSql + ' PE_ADDR,';
  stSql := stSql + ' PE_MEMO ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aPersonID + ''', ';
  stSql := stSql + '''' + aUserName + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '''' + aJijumCode + ''', ';
  stSql := stSql + '''' + aDepartCode + ''', ';
  stSql := stSql + '''' + aPosiName + ''', ';
  stSql := stSql + '''' + aEmail1 + ''', ';
  stSql := stSql + '''' + aEmail2 + ''', ';
  stSql := stSql + '''' + aZip + ''', ';
  stSql := stSql + '''' + aAddr + ''', ';
  stSql := stSql + '''' + aEtc + ''') ';

  result := dmDB.ProcessExecSQL(stSql);
end;

procedure TfmManagerAdd.LoadCompanyCode(cmb_Box: TComboBox;
  aCompanyGubunCode: string; TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_COMPANY ';
  if aCompanyGubunCode <> '000' then
    stSql := stSql + ' Where CG_CODE = ''' + aCompanyGubunCode + ''' ';
  stSql := stSql + ' order by CO_NAME ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_NAME').AsString );
      TempList.Add(FindField('CO_COMPANYCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmManagerAdd.LoadDepartCode(cmb_Box: TComboBox; aCompanyCode,
  aJijumCode: string; TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_DEPART ';
  if aJijumCode = '000' then Exit;
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_DEPARTNAME').AsString );
      TempList.Add(FindField('CO_DEPARTCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmManagerAdd.LoadJijumCode(cmb_Box: TComboBox;
  aCompanyCode: string; TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_JIJUM ';
  if aCompanyCode = '000' then Exit;
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_JIJUMNAME').AsString );
      TempList.Add(FindField('CO_JIJUMCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmManagerAdd.LoadPoneGubun;
var
  stSql : string;
begin
  PhoneGubunList.Clear;
  cmb_PhoneGubun.Clear;
  stSql := 'select * from TB_TELGUBUN ';
  stSql := stSql + ' order by TE_GUBUN ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_PhoneGubun.Items.Add(FindField('TE_GUBUNNAME').AsString );
      PhoneGubunList.Add(FindField('TE_GUBUN').AsString);
      Next;
    end;
    cmb_PhoneGubun.ItemIndex := 0;
  end;
end;

procedure TfmManagerAdd.LoadPosiName;
var
  stSql : string;
begin
  cmbPosiName.Clear;

  stSql := 'select PE_POSITIONNAME from TB_PERSON ';
  stSql := stSql + ' Group by PE_POSITIONNAME ';
  stSql := stSql + ' order by PE_POSITIONNAME ';

  with TempQuery do
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
      cmbPosiName.Items.Add(FindField('PE_POSITIONNAME').AsString);
      Next;
    end;
  end;
end;

procedure TfmManagerAdd.searchPhoneList(aPersonID: string);
var
  stSql :string;
  nRow : integer;
  stGubun : string;
begin
  GridInit(sg_Phone,3);

  stSql := 'select a.*,b.TE_GUBUNNAME from TB_TELNUM a ';
  stSql := stSql + ' Left Join TB_TELGUBUN b ';
  stSql := stSql + ' ON ( a.TE_GUBUN = b.TE_GUBUN ) ';
  stSql := stSql + ' Where a.PE_CODE = ''' + aPersonID + ''' ';

  with TempQuery do
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
    sg_Phone.RowCount := recordCount + 1;
    nRow := 1;
    while Not Eof do
    begin
      with sg_Phone do
      begin               
        AddButton(0,nRow,1,1,'X',haFull,vaFull);
        cells[1,nRow] := FindField('TE_GUBUNNAME').AsString;
        cells[2,nRow] := PhoneNumberType(FindField('TE_TELNUMBER').AsString);
        cells[3,nRow] := FindField('TE_GUBUN').AsString;
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
end;

function TfmManagerAdd.UpdateTB_PERSON(aPersonID, aUserName, aCompanyCode,
  aJijumCode, aDepartCode, aPosiName, aEmail1, aEmail2,aZip,aAddr,
  aEtc: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_PERSON Set ';
  stSql := stSql + ' PE_NAME = ''' + aUserName + ''',';
  stSql := stSql + ' CO_COMPANYCODE = ''' + aCompanyCode + ''',';
  stSql := stSql + ' CO_JIJUMCODE = ''' + aJijumCode + ''',';
  stSql := stSql + ' CO_DEPARTCODE = ''' + aDepartCode + ''',';
  stSql := stSql + ' PE_POSITIONNAME = ''' + aPosiName + ''',';
  stSql := stSql + ' PE_EMAIL1 = ''' + aEmail1 + ''',';
  stSql := stSql + ' PE_EMAIL2 = ''' + aEmail2 + ''',';
  stSql := stSql + ' PE_ZIPCODE = ''' + aZip + ''',';
  stSql := stSql + ' PE_ADDR = ''' + aAddr + ''',';
  stSql := stSql + ' PE_MEMO = ''' + aEtc + ''' ';
  stSql := stSql + ' Where PE_CODE = ''' + aPersonID + '''  ';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmManagerAdd.UpdateTelNumber(aPhoneNum, aPersonID, aTelGubun,
  aTelViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_TELNUM Set ';
  stSql := stSql + ' TE_GUBUN = ''' + aTelGubun + ''',';
  stSql := stSql + ' TE_VIEWSEQ = ' + aTelViewSeq + ' ';
  stSql := stSql + ' Where TE_TELNUMBER = ''' + aPhoneNum + ''' ';
  stSql := stSql + ' AND PE_CODE = ''' + aPersonID + ''',';

  result := dmDB.ProcessExecSQL(stSql);
end;

procedure TfmManagerAdd.btn_CloseClick(Sender: TObject);
begin
  L_bSave := False;
  Close;
end;

procedure TfmManagerAdd.FormCreate(Sender: TObject);
begin
  inherited;
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PhoneGubunList := TStringList.Create;

end;

procedure TfmManagerAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PhoneGubunList.Free;
end;

procedure TfmManagerAdd.FormShow(Sender: TObject);
begin
  LoadCompanyCode(cmb_Company,'000',CompanyCodeList,False);
  LoadJijumCode(cmb_Jijum,'000',JijumCodeList,False);
  LoadDepartCode(cmb_Depart,'000','000',DepartCodeList,False);

  LoadPoneGubun;
  LoadPosiName;

  ed_AddPhone.Text := L_TelNumber;
  ed_PersonID.Text := GetMaxPersonID;
  PhoneTypeCheck;
end;

procedure TfmManagerAdd.cmb_CompanyChange(Sender: TObject);
begin
  if cmb_Company.itemIndex < 0 then Exit;
  if L_bKeyPress then Exit;
  L_nSelectCompanyIndex := cmb_Company.ItemIndex;
  LoadJijumCode(cmb_Jijum,CompanyCodeList.Strings[cmb_Company.itemIndex],JijumCodeList,False);
  LoadDepartCode(cmb_Depart,CompanyCodeList.Strings[cmb_Company.itemIndex],'000',DepartCodeList,False);

end;

procedure TfmManagerAdd.cmb_CompanyExit(Sender: TObject);
begin
  inherited;
  L_bKeyPress := False;
  cmb_CompanyChange(Sender);

end;

procedure TfmManagerAdd.cmb_CompanyKeyPress(Sender: TObject;
  var Key: Char);
var
  i : integer;
  stWriteCompanyName : string;
begin
  inherited;
  stWriteCompanyName := cmb_Company.Text;
  L_bKeyPress := True;
  if Key <> #13 then exit;
  L_bKeyPress := False;
  if L_nSelectCompanyIndex > (cmb_Company.Items.Count - 1) then Exit;
  for i:= L_nSelectCompanyIndex + 1 to cmb_Company.Items.Count - 1 do
  begin
    if Pos( UpperCase(stWriteCompanyName),UpperCase(cmb_Company.Items.Strings[i])) > 0 then
    begin
      cmb_Company.ItemIndex := i;
      cmb_Company.Text := cmb_Company.Items.Strings[i];
      break;
    end else L_nSelectCompanyIndex := -1;
  end;
  cmb_CompanyChange(Sender);

end;

procedure TfmManagerAdd.cmb_JijumChange(Sender: TObject);
begin
  inherited;
  if cmb_Jijum.itemIndex < 0 then Exit;
  if L_bKeyPress then Exit;
  L_nSelectJijumIndex := cmb_Jijum.ItemIndex;
  LoadDepartCode(cmb_Depart,CompanyCodeList.Strings[cmb_Company.itemIndex],JijumCodeList.Strings[cmb_Jijum.itemIndex],DepartCodeList,False);

end;

procedure TfmManagerAdd.cmb_JijumExit(Sender: TObject);
begin
  inherited;
  L_bKeyPress := False;
  cmb_JijumChange(Sender);

end;

procedure TfmManagerAdd.cmb_JijumKeyPress(Sender: TObject; var Key: Char);
var
  i : integer;
  stWriteJijumName : string;
begin
  inherited;
  stWriteJijumName := cmb_Jijum.Text;
  L_bKeyPress := True;
  if Key <> #13 then exit;
  L_bKeyPress := False;
  if L_nSelectJijumIndex > (cmb_Jijum.Items.Count - 1) then Exit;
  for i:= L_nSelectJijumIndex + 1 to cmb_Jijum.Items.Count - 1 do
  begin
    if Pos( UpperCase(stWriteJijumName),UpperCase(cmb_Jijum.Items.Strings[i])) > 0 then
    begin
      cmb_Jijum.ItemIndex := i;
      break;
    end else L_nSelectJijumIndex := -1;
  end;
  cmb_JijumChange(Sender);

end;

procedure TfmManagerAdd.ed_UserNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ed_UserName.Text <> '' then
     GetUserName;

end;

function TfmManagerAdd.GetUserName: Boolean;
var
  stSql : string;
  nRow : integer;
begin
  pan_Customer.Visible := False;
  result := False;
  stSql := 'select a.*,b.CO_NAME,c.CO_JIJUMNAME,d.CO_DEPARTNAME from TB_PERSON a ';
  stSql := stSql + ' Left Join TB_COMPANY b ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE) ';
  stSql := stSql + ' Left Join TB_JIJUM c ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = c.CO_JIJUMCODE) ';
  stSql := stSql + ' Left Join TB_DEPART d ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = d.CO_DEPARTCODE) ';
  stSql := stSql + ' Where a.PE_NAME Like ''%' + ed_UserName.Text + '%'' ';
  stSql := stSql + ' order by a.PE_NAME ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    pan_Customer.Visible := True;
    GridInit(sg_Customer,4); //스트링그리드 초기화
    with sg_Customer do
    begin
      RowCount := recordCount + 1;
      nRow := 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('PE_NAME').AsString;
        Cells[1,nRow] := FindField('CO_NAME').AsString;
        Cells[2,nRow] := FindField('CO_JIJUMNAME').AsString;
        Cells[3,nRow] := FindField('CO_DEPARTNAME').AsString;
        Cells[4,nRow] := FindField('PE_CODE').AsString;
        Cells[5,nRow] := FindField('CO_COMPANYCODE').AsString;
        Cells[6,nRow] := FindField('CO_JIJUMCODE').AsString;
        Cells[7,nRow] := FindField('CO_DEPARTCODE').AsString;
        Cells[8,nRow] := FindField('PE_POSITIONNAME').AsString;
        Cells[9,nRow] := FindField('PE_ZIPCODE').AsString;
        Cells[10,nRow] := FindField('PE_ADDR').AsString;
        inc(nRow);
        next;
      end;
    end;
  end;
  result := True;
end;

procedure TfmManagerAdd.btn_addClick(Sender: TObject);
begin
  inherited;
  pan_Customer.Visible := False;
end;

procedure TfmManagerAdd.sg_CustomerDblClick(Sender: TObject);
begin
  inherited;
  with sg_Customer do
  begin
    ed_UserName.Text := Cells[0,Row];
    ed_PersonID.Text := Cells[4,Row];
    cmb_Company.ItemIndex := CompanyCodeList.IndexOf(Cells[5,Row]);
    if cmb_Company.ItemIndex > 0 then
      LoadJijumCode(cmb_Jijum,CompanyCodeList.Strings[cmb_Company.itemIndex],JijumCodeList,False);
    cmb_Jijum.ItemIndex := JijumCodeList.IndexOf(Cells[6,Row]);
    if cmb_Jijum.ItemIndex > 0 then
      LoadDepartCode(cmb_Depart,CompanyCodeList.Strings[cmb_Company.itemIndex],JijumCodeList.Strings[cmb_Jijum.itemIndex],DepartCodeList,False);
    cmb_Depart.ItemIndex := DepartCodeList.IndexOf(Cells[7,Row]);
    cmbPosiName.Text := Cells[8,Row];
    ed_Zip.Text := Cells[9,Row];
    ed_Addr.Text := Cells[10,Row];
    pan_Customer.visible := False;
    searchPhoneList(ed_PersonID.Text);
  end;

end;

procedure TfmManagerAdd.btn_PhoneAddClick(Sender: TObject);
var
  stTelGubun : string;
  stPhoneNum : string;
  nTelViewSeq : integer;
begin

  stPhoneNum := StringReplace(ed_AddPhone.Text,'-','',[rfReplaceAll]);
  if isdigit(stPhoneNum) then
  begin
    nTelViewSeq := GetMaxTelView(stPhoneNum);
    stTelGubun := '000';
    if cmb_PhoneGubun.itemIndex > -1 then
      stTelGubun := PhoneGubunList.Strings[cmb_PhoneGubun.itemIndex];
    if CheckPhonList(ed_PersonID.Text,stPhoneNum) then
    begin
      UpdateTelNumber(stPhoneNum,ed_PersonID.Text,stTelGubun,inttostr(nTelViewSeq));
    end else
    begin
      InsertIntoTelNumber(stPhoneNum,ed_PersonID.Text,stTelGubun,inttostr(nTelViewSeq));
    end;
    ed_AddPhone.Text := '';
  end;
  searchPhoneList(ed_PersonID.Text);
end;

procedure TfmManagerAdd.btn_SaveClick(Sender: TObject);
var
  bResult : Boolean;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPhoneNum : string;
  stTelGubun : string;
  nTelViewSeq : integer;
begin
  stCompanyCode := '000';
  stJijumCode := '000';
  stDepartCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  if cmb_Jijum.ItemIndex > 0 then stJijumCode := JijumCodeList.Strings[cmb_Jijum.ItemIndex];
  if cmb_Depart.ItemIndex > 0 then stDepartCode := DepartCodeList.Strings[cmb_Depart.ItemIndex];

  stPhoneNum := StringReplace(ed_AddPhone.Text,'-','',[rfReplaceAll]);
  if isdigit(stPhoneNum) then
  begin
    nTelViewSeq := GetMaxTelView(stPhoneNum);
    stTelGubun := '000';
    if cmb_PhoneGubun.itemIndex > -1 then
      stTelGubun := PhoneGubunList.Strings[cmb_PhoneGubun.itemIndex];
    if CheckPhonList(ed_PersonID.Text,stPhoneNum) then
    begin
      UpdateTelNumber(stPhoneNum,ed_PersonID.Text,stTelGubun,inttostr(nTelViewSeq));
    end else
    begin
      InsertIntoTelNumber(stPhoneNum,ed_PersonID.Text,stTelGubun,inttostr(nTelViewSeq));
    end;
  end;

  if CheckTB_PERSON(ed_PersonID.Text) then
  begin
    bResult := UpdateTB_PERSON(ed_PersonID.Text,
                               ed_UserName.Text,
                               stCompanyCode,
                               stJijumCode,
                               stDepartCode,
                               cmbPosiName.Text,
                               ed_Email1.Text,
                               ed_Email2.Text,
                               ed_zip.Text,
                               ed_Addr.Text,
                               mem_etc.Text);
  end else
  begin
    bResult := InsertTB_PERSON(ed_PersonID.Text,
                               ed_UserName.Text,
                               stCompanyCode,
                               stJijumCode,
                               stDepartCode,
                               cmbPosiName.Text,
                               ed_Email1.Text,
                               ed_Email2.Text,
                               ed_zip.Text,
                               ed_Addr.Text,
                               mem_etc.Text);
  end;
  if Not bResult then
  begin
    showmessage('데이터 저장에 실패 했습니다.');
    Exit;
  end;
  L_bSave := True;
  Close;
end;

function TfmManagerAdd.CheckTB_PERSON(aPersonID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_PERSON ';
  stSql := stSql + ' Where PE_CODE = ''' + aPersonID + ''' ';

  With TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount > 0 then result := True;
  end;
end;

procedure TfmManagerAdd.ed_AddPhoneKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  PhoneTypeCheck;
end;

procedure TfmManagerAdd.PhoneTypeCheck;
begin
  if (copy(ed_AddPhone.Text,1,3) = '010') or
     (copy(ed_AddPhone.Text,1,3) = '011') or
     (copy(ed_AddPhone.Text,1,3) = '016') or
     (copy(ed_AddPhone.Text,1,3) = '017') or
     (copy(ed_AddPhone.Text,1,3) = '019') then
  begin
    cmb_PhoneGubun.ItemIndex := 0;
  end else
  begin
    if cmb_PhoneGubun.ItemIndex = 0 then
      cmb_PhoneGubun.ItemIndex := 1;
  end;
end;

end.
