program DelphiBootCampJeuDuPendu;

uses
  System.StartUpCopy,
  FMX.Forms,
  fJeu in 'fJeu.pas' {frmJeu},
  cDessinPendu in 'cDessinPendu.pas' {DessinPendu: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmJeu, frmJeu);
  Application.Run;
end.
