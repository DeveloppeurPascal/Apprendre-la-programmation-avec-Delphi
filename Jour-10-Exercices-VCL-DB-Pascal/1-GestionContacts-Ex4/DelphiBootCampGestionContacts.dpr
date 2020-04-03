program DelphiBootCampGestionContacts;

uses
  Vcl.Forms,
  fPrincipale in 'fPrincipale.pas' {frmPrincipale},
  fAjouter in 'fAjouter.pas' {frmAjouter},
  fModifier in 'fModifier.pas' {frmModifier},
  fSupprimer in 'fSupprimer.pas' {frmSupprimer},
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipale, frmPrincipale);
  Application.CreateForm(TfrmAjouter, frmAjouter);
  Application.CreateForm(TfrmModifier, frmModifier);
  Application.CreateForm(TfrmSupprimer, frmSupprimer);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
