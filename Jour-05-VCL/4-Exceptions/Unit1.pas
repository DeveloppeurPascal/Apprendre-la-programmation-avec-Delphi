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
var
  i: single;
  j: integer;
  k: integer;
begin
  i := 12.5;
  j := 34;
  j := j div 5;
  i := j / 45;
  k := 0;
  try
    try
      j := 54 div k;
    finally
      ShowMessage('youhou');
    end;
  except
    ShowMessage('oups');
  end;
  raise Exception.Create('J''ai bugué');
end;

end.
