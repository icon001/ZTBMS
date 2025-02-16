unit uCompanyCodeLoad;

interface
uses ADODB,StdCtrls,Classes,SysUtils,ActiveX;

procedure LoadAntiGroupCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadCompanyCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True);
procedure LoadJijumCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadDepartCode(aCompanyCode,aJijumCode:string;aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadPosiCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadEmpType(aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadEmpSearchType(cmb_Box:TComboBox);
procedure LoadRegGubun(cmb_Box:TComboBox);
procedure LoadCardGubun(cmb_Box:TComboBox);
procedure LoadWorkGubun(aStringList:TStringList;cmb_Box:TComboBox;aAll:string='');

procedure LoadsCompanyCode(aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadsJijumCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadsDepartCode(aCompanyCode,aJijumCode:string;aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadsPosiCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadsEmpType(aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadsCardGubun(cmb_Box:TComboBox);

procedure LoadFoodArea(aList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllName:string='전체');

implementation
uses
  uDataModule1,
  uLomosUtil;
  
procedure LoadAntiGroupCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select AG_CODE,AG_NAME from TB_ANTIGROUPCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by AG_CODE ';

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

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('AG_NAME').AsString);
        aStringList.Add(inttostr(FindField('AG_CODE').AsInteger));
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadCompanyCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  stTemp : string;
begin
  cmb_Box.Clear;
  aStringList.Clear;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE from TB_COMPANY a ';
  if strtoint(CompanyGrade) = 1 then
  begin
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1''';
  if strtoint(CompanyGrade) = 1 then
     stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  stSql := stSql + ' Group by a.CO_NAME,a.CO_COMPANYCODE ';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by a.CO_COMPANYCODE ';
  end else
  begin
    stSql := stSql + ' Order by a.CO_NAME ';
  end;

  //if aAll then   //잘못하면 CompanyCodeList 의 인덱스와 맞지 않을 수 있다
  //begin
    cmb_Box.Items.Add('전체');
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  //end;

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
      stTemp := FindField('CO_COMPANYCODE').AsString + FindField('CO_NAME').AsString;
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      aStringList.Add(FindField('CO_COMPANYCODE').AsString);
      Next;
    end;
    if RecordCount = 1 then
    begin
      cmb_Box.ItemIndex := 1;
    end else
    begin
      if strtoint(CompanyGrade) > 1 then
      begin
        nIndex := aStringList.IndexOf(MasterCompany);
        if nIndex > 0 then cmb_Box.ItemIndex := nIndex;
      end;
      if cmb_Box.Items.Count > 0 then
         cmb_Box.ItemIndex := 0;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure LoadJijumCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  i : integer;
  nIndex : integer;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('전체');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  if CompanyGrade = '2' then
  begin
    stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
    stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.CO_GUBUN = ''2''';
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  end else
  begin
    stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.CO_GUBUN = ''2''';
    if IsMaster or ( strtoint(CompanyGrade) < 2) then
    begin
      if (aCompanyCode = '000') or (aCompanyCode = '') then Exit;
    end;
    if (aCompanyCode <> '000') and (aCompanyCode <> '') then
        stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  end;

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by a.CO_COMPANYCODE,a.CO_JIJUMCODE ';
  end else
  begin
    stSql := stSql + ' Order by a.CO_NAME ';
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

    First;

    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      aStringList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString);
      Next;
    end;

    if RecordCount = 1 then
    begin
      cmb_Box.ItemIndex := 1;
    end else
    begin
      if MasterJijum <> '000' then
      begin
        nIndex := aStringList.IndexOf(MasterCompany + MasterJijum);
        if nIndex > 0 then cmb_Box.ItemIndex := nIndex;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

procedure LoadDepartCode(aCompanyCode,aJijumCode:string;aStringList:TStringList;cmb_Box:TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  i : integer;
  nIndex : integer;
begin
  cmb_Box.Clear;
  aStringList.Clear;

  cmb_Box.Items.Add('전체');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  if CompanyGrade = '3' then
  begin
    stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
    stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.CO_GUBUN = ''3''';
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  end else
  begin
    stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.CO_GUBUN = ''3''';
    if IsMaster or (strtoint(CompanyGrade) < 3) then
    begin
      if (aJijumCode = '000') or (aJijumCode = '') then Exit;
    end;
    if (aJijumCode <> '000') and (aJijumCode <> '') then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
    end;
  end;

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE ';
  end else
  begin
    stSql := stSql + ' Order by a.CO_NAME ';
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

    First;

    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      aStringList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString + FindField('CO_DEPARTCODE').AsString);
      Next;
    end;
    if RecordCount = 1 then
    begin
      cmb_Box.ItemIndex := 1;
    end else
    begin
      if MasterDepart <> '000' then
      begin
        nIndex := aStringList.IndexOf(MasterCompany + MasterJijum + MasterDepart);
        if nIndex > 0 then cmb_Box.ItemIndex := nIndex;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure LoadPosiCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('전체');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_POSI ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aCompanyCode = '') or (aCompanyCode = '000') then Exit;
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
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

    First;

    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('PO_NAME').AsString);
      aStringList.Add(FindField('CO_COMPANYCODE').AsString + FindField('PO_POSICODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure LoadsCompanyCode(aStringList:TStringList;cmb_Box:TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;

  cmb_Box.Items.Add('');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE from TB_COMPANY a ';
  if strtoint(CompanyGrade) = 1 then
  begin
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1''';
  if strtoint(CompanyGrade) = 1 then
     stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  stSql := stSql + ' Group by a.CO_NAME,a.CO_COMPANYCODE ';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by a.CO_COMPANYCODE ';
  end else
  begin
    stSql := stSql + ' Order by a.CO_NAME ';
  end;

{  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE from TB_COMPANY a ';
  if CompanyGrade = '1' then
  begin
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1''';
  if CompanyGrade = '1' then
     stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
}

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
        cmb_Box.Items.Add(FindField('CO_NAME').AsString);
        aStringList.Add(FindField('CO_COMPANYCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


procedure LoadsJijumCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  i : integer;
  nIndex : integer;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  if CompanyGrade = '2' then
  begin
    stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
    stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.CO_GUBUN = ''2''';
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  end else
  begin
    stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.CO_GUBUN = ''2''';
    if IsMaster or ( strtoint(CompanyGrade) < 2) then
    begin
      if (aCompanyCode = '000') or (aCompanyCode = '') then Exit;
    end;
    if (aCompanyCode <> '000') and (aCompanyCode <> '') then
        stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  end;
  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by a.CO_COMPANYCODE,a.CO_JIJUMCODE ';
  end else
  begin
    stSql := stSql + ' Order by a.CO_NAME ';
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

    First;

    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      aStringList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString);
      Next;
    end;

    if RecordCount = 1 then
    begin
      cmb_Box.ItemIndex := 1;
    end else
    begin
      if MasterJijum <> '000' then
      begin
        nIndex := aStringList.IndexOf(MasterCompany + MasterJijum);
        if nIndex > 0 then cmb_Box.ItemIndex := nIndex;
      end;
    end;
    
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

procedure LoadsDepartCode(aCompanyCode,aJijumCode:string;aStringList:TStringList;cmb_Box:TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  if (aCompanyCode = '000') or (aCompanyCode = '') then Exit;

  if CompanyGrade = '3' then
  begin
    stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
    stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.CO_GUBUN = ''3''';
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  end else
  begin
    stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.CO_GUBUN = ''3''';
    if IsMaster or (strtoint(CompanyGrade) < 3) then
    begin
      if (aJijumCode = '000') or (aJijumCode = '') then Exit;
    end;
    if (aJijumCode <> '000') and (aJijumCode <> '') then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
    end;
  end;
  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE ';
  end else
  begin
    stSql := stSql + ' Order by a.CO_NAME ';
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

    First;

    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      aStringList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString +  FindField('CO_DEPARTCODE').AsString);
      Next;
    end;
    if RecordCount = 1 then
    begin
      cmb_Box.ItemIndex := 1;
    end else
    begin
      if MasterDepart <> '000' then
      begin
        nIndex := aStringList.IndexOf(MasterCompany + MasterJijum + MasterDepart);
        if nIndex > 0 then cmb_Box.ItemIndex := nIndex;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure LoadsPosiCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_POSI ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aCompanyCode = '') or (aCompanyCode = '000') then Exit;
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
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

    First;

    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('PO_NAME').AsString);
      aStringList.Add(FindField('CO_COMPANYCODE').AsString + FindField('PO_POSICODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure LoadsEmpType(aStringList:TStringList;cmb_Box:TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_RELAYGUBUN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by RG_CODE ';

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
      cmb_Box.Items.Add(FindField('RG_NAME').AsString);
      aStringList.Add(FindField('RG_CODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure LoadEmpType(aStringList:TStringList;cmb_Box:TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('전체');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_RELAYGUBUN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by RG_CODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('RG_NAME').AsString);
        aStringList.Add(FindField('RG_CODE').AsString);
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadEmpSearchType(cmb_Box:TComboBox);
begin
  cmb_Box.Clear;
  cmb_Box.Items.Add(FM101);
  cmb_Box.Items.Add(FM102);
  cmb_Box.Items.Add(FM103);
  cmb_Box.Items.Add('집전화번호');
  cmb_Box.Items.Add(FM107);
  cmb_Box.Items.Add('카드번호');
  cmb_Box.Items.Add('카드등록구분');
  cmb_Box.Items.Add(FM042);
  cmb_Box.Items.Add('카드타입');
  cmb_Box.Items.Add(FM108);
  cmb_Box.Items.Add(FM109);
  //cmb_Box.Items.Add(FM110);
  cmb_Box.ItemIndex := 0;
end;

procedure LoadRegGubun(cmb_Box:TComboBox);
begin
  cmb_Box.Clear;
  cmb_Box.Items.Add('0.전체');
  cmb_Box.Items.Add('1.등록');
  cmb_Box.Items.Add('2.분실');
  cmb_Box.Items.Add('3.정지');
  cmb_Box.ItemIndex := 0;
end;

procedure LoadCardGubun(cmb_Box:TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  cmb_Box.Items.Add('전체');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_CARDTYPE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by CT_CODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('CT_CODE').AsString + '.' + FindField('CT_NAME').AsString);
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadWorkGubun(aStringList:TStringList;cmb_Box:TComboBox;aAll:string='');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add(aAll);
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_WORKGUBUN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by WG_CODE ';

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
      cmb_Box.Items.Add(FindField('WG_NAME').AsString);
      aStringList.Add(FindField('WG_CODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;
procedure LoadsCardGubun(cmb_Box:TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;

  stSql := 'select * from TB_CARDTYPE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by CT_CODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('CT_CODE').AsString + '.' + FindField('CT_NAME').AsString);
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  if cmb_Box.Items.Count > 0 then cmb_Box.ItemIndex := 0;
end;


procedure LoadFoodArea(aList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllName:string='전체');
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  aList.Clear;
  cmb_Box.Clear;
  if aAll then
  begin
    aList.Add('');
    cmb_Box.Items.Add(aAllName);
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select a.* from TB_FOOD a';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINFOOD f ';
    stSql := stSql + ' ON (a.AC_NODENO=f.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = f.AC_ECUID AND a.FO_DOORNO = f.FO_DOORNO ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
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

      if RecordCount < 1 then Exit;
      First;
      While Not Eof do
      begin
        aList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString  + FindField('FO_DOORNO').AsString);
        cmb_Box.Items.Add(FindField('FO_NAME').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  if cmb_Box.Items.Count > 0 then cmb_Box.ItemIndex := 0;

end;

end.
