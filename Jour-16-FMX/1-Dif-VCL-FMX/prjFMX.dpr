program prjFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  fFXM in 'fFXM.pas' {frmFMX};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFMX, frmFMX);
  Application.Run;
end.
