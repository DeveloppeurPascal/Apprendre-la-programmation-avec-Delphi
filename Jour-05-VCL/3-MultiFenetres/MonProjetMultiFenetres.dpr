program MonProjetMultiFenetres;

uses
  Vcl.Forms,
  UForm1 in 'UForm1.pas' {Form1},
  uForm2 in 'uForm2.pas' {Form2},
  uForm3 in 'uForm3.pas' {Form3},
  Unit4 in 'Unit4.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
