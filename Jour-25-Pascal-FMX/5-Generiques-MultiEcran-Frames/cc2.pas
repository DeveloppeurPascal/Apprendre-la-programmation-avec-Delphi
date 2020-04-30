unit cc2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFrame2 = class(TFrame)
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    EcranPrecedent:integer;
  end;

implementation

{$R *.fmx}

uses cf1;

procedure TFrame2.Button1Click(Sender: TObject);
begin
  if (parent is TForm5) then
    (parent as TForm5).AfficheEcran(EcranPrecedent)
  else
    ShowMessage('Parent non reconnu, changement d''�cran non g�r�');
end;

end.
