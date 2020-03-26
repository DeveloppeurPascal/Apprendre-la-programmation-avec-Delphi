unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
    ValeurATrouver: integer;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ValeurATrouver := random(100);
  // showmessage(ValeurATrouver.ToString);
  // showmessage(InttoStr(ValeurATrouver));
  PageControl1.ActivePage := TabSheet2;
  Edit1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  ValeurSaisie: integer;
  // ch: string;
begin
  // ch := Edit1.Text;
  // ValeurSaisie := ch.toInteger;
  ValeurSaisie := StrToInt(Edit1.Text);
  if ValeurSaisie = ValeurATrouver then
  begin
    showmessage('bravo');
    PageControl1.ActivePage := TabSheet1;
  end
  else
  begin
    showmessage('loupé');
    Edit1.SetFocus;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  Edit1.Text := '0';
end;

end.
