program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  IconFontsImageList in '..\..\..\..\..\..\..\Downloads\IconFontsImageList-master\IconFontsImageList-master\Source\IconFontsImageList.pas',
  IconFontsUtils in '..\..\..\..\..\..\..\Downloads\IconFontsImageList-master\IconFontsImageList-master\Source\IconFontsUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
