unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uFunc, uProc;

procedure TForm1.Button1Click(Sender: TObject);
begin
  showmessage(FuncMath(StrToInt(Edit1.Text)).ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  nb, i, res: integer;
begin
  nb := StrToInt(Edit1.Text);
  res := 0;
  for i := 0 to nb do
    res := res + i;
  showmessage(res.ToString);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  res: integer;
begin
  Calcule(StrToInt(Edit1.Text), res);
  showmessage(res.ToString);
end;

end.
