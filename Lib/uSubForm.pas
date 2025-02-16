unit uSubForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CommandArray, StdCtrls, RunDLL, Grids,DB,ExtCtrls,Jpeg,AdvGrid,
  RzEdit,Gauges,RzButton;

type
  TfmASubForm = class(TForm)
    CommandArray: TCommandArray;
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    IsInsertGrade : Boolean;
    IsUpdateGrade : Boolean;
    IsDeleteGrade : Boolean;
    ModuleID : String;
    ErrorCode : Integer;

    Function  MainModule:TfmASubForm;
    Function  MainCommand(CommandName:String):TCommand;

    Function  FindSubForm(ModuleID:String):TfmASubForm;
    Function  FindClassForm(FormName:string):TfmASubForm;
    Function  FindCommand(CommandName:String):TCommand;

    Function  GetCommand(ModuleID,CommandName:String):TCommand;

    Procedure RunModule(ModuleID,DllName:String; Parent:TwinControl; Visible:Boolean);
    Procedure CloseModules(MainForm:TForm);
    Procedure RowGridInitialize(sg_Grid:TAdvStringGrid;aRow:integer = 2;bCheckBox:Boolean=False); //모두 지움 쓰레기 데이터 남을수 없도록
    Procedure GridInitialize(sg_Grid:TAdvStringGrid;aRow:integer = 2;bCheckBox:Boolean=False);
    procedure GridInit(sg:TAdvStringGrid;aCol:integer;aRow:integer = 2;bCheckBox:Boolean=False);
    procedure JPEGLoadFromDB(Field: TField; Image: TImage);
    Function GetJPEGFromDB(Field:TField):TJPEGImage;
  public
    //Edit 찾는 함수
    Function TravelEditItem(GroupBox:TGroupBox;stName:string; no:Integer):TEdit;
    Function TravelRzEditItem(GroupBox:TGroupBox;stName:string; no:Integer):TRzEdit;
    //RzBitBtn 찾는 함수
    Function TravelRzBitBtnItem(GroupBox:TGroupBox;stName:string; no:Integer):TRzBitBtn;
    //CheckBox 찾는 함수
    Function TravelCheckBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TCheckBox;
    //ComboBox 찾는 함수
    Function TravelComboBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TComboBox;
    //Label 찾는 함수
    Function TravelLabelItem(GroupBox:TGroupBox;stName:string; no:string):TLabel;
    //Gauge 찾는 함수
    Function TravelGaugeItem(GroupBox:TGroupBox;stName:string; no:string):TGauge;


  end;

var
  fmASubForm: TfmASubForm;

implementation

var
  FNilCommand : TCommand;

{$R *.dfm}

{ TfmASubForm }

procedure TfmASubForm.RunModule(ModuleID,DllName:String; Parent:TwinControl; Visible:Boolean);
begin
  TRunDLL.Run(ModuleID, DllName, Parent, Visible);
end;

function TfmASubForm.FindCommand(CommandName: String): TCommand;
begin
  Try
    Result:= CommandArray.FindCommand(CommandName);

    If Result = Nil then Begin
      ErrorCode:= -3;
      // Command를 못찾더라도 Execute를 실행하는데 에러를 내지 않는다.  에러코드만 변경
      Result:= FNilCommand;
    End Else ErrorCode:= 0;
  Except
//    ErrorCode:= -3;
    Result:= nil;
  end;
end;

function TfmASubForm.FindSubForm(ModuleID: String): TfmASubForm;
var
  Loop : Integer;
  stTemp : string;
begin
  ErrorCode:= -2;
  Result:= Nil;

  For Loop:= 0 to Application.ComponentCount-1 do Begin
    If Application.Components[Loop] is TForm then Begin
      stTemp := TfmASubForm(Application.Components[Loop]).Caption;
      If LowerCase(TfmASubForm(Application.Components[Loop]).ModuleID) = LowerCase(ModuleID) then
        Try
          ErrorCode:= 0;
          Result:= TfmASubForm(Application.Components[Loop]);
          Break;
        Except
        End;
    End;
  End;
end;

function TfmASubForm.GetCommand(ModuleID, CommandName: String): TCommand;
var
  fmSub : TfmASubForm;
begin
  fmSub:= FindSubForm(ModuleID);
  If fmSub = Nil then Begin
    Result:= FNilCommand;
    Exit;
  End;

  Result:= fmSub.FindCommand(CommandName);
end;

function TfmASubForm.MainModule: TfmASubForm;
begin
  ErrorCode:= 0;

  Result:= TfmASubForm(Application.MainForm)
end;

function TfmASubForm.MainCommand(CommandName: String): TCommand;
begin
  If MainModule = Nil then Result:= FNilCommand
  Else Result:= MainModule.FindCommand(CommandName);
end;

procedure TfmASubForm.CloseModules(MainForm: TForm);
var
  Loop : Integer;
begin
  For Loop:= 0 to Application.ComponentCount-1 do Begin
    If not (Application.Components[Loop] is TForm) then Continue;
    If Application.Components[Loop] = MainForm then Continue;

    TForm(Application.Components[Loop]).Close;
  End;
end;

function TfmASubForm.FindClassForm(FormName: string): TfmASubForm;
var
  tmpFormClass : TFormClass;
  i : Integer;
  stTemp : string;
  clsName : String;
  tmpClass : TPersistentClass;
begin
  ErrorCode:= -2;
  Result:= Nil;
  clsName := FormName;
  tmpClass := FindClass(clsName);

  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        Try
          ErrorCode:= 0;
          Result:= TfmASubForm(Screen.Forms[i]);
          Break;
        Except
        End;
      end;
    end;
  end;

end;

procedure TfmASubForm.GridInitialize(sg_Grid: TAdvStringGrid;aRow:integer = 2;bCheckBox:Boolean=False);
var
  i,j:integer;
begin
  with sg_Grid do
  begin
    if bCheckBox then
    begin
      RemoveCheckBox(0,0);
      RemoveCheckBox(0,1);

      AddCheckBox(0,0,False,False);
    end;
    for i:= 0 to ColCount - 1 do
    begin
      for j:= aRow - 1 to RowCount -1 do
      begin
        Cells[i,j] := '';
      end;
    end;
    rowCount := aRow;
  end;

end;

procedure TfmASubForm.JPEGLoadFromDB(Field: TField; Image: TImage);
var
  jpg: TJPEGImage;
  mem: TMemoryStream;
  BlobField : TBlobField;
begin
    jpg := TJPEGImage.Create;
    mem := TMemoryStream.Create;
    try
       BlobField:=(Field as TBlobField);
       if BlobField.IsNull then
       begin
            Image.Picture := nil;
       end else
       begin
            try
               BlobField.SaveToStream(mem);
               mem.Position := 0;
               jpg.LoadFromStream(mem);
               Image.Picture.Graphic := jpg;
            except
               Image.Picture := nil;
            end;
       end;
    finally
       mem.Free;
       jpg.Free;
    end;

end;

function TfmASubForm.GetJPEGFromDB(Field: TField): TJPEGImage;
var
  jpg: TJPEGImage;
  mem: TMemoryStream;
  BlobField : TBlobField;
begin
    jpg := TJPEGImage.Create;
    mem := TMemoryStream.Create;
    try
       BlobField:=(Field as TBlobField);
       if BlobField.IsNull then
       begin
            GetJPEGFromDB := nil;
       end else
       begin
            try
               BlobField.SaveToStream(mem);
               mem.Position := 0;
               jpg.LoadFromStream(mem);
               GetJPEGFromDB := jpg;
            except
               GetJPEGFromDB := nil;
            end;
       end;
    finally
       mem.Free;
       jpg.Free;
    end;

end;

procedure TfmASubForm.GridInit(sg: TAdvStringGrid; aCol: integer;aRow:integer = 2;bCheckBox:Boolean=False);
var
  i,j:integer;
begin
  with sg do
  begin
    if bCheckBox then
    begin
      RemoveCheckBox(0,0);
      RemoveCheckBox(0,1);

      AddCheckBox(0,0,False,False);
    end;
    for i:= 0 to ColCount - 1 do
    begin
      for j:= aRow - 1 to RowCount -1 do
      begin
        Cells[i,j] := '';
      end;
    end;
    RowCount := aRow;

    for i := aCol to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
end;

procedure TfmASubForm.RowGridInitialize(sg_Grid: TAdvStringGrid;aRow:integer = 2;bCheckBox:Boolean=False);
var
  i,j:integer;
begin
  with sg_Grid do
  begin
    if bCheckBox then
    begin
      RemoveCheckBox(0,0);
      RemoveCheckBox(0,1);

      AddCheckBox(0,0,False,False);
    end;
    for i:= 0 to ColCount - 1 do
    begin
      for j:= aRow - 1 to RowCount -1 do
      begin
        Cells[i,j] := '';
      end;
    end;
    rowCount := aRow;
  end;
end;

function TfmASubForm.TravelCheckBoxItem(GroupBox: TGroupBox;
  stName: string; no: Integer): TCheckBox;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TCheckBox(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

function TfmASubForm.TravelComboBoxItem(GroupBox: TGroupBox;
  stName: string; no: Integer): TComboBox;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    if no <> -1 then
    begin
      If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
      Begin
        Result:=TComboBox(GroupBox.Controls[Loop]);
        exit;
      End;
    end else
    begin
      If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) then
      Begin
        Result:=TComboBox(GroupBox.Controls[Loop]);
        exit;
      End;
    end;
  End;
end;

function TfmASubForm.TravelEditItem(GroupBox: TGroupBox; stName: string;
  no: Integer): TEdit;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    if no <> -1 then
    begin
      If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
      Begin
        Result:=TEdit(GroupBox.Controls[Loop]);
        exit;
      End;
    end else
    begin
      If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) then
      Begin
        Result:=TEdit(GroupBox.Controls[Loop]);
        exit;
      End;
    end;
  End;

end;

function TfmASubForm.TravelGaugeItem(GroupBox: TGroupBox; stName,
  no: string): TGauge;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + no then
    Begin
      Result:=TGauge(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

function TfmASubForm.TravelLabelItem(GroupBox: TGroupBox; stName,
  no: string): TLabel;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + no then
    Begin
      Result:=TLabel(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

function TfmASubForm.TravelRzBitBtnItem(GroupBox: TGroupBox;
  stName: string; no: Integer): TRzBitBtn;
var
  Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TRzBitBtn(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

function TfmASubForm.TravelRzEditItem(GroupBox: TGroupBox; stName: string;
  no: Integer): TRzEdit;
var
  Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TRzEdit(GroupBox.Controls[Loop]);
      exit;
    End;
  End;

end;

initialization
  FNilCommand:= TCommand.Create(Nil);
finalization
  FreeAndNil(FNilCommand);
end.

