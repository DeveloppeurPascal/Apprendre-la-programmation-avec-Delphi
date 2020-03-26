unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    VersLeHaut: TButton;
    VersLaDroite: TButton;
    VersLaGauche: TButton;
    VersLeBas: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    procedure VersLeHautClick(Sender: TObject);
    procedure VersLeBasClick(Sender: TObject);
    procedure VersLaGaucheClick(Sender: TObject);
    procedure VersLaDroiteClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.VersLeHautClick(Sender: TObject);
begin
  if Label1.Top >= 10 then
    Label1.Top := Label1.Top - 10;
end;

procedure TForm1.VersLaDroiteClick(Sender: TObject);
begin
  if Label1.Left + Label1.Width < Panel1.ClientWidth-10 then
    Label1.Left := Label1.Left + 10;
end;

procedure TForm1.VersLaGaucheClick(Sender: TObject);
begin
  if Label1.Left >= 10 then
    Label1.Left := Label1.Left - 10;
end;

procedure TForm1.VersLeBasClick(Sender: TObject);
begin
  if Label1.Top + Label1.Height < Panel1.ClientHeight-10 then
    Label1.Top := Label1.Top + 10;
end;

end.
