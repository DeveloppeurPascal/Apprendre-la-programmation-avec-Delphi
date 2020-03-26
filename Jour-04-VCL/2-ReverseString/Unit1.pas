unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
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

uses System.uitypes;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if ord(key) = vkback then
    Label1.Caption := copy(Label1.Caption, 2)
  else if ((Key >= 'a') and (Key <= 'z')) or (Key in ['A' .. 'Z', '0' .. '9'])
  then
    Label1.Caption := Key + Label1.Caption;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Label1.Caption := '';
end;

end.
