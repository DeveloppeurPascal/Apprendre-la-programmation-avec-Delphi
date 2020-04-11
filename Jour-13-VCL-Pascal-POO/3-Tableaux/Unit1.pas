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

procedure TForm1.Button1Click(Sender: TObject);
type
  ttab1 = array [1 .. 10] of integer;
  ttab2 = array [0 .. 9] of ttab1;
  ttab3 = array [0 .. 9, 1 .. 10] of integer;
  ttab4 = array of string;
var
  Tab1: ttab1;
  Tab2: ttab2;
  Tab3: ttab3;
  Tab4: ttab4;
  i, j: integer;
begin
  for i := 1 to 10 do
    Tab1[i] := i;
  for i := 0 to 9 do
    for j := 1 to 10 do
      Tab2[i][j] := i * j;
  for i := 0 to 9 do
    for j := 1 to 10 do
      Tab3[i, j] := i * j;
  setLength(Tab4, 10);
  for i := 0 to 9 do
    Tab4[i] := i.ToString;
  setLength(Tab4, 15);
  for i := 10 to 14 do
    Tab4[i] := i.ToString;
end;

end.
