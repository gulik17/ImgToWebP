object SettingForm: TSettingForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'SettingForm'
  ClientHeight = 160
  ClientWidth = 470
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 114
    Width = 470
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 378
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 470
    Height = 114
    ActivePage = tsWebp
    Align = alClient
    TabOrder = 1
    object tsWebp: TTabSheet
      Caption = 'WebP'
      object Label1: TLabel
        Left = 16
        Top = 22
        Width = 41
        Height = 15
        Caption = 'Quality:'
      end
      object tbWebpQuality: TTrackBar
        Left = 63
        Top = 22
        Width = 346
        Height = 35
        Max = 100
        Position = 90
        TabOrder = 0
        OnChange = tbWebpQualityChange
      end
      object eQuality: TEdit
        Left = 415
        Top = 19
        Width = 34
        Height = 21
        TabOrder = 1
        Text = '90'
      end
    end
    object tsJpeg: TTabSheet
      Caption = 'JPEG'
      ImageIndex = 1
      TabVisible = False
    end
    object tsPng: TTabSheet
      Caption = 'PNG'
      ImageIndex = 2
      TabVisible = False
    end
  end
end
