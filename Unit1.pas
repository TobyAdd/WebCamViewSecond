unit Unit1;

interface

uses
  Windows, SysUtils, Classes, Forms, DateUtils, Controls, StdCtrls, ExtCtrls, ComCtrls,
  VFrames, Buttons;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    shp1: TShape;
    btn1: TSpeedButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    cbb1: TComboBox;
    trckbr1: TTrackBar;
    btn2: TButton;
    img1: TImage;
    chk1: TCheckBox;
    lbl4: TLabel;
    tmrGetKey: TTimer;
    procedure OnNewVideoFrame(Sender: TObject; Width, Height: integer; DataPtr: Pointer);
    procedure shp1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure shp1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure shp1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmrGetKeyTimer(Sender: TObject);
    procedure lbl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbl1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn1Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure trckbr1Change(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
      FMouseDownPos, FLastPosition :TPoint;
      FDragEnabled:Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Video: TVideoImage;
  TimeSaved: TDateTime;
  FPS: Integer = 0;

implementation

{$R *.dfm}



procedure TForm1.shp1MouseMove(Sender: TObject; Shift: TShiftState; X,  Y: Integer);
begin
  if FDragEnabled then  begin
    pnl1.Left := pnl1.Left + (X - FMouseDownPos.X);
    pnl1.Top := pnl1.Top + (Y - FMouseDownPos.Y);
  end;
end;

procedure TForm1.shp1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMouseDownPos.X := X;
  FMouseDownPos.Y := Y;
  FDragEnabled := True;
end;

procedure TForm1.shp1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
FDragEnabled := false;
end;

procedure TForm1.tmrGetKeyTimer(Sender: TObject);
begin
if pnl1.Visible = False then
   if GetAsyncKeyState(VK_TAB) <> 0 then
   begin
    pnl1.Visible := True;
    lbl4.visible := false;
   end
end;


procedure TForm1.lbl1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     FMouseDownPos.X := X;
  FMouseDownPos.Y := Y;
  FDragEnabled := True;
end;

procedure TForm1.lbl1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if FDragEnabled then  begin
    pnl1.Left := pnl1.Left + (X - FMouseDownPos.X);
    pnl1.Top := pnl1.Top + (Y - FMouseDownPos.Y);
  end;
end;

procedure TForm1.lbl1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   FDragEnabled := false;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
pnl1.Visible := false;
end;

procedure TForm1.chk1Click(Sender: TObject);
begin
  if chk1.Checked = True then
begin
 FormStyle := fsStayOnTop
 end
 else
 begin
   FormStyle := fsNormal
 end;
end;


procedure TForm1.FormShow(Sender: TObject);
var
  StringList: TStringList;
  i: Integer;
begin
  TimeSaved := Now;
  StringList := TStringList.Create;
  Video := TVideoImage.Create;

  Video.OnNewVideoFrame := OnNewVideoFrame;
  Video.GetListOfDevices(StringList);

  for i := 0 to StringList.Count-1 do cbb1.items.Add(StringList.Strings[i]);
  cbb1.ItemIndex := 0;
end;

procedure TForm1.OnNewVideoFrame(Sender: TObject; Width, Height: integer; DataPtr: Pointer);
begin
  if MilliSecondsBetween(TimeSaved, Now) >= FPS then begin;
    TimeSaved := Now;
    Video.GetBitmap(img1.Picture.Bitmap);
  end;
end;


procedure TForm1.trckbr1Change(Sender: TObject);
begin
  FPS := Round(1000/trckbr1.Position);
  if trckbr1.Position = trckbr1.Max then FPS := 0;
  lbl3.Caption := 'FPS: ' + IntToStr(trckbr1.Position);
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  if btn2.Caption = 'Start' then begin
     cbb1.Enabled := False;
     Video.VideoStart(cbb1.Items[cbb1.ItemIndex]);
     btn2.Caption := 'Stop';
     chk1.Enabled := False;
  end else begin
     Video.VideoStop;
     cbb1.Enabled := True;
     btn2.Caption := 'Start';
     chk1.Enabled := True;
  end;
  
end;

end.
