program progFiches;

uses
  System.StartUpCopy,
  FMX.Forms,
  f1 in 'f1.pas' {Form1},
  f2 in 'f2.pas' {Form2},
  f3 in 'f3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
