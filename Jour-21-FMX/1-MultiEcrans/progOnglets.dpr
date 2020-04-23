program progOnglets;

uses
  System.StartUpCopy,
  FMX.Forms,
  o1 in 'o1.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
