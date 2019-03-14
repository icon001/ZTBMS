unit uExcelSave;

interface

uses
   Windows,SysUtils, Classes,ComObj,OleCtrls,AdvGrid,Gauges,Dialogs,Forms, ShellAPI, StdCtrls;

type
  TdmExcelSave = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    Function ExcelPrintOut(StringGrid:TAdvStringGrid;refFileName,SaveFileName:String;FileOut:Boolean;ExcelRowStart:integer;stTitle:string;bRowHeader,bColHeader:Boolean;Gauge:TGauge=nil;aPWUse:Boolean=false;aPasswd:string=''):Boolean;
  end;

var
  dmExcelSave: TdmExcelSave;

implementation
uses
  uLomosUtil;

{$R *.dfm}

{ TdmExcelSave }

function TdmExcelSave.ExcelPrintOut(StringGrid: TAdvStringGrid;
  refFileName, SaveFileName: String; FileOut: Boolean;
  ExcelRowStart: integer; stTitle: string; bRowHeader, bColHeader: Boolean;
  Gauge: TGauge=nil;aPWUse:Boolean=false;aPasswd:string=''): Boolean;
var
  oXL, oWB, oSheet, oRng, VArray : Variant;
  nCol1,nCol2 : Integer;
  Loop : Integer;
  sCurDay,sPreDay : String;
  curDate : TDateTime;
  mergeStart :char;
  i,j,k : Integer;
  st : String;
  nColChar : integer;
  nFixCol,nFixRow : integer;
  stCellRange : string;
  nFileFormat : oleVariant;
begin
  Result := False;
  Try
    oXL := CreateOleObject('Excel.Application');
  Except
    if FileOut then
    begin
      showmessage('엑셀저장 실패로 CSV포맷으로 저장 됩니다.');
      SaveFileName := copy(SaveFileName,1,Length(SaveFileName) - 3) + 'csv';
      StringGrid.SaveToCSV(SaveFileName);
    end else
    begin
      showmessage('엑셀이 미설치시 출력기능이 제공되지 않습니다.');
    end;
    exit;
  End;

  Try
    if FileExists(refFileName) = False then
    begin
      Showmessage(refFileName + ' 파일이 없습니다.');
      exit;
    end;

    if (SaveFileName = '') then
    begin
      DeleteFile('c:\temp.xls');
      SaveFileName := 'c:\temp.xls';
    end;

    CopyFile(PChar(refFileName), PChar(SaveFileName), False);

    oXL.Workbooks.Open(SaveFileName);
    //oXL.Workbooks.Open(SaveFileName);
    oXL.DisplayAlerts := False;
    //oXL.Visible := True;
    oSheet := oXL.ActiveSheet;
    nFileFormat := oXL.Application.WorkBooks[1].FileFormat;


    with StringGrid do
    begin

      //타이틀을 적자
      nCol1 := ColCount div 26;
      nCol2 := (ColCount mod 26) + 1;
      if bRowHeader then
      begin
        oSheet.Range['A' + inttostr(ExcelRowStart - 1)].Value := stTitle;
        if bColHeader then nFixCol := 0
        else nFixCol := FixedCols ;
        for i:= 0 to FixedRows - 1 do
        begin
          for j:= nFixCol to ColCount - 1 do
          begin
            nColChar := j div 26;
            if j < 26 then
              oXL.Range[Chr(Ord('A') + j ) + inttostr(i+ ExcelRowStart)].Value := Cells[j,i]
            else
              oXL.Range[Chr(Ord('A') + nColChar - 1 ) + Chr(Ord('A') + j - (26 * nColChar) ) + inttostr(i+ ExcelRowStart)].Value := Cells[j,i];
          end;
        end;
        ExcelRowStart := ExcelRowStart + FixedRows ;
      end
      else    oSheet.Range['A' + inttostr(ExcelRowStart - FixedRows - 1)].Value := stTitle;

      Gauge.MaxValue := ( RowCount - FixedRows );
      Gauge.Progress := 0;
      //for i := FixedRows to RowCount - 1 do
      for i := FixedRows to (FixedRows + RowCount) - 1 do
      begin

        if i <  (FixedRows + RowCount) - 2 then    //한칸씩 삽입  if i <  RowCount - 2 then
        begin
          if ColCount < 26 then stCellRange := 'A' + inttostr(i+ ExcelRowStart - FixedRows + 1) + ':' + Chr(Ord('A') + nCol1 ) + Chr(Ord('A') + nCol2 - 1 ) +  inttostr(i+ ExcelRowStart - FixedRows + 1)
          else                  stCellRange := 'A' + inttostr(i+ ExcelRowStart - FixedRows + 1) + ':' + Chr(Ord('A') + nCol1 -1 ) + Chr(Ord('A') + nCol2 - 1 ) +  inttostr(i+ ExcelRowStart - FixedRows + 1);
          oSheet.Range[stCellRange].Insert;
        end;
        Gauge.Progress := Gauge.Progress + 1;
        Application.ProcessMessages;
      end;
      StringGrid.CopyToClipBoard;
      //oSheet.Range['A' + inttostr(ExcelRowStart - FixedRows), 'A' + inttostr(ExcelRowStart - FixedRows)].Select;
      oSheet.Range['A' + inttostr(ExcelRowStart), 'A' + inttostr(ExcelRowStart)].Select;
      oSheet.Paste;
      for i := 0 to FixedRows - 1 do
      begin
        if ColCount < 26 then stCellRange := 'A' + inttostr(ExcelRowStart) + ':' + Chr(Ord('A') + nCol1 ) + Chr(Ord('A') + nCol2 - 1 ) +  inttostr(ExcelRowStart )
        else                  stCellRange := 'A' + inttostr(ExcelRowStart) + ':' + Chr(Ord('A') + nCol1 -1 ) + Chr(Ord('A') + nCol2 - 1 ) +  inttostr(ExcelRowStart );
        oSheet.Range[stCellRange].Delete;
        Gauge.Progress := Gauge.Progress + 1;
        Application.ProcessMessages;
      end;
      
    end;//With

    //oXL.Visible := False;
    if FileOut then
    begin
      if aPWUse then
      begin
        //oSheet.Protect(Password:=aPasswd, DrawingObjects:=True, Contents:=True, Scenarios:=True);   //쓰기 방지만 됨 수정이 안되도록
        oSheet.SaveAs(SaveFileName,Password := aPasswd);    //파일 전체에 패스워드 걸림
      end else
      begin
        //Delay(3000);
        //oXL.Application.WorkBooks[1].SaveAs(SaveFileName, nFileFormat);
        Try
          oXL.save;//(SaveFileName);
        Except
          Try
            oSheet.SaveAs(SaveFileName);
          Except
            showmessage('엑셀저장 실패로 CSV포맷으로 저장 됩니다.');
            SaveFileName := copy(SaveFileName,1,Length(SaveFileName) - 3) + 'csv';
            StringGrid.SaveToCSV(SaveFileName);
          End;
        End;
        //oXL.ActiveWorkBook.SaveAs(SaveFileName);
        //oSheet.SaveAs(SaveFileName);
      end;
    end else  oSheet.PrintOut;
    oXL.ActiveWorkbook.Close(False);
    oXL.Quit;
    //oXL:= Unassigned;
  Except
    oXL.ActiveWorkbook.Close(False);
    oXL.Quit;
    //oXL:= Unassigned;
    if FileOut then
    begin
      showmessage('엑셀저장 실패로 CSV포맷으로 저장 됩니다.');
      SaveFileName := copy(SaveFileName,1,Length(SaveFileName) - 3) + 'csv';
      StringGrid.SaveToCSV(SaveFileName);
    end else
    begin
      showmessage('엑셀파일 문제로 출력 실패 하였습니다.');
    end;
    exit;
  End;
  //DeleteFile(PChar(SaveFileName + '1'));
  Result := True;
end;

end.
