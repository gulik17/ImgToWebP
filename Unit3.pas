unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TSettingForm = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    tsWebp: TTabSheet;
    tsJpeg: TTabSheet;
    tsPng: TTabSheet;
    Button1: TButton;
    tbWebpQuality: TTrackBar;
    Label1: TLabel;
    eQuality: TEdit;
    procedure tbWebpQualityChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingForm: TSettingForm;

implementation

{$R *.dfm}

procedure TSettingForm.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TSettingForm.tbWebpQualityChange(Sender: TObject);
begin
  eQuality.Text := IntToStr(tbWebpQuality.Position);
end;

end.
