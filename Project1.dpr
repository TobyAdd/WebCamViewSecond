program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Direct3D9 in 'Include\Direct3D9.pas',
  DirectDraw in 'Include\DirectDraw.pas',
  DirectShow9 in 'Include\DirectShow9.pas',
  DirectSound in 'Include\DirectSound.pas',
  DXTypes in 'Include\DXTypes.pas',
  UGDIPlus in 'Include\UGDIPlus.pas',
  VFrames in 'Include\VFrames.pas',
  VSample in 'Include\VSample.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
