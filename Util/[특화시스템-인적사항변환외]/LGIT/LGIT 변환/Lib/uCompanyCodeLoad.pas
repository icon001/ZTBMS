unit uCompanyCodeLoad;

interface
uses ADODB,StdCtrls,Classes,SysUtils,ActiveX;

procedure LoadCompanyCode(aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadJijumCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadDepartCode(aCompanyCode,aJijumCode:string;aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadPosiCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadEmpType(aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadEmpSearchType(cmb_Box:TComboBox);
procedure LoadRegGubun(cmb_Box:TComboBox);
procedure LoadCardGubun(cmb_Box:TComboBox);

procedure LoadsCompanyCode(aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadsJijumCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadsDepartCode(aCompanyCode,aJijumCode:string;aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadsPosiCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadsEmpType(aStringList:TStringList;cmb_Box:TComboBox);
procedure LoadsCardGubun(cmb_Box:TComboBox);

implementation
uses
  uDataModule1;

procedure LoadCompanyCode(aStringList:TStringList;cmb_Box:TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
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

  cmb_Box.Items.Add('��ü');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

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
  cmb_Box.Items.Add('��ü');
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
  stSql := stSql + ' order by a.CO_COMPANYCODE,a.CO_JIJUMCODE';

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

  cmb_Box.Items.Add('��ü');
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
  stSql := stSql + ' order by a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE ';

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
  cmb_Box.Items.Add('��ü');
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
  stSql := stSql + ' order by a.CO_COMPANYCODE,a.CO_JIJUMCODE';

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
  stSql := stSql + ' order by a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE ';

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
  cmb_Box.Items.Add('��ü');
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
  cmb_Box.Items.Add('����ȭ��ȣ');
  cmb_Box.Items.Add('�޴�����ȣ');
  cmb_Box.Items.Add('ī���ȣ');
  cmb_Box.Items.Add('ī���ϱ���');
  cmb_Box.Items.Add(FM042);
  cmb_Box.Items.Add('ī��Ÿ��');
  cmb_Box.ItemIndex := 0;
end;

procedure LoadRegGubun(cmb_Box:TComboBox);
begin
  cmb_Box.Clear;
  cmb_Box.Items.Add('0.��ü');
  cmb_Box.Items.Add('1.���');
  cmb_Box.Items.Add('2.�н�');
  cmb_Box.Items.Add('3.����');
  cmb_Box.ItemIndex := 0;
end;

procedure LoadCardGubun(cmb_Box:TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  cmb_Box.Items.Add('��ü');
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


end.
