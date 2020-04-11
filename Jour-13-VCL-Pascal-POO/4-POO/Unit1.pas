unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.Button1Click(Sender: TObject);
var
  c: TMaClasse2;
begin
  c := TMaClasse2.Create;
  try
    c.MaClasseProc;
    c.MaClasse2Proc;
    if c is TMaClasse2 then
      (c as TMaClasse2).MaClasse2Proc;
    if Sender is TButton then
      (Sender as TButton).OnClick(self);
  finally
    c.Free;
  end;
end;

end.
