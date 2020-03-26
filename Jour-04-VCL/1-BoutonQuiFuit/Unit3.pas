unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Button1: TButton;
    procedure Button1MouseEnter(Sender: TObject);
    procedure Button1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1MouseEnter(Sender: TObject);
begin
  Button1.Left := random(clientwidth - Button1.width);
  Button1.Top := random(clientheight - Button1.height);
end;

procedure TForm3.Button1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Button1MouseEnter(Sender);
end;

end.
