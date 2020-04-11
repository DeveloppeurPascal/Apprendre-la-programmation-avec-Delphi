unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrame5 = class(TFrame)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}

uses Unit3;

procedure TFrame5.Button1Click(Sender: TObject);
begin
  Label1.Caption := Edit1.Text;
  Edit1.SetFocus;
  if assigned(parent) and (parent is tform3) then
    (parent as tform3).Button1.Caption := Edit1.Text;
end;

end.
