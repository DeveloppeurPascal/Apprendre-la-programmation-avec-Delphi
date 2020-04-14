unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
    FVariablePriveeDeLaClasseAccessiblePourChaqueInstance: integer;
  protected
    FVariableProtegeeAccessibleDansLesInstancesDeLaClasseEtLesSourcesDeCetteUnite
      : integer;
  public
    { Déclarations publiques }
    FVariablePubliqueAccessiblePartoutSurUneInstanceDeLaClasse: integer;
  end;

var
  Form1: TForm1;
  VariableGlobaleDesUnitersUtilisantCelleCi: integer;

implementation

{$R *.dfm}

var
  VariableGlobalDeLUnite: integer;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 1 to 10 do
  begin
  end;

  for var j: integer := 1 to 10 do // Delphi 10.3 Rio et suivants !!!
  begin
  end;

  for var j := 1 to 10 do // Delphi 10.3 Rio et suivants !!!
  begin
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  VariableLocale: integer;
begin
  ShowMessage('coucou');
  ShowMessage('coucou');
  var // Delphi 10.3 Rio et suivant uniquement !!!
    VariableEnLigneAccessibleAPartirDIci: integer;
  ShowMessage('coucou');
  begin
    var
      i: integer;
  end;
  // var
  // i: integer;
  // ShowMessage(i.Tostring);
  ShowMessage('coucou');
  begin
    var
      i: integer;
  end;
end;

end.
