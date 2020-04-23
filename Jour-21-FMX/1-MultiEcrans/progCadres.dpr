program progCadres;

uses
  System.StartUpCopy,
  FMX.Forms,
  cf1 in 'cf1.pas' {Form5},
  cc3 in 'cc3.pas' {Frame1: TFrame},
  cc2 in 'cc2.pas' {Frame2: TFrame},
  cc1 in 'cc1.pas' {Frame3: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
