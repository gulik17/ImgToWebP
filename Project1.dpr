program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {MainForm},
  Unit2 in 'Unit2.pas' {AboutForm},
  libwebp in 'libwebp.pas',
  WebpHelpers in 'WebpHelpers.pas',
  Vcl.WebpImage in '..\..\src\Vcl.WebpImage.pas',
  Unit3 in 'Unit3.pas' {SettingForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TSettingForm, SettingForm);
  Application.Run;
end.
