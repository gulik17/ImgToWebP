unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, libwebp, WebpHelpers, Winapi.GDIPAPI, Winapi.GDIPOBJ, Math, Vcl.WebpImage, IOUtils,
  Vcl.ComCtrls;

type
  TMainForm = class(TForm)
    lbIn: TListBox;
    Panel2: TPanel;
    Panel3: TPanel;
    lbOut: TListBox;
    Panel1: TPanel;
    bAdd: TButton;
    bAddAll: TButton;
    bRemove: TButton;
    bClear: TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    About1: TMenuItem;
    Button5: TButton;
    ImageList1: TImageList;
    ProgressBar1: TProgressBar;
    Button6: TButton;
    cbSettings: TComboBox;
    Button1: TButton;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Splitter1: TSplitter;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bAddClick(Sender: TObject);
    procedure bClearClick(Sender: TObject);
    procedure bRemoveClick(Sender: TObject);
    procedure bAddAllClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses Unit2, Unit3;

procedure LoadFileList(aFiles: TStrings; sPath: string; sMask: string = '*.*');
  var
    aFile, str: string;
begin
  aFiles.Clear;
  for aFile in TDirectory.GetFiles(IncludeTrailingPathDelimiter(sPath), sMask) do begin
    str := aFile;
    Delete(str, 1, 3);
    aFiles.Add(str);
  end;
end;

procedure TMainForm.About1Click(Sender: TObject);
begin
  AboutForm.ShowModal;
end;

procedure TMainForm.bAddClick(Sender: TObject);
  var
    str: string;
    i: Integer;
begin
  str := lbIn.Items[lbIn.ItemIndex];
  for i:= 0 to lbOut.Items.Count - 1 do begin
    if str = lbOut.Items[i] then begin
      Exit;
    end;
  end;
  lbOut.Items.Add(str);
end;

procedure TMainForm.bAddAllClick(Sender: TObject);
  var
    str: string;
    i: Integer;
begin
  lbOut.Items.Clear;
  for i:= 0 to lbIn.Items.Count - 1 do begin
    str := lbIn.Items[i];
    lbOut.Items.Add(str);
  end;
end;

procedure TMainForm.bRemoveClick(Sender: TObject);
begin
  lbOut.Items.Delete(lbOut.ItemIndex);
end;

procedure TMainForm.bClearClick(Sender: TObject);
begin
  lbOut.Items.Clear;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  LoadFileList(lbIn.Items, 'in');
end;

procedure TMainForm.Button5Click(Sender: TObject);
  var
    stream: TMemoryStream;
    fs : TFileStream;
    bmp : TGPBitmap;
    dat : PByte;
    str, fileName: string;
    i: Integer;
begin
  if lbOut.Items.Count < 0 then begin
    Exit;
  end;
  Button5.Enabled := False;
  ProgressBar1.Position := 0;
  ProgressBar1.Max := lbOut.Items.Count;
  for i:= 0 to lbOut.Items.Count - 1 do begin
    Application.ProcessMessages();
    str := 'in\'+lbOut.Items[i];
    if CheckBox1.Checked then begin
      fileName := IntToStr(i);
    end
    else begin
      fileName := Copy(lbOut.Items[i], 1, Length(lbOut.Items[i]) - Length(ExtractFileExt(lbOut.Items[i])));
    end;
    if cbSettings.Text = 'webp' then begin
      stream := TMemoryStream.Create;
      bmp := TGPBitmap.Create(str);
      WebpEncode(stream, bmp, SettingForm.tbWebpQuality.Position);
      stream.SaveToFile('out\'+ fileName +'.webp');
      bmp.Free;
      stream.Free;
    end;
    if cbSettings.Text = 'jpeg' then begin
      fs := TFileStream.Create(str, fmOpenRead);
      WebpDecode(fs, dat, bmp);
      bmp.Save('out\'+ fileName +'.jpeg', gPJG);
      bmp.Free;
      fs.Free;
      WebPFree(dat);
    end;
    ProgressBar1.Position := i + 1;
  end;
  Button5.Enabled := True;
end;

procedure TMainForm.Button6Click(Sender: TObject);
begin
  SettingForm.tsWebp.TabVisible := False;
  SettingForm.tsJpeg.TabVisible := False;
  SettingForm.tsPng.TabVisible := False;
  if cbSettings.Text = 'webp' then begin
    SettingForm.tsWebp.TabVisible := True;
  end;
  if cbSettings.Text = 'jpeg' then begin
    SettingForm.tsJpeg.TabVisible := True;
  end;
  if cbSettings.Text = 'png' then begin
    SettingForm.tsPng.TabVisible := True;
  end;

  SettingForm.ShowModal;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  LoadFileList(lbIn.Items, 'in');
end;

end.
