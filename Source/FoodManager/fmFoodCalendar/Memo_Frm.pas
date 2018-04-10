unit Memo_Frm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls;

type
  TMemo_Form = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure LoadConfig;
    procedure SaveConfig;
  public
  end;

implementation

uses
  DayTexts, Registry;

{$R *.dfm}

procedure TMemo_Form.LoadConfig;
begin
  with TRegIniFile.Create do
   try
     if OpenKey( 'SOFTWARE\BKCalendar\', True ) then
      begin
        WindowState := TWindowState( ReadInteger( 'Window', 'State', Ord( wsNormal ) ) );
        SetBounds( ReadInteger( 'Memo', 'Left', Left ),
                   ReadInteger( 'Memo', 'Top', Top ),
                   ReadInteger( 'Memo', 'Width', Width ),
                   ReadInteger( 'Memo', 'Height', Height ) );
      end;
   finally
     Free;
   end;
end;

procedure TMemo_Form.SaveConfig;
begin
  with TRegIniFile.Create do
   try
     if OpenKey( 'SOFTWARE\BKCalendar\', True ) then
      begin
        WriteInteger( 'Memo', 'State', Ord( WindowState ) );
        if WindowState = wsNormal then
         begin
           WriteInteger( 'Memo', 'Left', Left );
           WriteInteger( 'Memo', 'Top', Top );
           WriteInteger( 'Memo', 'Width', Width );
           WriteInteger( 'Memo', 'Height', Height );
         end;
      end;
   finally
     Free;
   end;
end;

procedure TMemo_Form.FormCreate(Sender: TObject);
begin
  LoadConfig;
end;

procedure TMemo_Form.FormDestroy(Sender: TObject);
begin
  SaveConfig;
end;

procedure TMemo_Form.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_ESCAPE: begin
               Close;
             end;
  end;
end;

procedure TMemo_Form.MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin
               if ssAlt in Shift then
                begin
                  Key := 0;
                  Close;
                end;
             end;
  end;
end;

end.
