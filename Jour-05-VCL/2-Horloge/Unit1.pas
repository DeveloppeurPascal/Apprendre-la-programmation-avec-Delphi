unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Button1: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
begin
  if Timer1.Enabled then
  begin
    Timer1.Enabled := false;
    Button1.Caption := 'Lancer';
  end
  else
  begin
    Timer1.Enabled := true;
    Button1.Caption := 'Stop';
  end;

//  if Timer1.Enabled then
//    Button1.Caption := 'Lancer'
//  else
//    Button1.Caption := 'Stop';
//  Timer1.Enabled := not Timer1.Enabled;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if Timer1.Enabled then
    Button1.Caption := 'Stop'
  else
    Button1.Caption := 'Lancer';
  // if Timer1.Enabled then
  // Button1.Caption := 'Stop';
  // if not Timer1.Enabled then
  // Button1.Caption := 'Lancer';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Label1.Caption := TimeToStr(Now);
end;

end.
