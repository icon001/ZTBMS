program DongyangRelay;

uses
  Forms,
  Unit1 in 'Unit1.pas' {fmMain},
  uGroupCode in 'uGroupCode.pas' {fmGroupCode},
  uSubForm in '..\..\..\Lib\uSubForm.pas' {fmASubForm},
  uGroupGrade in 'uGroupGrade.pas' {fmGroupGrade},
  uMapping in 'uMapping.pas' {fmMapping};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmGroupCode, fmGroupCode);
  Application.CreateForm(TfmASubForm, fmASubForm);
  Application.CreateForm(TfmGroupGrade, fmGroupGrade);
  Application.CreateForm(TfmMapping, fmMapping);
  Application.Run;
end.
