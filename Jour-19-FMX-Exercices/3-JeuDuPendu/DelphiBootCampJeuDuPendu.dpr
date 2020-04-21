program DelphiBootCampJeuDuPendu;

uses
  System.StartUpCopy,
  FMX.Forms,
  fJeu in 'fJeu.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
