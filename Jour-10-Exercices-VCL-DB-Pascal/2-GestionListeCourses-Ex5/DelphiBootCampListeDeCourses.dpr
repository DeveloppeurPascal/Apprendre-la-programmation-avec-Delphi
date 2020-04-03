program DelphiBootCampListeDeCourses;

uses
  Vcl.Forms,
  fPrincipale in 'fPrincipale.pas' {frmPrincipale},
  uDM in 'uDM.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipale, frmPrincipale);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
