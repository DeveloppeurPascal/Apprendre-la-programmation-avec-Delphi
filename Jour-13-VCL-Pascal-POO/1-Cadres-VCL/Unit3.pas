unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit5;

type
  TForm3 = class(TForm)
    Button1: TButton;
    MonCadre: TFrame5;
    procedure Button1Click(Sender: TObject);
    procedure TFrame51Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit4;

procedure TForm3.Button1Click(Sender: TObject);
begin
  form4.ShowModal;
end;

procedure TForm3.TFrame51Button1Click(Sender: TObject);
begin
  MonCadre.Button1Click(Sender);
  ShowMessage('coucou');
end;

end.
