unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, GR32_Image, Buttons, Shader, ComCtrls,
  ImgList,ADODB,ActiveX,GR32_Layers,GR32_Objects,GR32_Misc,GR32;

type
  TfmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    ImgView: TImgView32;
    lb_MapName: TLabel;
    GroupBox1: TGroupBox;
    btn_Close: TSpeedButton;
    btn_Save: TSpeedButton;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    btn_Mapadd: TSpeedButton;
    btn_HotSensorAdd: TSpeedButton;
    btn_etcSensorAdd: TSpeedButton;
    PageControl1: TPageControl;
    tbLOCATE: TTabSheet;
    GroupBox5: TGroupBox;
    TreeView_Location: TTreeView;
    Shader2: TShader;
    TreeView_LocationCode: TTreeView;
    toolslist: TImageList;
    btn_MapUpdate: TSpeedButton;
    btn_MapDelete: TSpeedButton;
    btn_Cancel: TSpeedButton;
    btn_ZoneAreaCreate: TSpeedButton;
    btn_CountrolDelete: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_MapaddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView_LocationClick(Sender: TObject);
    procedure ImgViewResize(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
    procedure btn_ZoneAreaCreateClick(Sender: TObject);
    procedure btn_HotSensorAddClick(Sender: TObject);
    procedure ImgViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure btn_SaveClick(Sender: TObject);
    procedure ImgViewMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
    procedure ImgViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure btn_etcSensorAddClick(Sender: TObject);
  private
    FMapUpdate: Boolean;
    FMapInsert: Boolean;
    L_stInsertMapFile : string;
    L_stCurrentMapID : string;
    L_stInsertMapNAME : string;
    L_stPositionCode : string;
    L_nLeft : integer;
    L_nTop : integer;
    FSelection: TPositionedLayer;
    SelectionShape: TShape;
    SelectionRec: TRect;
    scrollbar_width: integer;
    { Private declarations }
    procedure LoadMapLocation;
    procedure SetMapUpdate(const Value: Boolean);
    procedure SetMapInsert(const Value: Boolean);
    procedure SetSelection(const Value: TPositionedLayer);
    procedure ButtonEnable(aValue:Boolean);
  private
    procedure OpenImage(const FileName: string);
    procedure DesignerMoving(Sender: TObject; const OldLocation: TFloatRect;
      var NewLocation: TFloatRect; DragState: integer; Shift: TShiftState);
    procedure DesignerBtnMoving(Sender: TObject);
    procedure ValidateDragState(Sender: TObject; var dragState: integer);
    procedure CountSelected(out count, indexLast: integer);
    procedure DrawFocusRec(Rec: TRect);

  protected
    RBLayer: TRubberbandLayer;
  public
    { Public declarations }
    property MapUpdate:Boolean read FMapUpdate write SetMapUpdate;
    property MapInsert:Boolean read FMapInsert write SetMapInsert;

    property Selection: TPositionedLayer read FSelection write SetSelection;
  end;

var
  fmMain: TfmMain;

implementation
uses
  uDataModule1,
  uDataBaseConfig,
  uMDBSql,
  uMSSql,
  uPostGresql,
  uFireBird,
  uLomosUtil,
  uMapAdd,
  uMapArea,
  gr32Util,
  uMapSensor;
{$R *.dfm}

procedure TfmMain.FormActivate(Sender: TObject);
begin
  WindowState := wsMaximized;

  LoadMapLocation;
end;

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  TDataBaseConfig.GetObject.DataBaseConnect;
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if TDataBaseConfig.GetObject.Cancel then
    begin
      Application.Terminate;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;
end;

procedure TfmMain.LoadMapLocation;
var
  aTreeView   : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode   : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stSql : string;
  stLocationCode,stLocationCaption : string;
  stParentCode : string;
  TempAdoQuery :TADOQuery;
begin
  aTreeView := TreeView_Location;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := TreeView_LocationCode;   //위치 코드 등록으로 현재 상태를 파악하기 위함
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;

  aNode:= aTreeView.Items.Add(nil,'맵정보');
  aNode.ImageIndex:=0;
  aNode.SelectedIndex:=0;
  aNode.StateIndex:= -1;
  vNode1 := vTreeView.Items.Add(nil,'M0000000000000000');

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    if DBTYPE = 'MDB' then stSql := MDBSql.SelectMapCountryAll
    else if DBTYPE = 'PG' then stSql := PostGreSql.SelectMapCountryAll
    else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectMapCountryAll
    else if DBTYPE = 'FB' then stSql := FireBird.SelectMapCountryAll
    else Exit;
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
        stLocationCode := FindField('ML_GUBUN').AsString + FindField('ML_COUNTRY').AsString + FindField('ML_BUILDING').AsString + FindField('ML_FLOOR').AsString  + FindField('ML_AREA').AsString ;
        stLocationCaption := FindField('ML_NAME').AsString;
        //지역 등록
        bNode:= aTreeView.Items.AddChild(aNode,stLocationCaption);
        bNode.ImageIndex:=1;
        bNode.SelectedIndex:=1;
        bNode.StateIndex:= -1;
        vNode2 := vTreeView.Items.AddChild(vNode1,stLocationCode);
        Application.ProcessMessages;
        Next;
      end;
      aNode.Expanded := True;
    end;

    if DBTYPE = 'MDB' then stSql := MDBSql.SelectMapBuildingAll
    else if DBTYPE = 'PG' then stSql := PostGreSql.SelectMapBuildingAll
    else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectMapBuildingAll
    else if DBTYPE = 'FB' then stSql := FireBird.SelectMapBuildingAll
    else Exit;
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
        stParentCode := '0' + FindField('ML_COUNTRY').AsString + '000000000';
        stLocationCode := FindField('ML_GUBUN').AsString + FindField('ML_COUNTRY').AsString + FindField('ML_BUILDING').AsString + FindField('ML_FLOOR').AsString  + FindField('ML_AREA').AsString ;
        stLocationCaption := FindField('ML_NAME').AsString;
        //빌딩 등록
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=2;
            cNode.SelectedIndex:=2;
            cNode.StateIndex:= -1;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then
          begin
            vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
          end;
          vNode1.Expanded := True;
          bNode.Expanded := True;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;

    if DBTYPE = 'MDB' then stSql := MDBSql.SelectMapFloorAll
    else if DBTYPE = 'PG' then stSql := PostGreSql.SelectMapFloorAll
    else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectMapFloorAll
    else if DBTYPE = 'FB' then stSql := FireBird.SelectMapFloorAll
    else Exit;
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
        stParentCode := '1' + FindField('ML_COUNTRY').AsString + FindField('ML_BUILDING').AsString + '000000';
        stLocationCode := FindField('ML_GUBUN').AsString + FindField('ML_COUNTRY').AsString + FindField('ML_BUILDING').AsString + FindField('ML_FLOOR').AsString  + FindField('ML_AREA').AsString ;
        stLocationCaption := FindField('ML_NAME').AsString;
        //층 등록
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=3;
            cNode.SelectedIndex:=3;
            cNode.StateIndex:= -1;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then
          begin
            vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
          end;
          vNode1.Expanded := True;
          bNode.Expanded := True;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;

    if DBTYPE = 'MDB' then stSql := MDBSql.SelectMapAreaAll
    else if DBTYPE = 'PG' then stSql := PostGreSql.SelectMapAreaAll
    else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectMapAreaAll
    else if DBTYPE = 'FB' then stSql := FireBird.SelectMapAreaAll
    else Exit;
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
        stParentCode := '2' + FindField('ML_COUNTRY').AsString + FindField('ML_BUILDING').AsString + FindField('ML_BUILDING').AsString + '000';
        stLocationCode := FindField('ML_GUBUN').AsString + FindField('ML_COUNTRY').AsString + FindField('ML_BUILDING').AsString + FindField('ML_FLOOR').AsString  + FindField('ML_AREA').AsString ;
        stLocationCaption := FindField('ML_NAME').AsString;
        //구역 등록
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=4;
            cNode.SelectedIndex:=4;
            cNode.StateIndex:= -1;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then
          begin
            vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
          end;
          vNode1.Expanded := True;
          bNode.Expanded := True;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
    
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.btn_MapaddClick(Sender: TObject);
begin
  fmMapAdd:= TfmMapAdd.Create(Self);
  if TreeView_Location.Selected <> nil then
    fmMapAdd.L_stSelectMapID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  fmMapAdd.SHowmodal;
  L_stInsertMapFile := fmMapAdd.ImageName;
  L_stCurrentMapID := fmMapAdd.CurrentMapID;
  L_stInsertMapNAME := fmMapAdd.CurrentMapName;
  if L_stCurrentMapID <> '' then MapInsert := True;
  fmMapAdd.free;
  fmMain.Caption := '맵관리[' + L_stCurrentMapID + ']-' + L_stInsertMapNAME;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  MapUpdate := False;
  MapInsert := False;

  scrollbar_width := GetSystemMetrics(SM_CXVSCROLL);
  L_nLeft := 0;
  L_nTop := 0;
end;

procedure TfmMain.SetMapUpdate(const Value: Boolean);
begin
  FMapUpdate := Value;
  ImgView.Enabled := Value;
  ButtonEnable(Value);
end;

procedure TfmMain.TreeView_LocationClick(Sender: TObject);
var
  stSelectID : string;
begin
  if TreeView_Location.Selected.AbsoluteIndex = 0 then Exit;
  stSelectID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if MapInsert then
  begin
    if (Application.MessageBox(PChar('생성중인 맵이 있습니다. 생성 맵 정보를 취소하시겠습니까?'),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;
  end;
  L_stInsertMapFile := '';
  L_stInsertMapNAME := '';
  if MapUpdate then
  begin
    if L_stCurrentMapID = stSelectID then Exit;
  end;
  L_stCurrentMapID := '';

end;

procedure TfmMain.SetMapInsert(const Value: Boolean);
begin
  FMapInsert := Value;
  ImgView.Enabled := Value;
  ButtonEnable(Value);
  if Not Value then Exit;

  OpenImage(L_stInsertMapFile);

end;

procedure TfmMain.OpenImage(const FileName: string);
begin
  with ImgView do
  try
    Selection := nil;
    RBLayer := nil;
    Layers.Clear;
    Scale := 1;
    Bitmap.LoadFromFile(FileName);
  finally
//    pnlImage.Visible := not Bitmap.Empty;
  end;
  ImgViewResize(self);
end;

procedure TfmMain.SetSelection(const Value: TPositionedLayer);
begin
  FSelection := Value;
end;

procedure TfmMain.ImgViewResize(Sender: TObject);
begin
  if ImgView.Bitmap.Width <> 0 then
  begin
    ImgView.Scale := (ImgView.ClientWidth - scrollbar_width {-20} )/ImgView.Bitmap.Width;
    ImgView.ScrollToCenter(0,0);
  end;
end;

procedure TfmMain.ButtonEnable(aValue: Boolean);
begin
  btn_ZoneAreaCreate.Enabled := aValue;
  btn_CountrolDelete.Enabled := aValue;
  btn_HotSensorAdd.Enabled := aValue;
  btn_etcSensorAdd.Enabled := aValue;
end;

procedure TfmMain.Panel3Resize(Sender: TObject);
begin
  btn_ZoneAreaCreate.Left := (Panel3.Width div 8) - (btn_ZoneAreaCreate.Width div 2);
  btn_HotSensorAdd.Left := ((Panel3.Width div 8) * 3) - (btn_HotSensorAdd.Width div 2);
  btn_etcSensorAdd.Left := ((Panel3.Width div 8) * 5) - (btn_etcSensorAdd.Width div 2);
  btn_CountrolDelete.Left := ((Panel3.Width div 8) * 7) - (btn_CountrolDelete.Width div 2);
end;

procedure TfmMain.btn_ZoneAreaCreateClick(Sender: TObject);
var
  stMapAreaType : string;
  stPositionCode : string;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  tcNormalColor : TColor;
  tcAlertColor : TColor;
  stMapName : string;
  stNodeNo : string;
  stEcuID : string;

  i: integer;
  obj: TDrawObjLayerBase;
  fs: TFileStream;
begin
  fmMapArea:= TfmMapArea.Create(Self);
  fmMapArea.SHowmodal;
  stMapAreaType := fmMapArea.MapType;
  stPositionCode := '';
  stBuildingCode := fmMapArea.RealBuildingCode;
  stFloorCode := fmMapArea.RealFloorCode;
  stAreaCode := fmMapArea.RealAreaCode;
  tcNormalColor := fmMapArea.NormalColor;
  tcAlertColor := fmMapArea.AlertColor;
  stMapName := fmMapArea.MapName;
  stNodeNo := fmMapArea.NodeNo;
  stEcuID := fmMapArea.EcuID;
  fmMapArea.free;
  if stMapAreaType = '' then Exit;

  obj := TDrawObjRectangle.create(ImgView.Layers);
  obj.MapType := stMapAreaType;
  obj.ObjID := stPositionCode;
  obj.ObjName := stMapName;
  obj.BuildingCode := stBuildingCode;
  obj.FloorCode := stFloorCode;
  obj.ArearCode := stAreaCode;
  obj.NodeNo := stNodeNo;
  obj.EcuID := stEcuID;

  if not (obj is TDrawObjLine) then
  begin
    obj.SetControlBtns(MakeArrayOfFixedPoints([DEFAULT_MARGIN, DEFAULT_MARGIN,
                         100, 100]));
//    TDrawObjGraphic(obj).Scale := 190;
    obj.FillColor := 0;//4278190335;//$00000000;
    obj.StrokeWidth := 4;
    obj.StrokeColor := Color32(tcNormalColor);//tcNormalColor + $FF000000;//$FF00FF00; //$FFFF0000;  빨강
    obj.AlertColor := Color32(tcAlertColor);// + $FF000000;//$FF00FF00; //$FFFF0000;  빨강
    obj.NormalColor := Color32(tcNormalColor);// + $FF000000;//$FF00FF00; //$FFFF0000;  빨강
    obj.Left := L_nLeft;
    obj.Top := L_nTop;
    L_nTop := L_nTop + 10;
    L_nLeft := L_nLeft + 10;
    //obj.Text := 'TEST';
  end;
  obj.RePaint;

  for i := ImgView.Layers.Count -1 downto 0 do
    if ImgView.Layers[i] is TDesignerLayer then
      ImgView.Layers[i].Free;

  with TDesignerLayer.Create(ImgView.Layers) do
  begin
    OnMoving := DesignerMoving;
    OnButtonMoving := DesignerBtnMoving;
    OnValidateDragState := ValidateDragState;
    ChildLayer := obj;
    //obj.FillColor := $00000000;
  end;
  

end;

procedure TfmMain.DesignerMoving(Sender: TObject;
  const OldLocation: TFloatRect; var NewLocation: TFloatRect;
  DragState: integer; Shift: TShiftState);
var
  i: integer;
  loc: TFloatRect;
begin
  //move all the selected objects to their new locations ...
  for i := 0 to ImgView.Layers.Count -1 do
    if (ImgView.Layers[i] is TDesignerLayer) and (Sender <> ImgView.Layers[i]) then
      with TDesignerLayer(ImgView.Layers[i]) do
      begin
        loc := Location;
        OffsetFloatRect(loc,
          round(newLocation.Left-OldLocation.Left),
          round(newLocation.top-OldLocation.Top));
        Location := loc;
      end;
//  OI.Refresh;

end;

procedure TfmMain.DesignerBtnMoving(Sender: TObject);
begin
//
end;

procedure TfmMain.ValidateDragState(Sender: TObject;
  var dragState: integer);
var
  cnt,last: integer;
  LocationRect : TFloatRect;
begin
  //if the mouse is over an object control button, make sure only one object is
  //selected before allowing the designer to proceed with button moves ...
  CountSelected(cnt, last);
  //nb: dragState >= 0 means the mouse is over a control button ...
  if (dragState >= 0) and (cnt <> 1) then
  begin
    dragState := DRAG_MOVE;
  end;
{  if (Sender is TDesignerLayer) then
  begin
    LocationRect := TDesignerLayer(Sender).Location;
    //LocationRect := TDesignerLayer(Sender).GetAdjustedLocation;
    memo1.Lines.Add('ValidateDragState' + inttostr(L_nTestCount) + ':'
                  + inttostr(round(LocationRect.left)) + ',' + inttostr(round(LocationRect.Top)) + ','
                  + inttostr(round(LocationRect.Right)) + ',' + inttostr(round(LocationRect.Bottom)));
  end; }

end;

procedure TfmMain.CountSelected(out count, indexLast: integer);
var
  i: integer;
begin
  count := 0;
  for i := 0 to ImgView.Layers.Count -1 do
    if (ImgView.Layers[i] is TDesignerLayer) then
    begin
      inc(count);
      indexLast := TDesignerLayer(ImgView.Layers[i]).ChildLayer.Index;
    end;

end;

procedure TfmMain.btn_HotSensorAddClick(Sender: TObject);
var
  stMapAreaType : string;
  stPositionCode : string;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  tcNormalColor : TColor;
  tcAlertColor : TColor;
  stMapName : string;
  stNodeNo : string;
  stEcuID : string;
  stZoneNum : string;
begin
  fmMapSensor:= TfmMapSensor.Create(Self);
  fmMapSensor.SensorType := 5;
  fmMapSensor.SHowmodal;
  stMapAreaType := fmMapSensor.MapType;
  stBuildingCode := fmMapSensor.RealBuildingCode;
  stFloorCode := fmMapSensor.RealFloorCode;
  stAreaCode := fmMapSensor.RealAreaCode;
  tcNormalColor := fmMapSensor.NormalColor;
  tcAlertColor := fmMapSensor.AlertColor;
  stMapName := fmMapSensor.MapName;
  stNodeNo := fmMapSensor.NodeNo;
  stEcuID := fmMapSensor.EcuID;
  stZoneNum := fmMapSensor.ZoneNum;
  fmMapSensor.free;
  if stMapAreaType = '' then Exit;

end;

procedure TfmMain.ImgViewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
  procedure ClearDesigners;
  var
    i: integer;
  begin
    for i := ImgView.Layers.Count -1 downto 0 do
      if ImgView.Layers[i] is TDesignerLayer then
        ImgView.Layers[i].Free;
  end;

var
  cnt, last: integer;
begin
  if Layer is TDesignerLayer then
  begin
    if (ssCtrl in Shift) then Layer.Free;

    CountSelected(cnt, last);
{    if cnt = 1 then
    begin
      OI.SetObject(ImgView.Layers[last]);
      ePropName.Text := OI.DrawObj.ClassName;
    end else
    begin
      OI.SetObject(nil);
      ePropName.Text := '';
    end; }
    exit;
  end
  else if Layer is TDrawObjLayerBase then
  begin
    if ([ssShift, ssCtrl] * Shift = []) then ClearDesigners;
    with TDesignerLayer.Create(ImgView.Layers) do
    begin
      OnMoving := DesignerMoving;
      OnButtonMoving := DesignerBtnMoving;
      OnValidateDragState := ValidateDragState;
      ChildLayer := TDrawObjLayerBase(Layer);
    end;
    CountSelected(cnt, last);
{    if cnt = 1 then
    begin
      OI.SetObject(ImgView.Layers[last]);
      ePropName.Text := OI.DrawObj.ClassName;
    end else
    begin
      OI.SetObject(nil);
      ePropName.Text := '';
    end;  }
  end else
  begin
    ClearDesigners;
    //start selection rubber-banding ...
    SelectionRec := Rect(X,Y,X,Y);
    if (ssLeft in Shift) then DrawFocusRec(SelectionRec);
  end;
end;

procedure TfmMain.btn_SaveClick(Sender: TObject);
begin
  L_stPositionCode := '';
end;

procedure TfmMain.ImgViewMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer; Layer: TCustomLayer);
  procedure ClearDesigners;
  var
    i: integer;
  begin
    for i := ImgView.Layers.Count -1 downto 0 do
      if ImgView.Layers[i] is TDesignerLayer then
        ImgView.Layers[i].Free;
  end;
var
  cnt, last: integer;
begin
  ImgView.Hint := '';
  lb_MapName.Visible := False;
  lb_MapName.Caption := '';
  lb_MapName.Left := X + 20;
  lb_MapName.Top := Y + 20;
  imgView.PopupMenu := nil;
  if Layer is TDrawObjLayerBase then
  begin
    lb_MapName.Caption := TDrawObjLayerBase(Layer).ObjName;
    lb_MapName.Visible := True;
    Application.ProcessMessages;
  end else if Layer is TDesignerLayer then
  begin
    CountSelected(cnt, last);
    lb_MapName.Caption := TDrawObjLayerBase(ImgView.Layers[last]).ObjName;
    lb_MapName.Visible := True;
    Application.ProcessMessages;
  end;

  if not (ssLeft in Shift) or not Assigned(SelectionShape) then exit;
  SelectionRec.BottomRight := Point(X,Y);
  DrawFocusRec(NormalizeRect(SelectionRec));

end;

procedure TfmMain.ImgViewMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
var
  rec2,rec3: TRect;
  i, cnt, last: integer;
  selectionFixedRect: TFixedRect;
begin
  if not Assigned(SelectionShape) then exit;
  FreeAndNil(SelectionShape);
  with SelectionRec do if (abs(right-left) < 5) and (abs(bottom-top) < 5) then
    exit; //ie assume it's a simple form click.

  //create Designer layers for each DrawObject that resides inside
  //the selection rectangle ...
  selectionFixedRect := FixedRect(NormalizeRect(SelectionRec));
  ScreenToBitmap(ImgView.Layers, selectionFixedRect.TopLeft);
  ScreenToBitmap(ImgView.Layers, selectionFixedRect.BottomRight);
  rec2 := MakeRect(selectionFixedRect);
  for i := 0 to ImgView.Layers.Count -1 do
    if (ImgView.Layers[i] is TDrawObjLayerBase) then
    begin
      rec3 := MakeRect(TDrawObjLayerBase(ImgView.Layers[i]).Location);
      if IntersectRect(rec3, rec2, rec3) then
        with TDesignerLayer.Create(ImgView.Layers) do
        begin
          OnMoving := DesignerMoving;
          OnButtonMoving := DesignerBtnMoving;
          OnValidateDragState := ValidateDragState;
          ChildLayer := TDrawObjLayerBase(ImgView.Layers[i]);
        end;
    end;
end;

procedure TfmMain.DrawFocusRec(Rec: TRect);
begin
  if not Assigned(SelectionShape) then
  begin
    //simple selection 'rubber-banding' ...
    SelectionShape := TShape.create(self);
    SelectionShape.Parent := ImgView;
    SelectionShape.Brush.Style := bsClear;
    SelectionShape.Pen.Style := psDot;
  end;
  with Rec do
    SelectionShape.SetBounds(left,top,right-left, bottom-top);

end;

procedure TfmMain.btn_etcSensorAddClick(Sender: TObject);
begin
  fmMapSensor:= TfmMapSensor.Create(Self);
  fmMapSensor.SensorType := 6;
  fmMapSensor.SHowmodal;
  fmMapSensor.free;
end;

end.
