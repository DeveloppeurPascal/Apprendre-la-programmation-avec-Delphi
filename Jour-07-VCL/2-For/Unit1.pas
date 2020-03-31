unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
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
var
  i: integer;
begin
  for i := StrToInt(Edit1.Text) downto 1 do
    Memo1.Lines.insert(0, 'Valeur = ' + i.ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i: integer;
begin
  for i := 1 to StrToInt(Edit1.Text) do
    Memo1.Lines.insert(0, 'Valeur = ' + i.ToString);
end;

end.
