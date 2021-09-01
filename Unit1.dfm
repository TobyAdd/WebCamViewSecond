object Form1: TForm1
  Left = 240
  Top = 142
  Width = 370
  Height = 248
  Caption = 'WebCamView'
  Color = 4210752
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    354
    210)
  PixelsPerInch = 96
  TextHeight = 13
  object img1: TImage
    Left = 0
    Top = 0
    Width = 353
    Height = 209
    Anchors = [akLeft, akTop, akRight, akBottom]
    Stretch = True
  end
  object lbl4: TLabel
    Left = 0
    Top = 0
    Width = 353
    Height = 209
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Caption = 'Press tab to open settings'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object pnl1: TPanel
    Left = 8
    Top = 8
    Width = 265
    Height = 169
    Color = 6118749
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = False
    object shp1: TShape
      Left = 0
      Top = 0
      Width = 265
      Height = 23
      Brush.Color = 6118749
      Pen.Color = clWhite
      OnMouseDown = shp1MouseDown
      OnMouseMove = shp1MouseMove
      OnMouseUp = shp1MouseUp
    end
    object btn1: TSpeedButton
      Left = 242
      Top = 0
      Width = 23
      Height = 22
      Caption = 'X'
      Flat = True
      OnClick = btn1Click
    end
    object lbl1: TLabel
      Left = 4
      Top = 5
      Width = 134
      Height = 13
      Caption = 'WebCamView (by TobyAdd)'
      OnMouseDown = lbl1MouseDown
      OnMouseMove = lbl1MouseMove
      OnMouseUp = lbl1MouseUp
    end
    object lbl2: TLabel
      Left = 8
      Top = 24
      Width = 47
      Height = 13
      Caption = 'WebCam:'
    end
    object lbl3: TLabel
      Left = 8
      Top = 64
      Width = 37
      Height = 13
      Caption = 'FPS: 60'
    end
    object cbb1: TComboBox
      Left = 8
      Top = 40
      Width = 249
      Height = 21
      Color = 6118749
      ItemHeight = 13
      TabOrder = 0
    end
    object trckbr1: TTrackBar
      Left = 8
      Top = 80
      Width = 249
      Height = 25
      Max = 60
      Min = 1
      PageSize = 1
      Position = 60
      TabOrder = 1
      TickStyle = tsNone
      OnChange = trckbr1Change
    end
    object btn2: TButton
      Left = 8
      Top = 112
      Width = 249
      Height = 25
      Caption = 'Start'
      TabOrder = 2
      OnClick = btn2Click
    end
    object chk1: TCheckBox
      Left = 8
      Top = 144
      Width = 97
      Height = 17
      Caption = 'TopMost'
      TabOrder = 3
      OnClick = chk1Click
    end
  end
  object tmrGetKey: TTimer
    Interval = 1
    OnTimer = tmrGetKeyTimer
    Left = 312
    Top = 8
  end
end
