program Project1;

uses
  Vcl.Forms,
  fprincipale in 'fprincipale.pas' {Form1},
  uDM in 'uDM.pas' {DataModule2: TDataModule},
  flivres in 'flivres.pas' {frmLivres},
  fediteurs in 'fediteurs.pas' {frmEditeurs},
  fauteurs in 'fauteurs.pas' {frmAuteurs},
  fAuteursDUnLivre in 'fAuteursDUnLivre.pas' {frmAuteursDUnLivre};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TfrmLivres, frmLivres);
  Application.CreateForm(TfrmEditeurs, frmEditeurs);
  Application.CreateForm(TfrmAuteurs, frmAuteurs);
  Application.CreateForm(TfrmAuteursDUnLivre, frmAuteursDUnLivre);
  Application.Run;
end.
