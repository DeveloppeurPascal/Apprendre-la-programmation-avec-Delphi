program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit5 in '..\..\Jour-13-VCL-Pascal-POO\1-Cadres-VCL\Unit5.pas' {Frame5: TFrame},
  Unit2 in 'Unit2.pas' {Frame2: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
