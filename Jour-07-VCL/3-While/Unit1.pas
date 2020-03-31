unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
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
  i := 0;
  while (SpeedButton1.Down) and (i < 500) do
  begin
    Memo1.Lines.Insert(0, 'on ' + i.tostring);
    inc(i);

    // traite la file d'attente d'événements de Delphi
    Application.ProcessMessages;
    // à éviter dans vos programmes !
  end;
  if not(SpeedButton1.Down) then
    Memo1.Lines.Insert(0, 'off')
end;

end.
