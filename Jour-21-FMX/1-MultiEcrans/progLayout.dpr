program progLayout;

uses
  System.StartUpCopy,
  FMX.Forms,
  l1 in 'l1.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
