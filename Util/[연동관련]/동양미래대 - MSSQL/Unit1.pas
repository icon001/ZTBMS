unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Buttons, Grids, DBGrids,ActiveX, ExtCtrls,
  antTaskbarIcon, StdCtrls, ImgList, Menus;

type
  TJijumCode = class(TComponent)
  private
    DepartNameList : TStringList;
    FJijumCode: string;
    FJijumName: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    function SetDepartCodeName(aDepartCode,aDepartName:string):Boolean;
    function GetDepartCode(aDepartName:string):string;
    
    property jijumcode : string read FJijumCode write FJijumCode;
    property JijumName : string read FJijumName write FJijumName;
  end;
  TDepartCode = class(Tcomponent)
  private
    FDepartCode: string;
    FDepartName: string;
  public
    property Departcode : string read FDepartCode write FDepartCode;
    property DepartName : string read FDepartName write FDepartName;
  end;


  TfmMain = class(TForm)
    ADOConnection1: TADOConnection;
    RelayADOQuery: TADOQuery;
    ZmosADOConnection: TADOConnection;
    ADOQuery2: TADOQuery;
    tbi: TantTaskbarIcon;
    FirstTimer: TTimer;
    AdoConnectCheckTimer: TTimer;
    RelayAdoTimer: TTimer;
    RelayTimer: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RelayExecQuery1: TADOQuery;
    RelaySearchADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    imlstIcons: TImageList;
    pmTest: TPopupMenu;
    miShow: TMenuItem;
    MenuItem3: TMenuItem;
    miExit: TMenuItem;
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ADOOraConnection: TADOConnection;
    OracleConnectCheckTimer: TTimer;
    ADOOraQuery: TADOQuery;
    DataSource2: TDataSource;
    ADOOraQuery1: TADOQuery;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Memo3: TMemo;
    DBGrid2: TDBGrid;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Button1: TButton;
    Memo2: TMemo;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FirstTimerTimer(Sender: TObject);
    procedure AdoConnectCheckTimerTimer(Sender: TObject);
    procedure RelayAdoTimerTimer(Sender: TObject);
    procedure RelayTimerTimer(Sender: TObject);
    procedure tbiDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure miShowClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure OracleConnectCheckTimerTimer(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    FDBConnected: Boolean;
    FRelayDBConnected: Boolean;
    FOraDBConnected: Boolean;
    Function ZmosConnect:Boolean;
    Function RelayTestConnect:Boolean;
    Function UnivercityTestConnect : Boolean;
    Function RelayConnect:Boolean;
    Function UnivercityConnect : Boolean;
    procedure SetDBConnected(const Value: Boolean);
    procedure SetRelayDBConnected(const Value: Boolean);
    procedure SetOraDBConnected(const Value: Boolean);
  private
    L_stProgramType : string; //1:아주대,2:전남대병원
    L_stDBType : string; //1:MSSQL,2:PostGresql,3:ORACLE,4:MDB
    L_stDBIP : string; //BataBase 접속IP
    L_stDBPort : string; //BataBase 접속Port
    L_stDBUserID : string;
    L_stDBUserPW : string;
    L_stDBName : string;
    L_stDBType2 : string; //1:MSSQL,2:PostGresql,3:ORACLE,4:MDB
    L_stDBIP2 : string; //BataBase 접속IP
    L_stDBPort2 : string; //BataBase 접속Port
    L_stDBUserID2 : string;
    L_stDBUserPW2 : string;
    L_stDBName2 : string;

    L_stRelayTime : string;
    L_stLastRelayTime : string; //마지막 연동 시간
    L_stCardRelayTime : string;
    L_stLastRelayDelTime : string; //마지막 삭제 연동시간
    L_stCompanyCode : string;
    L_stJijumCode : string;
    L_dtRelayActionTime : TDatetime;
    L_bRelayDB : Boolean;
    L_bShowState : Boolean;
    L_bJUNNAMShowState : Boolean;
    L_bKTBundangShowState : Boolean;
    L_bCHOSUNShowState : Boolean;
    L_bSSANGYONGShowState : Boolean;
    L_bYounseEventShowState : Boolean;
    L_bHizeAirEventShowState : Boolean;
    procedure LoadConfig;
  private
    L_bActive : Boolean;
    L_bApplicationTerminate : Boolean;
    L_bClose : Boolean;
    L_bRelayStart : Boolean;
    JijumCodeList : TStringList;
    PosiCodeList : TStringList;
    EmTypeCodeList : TStringList;
    RegCodeList : TStringList;
    MappingCode1List : TStringList;
    MappingCode2List : TStringList;
    { Private declarations }
    Function DongYangUniversityRelay(aCount:integer=0;aAll:Boolean=False):Boolean;
    Function DongYangConversionEmployee(aJijumName,aDepartName,aPosiCode,aEmName,aEmCode,aCardSeq,aCardType,aGubun,aCardNo:string):Boolean;
    Function DongYangDelete_MFC_HUB_SEQ(aSeq:string):Boolean;
    Function DongYangDelete_MFC_HUB(aEmCode,aCardNO:string):Boolean;
    Function DongYangUpdate_MFC_HUB(aEmCode,aCardNO,aAck:string):Boolean;
    function Hex2Dec64(const S: string): int64;
    Function RelayCardSystem(aAll:Boolean) : Boolean;
    Function RelayUniversitySystem(aDate:string) : Boolean;
  private
    procedure CreateDepartCode(aCompanyCode,aJijumCode,aDepartName,aJijumName:string; var aDepartCode:string);
    procedure CreateJijumCode(aCompanyCode,aJijumName:string;var aJijumCode:string);
  private
    Function CheckTB_CARD(aCardNo:string):Boolean;
    Function CheckTB_CARD_Employee(aCompanyCode,aEmCode,aCardNo:string;var aOldCardNo:string):boolean;
    Function CheckTB_CONFIG(aGroup,aCode:string):Boolean;
    Function CheckTB_EMMAPPINGTABLE:Boolean;
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmCode:string; var aFdmsID:integer):Boolean;
    Function CopyGradeOldCard(aOldCardNO,aNewCardNO:string):Boolean;
    Function CreateTB_EMMAPPING:Boolean;
    Function DeleteTB_CARD(aCardNo:string):Boolean;
    Function DeleteTB_DEVICECARDNOCardNo(aCardNo:string):Boolean;
    Function DeleteTB_EMPLOYEE(aEmCode,aCardNo:string):Boolean;
    Function GetDepartCode(aCompanyCode,aJijumCode,aDepartName,aJijumName:string):string;
    Function GetFdmsID:string;
    Function GetMaxDepartCode(aCompanyCode,aJijumCode:string):string;
    Function GetMaxJijumCode(aCompanyCode:string):integer;
    Function GetMaxPositionNum : integer;
    Function GetMappingType : string;
    Function GetJijumCode(aCompanyCode,aJijumName:string):string;
    Function GetCardInfo(aEmCode:string;var aCardNo,aCardType,aCardSeq:string):Boolean;
    Function GetOracleInfo(aEmCode:string; var aJijumName,aDepartName,aPosiCode,aEmName,aGubun:string):Boolean;
    Function LoadMappingCode:Boolean;
    Function InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,aGubun,aName:string):Boolean;
    Function InsertIntoTB_CONFIG(aGroup,aCode,aValue:string):Boolean;
    Function InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,afdmsID,aMode,aCardNo,aCardType,aEmName,aHandPhone,aCompanyName,aJijumName,aDepartName,aPosiName:string):Boolean;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function InsertTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode:string):Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string;aDoorGrade:string='') : Boolean;
    Function UpdateTB_CARD_Change(aOldCardNo,aNewCardNo:string):Boolean;
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):Boolean;
    Function UpdateTB_DEVICECARDNO_permit(aCardNo,aPermit:string):Boolean; //모든 카드 권한을 삭제 처리함
    Function UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode:string):Boolean;
    Function UpdateTB_DEVICECARDNOExist(aCardNO,aPromiseGrade:string):Boolean;
    Function InsertTB_DEVICECARDNONotExist(aCardNO,aPromiseGrade:string):Boolean;
    Function UpdateTB_CARDDOORGRADE(aCardNo,aDoorGrade:string):Boolean;
  public
    { Public declarations }
    property DBConnected : Boolean read FDBConnected write SetDBConnected;
    property RelayDBConnected : Boolean read FRelayDBConnected write SetRelayDBConnected;
    property OraDBConnected : Boolean read FOraDBConnected write SetOraDBConnected;
  public
    function FillZeroNumber(aNo:int64; aLength:Integer): string;
    function Isdigit(st: string):Boolean;
    Function ZmosProcessExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
  end;

var
  fmMain: TfmMain;
  GROUPCODE : string = '1234567890';
  MAPTYPE : string = '1';

implementation
uses
  uGroupCode,
  uGroupGrade,
  uMapping;
{$R *.dfm}

procedure TfmMain.FormCreate(Sender: TObject);
begin
  L_bApplicationTerminate := False;
  GROUPCODE := '1234567890';

  JijumCodeList := TStringList.create;
  PosiCodeList := TStringList.create;
  EmTypeCodeList := TStringList.create;
  RegCodeList := TStringList.create;
  MappingCode1List := TStringList.create;
  MappingCode2List := TStringList.create;


  ZmosConnect;
  RelayConnect;
  UnivercityConnect;

  LoadConfig;
//  AdoConnectCheckTimer.Enabled := True; //ZmosConnect
//  RelayAdoTimer.Enabled := True;        //RelayConnect
  RelayTimer.Enabled := True;           //Relay
  tbi.Visible := True;
  tbi.Hint := '사원정보 연동 시스템';
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  L_bApplicationTerminate := True;
    JijumCodeList.free;
    PosiCodeList.free;
    EmTypeCodeList.free;
    RegCodeList.free;
  MappingCode1List.free;
  MappingCode2List.free;
end;

procedure TfmMain.SpeedButton2Click(Sender: TObject);
begin
  DongYangUniversityRelay(0,True);
end;

function TfmMain.DongYangConversionEmployee(aJijumName, aDepartName,
  aPosiCode, aEmName, aEmCode, aCardSeq, aCardType, aGubun,
  aCardNo: string): Boolean;
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardState : string;
  nFdmsID : integer;
  stOldCodeNo : string;
  nIndex : integer;
  stGradeGroupCode : string;
  bEmployeeInsert : Boolean;
  stCardNo : string;
begin
  Try
    result := False;
    bEmployeeInsert := False;
    stCardNo := '';
    // aCardType : //0:정상,1:분실
    // aPosiCode : //1: 학사(003),2:석사(001),3:박사(003),4:교원(004),5:직원(005),8:조교(006)
    //aGubun 1.재학/재직,2.휴학/휴직,3.졸업/퇴직,4.제적
    if aGubun = '' then aGubun := '1';
    if aPosiCode = '' then aPosiCode := '1';
    aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
    stCompanyCode := '001';
    if Trim(aJijumName) = '' then aJijumName := '단과대정보없음';
    stJijumCode := GetJijumCode(stCompanyCode,aJijumName);
    if stJijumCode = '000' then
    begin
      if Trim(aJijumName) <> '' then
        CreateJijumCode(stCompanyCode,aJijumName,stJijumCode);

    end;
    stDepartCode := '000';
    if Trim(aJijumName) <> '' then
    begin
      if aDepartName <> '' then
        stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,aDepartName,aJijumName);
      if stDepartCode = '000' then
      begin
        if Trim(aDepartName) <> '' then
          CreateDepartCode(stCompanyCode,stJijumCode,aDepartName,aJijumName,stDepartCode);
      end;
    end;

    stPosiCode := '000';
    if aPosiCode <> '' then
    begin
      case aPosiCode[1] of
        '1': stPosiCode := '003';  //학생
        '2': stPosiCode := '001';  //석사
        //'3': stPosiCode := '002';  //교직원   ---교직원 권한 연동시 초기화 되는 문제 발생
        '3': stPosiCode := '004';  //교원
        '4': stPosiCode := '005';  //직원
        '5': stPosiCode := '006';  //조교
        '0': stPosiCode := '008';  //총장
        '9': stPosiCode := '009';  //산학협력단
        else stPosiCode := '003';
      end;
    end;
    stCardState := '2';
    if aCardType = '0' then stCardState := '1';  //aType이 0 인경우만 정상

    nIndex := MappingCode1List.IndexOf(stCompanyCode + stPosiCode);
    stGradeGroupCode := '';
    if nIndex > -1 then
    begin
      stGradeGroupCode := MappingCode2List.Strings[nIndex];
    end;
    //if length(aEmCode) < 9 then
    //  aEmCode := FillZeroStrNum(aEmCode,9,True);

    if aCardNo <> '' then
      stCardNo := FillZeroNumber(Hex2Dec64(aCardNo),10);
    //Memo1.Lines.Add('1');

    if CheckTB_EMPLOYEE('001',aEmCode,nFdmsID) then
    begin
      if (aGubun = '1') or (aGubun = '2') then
      begin
        if Not UpdateTB_EMPLOYEE(aEmCode,
                        aEmName,
                        '001',
                        stJijumCode,
                        stDepartCode,
                        stPosiCode,
                        '',
                        '20000101',
                        '99991231',
                        '',
                        '',
                        '',
                        '',
                        '',
                        stCardState,
                        stCardNo,
                        '',
                        inttostr(nFdmsID),
                        '001') then
        begin
          Exit;
        end;
        InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                          '2',stCardNo,stCardState,aEmName,
                          '','동양미래대학교',aJijumName,aDepartName,'');
      end else
      begin
        DeleteTB_EMPLOYEE(aEmCode,stCardNo);
        InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                          '3',stCardNo,stCardState,aEmName,
                          '','동양미래대학교',aJijumName,aDepartName,'');
        result := True;
        Exit;
      end;
    end else
    begin
      if (aGubun = '1') or (aGubun = '2') then
      begin
        bEmployeeInsert := True;
        nFdmsID := strtoint(GetFdmsID);
        if Not InsertTB_EMPLOYEE(aEmCode,
                          aEmName,
                          '001',
                          stJijumCode,
                          stDepartCode,
                          stPosiCode,
                          '',
                          '20000101',
                          '99991231',
                          '',
                          '',
                          '',
                          '',
                          '',
                          stCardState,
                          stCardNo,
                          '',
                          inttostr(nFdmsID),
                          '001') then Exit;
        InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                            '1',stCardNo,stCardState,aEmName,
                            '','동양미래대학교',aJijumName,aDepartName,'');
      end else
      begin
        result := True;
        Exit;
      end;
    end;

    if stCardNo = '' then
    begin
      memo1.Text := aEmCode + ':' + aEmName + ' - Not Card ';
      result := True;
      Exit; //카드가 없는 경우 아래는 수행할 필요 없다.
    end;
    //Memo1.Lines.Add('2');
    //학번에 다른 카드가 있으면 기존 카드 정지 후
    if CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCodeNo) then
    begin
      //같은 사번으로 다른 카드가 있는 경우
      //기존카드 권한을 똑같이 옮김
      UpdateTB_CARD_Change(stOldCodeNo,stCardNo);
      //DeleteTB_CARD(stOldCodeNo);   //기존 카드 삭제
      //UpdateTB_DEVICECARDNO_permit(stOldCodeNo,'N');
    end;
    if CheckTB_CARD(stCardNo) then
    begin
      if Not UpdateTB_CARD(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
      if stGradeGroupCode <> '' then  //여기서 권한 복사 하자...  20150903에 새로 적용 업데이트시에 권한이 없는 상태로 남아 있음.
      begin
        UpdateTB_DEVICECARDNOExist(stCardNO,stGradeGroupCode);
        InsertTB_DEVICECARDNONotExist(stCardNO,stGradeGroupCode);
        UpdateTB_CARDDOORGRADE(stCardNo,'Y');
      end;
    end else
    begin
      if Not InsertTB_CARD(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
      if stGradeGroupCode <> '' then  //여기서 권한 복사 하자...
      begin
        UpdateTB_DEVICECARDNOExist(stCardNO,stGradeGroupCode);
        InsertTB_DEVICECARDNONotExist(stCardNO,stGradeGroupCode);
        UpdateTB_CARDDOORGRADE(stCardNo,'Y');
      end;
    end;

    if stCardState <> '1' then  //비정상
    begin
      UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
    end;
  Except
    Exit;
  End;

  result := True;
end;

function TfmMain.DongYangDelete_MFC_HUB(aEmCode,aCardNO:string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From MFC_HUB where hub_chipserno = ''' + aCardNO + ''' ';
  with RelayExecQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSQL;
    Except
      Exit;
    End;
  end;
  result := True;
  //FindField('HUB_IDNO').asstring,FindField('hub_chipserno').AsString
end;

function TfmMain.DongYangUniversityRelay(aCount:integer=0;aAll:Boolean=False): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stJijumName : string;
  stDepartName : string;
  stPosiCode : string;
  stEmName : string;
  stEmCode : string;
  stCardSeq : string;
  stType : string;
  stGubun : string;
  stCardNo : string;
  i : integer;
  stEMSeq : string;
begin
  if Not DBConnected then Exit;
  if Not RelayDBConnected then Exit;
  if Not OraDBConnected then Exit;
  if L_bRelayStart then Exit;
  L_bRelayStart := True;

(*
  if aAll then
  begin
    stSql := 'Update MFC_HUB set HUB_YN = ''N'' ';
    with RelayADOQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        ExecSQL;
      Except
        RelayDBConnected := False;  //Select 에러 나면 재접속을 시도하자...
        Exit;
      End;
    end;
  end;
*)
  Try
    RelayCardSystem(aAll);
    RelayUniversitySystem(L_stLastRelayTime);

  Finally
    L_bRelayStart := False;
  End;

  tbi.Hint := '연동완료' ;
end;

function TfmMain.GetJijumCode(aCompanyCode, aJijumName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  oJijumCode : TJijumCode;
begin
  result := '000';

  nIndex := JijumCodeList.IndexOf(aJijumName);
  if nIndex > -1 then
  begin
    result := TJijumCode(JijumCodeList.Objects[nIndex]).jijumcode;
    Exit;
  end;

  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' Where CO_GUBUN = ''2'' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_NAME = ''' + aJijumName + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      result := FindField('CO_JIJUMCODE').AsString;
      //메모리 적재
      nIndex := JijumCodeList.IndexOf(aJijumName);
      if nIndex < 0 then
      begin
        oJijumCode := TJijumCode.Create(nil);
        oJijumCode.jijumcode := FindField('CO_JIJUMCODE').AsString;
        oJijumCode.JijumName := aJijumName;
        JijumCodeList.AddObject(aJijumName,oJijumCode);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.CreateJijumCode(aCompanyCode, aJijumName: string;
  var aJijumCode: string);
var
  nJijumCode : integer;
  nIndex : integer;
  oJijumCode : TJijumCode;
begin
  nJijumCode := GetMaxJijumCode(aCompanyCode);
  aJijumCode := FillZeroNumber(nJijumCode,3);
  InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,'000','2',aJijumName);

  nIndex := JijumCodeList.IndexOf(aJijumName);
  if nIndex < 0 then
  begin
    oJijumCode := TJijumCode.Create(nil);
    oJijumCode.jijumcode := aJijumCode;
    oJijumCode.JijumName := aJijumName;
    JijumCodeList.AddObject(aJijumName,oJijumCode);
  end;

end;

function TfmMain.GetDepartCode(aCompanyCode, aJijumCode, aDepartName,
  aJijumName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
begin
  result := '000';
  if aJijumName <> '' then
  begin
    nIndex := JijumCodeList.IndexOf(aJijumName);
    if nIndex > -1 then
    begin
      result := TJijumCode(JijumCodeList.Objects[nIndex]).GetDepartCode(aDepartName);
      if result <> '' then Exit;
      result := '000';
    end;
  end;
  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' Where CO_GUBUN = ''3'' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_NAME = ''' + aDepartName + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      result := FindField('CO_DEPARTCODE').AsString;
      if nIndex > -1 then
      begin
        TJijumCode(JijumCodeList.Objects[nIndex]).SetDepartCodeName(FindField('CO_DEPARTCODE').AsString,aDepartName);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.CreateDepartCode(aCompanyCode, aJijumCode, aDepartName,
  aJijumName: string; var aDepartCode: string);
var
  nIndex : integer;
begin
  aDepartCode := GetMaxDepartCode(aCompanyCode,aJijumCode);
  InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,'3',aDepartName);
  if aJijumName = '' then Exit;
  nIndex := JijumCodeList.IndexOf(aJijumName);
  if nIndex > -1 then
  begin
    TJijumCode(JijumCodeList.Objects[nIndex]).SetDepartCodeName(aDepartCode,aDepartName);
  end;
end;

function TfmMain.FillZeroNumber(aNo:int64; aLength: Integer): string;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= InttoStr(aNo);
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+'0';
    St:= St + StrNo;
    FillZeroNumber:= st;
  end else FillZeroNumber:= copy(Strno,1,aLength);

end;

function TfmMain.CheckTB_EMPLOYEE(aCompanyCode, aEmCode: string;
  var aFdmsID: integer): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := ' Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where EM_CODE = ''' + aEmCode + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      aFdmsID := FindField('FDMS_ID').AsInteger;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.UpdateTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode, aJijumCode,
  aDepartCode, aPosiCode, aCompanyPhone, aJoinDate, aRetireDate, aZipcode,
  aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo, aEmpImg,
  afdmsId, aEmTypeCode: string): Boolean;
var
  stSql : string;
begin

  stSql := 'Update TB_EMPLOYEE set ';
  stSql := stSql + 'CO_JIJUMCODE =''' + aJijumCode + ''',';
  stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  stSql := stSql + 'PO_POSICODE = ''' + aPosiCode + ''',';
  if aEmpNM <> '' then stSql := stSql + 'EM_NAME = ''' + aEmpNM + ''',';   //추가
  if aHandphone <> '' then stSql := stSql + 'EM_HANDPHONE = ''' + aHandphone + ''',';
  stSql := stSql + 'RG_CODE = ''' + aEmTypeCode + ''' ';
  stSql := stSql + ' Where EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  result := ZmosProcessExecSQL(stSql);
  if Not result then Memo1.Lines.Add(stSql);
end;

function TfmMain.ZmosProcessExecSQL(aSql: String;
  bUpdateResult: Boolean): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
  Result:= False;
  //OleInitialize(nil);
  Try
    //FCS.Enter;
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ZmosADOConnection;
    ExecQuery.DisableControls;
    //if DBTYPE = 'MDB' then ADOConnection.BeginTrans;
    with ExecQuery do
    begin
      Close;
      //SQL.Clear;
      SQL.Text:= aSql;
      try
        //Memo1.Text := aSql;
        nResult := ExecSQL;
      except
      ON E: Exception do
        begin
          //Memo1.Text := '[Error]' + aSql;
          //SQLErrorLog('DBError('+ E.Message + ')' + aSql);
          
          if Pos('no connection to the server',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('out of memory',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('연결을 실패했습니다',E.Message) > 0 then
          begin
            DBConnected := False;
          end;
          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;
  //if DBTYPE = 'MDB' then ADOConnection.CommitTrans;

  if bUpdateResult then
  begin
    if nResult > 0 then Result := True
    else
    begin
      Result := False;
      //SQLErrorLog('DBError:'+ aSql);
    end;
  end else
  begin
    Result:= True;
  end;
end;

function TfmMain.InsertIntoTB_EMPHIS(aCompanyCode, aEmCode, afdmsID, aMode,
  aCardNo, aCardType, aEmName, aHandPhone, aCompanyName, aJijumName,
  aDepartName, aPosiName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPHIS(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' EM_CODE,';
  if afdmsID <> '' then
    stSql := stSql + ' FDMS_ID,';
  stSql := stSql + ' MODE, ';
  stSql := stSql + ' SEND_STATUS, ';
  stSql := stSql + ' CA_CARDNO, ';
  stSql := stSql + ' CA_CARDTYPE, ';
  stSql := stSql + ' SEND_STATUS2,';
  stSql := stSql + ' EH_INSERTTIME, ';
  stSql := stSql + ' EM_NAME, ';
  stSql := stSql + ' EM_HANDPHONE, ';
  stSql := stSql + ' COMPANY_NAME, ';
  stSql := stSql + ' JIJUM_NAME, ';
  stSql := stSql + ' DEPART_NAME, ';
  stSql := stSql + ' PO_NAME) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''1234567890'',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  if afdmsID <> '' then
    stSql := stSql + afdmsID + ',';
  stSql := stSql + '''' + aMode + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aCardType + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',Now) + ''',';
  stSql := stSql + '''' + aEmName + ''',';
  stSql := stSql + '''' + aHandPhone + ''',';
  stSql := stSql + '''' + aCompanyName + ''',';
  stSql := stSql + '''' + aJijumName + ''',';
  stSql := stSql + '''' + aDepartName + ''',';
  stSql := stSql + '''' + aPosiName + ''') ';

  result := ZmosProcessExecSQL(stSql);
  if Not result then Memo1.Lines.Add(stSql);
end;

function TfmMain.DeleteTB_EMPLOYEE(aEmCode, aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DEVICECARDNO set DE_PERMIT = ''N'',DE_RCVACK = ''N'' where CA_CARDNO = ''' + aCardNo + ''' ';
  result := ZmosProcessExecSQL(stSql);

  stSql := ' Delete From TB_CARD where EM_CODE = ''' + aEmCode + ''' ';
  result := ZmosProcessExecSQL(stSql);

  stSql := ' Delete From TB_EMPLOYEE where EM_CODE = ''' + aEmCode + ''' ';
  result := ZmosProcessExecSQL(stSql);

end;

function TfmMain.GetFdmsID: string;
var
  stSql : string;
  nFdms_id : integer;
  TempAdoQuery : TADOQuery;
begin
  result := '31';
  stSql := 'select Max(Fdms_id) as fdms_id from TB_EMPLOYEE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
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
      if recordCount < 1 then Exit;
      Try
        nFdms_id := FindField('fdms_id').AsInteger;
        if nFdms_id = 0 then Exit;
      Except
        Exit;
      End;
      result := inttostr(nFdms_id + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.InsertTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode, aJijumCode,
  aDepartCode, aPosiCode, aCompanyPhone, aJoinDate, aRetireDate, aZipcode,
  aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo, aEmpImg,
  afdmsId, aEmTypeCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CO_JIJUMCODE,';
  stSql := stSql + 'CO_DEPARTCODE,';
  stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'EM_NAME,';
  stSql := stSql + 'EM_COPHONE,';
  stSql := stSql + 'EM_HOMEPHONE,';
  stSql := stSql + 'EM_HANDPHONE,';
  stSql := stSql + 'ZI_ZIPCODE,';
  stSql := stSql + 'EM_ADDR1,';
  stSql := stSql + 'EM_ADDR2,';
  stSql := stSql + 'EM_JOINDATE,';
  stSql := stSql + 'EM_RETIREDATE,';
  stSql := stSql + 'FDMS_ID,';
  stSql := stSql + 'RG_CODE) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmpID + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aEmpNM + ''',';
  stSql := stSql + '''' + aCompanyPhone + ''',';
  stSql := stSql + '''' + aHomePhone + ''',';
  stSql := stSql + '''' + aHandphone + ''',';
  stSql := stSql + '''' + aZipcode + ''',';
  stSql := stSql + '''' + aAddr1 + ''',';
  stSql := stSql + '''' + aAddr2 + ''',';
  stSql := stSql + '''' + aJoinDate + ''',';
  stSql := stSql + '''' + aRetireDate + ''',';
  stSql := stSql + '' + afdmsId + ',';
  stSql := stSql + '''' + aEmTypeCode + ''')';

  result := ZmosProcessExecSQL(stSql);

  if Not result then Memo1.Lines.Add(stSql);
end;

function TfmMain.CheckTB_CARD_Employee(aCompanyCode, aEmCode,
  aCardNo: string; var aOldCardNo: string): boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where EM_CODE = ''' + aEmCode + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CA_CARDTYPE = ''1'' ';  //등록된 카드 중에서

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
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
        if FindField('CA_CARDNO').AsString <> aCardNo then
        begin
          aOldCardNo := FindField('CA_CARDNO').AsString;
          result := True;
          Exit;
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

function TfmMain.UpdateTB_CARD_Change(aOldCardNo,
  aNewCardNo: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
begin
  Result := False;
  if aOldCardNo = '' then Exit;
  DeleteTB_DEVICECARDNOCardNo(aNewCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
  CopyGradeOldCard(aOldCardNo,aNewCardNo); //여기서 권한을 복사 L_stStopCard -> stCardNo
  bResult := UpdateTB_DEVICECARDNO_permit(aOldCardNo,'N'); //모든 카드 권한을 삭제 처리함
  //if Not bResult then Exit;

  stSql := ' delete from  TB_CARD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' +  aOldCardNo + ''' ';

  result := ZmosProcessExecSQL(stSql);

  //InsertTB_EMPHISCardStop(aOldCardNo);
end;

function TfmMain.CheckTB_CARD(aCardNo: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
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
      if RecordCount > 0 then Result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End; 
end;

function TfmMain.UpdateTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode, aDoorGrade: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set ';
  stSql := stSql + 'CA_CARDTYPE = ''' + aCardType + ''',';
  stSql := stSql + 'EM_CODE = ''' + aEmpID + ''',';
  if aDoorGrade <> '' then stSql := stSql + 'CA_DOORGRADE = ''' + aDoorGrade + ''',';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := ZmosProcessExecSQL(stSql);
  if Not result then Memo1.Lines.Add(stSql);
end;

function TfmMain.InsertTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode: string): Boolean;
var
  stSql : string;
  nPositionNum : integer;
begin
  result := False;
  if Length(aCardNo) = 0 then
  begin
    result := True;
    Exit;
  end;
  if Not IsDigit(aCardGubun) then aCardGubun := '1';

  nPositionNum := GetMaxPositionNum;

  stSql := 'Insert Into TB_CARD(GROUP_CODE,CA_CARDNO,CA_GUBUN,CA_CARDTYPE,';
  stSql := stSql + 'EM_CODE,CO_COMPANYCODE,CA_UPDATETIME,POSITIONNUM,CA_UPDATEOPERATOR) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCardNo + ''',' ;
  stSql := stSql + '''' + aCardGubun + ''',' ;
  stSql := stSql + '''' + aCardType + ''',' ;
  stSql := stSql + '''' + aEmpID + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + inttostr(nPositionNum) + ',' ;
  stSql := stSql + '''SYSTEM'')' ;

  result := ZmosProcessExecSQL(stSql);
  if Not result then Memo1.Lines.Add(stSql);
end;

function TfmMain.UpdateTB_DEVICECARDNO_permit(aCardNo,
  aPermit: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_PERMIT = ''' + aPermit + ''', ';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := ZmosProcessExecSQL(stSql);
  if Not result then Memo1.Lines.Add(stSql);
end;

{ TJijumCode }

constructor TJijumCode.Create(AOwner: TComponent);
begin
  inherited;
  DepartNameList := TStringList.Create;
end;

destructor TJijumCode.Destroy;
var
  i : integer;
begin
  if DepartNameList.Count > 0 then
  begin
    for i := DepartNameList.Count - 1 downto 0 do
    begin
      TDepartCode(DepartNameList.Objects[i]).Free;
    end;
  end;
  DepartNameList.Free;
  inherited;
end;

function TJijumCode.GetDepartCode(aDepartName: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := DepartNameList.IndexOf(aDepartName);
  if nIndex < 0 then Exit;
  result := TDepartCode(DepartNameList.Objects[nIndex]).Departcode;
end;

function TJijumCode.SetDepartCodeName(aDepartCode,
  aDepartName: string): Boolean;
var
  nIndex : integer;
  oDepartCode : TDepartCode;
begin
  result := False;
  nIndex := DepartNameList.IndexOf(aDepartName);
  if nIndex > -1 then Exit;
  oDepartCode := TDepartCode.Create(nil);
  oDepartCode.Departcode := aDepartCode;
  oDepartCode.DepartName := aDepartName;
  DepartNameList.AddObject(aDepartName,oDepartCode);
  result := True;
end;

function TfmMain.GetMaxJijumCode(aCompanyCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;
  stSql := ' Select Max(CO_JIJUMCODE) as CO_JIJUMCODE from TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      if isDigit(FindField('CO_JIJUMCODE').AsString) then
      begin
        result := strtoint(FindField('CO_JIJUMCODE').AsString) + 1;
      end else
      begin
        result := 1;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.InsertIntoTB_COMPANY(aCompanyCode, aJijumCode, aDepartCode,
  aGubun, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_COMPANY(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_JIJUMCODE,';
  stSql := stSql + ' CO_DEPARTCODE,';
  stSql := stSql + ' CO_NAME,';
  stSql := stSql + ' CO_GUBUN) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''' + aGubun + ''')';

  result := ZmosProcessExecSQL(stSql);
  if Not result then Memo1.Lines.Add(stSql);
end;

function TfmMain.GetMaxDepartCode(aCompanyCode, aJijumCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '001';
  stSql := ' Select Max(CO_DEPARTCODE) as departCode from TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + '''';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      if isDigit(FindField('departCode').AsString) then
      begin
        result := FillZeroNumber(strtoint(FindField('departCode').AsString) + 1 ,3);
      end else
      begin
        result := '001';
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.DeleteTB_DEVICECARDNOCardNo(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DEVICECARDNO ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := ZmosProcessExecSQL(stSql);
  if Not result then Memo1.Lines.Add(stSql);
end;

function TfmMain.CopyGradeOldCard(aOldCardNO, aNewCardNO: string): Boolean;
var
  stSql : string;
begin
  if Trim(aNewCardNO) = '' then Exit;
    stSql := ' Insert INTO TB_DEVICECARDNO (GROUP_CODE, ';
    stSql := stSql + ' AC_NODENO, ';
    stSql := stSql + ' AC_ECUID, ';
    stSql := stSql + ' CA_CARDNO, ';
    stSql := stSql + ' DE_DOOR1, ';
    stSql := stSql + ' DE_DOOR2, ';
    stSql := stSql + ' DE_USEACCESS, ';
    stSql := stSql + ' DE_USEALARM, ';
    stSql := stSql + ' DE_TIMECODE, ';
    stSql := stSql + ' DE_PERMIT, ';
    stSql := stSql + ' DE_RCVACK, ';
    stSql := stSql + ' DE_UPDATETIME, ';
    stSql := stSql + ' DE_UPDATEOPERATOR) ';
    stSql := stSql + ' select ''' + GROUPCODE + ''', ';
    stSql := stSql + ' b.AC_NODENO, ';
    stSql := stSql + ' b.AC_ECUID, ';
    stSql := stSql + ' ''' + aNewCardNO + ''', ';
    stSql := stSql + ' b.DE_DOOR1, ';
    stSql := stSql + ' b.DE_DOOR2, ';
    stSql := stSql + ' b.DE_USEACCESS, ';
    stSql := stSql + ' b.DE_USEALARM, ';
    stSql := stSql + ' b.DE_TIMECODE, ';
    stSql := stSql + ' b.DE_PERMIT, ';
    stSql := stSql + ' ''N'', ';
    stSql := stSql + ' '''+ formatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + ' ''SYSTEM'' ';
    stSql := stSql + ' From TB_DEVICECARDNO B  ';
    stSql := stSql + ' where B.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND B.CA_CARDNO = ''' + aOldCardNO + ''' ';
    stSql := stSql + ' AND NOT EXISTS ';
    stSql := stSql + ' (SELECT * FROM TB_DEVICECARDNO A ';
    stSql := stSql + ' WHERE A.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND A.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND A.AC_ECUID = b.AC_ECUID  ';
    stSql := stSql + ' AND A.CA_CARDNO = ''' + aNewCardNO + ''')  ';

    result := ZmosProcessExecSQL(stSql);
    if Not result then Memo1.Lines.Add(stSql);
end;

function TfmMain.Isdigit(st: string): Boolean;
var
  I: Integer;
begin
  result:=True;
  if Length(st) < 1 then
  begin
    result:=False;
    Exit;
  end;
  for I:=1 to Length(st) do
    if (st[I]< '0') or (st[I] > '9')  then result:=False

end;

function TfmMain.GetMaxPositionNum: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(PositionNum) as MaxPosition From TB_CARD ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
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
      if Not IsDigit(FindField('MaxPosition').AsString) then
      begin
        Exit;
      end;
      result := FindField('MaxPosition').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.FirstTimerTimer(Sender: TObject);
begin
  if L_bApplicationTerminate then Exit;
  FirstTimer.Enabled:=False;
  Visible:=False;

end;

procedure TfmMain.AdoConnectCheckTimerTimer(Sender: TObject);
begin
  AdoConnectCheckTimer.Enabled := False;
  ZmosConnect;
  if Not DBConnected then
  begin
    AdoConnectCheckTimer.Enabled := True;
  end;
  label3.Caption := 'AdoConnectCheckTimer';
end;

function TfmMain.ZmosConnect: Boolean;
var
  conStr : string;
begin
  result := False;
  conStr := 'Provider=SQLOLEDB.1;';
  conStr := constr + 'Password=sapasswd;';
  conStr := constr + 'Persist Security Info=True;';
  conStr := constr + 'User ID=sa;';
  conStr := constr + 'Initial Catalog=zmos;';
  conStr := constr + 'Data Source=127.0.0.1,1433';

  with ZmosADOConnection do
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
  end;
  DBConnected := True;
  result := True;
end;

procedure TfmMain.SetDBConnected(const Value: Boolean);
begin
  if FDBConnected = Value then exit;
  FDBConnected := Value;
  AdoConnectCheckTimer.Enabled := Not Value;
end;

function TfmMain.RelayConnect: Boolean;
var
  conStr : string;
begin
  Label3.Caption := 'RelayDBDisConnected';
  RelayDBConnected := False;
  //conStr := 'driver={CUBRID Driver};server=203.249.39.19;port=33000;db_name=ISSUE;User ID=dba;Password=inzenst;';
  conStr := 'Provider=SQLOLEDB.1;';
  conStr := constr + 'Password=ktcap!@!@;';
  conStr := constr + 'Persist Security Info=True;';
  conStr := constr + 'User ID=ktcap;';
  conStr := constr + 'Initial Catalog=ISSUE;';
  conStr := constr + 'Data Source=203.249.39.8,1433';

  //conStr := 'DRIVER=CUBRID Driver;UID=dba;PWD=33000;FETCH_SIZE=100;PORT=33000;SERVER=203.249.39.19;DB_NAME=ISSUE;DESCRIPTION=ISSUE;CHARSET=utf-8;';

  //conStr := 'Provider=CUBRIDProvider;User ID=dba;Password=inzenst;Data Source=ISSUE;Location=203.249.39.19;Port=33000;';
  //constr := 'DRIVER={CUBRID Driver Unicode};UID=dba;PWD=inzenst;FETCH_SIZE=100;PORT=33000;SERVER=203.249.39.19;DB_NAME=ISSUE;DESCRIPTION=ISSUE;CHARSET=utf-8;';
  with ADOConnection1 do
  begin
    Connected := False;
    ConnectionString := conStr ; //'driver={CUBRID Driver};server=203.249.39.19;port=33000;db_name=ISSUE;User ID=dba;Password=inzenst;';
    Label3.Caption := ConnectionString;
    //ConnectionString := 'Provider=OraOLEDB.Oracle.1;Password=icon002;User ID=icon002;Data Source=OPPRA;Persist Security Info=True';
    LoginPrompt:= false ;
    Try
      Connected := True;
    Except
      on E : Exception do
        begin
          ShowMessage(E.Message + conStr );
          Exit;
        end;
      else
        begin
          ShowMessage('Relay데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;


  end;
  Label3.Caption := 'RelayDBConnected';
  RelayDBConnected := True;
  result := True;
end;

procedure TfmMain.SetRelayDBConnected(const Value: Boolean);
begin
  if FRelayDBConnected = Value then Exit;
  FRelayDBConnected := Value;
  RelayAdoTimer.Enabled := Not Value;
end;

procedure TfmMain.RelayAdoTimerTimer(Sender: TObject);
begin
  RelayAdoTimer.Enabled := False;
  RelayAdoTimer.Interval := 10000;
  RelayConnect;
  if Not RelayDBConnected then
  begin
    RelayAdoTimer.Enabled := True;
  end;
  label3.Caption := 'RelayAdoTimerTimer';
end;

procedure TfmMain.RelayTimerTimer(Sender: TObject);
begin
  RelayTimer.Enabled := False;
  RelayTimer.Interval := 30000; //30초에 한번씩 연동 하자.
  RelayConnect;
  UnivercityConnect;
  Try
    DongYangUniversityRelay;
  Finally
    RelayTimer.Enabled := Not L_bApplicationTerminate;
  End;
end;

function TfmMain.Hex2Dec64(const S: string): int64;
var
  HexStr: string;
begin
  result := -1;
  Try
    if Pos('$', S) = 0 then HexStr := '$' + S
    else HexStr := S;
    Result := StrToInt64Def(HexStr, 0);
  Except
    Exit;
  End;
end;

procedure TfmMain.tbiDblClick(Sender: TObject);
begin
  Visible := True;
end;

procedure TfmMain.SpeedButton1Click(Sender: TObject);
var
  stSql : string;
begin
  with RelaySearchADOQuery1 do
  begin
    Close;
    //stSql := 'Select * from MFC_HUB';
    //if ed_EmCode.Text <> '' then stSql := stSql + ' Where HUB_IDNO = ''' + ed_EmCode.Text + ''' ';
    //stSql := stSql + ' order by HUB_SEQNO ';

    Sql.Text := memo2.Text;
    Try
      Open;
    Except
      Exit;
    End;
  end;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  if L_bApplicationTerminate then Exit;

  if L_bActive then Exit;
  L_bActive := True;
  
  FirstTimer.Enabled := True;
  ZmosConnect;
  if Not CheckTB_CONFIG('RELAY','EMMAPCODE') then
  begin
    InsertIntoTB_CONFIG('RELAY','EMMAPCODE','1');
  end;
  if Not CheckTB_EMMAPPINGTABLE then
  begin
    CreateTB_EMMAPPING;
  end;

  MAPTYPE := GetMappingType;
  LoadMappingCode;
end;

procedure TfmMain.miShowClick(Sender: TObject);
begin
  Visible := True;
end;

procedure TfmMain.miExitClick(Sender: TObject);
begin
  L_bClose := True;
  Close;

end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if L_bClose = False then
  Begin
    Visible := False;
    CanClose := False;
    Exit;
  End;

end;

procedure TfmMain.N2Click(Sender: TObject);
begin
  fmGroupCode := TfmGroupCode.Create(nil);
  fmGroupCode.ShowModal;
  fmGroupCode.Free;
end;


procedure TfmMain.N3Click(Sender: TObject);
begin
  fmGroupGrade := TfmGroupGrade.Create(nil);
  fmGroupGrade.ShowModal;
  fmGroupGrade.Free;

end;

function TfmMain.CheckTB_CONFIG(aGroup, aCode: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''' + aGroup + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
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
      if recordCount < 1 then Exit;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.InsertIntoTB_CONFIG(aGroup, aCode,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CONFIG(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_CONFIGGROUP,';
  stSql := stSql + ' CO_CONFIGCODE,';
  stSql := stSql + ' CO_CONFIGVALUE) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aGroup + ''',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aValue + ''')';

  result := ZmosProcessExecSQL(stSql);
  if Not result then Memo1.Lines.Add(stSql);
end;

function TfmMain.CheckTB_EMMAPPINGTABLE: Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select count(*) from TB_EMMAPPING ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
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
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.CreateTB_EMMAPPING: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMMAPPING (';
  stSql := stSql + ' MP_TYPE varchar(3) NOT NULL,'; //맵핑 타입(1.직위구분)
  stSql := stSql + ' MP_CODE varchar(50) NOT NULL,';//매핑코드
  stSql := stSql + ' DG_CODE varchar(10),';         //DeviceGroup code
  stSql := stSql + ' PRIMARY KEY (MP_TYPE,MP_CODE) ';
  stSql := stSql + ' ) ';

  result := ZmosProcessExecSQL(stSql);

end;

function TfmMain.GetMappingType: string;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := '1';
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''RELAY'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''EMMAPCODE'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
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
      if recordCount < 1 then Exit;
      result := FindField('CO_CONFIGVALUE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.N4Click(Sender: TObject);
begin
  fmMapping := TfmMapping.Create(nil);
  fmMapping.ShowModal;
  fmMapping.Free;
  MAPTYPE := GetMappingType;
  LoadMappingCode;
end;

function TfmMain.LoadMappingCode: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  MappingCode1List.Clear;
  MappingCode2List.Clear;

  stSql := 'select * from TB_EMMAPPING ';
  stSql := stSql + ' Where MP_TYPE = ''' + MAPTYPE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
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
      if recordCount < 1 then Exit;

      While Not Eof do
      begin
        MappingCode1List.Add(FindField('MP_CODE').AsString);
        MappingCode2List.Add(FindField('DG_CODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.InsertTB_DEVICECARDNONotExist(aCardNO,
  aPromiseGrade: string): Boolean;
var
  stSql : string;
begin
  if Trim(aCardNo) = '' then Exit;
  stSql := ' Insert INTO TB_DEVICECARDNO (GROUP_CODE, ';
  stSql := stSql + ' AC_NODENO, ';
  stSql := stSql + ' AC_ECUID, ';
  stSql := stSql + ' CA_CARDNO, ';
  stSql := stSql + ' DE_DOOR1, ';
  stSql := stSql + ' DE_DOOR2, ';
  stSql := stSql + ' DE_USEACCESS, ';
  stSql := stSql + ' DE_USEALARM, ';
  stSql := stSql + ' DE_TIMECODE, ';
  stSql := stSql + ' DE_PERMIT, ';
  stSql := stSql + ' DE_RCVACK, ';
  stSql := stSql + ' DE_UPDATETIME, ';
  stSql := stSql + ' DE_UPDATEOPERATOR) ';
  stSql := stSql + ' select ''' + GROUPCODE + ''', ';
  stSql := stSql + ' b.AC_NODENO, ';
  stSql := stSql + ' b.AC_ECUID, ';
  stSql := stSql + ' ''' + aCardNO + ''', ';
  stSql := stSql + ' b.DE_DOOR1, ';
  stSql := stSql + ' b.DE_DOOR2, ';
  stSql := stSql + ' b.DE_USEACCESS, ';
  stSql := stSql + ' b.DE_USEALARM, ';
  stSql := stSql + ' b.DE_TIMECODE, ';
  stSql := stSql + ' b.DE_PERMIT, ';
  stSql := stSql + ' ''N'', ';
  stSql := stSql + ' '''+ formatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' ''RelaySYS'' ';
  stSql := stSql + ' From TB_DEVICECARDNOGROUP B  ';
  stSql := stSql + ' where B.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND B.CA_GROUP = ''' + aPromiseGrade + ''' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_DEVICECARDNO A ';
  stSql := stSql + ' WHERE A.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND A.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND A.AC_ECUID = b.AC_ECUID  ';
  stSql := stSql + ' AND A.CA_CARDNO = ''' + aCardNO + ''')  ';

  result := ZmosProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_CARDDOORGRADE(aCardNo,
  aDoorGrade: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set CA_DOORGRADE = ''' + aDoorGrade + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := ZmosProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_DEVICECARDNOExist(aCardNO,
  aPromiseGrade: string): Boolean;
var
  stSql : string;
begin
    stSql := ' Update A ';
    stSql := stSql + ' Set a.DE_DOOR1 = b.DE_DOOR1, ';
    stSql := stSql + '     a.DE_DOOR2 = b.DE_DOOR2, ';
    stSql := stSql + '     a.DE_USEACCESS = b.DE_USEACCESS, ';
    stSql := stSql + '     a.DE_USEALARM = b.DE_USEALARM, ';
    stSql := stSql + '     a.DE_TIMECODE = b.DE_TIMECODE, ';
    stSql := stSql + '     a.DE_PERMIT = b.DE_PERMIT, ';
    stSql := stSql + '     a.DE_RCVACK = ''N'', ';
    stSql := stSql + '     a.DE_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + '     a.DE_UPDATEOPERATOR = ''RelaySYS'' ';
    stSql := stSql + ' From TB_DEVICECARDNO A,TB_DEVICECARDNOGROUP B ';
    stSql := stSql + ' WHERE A.GROUP_CODE = B.GROUP_CODE ';
    stSql := stSql + ' AND A.AC_NODENO = B.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = B.AC_ECUID ';
    stSql := stSql + ' AND (a.DE_DOOR1 <> B.DE_DOOR1 OR a.DE_DOOR2 <> B.DE_DOOR2 OR a.DE_USEACCESS <> B.DE_USEACCESS OR a.DE_USEALARM <> b.DE_USEALARM OR a.DE_PERMIT <> b.DE_PERMIT) ';
    stSql := stSql + ' AND B.CA_GROUP = ''' + aPromiseGrade + ''' ';
    stSql := stSql + ' AND A.CA_CARDNO = ''' + aCardNO + ''' ';
    stSql := stSql + ' AND A.GROUP_CODE = ''' + GROUPCODE + ''' ';

    result := ZmosProcessExecSQL(stSql);
end;

procedure TfmMain.Button1Click(Sender: TObject);
var
  stSql : string;
begin
  Memo2.Text :=  'Select * from MFC_HUB Where HUB_IDNO = ''  '' order by HUB_SEQNO ';

(*  stSql := ' Insert Into MFC_HUB(HUB_UNNM,HUB_PSNM,HUB_IDDI,HUB_NAME,HUB_IDNO,HUB_ISFG,HUB_LSFG,HUB_SDCO,hub_chipserno)';
  stSql := stSql + ' Values(''테스트'',''테스트'',''3'',''테스트직원'',''TEST02'',''0'',''0'',''0'',''499602D3'') ';

    with RelayExecQuery1 do
    begin
      Close;
      Sql.Text := stSql;
      Try
        ExecSQL;
      Except
      ON E: Exception do
        begin
          showmessage(E.Message);
          Exit;
        end
      End;
    end;
*)
end;

function TfmMain.DongYangUpdate_MFC_HUB(aEmCode, aCardNO,
  aAck: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update MFC_HUB set HUB_YN = ''Y'' where hub_chipserno = ''' + aCardNO + ''' ';
  with RelayExecQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSQL;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TfmMain.DongYangDelete_MFC_HUB_SEQ(aSeq: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From MFC_HUB where HUB_SEQNO <= ' + aSeq + ' ';
  with RelayExecQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSQL;
    Except
      Exit;
    End;
  end;
  result := True;
end;

procedure TfmMain.SpeedButton3Click(Sender: TObject);
var
  stSql : string;
begin
  with RelaySearchADOQuery1 do
  begin
    Close;
    //stSql := 'Select * from MFC_HUB';
    //if ed_EmCode.Text <> '' then stSql := stSql + ' Where HUB_IDNO = ''' + ed_EmCode.Text + ''' ';
    //stSql := stSql + ' order by HUB_SEQNO ';

    Sql.Text := memo2.Text;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
end;

procedure TfmMain.SpeedButton4Click(Sender: TObject);
begin
  if UnivercityConnect then
  begin
    showmessage('접속 성공');
  end;
end;

function TfmMain.UnivercityConnect: Boolean;
var
  conStr : string;
begin
  result := False;
(*  conStr := 'Provider=OraOLEDB.Oracle;';
  conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=203.249.39.13)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=MFC_BAS)(SERVER=DEDICATED)));';
  conStr := constr + 'User Id=park;';
  conStr := constr + 'Password=wnck1553';
*)
    conStr := 'Provider=MSDAORA.1;';
    //conStr := 'Provider=OraOLEDB.Oracle;';
    conStr := constr + 'Password=zkem2007;';
    conStr := constr + 'User ID=card;';
    conStr := constr + 'Data Source=MLCK2;';
    conStr := constr + 'Persist Security Info=False';   

  with ADOOraConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
      Connected := True;
    Except
      on E : Exception do
        begin
          ShowMessage('DBError('+ E.Message + ')' + conStr );
          Exit;
        end;
      else
        begin
          ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
    OraDBConnected := True;
    result := True;
  end;
end;

procedure TfmMain.OracleConnectCheckTimerTimer(Sender: TObject);
begin
  OracleConnectCheckTimer.Enabled := False;
  UnivercityConnect;
  if Not OraDBConnected then
  begin
    OracleConnectCheckTimer.Enabled := True;
  end;
  label3.Caption := 'OracleConnectCheckTimer';
end;

procedure TfmMain.SetOraDBConnected(const Value: Boolean);
begin
  if FOraDBConnected = Value then exit;
  FOraDBConnected := Value;
  OracleConnectCheckTimer.Enabled := Not Value;
end;

function TfmMain.RelayCardSystem(aAll:Boolean): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stJijumName : string;
  stDepartName : string;
  stPosiCode : string;
  stEmName : string;
  stEmCode : string;
  stCardSeq : string;
  stCardType : string;
  stGubun : string;
  stCardNo : string;
  i : integer;
//  stEMSeq : string;
begin

  result := False;
  stSql := ' Select * from MFC_VTUSM ';
  if ( Not aAll) then
  begin
    stSql := stSql + ' Where USM_UPDT > ''' +  L_stCardRelayTime + ''' ';
  end;
  stSql := stSql + ' order by USM_UPDT ';

  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      on E : Exception do
        begin
          RelayDBConnected := False;  //Select 에러 나면 재접속을 시도하자...
          Memo1.Text := 'DBError('+ E.Message + ')' +  stSql;
          Exit;
        end;
      else
        begin
          RelayDBConnected := False;  //Select 에러 나면 재접속을 시도하자...
          Memo1.Text := 'DBError()' + stSql;
          Exit;
        end;
      Exit;
    End;
    result := True;
    if recordCount < 1 then Exit;

    Label2.Caption := inttostr(Recordcount);
    i := 1;
    while Not Eof do
    begin
      stCardNo:= FindField('USM_CSN').AsString;
      stEmCode:= FindField('USM_IDNO').AsString;
      stCardType:= FindField('USM_LSFG').AsString;  //1.분실
      stCardSeq := FindField('USM_ISFG').AsString;
      stPosiCode:= FindField('USM_IDDI').AsString;
      stGubun:= FindField('USM_SDCO').AsString;



      //stPosiCode 1.학생,3.교원,4.직원,5.조교
      //stGubun    1.재학/재직,2.휴학/휴직,3.졸업/퇴직,4.제적
      if GetOracleInfo(stEmCode,stJijumName,stDepartName,stPosiCode,stEmName,stGubun) then
      begin
        if DongYangConversionEmployee(stJijumName,stDepartName,stPosiCode,stEmName,
                                 stEmCode,stCardSeq,stCardType,stGubun,
                                 stCardNo) then
        begin
          //memo1.Lines.Add(stEmCode + ':' + stEmName);
          Label1.Caption := 'CardSystem:' + stEmCode + ':' + stEmName ;
          L_stCardRelayTime := FindField('USM_UPDT').asstring;
          UpdateTB_CONFIG('EMPCONV','LASTCARDTIME',L_stCardRelayTime);
          //DongYangUpdate_MFC_HUB(FindField('HUB_IDNO').asstring,FindField('hub_chipserno').AsString,'Y');
          //DongYangDelete_MFC_HUB(FindField('HUB_IDNO').asstring,FindField('hub_chipserno').AsString);
        end
        else
        begin
          memo1.Text := '[실패]' +stEmCode + ':' + stEmName;
        end;
      end else
      begin
        memo1.Text := '[데이터없음]' +stEmCode + ':' + stEmName;
        //DongYangUpdate_MFC_HUB(FindField('HUB_IDNO').asstring,FindField('hub_chipserno').AsString,'Y');
      end;

      //StatusBar1.Panels[2].Text := FindField('HUB_UNNM').AsString + '연동완료';

      Label3.Caption := inttostr(i);
      inc(i);
      tbi.Hint := stEmCode + ':' + stEmName + '연동중' ;
      Application.ProcessMessages;
      Next;
    end;
  end;
end;

function TfmMain.GetOracleInfo(aEmCode: string; var aJijumName,
  aDepartName, aPosiCode, aEmName, aGubun: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := False;
  stSql := 'select * from mfc_bas where BAS_IDNO = ''' + aEmCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOOraConnection;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        on E : Exception do
          begin
            OraDBConnected := False;  //Select 에러 나면 재접속을 시도하자...
            Memo1.Text := 'DBError('+ E.Message + ')' +  stSql;
            Exit;
          end;
        else
          begin
            OraDBConnected := False;  //Select 에러 나면 재접속을 시도하자...
            Memo1.Text := 'DBError()' + stSql;
            Exit;
          end;
        Exit;
      End;
      if recordcount < 1 then Exit;
      result := True;
      aPosiCode := FindField('BAS_IDDI').AsString;
      if aPosiCode = '1' then
      begin
        aJijumName := FindField('BAS_UNNM').AsString;
        if aJijumName = '' then aJijumName := '동양미래대';
        aDepartName := FindField('BAS_PSNM').AsString;
      end else
      begin
        aJijumName := FindField('BAS_UNNM').AsString;
        if aJijumName = '' then aJijumName := '교직원';
        aDepartName := FindField('BAS_DPNM').AsString;
      end;
      aEmName := FindField('BAS_NAME').AsString;
      aGubun := FindField('BAS_SDCO').AsString;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.RelayUniversitySystem(aDate:string): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stJijumName : string;
  stDepartName : string;
  stPosiCode : string;
  stEmName : string;
  stEmCode : string;
  stCardSeq : string;
  stCardType : string;
  stGubun : string;
  stCardNo : string;
  i : integer;
  stCurrentTime : string;
  TempAdoQuery : TAdoQuery;
begin

  result := False;

  if Not OraDBConnected then Exit;

  stSql := ' SELECT SYSDATE - 0.0001 as curTime FROM DUAL';

  with ADOOraQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      on E : Exception do
        begin
          OraDBConnected := False;
          Memo1.Text := 'DBError('+ E.Message + ')' +  stSql;
          Exit;
        end;
      else
        begin
          OraDBConnected := False;
          Memo1.Text := 'DBError()' + stSql;
          Exit;
        end;
      Exit;
    End;
    if Not Findfield('curTime').IsNull then
    begin
      stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',(Findfield('curTime').AsDateTime) );
//      stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
//                       + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
    end else
    begin
      stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
//      stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
//                        + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
    end;

  end;

  stSql := ' Select * from MFC_BAS ';
  if aDate <> '' then stSql := stsql + ' where TO_CHAR(UPD_DT,''YYYYMMDDHH24MISS'') > ''' + copy(aDate,1,14) + ''' and TO_CHAR(UPD_DT,''YYYYMMDDHH24MISS'') <''' + copy(stCurrentTime,1,14) + ''' ';
  stSql := stSql + ' order by UPD_DT ';


  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOOraConnection;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        on E : Exception do
          begin
            OraDBConnected := False;  //Select 에러 나면 재접속을 시도하자...
            Memo1.Text := 'DBError('+ E.Message + ')' +  stSql;
            Exit;
          end;
        else
          begin
            OraDBConnected := False;  //Select 에러 나면 재접속을 시도하자...
            Memo1.Text := 'DBError()' + stSql;
            Exit;
          end;
        Exit;
      End;
      result := True;
      if recordCount < 1 then Exit;

      Label2.Caption := inttostr(Recordcount);
      i := 1;
      while Not Eof do
      begin
        stEmCode:= FindField('BAS_IDNO').AsString;
        stEmName:= FindField('BAS_NAME').AsString;
        stGubun:= FindField('BAS_SDCO').AsString;
        stPosiCode := FindField('BAS_IDDI').AsString;
        stJijumName := FindField('BAS_UNNM').AsString;
        if stPosiCode = '1' then
        begin
          if stJijumName = '' then stJijumName := '동양미래대';
          stDepartName := FindField('BAS_PSNM').AsString;
        end else
        begin
          if stJijumName = '' then stJijumName := '교직원';
          stDepartName := FindField('BAS_DPNM').AsString;
        end;
        stCardType:= '0';  //0.정상,1.분실
        //stEMSeq := FindField('HUB_SEQNO').AsString;
        //stCardSeq := FindField('HUB_ISFG').AsString;

        //stPosiCode 1.학생,3.교원,4.직원,5.조교
        //stGubun    1.재학/재직,2.휴학/휴직,3.졸업/퇴직,4.제적
        GetCardInfo(stEmCode,stCardNo,stCardType,stCardSeq);
        if DongYangConversionEmployee(stJijumName,stDepartName,stPosiCode,stEmName,
                                 stEmCode,stCardSeq,stCardType,stGubun,
                                 stCardNo) then
        begin
          //memo1.Lines.Add(stEmCode + ':' + stEmName);
          Label1.Caption := 'UniversitySystem:' + stEmCode + ':' + stEmName ;
          if Not FindField('UPD_DT').IsNull then
          begin
            Try
              L_stLastRelayTime := formatDateTime('yyyymmddhhnnss',FindField('UPD_DT').AsDateTime);
              UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
            Except
  //
            End;
          end;
        end
        else
        begin
          //memo1.Lines.Add('[실패]' +stEmCode + ':' + stEmName);
        end;

        //StatusBar1.Panels[2].Text := FindField('HUB_UNNM').AsString + '연동완료';

        Label3.Caption := inttostr(i);
        inc(i);
        tbi.Hint := stEmCode + ':' + stEmName + '연동중' ;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.SpeedButton5Click(Sender: TObject);
begin
  ADOOraQuery1.Close;
  ADOOraQuery1.SQL.Text := Memo3.Text;
  Try
    ADOOraQuery1.Open;
  Except
    on E : Exception do
      begin
        ShowMessage('DBError('+ E.Message + ')' );
        Exit;
      end;
    else
      begin
        ShowMessage('데이터베이스 쿼리 에러' );
        Exit;
      end;

  End;

end;

procedure TfmMain.LoadConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  L_stProgramType := '1';   //1:아주대,2:전남대병원,3.KT서초사옥
  L_stDBType := '3';
  L_stDBIP :='127.0.0.1';
  L_stDBPort := '1521';
  L_stDBUserID := 'SYS';
  L_stDBUserPW := 'orapasswd1';
  L_stDBName :='orcl';
  L_stDBType2 := '3';
  L_stDBIP2 :='127.0.0.1';
  L_stDBPort2 := '1521';
  L_stDBUserID2 := 'SYS';
  L_stDBUserPW2 := 'orapasswd1';
  L_stDBName2 :='orcl';

  L_stRelayTime :='30';
  L_stLastRelayTime := '';
  L_stCardRelayTime := '';
  L_stCompanyCode := '099';
  L_stJijumCode := '000';

  stSql := 'select * from TB_CONFIG ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ZmosADOConnection;
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
      while Not Eof do
      begin
        if FindField('CO_CONFIGGROUP').AsString = 'EMPCONV' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'PGTYPE'   then L_stProgramType := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBTYPE'   then L_stDBType := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBIP'     then L_stDBIP := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBPORT'   then L_stDBPort := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERID' then L_stDBUserID := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERPW' then L_stDBUserPW := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBNAME'   then L_stDBName := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBTYPE2'   then L_stDBType2 := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBIP2'     then L_stDBIP2 := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBPORT2'   then L_stDBPort2 := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERID2' then L_stDBUserID2 := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERPW2' then L_stDBUserPW2 := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBNAME2'   then L_stDBName2 := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'RELAYTIME'   then L_stRelayTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'LASTTIME'   then L_stLastRelayTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'LASTCARDTIME'   then L_stCardRelayTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DELTIME'   then L_stLastRelayDelTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'COCODE'   then L_stCompanyCode := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'JIJUMCD'   then L_stJijumCode := FindField('CO_CONFIGVALUE').AsString;
        end;
        Next;
      end;
    end;

  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.GetCardInfo(aEmCode: string; var aCardNo, aCardType,
  aCardSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  aCardNo := '';
  aCardType := '0';
  aCardSeq := '0';
  stSql := 'select  * from MFC_VTUSM where USM_IDNO = ''' + aEmCode + ''' order by USM_ISFG desc';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection1;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        on E : Exception do
          begin
            RelayDBConnected := False;  //Select 에러 나면 재접속을 시도하자...
            Memo1.Text := 'DBError('+ E.Message + ')' +  stSql;
            Exit;
          end;
        else
          begin
            RelayDBConnected := False;  //Select 에러 나면 재접속을 시도하자...
            Memo1.Text := 'DBError()' + stSql;
            Exit;
          end;
        Exit;
      End;
      if recordcount < 1 then
      begin
 //       memo4.Lines.Add(stSql);
        Exit;
      end;
      result := True;
      aCardNo := FindField('USM_CSN').AsString;
      aCardSeq := FindField('USM_ISFG').AsString;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.UpdateTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CONFIG ';
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result := ZmosProcessExecSQL(stSql);
end;

procedure TfmMain.SpeedButton6Click(Sender: TObject);
begin
  RelayConnect;
//  RelayTestConnect;
  UnivercityConnect;
//  UnivercityTestConnect;
  DongYangUniversityRelay;
end;

function TfmMain.RelayTestConnect: Boolean;
var
  conStr : string;
begin
  result := False;
  conStr := 'Provider=SQLOLEDB.1;';
  conStr := constr + 'Password=sapasswd;';
  conStr := constr + 'Persist Security Info=True;';
  conStr := constr + 'User ID=sa;';
  conStr := constr + 'Initial Catalog=zmos;';
  conStr := constr + 'Data Source=127.0.0.1,1433';

  with ADOConnection1 do
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
  end;
  RelayDBConnected := True;
  result := True;
end;

function TfmMain.UnivercityTestConnect: Boolean;
var
  conStr : string;
begin
  result := False;
  conStr := 'Provider=SQLOLEDB.1;';
  conStr := constr + 'Password=sapasswd;';
  conStr := constr + 'Persist Security Info=True;';
  conStr := constr + 'User ID=sa;';
  conStr := constr + 'Initial Catalog=zmos;';
  conStr := constr + 'Data Source=127.0.0.1,1433';

  with ADOOraConnection do
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
  end;
  OraDBConnected := True;
  result := True;
end;

function TfmMain.DeleteTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := ZmosProcessExecSQL(stSql);
  if Not result then Memo1.Lines.Add(stSql);
end;

end.
