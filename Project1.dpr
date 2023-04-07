program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {MainForm},
  Unit2 in 'Unit2.pas' {AboutForm},
  libwebp in 'libwebp.pas',
  WebpHelpers in 'WebpHelpers.pas',
  Unit3 in 'Unit3.pas' {SettingForm},
  Vcl.Themes,
  Vcl.Styles,
  Vcl.WebpImage in 'Vcl.WebpImage.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TSettingForm, SettingForm);
  Application.Run;
end.
