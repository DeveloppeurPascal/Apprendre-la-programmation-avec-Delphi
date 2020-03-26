program HelloWorld;

uses
  Vcl.Forms,
  fPrincipale in 'fPrincipale.pas' {frmPrincipale};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipale, frmPrincipale);
  Application.Run;
end.
