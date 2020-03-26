unit fPrincipale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipale = class(TForm)
    MonBouton: TButton;
    procedure MonBoutonClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmPrincipale: TfrmPrincipale;

implementation

{$R *.dfm}

procedure TfrmPrincipale.MonBoutonClick(Sender: TObject);
begin
ShowMessage('Hello world');
end;

end.
