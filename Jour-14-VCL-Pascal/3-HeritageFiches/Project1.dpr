program Project1;

uses
  Vcl.Forms,
  ABOUT in 'ABOUT.pas' {AboutBox},
  Unit2 in 'Unit2.pas' {OKHelpBottomDlg2},
  OKCNHLP1 in 'c:\program files (x86)\embarcadero\studio\20.0\ObjRepos\FR\DelphiWin32\OKCNHLP1.PAS' {OKHelpBottomDlg},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit1 in 'Unit1.pas' {Form1},
  Unit5 in 'Unit5.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TOKHelpBottomDlg2, OKHelpBottomDlg2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
