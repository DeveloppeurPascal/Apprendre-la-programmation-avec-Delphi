program DelphiBootcampGestionContactsFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  fPrincipale in 'fPrincipale.pas' {frmPrincipale},
  uDM in 'uDM.pas' {dm: TDataModule},
  u_urlOpen in 'u_urlOpen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipale, frmPrincipale);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
