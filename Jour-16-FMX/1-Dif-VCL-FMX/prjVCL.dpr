program prjVCL;

uses
  Vcl.Forms,
  fVCL in 'fVCL.pas' {frmVCL};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmVCL, frmVCL);
  Application.Run;
end.
