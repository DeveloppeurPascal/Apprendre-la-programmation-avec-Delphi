(* C2PP
  ***************************************************************************

  Apprendre la programmation avec Delphi

  Copyright 2020-2025 Patrick Prémartin under MIT license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Projets Delphi d'exemples développés pendant la formation en ligne gratuite pour apprendre à programmer en utilisant le langage Pascal dans Delphi réalisée en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial lié à la pandémie du virus COVID-19.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://apprendre-delphi.fr

  Project site :
  https://github.com/DeveloppeurPascal/Apprendre-la-programmation-avec-Delphi

  ***************************************************************************
  File last update : 2025-10-05T16:42:28.118+02:00
  Signature : 1879341a4f5a467eb4cd7c00879e6532638a4e10
  ***************************************************************************
*)

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
