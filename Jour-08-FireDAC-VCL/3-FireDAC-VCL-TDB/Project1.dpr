program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in '..\1-FireDACBases\Unit2.pas' {DataModule2: TDataModule},
  flivres in 'flivres.pas' {frmLivres},
  fediteurs in 'fediteurs.pas' {frmEditeurs},
  fauteurs in 'fauteurs.pas' {frmAuteurs};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TfrmLivres, frmLivres);
  Application.CreateForm(TfrmEditeurs, frmEditeurs);
  Application.CreateForm(TfrmAuteurs, frmAuteurs);
  Application.Run;
end.
