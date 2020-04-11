unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Unit5;

type
  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    CadreDeGauche: TFrame5;
    CadreDeDroite: TFrame5;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  showmessage(CadreDeGauche.Label1.Caption);
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  showmessage(CadreDeDroite.Label1.Caption);
end;

end.
