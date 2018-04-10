unit uConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls,WinSpool;

type
  TfmConfig = class(TForm)
    sbSave: TSpeedButton;
    sbCancel: TSpeedButton;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    cmb_InCardType: TComboBox;
    cmb_SaveCardType: TComboBox;
    TabSheet2: TTabSheet;
    StaticText3: TStaticText;
    cmb_InDeviceType: TComboBox;
    rg_CardRegType: TGroupBox;
    StaticText4: TStaticText;
    cmb_ComPort: TComboBox;
    TabSheet3: TTabSheet;
    StaticText5: TStaticText;
    cmb_IncardLength: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure cmb_InDeviceTypeChange(Sender: TObject);
  private
    ComPortList : TStringList;
    { Private declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;
  private
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):string;
    procedure PortRefresh;
  public
    { Public declarations }
  end;

var
  fmConfig: TfmConfig;

implementation

uses
  uCommonVariable,
  uDBModule;
{$R *.dfm}

procedure TfmConfig.FormCreate(Sender: TObject);
begin
  ComPortList := TStringList.Create;

  cmb_InCardType.ItemIndex := G_nInputCardType;
  cmb_SaveCardType.ItemIndex := G_nSaveCardType;
  cmb_InDeviceType.ItemIndex := G_nInputDeviceType;
  cmb_IncardLength.ItemIndex := G_nInputCardLengthType;

  cmb_InDeviceTypeChange(self);   

end;

procedure TfmConfig.sbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmConfig.sbSaveClick(Sender: TObject);
var
  stSql : string;
  nComPort : integer;
begin
  nComPort := G_nCardRegisterPort;
  G_nInputCardType := cmb_InCardType.ItemIndex ;
  G_nSaveCardType := cmb_SaveCardType.ItemIndex;
  G_nInputDeviceType := cmb_InDeviceType.ItemIndex;
  if G_nInputDeviceType = 0 then
  begin
    if cmb_ComPort.ItemIndex > -1 then
    begin
      nComPort := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
      G_nCardRegisterPort := nComPort;
    end;
  end;

  G_nInputCardLengthType := cmb_IncardLength.ItemIndex;

  stSql := UpdateTB_CONFIG('DEVCONV','INCARD',inttostr(G_nInputCardType));
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('DEVCONV','SAVECARD',inttostr(G_nSaveCardType));
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('DEVCONV','INDEVTYPE',inttostr(G_nInputDeviceType));
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('DEVCONV','INCOMPORT',inttostr(G_nCardRegisterPort));
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('DEVCONV','INCDLENTP',inttostr(G_nInputCardLengthType));
  dmDBModule.ProcessExecSQL(stSql);

  Close;
end;

function TfmConfig.UpdateTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string): string;
var
  stSql : string;
begin
  stSql := 'Update TB_CONFIG ';
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result :=  stSql;

end;

procedure TfmConfig.cmb_InDeviceTypeChange(Sender: TObject);
begin
  rg_CardRegType.Visible := False;
  if cmb_InDeviceType.ItemIndex = 0 then
  begin
    rg_CardRegType.Visible := True;
    PortRefresh;
  end;
end;

procedure TfmConfig.PortRefresh;
var
  nCount : integer;
  nIndex : integer;
  i : integer;
  stComPort : string;
begin
  nCount := GetSerialPortList(ComPortList);
  cmb_ComPort.Clear;
  if nCount = 0 then
  begin
    Exit;
  end;

  for i:= 0 to nCount - 1 do
  begin
    cmb_ComPort.items.Add(ComPortList.Strings[i])
  end;
  if G_nCardRegisterPort > 0 then
  begin
    stComPort := EncodeCommportName(G_nCardRegisterPort);
    nIndex := cmb_ComPort.Items.IndexOf(stComPort);
    if nIndex > -1 then cmb_ComPort.ItemIndex := nIndex;
  end else
    cmb_ComPort.ItemIndex := 0;

end;

function TfmConfig.DecodeCommportName(PortName: String): WORD;
var
 Pt : Integer;
begin
 PortName := UpperCase(PortName);
 if (Copy(PortName, 1, 3) = 'COM') then begin
    Delete(PortName, 1, 3);
    Pt := Pos(':', PortName);
    if Pt = 0 then Result := 0
       else Result := StrToInt(Copy(PortName, 1, Pt-1));
 end
 else if (Copy(PortName, 1, 7) = '\\.\COM') then begin
    Delete(PortName, 1, 7);
    Result := StrToInt(PortName);
 end
 else Result := 0;
end;

function TfmConfig.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

function TfmConfig.GetSerialPortList(List: TStringList;
  const doOpenTest: Boolean): LongWord;
type
 TArrayPORT_INFO_1 = array[0..0] Of PORT_INFO_1;
 PArrayPORT_INFO_1 = ^TArrayPORT_INFO_1;
var
{$IF USE_ENUMPORTS_API}
 PL : PArrayPORT_INFO_1;
 TotalSize, ReturnCount : LongWord;
 Buf : String;
 CommNum : WORD;
{$IFEND}
 I : LongWord;
 CHandle : THandle;
begin
 List.Clear;
{$IF USE_ENUMPORTS_API}
 EnumPorts(nil, 1, nil, 0, TotalSize, ReturnCount);
 if TotalSize < 1 then begin
    Result := 0;
    Exit;
    end;
 GetMem(PL, TotalSize);
 EnumPorts(nil, 1, PL, TotalSize, TotalSize, Result);

 if Result < 1 then begin
    FreeMem(PL);
    Exit;
    end;

 for I:=0 to Result-1 do begin
    Buf := UpperCase(PL^[I].pName);
    CommNum := DecodeCommportName(PL^[I].pName);
    if CommNum = 0 then Continue;
    List.AddObject(EncodeCommportName(CommNum), Pointer(CommNum));
    end;
{$ELSE}
 for I:=1 to MAX_COMPORT do List.AddObject(EncodeCommportName(I), Pointer(I));
{$IFEND}
 // Open Test
 if List.Count > 0 then for I := List.Count-1 downto 0 do begin
    CHandle := CreateFile(PChar(List[I]), GENERIC_WRITE or GENERIC_READ,
     0, nil, OPEN_EXISTING,
     FILE_ATTRIBUTE_NORMAL,
     0);
    if CHandle = INVALID_HANDLE_VALUE then begin
if doOpenTest or (GetLastError() <> ERROR_ACCESS_DENIED) then List.Delete(I);
Continue;
end;
    CloseHandle(CHandle);
    end;

 Result := List.Count;
{$IF USE_ENUMPORTS_API}
 if Assigned(PL) then FreeMem(PL);
{$IFEND}

end;

end.
