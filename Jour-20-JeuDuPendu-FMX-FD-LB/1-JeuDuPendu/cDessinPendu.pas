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
  File last update : 2025-10-05T16:42:28.295+02:00
  Signature : ef19025bf3bcdbd11eef17569340fafc4018367e
  ***************************************************************************
*)

unit cDessinPendu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects;

type
  TDessinPendu = class(TFrame)
    elem01: TRectangle;
    elem02: TRectangle;
    elem03: TRectangle;
    elem04: TLine;
    elem05: TCircle;
    elem06: TRectangle;
    elem07: TRectangle;
    elem10: TRectangle;
    elem11: TRectangle;
    elem09: TRectangle;
    elem08: TRectangle;
  private
    { Déclarations privées }
    NombreMorceauxRestants: integer;
  public
    { Déclarations publiques }
    procedure MasqueLeDessin;
    procedure AfficheUnMembre;
    function isPartiePerdue: boolean;
  end;

implementation

{$R *.fmx}
{ TDessinPendu }

procedure TDessinPendu.AfficheUnMembre;
var
  i: integer;
  num: integer;
  sortir: boolean;
begin
  dec(NombreMorceauxRestants);
  // version IF manuelle (pas souple en terme d'évolutions)
  if not elem01.Visible then
    elem01.Visible := true
  else if not elem02.Visible then
    elem02.Visible := true
  else if not elem03.Visible then
    elem03.Visible := true
  else if not elem04.Visible then
    elem04.Visible := true
  else if not elem05.Visible then
    elem05.Visible := true
  else if not elem06.Visible then
    elem06.Visible := true
  else if not elem07.Visible then
    elem07.Visible := true
  else if not elem08.Visible then
    elem08.Visible := true
  else if not elem09.Visible then
    elem09.Visible := true
  else if not elem10.Visible then
    elem10.Visible := true
  else if not elem11.Visible then
    elem11.Visible := true;
  // version boucle (aucune modif à faire si évolution du dessin)
  // sortir := false;
  // num := 0;
  // while (not sortir) and (num < ChildrenCount) do
  // begin
  // inc(num);
  // for i := 0 to ChildrenCount - 1 do
  // if children[i] is TShape then
  // begin
  // if ((children[i] as TShape).Tag = num) and
  // (not(children[i] as TShape).Visible) then
  // begin
  // (children[i] as TShape).Visible := true;
  // sortir := true;
  // break;
  // end;
  // end;
  // end;
end;

function TDessinPendu.isPartiePerdue: boolean;
begin
  result := NombreMorceauxRestants < 1;
end;

procedure TDessinPendu.MasqueLeDessin;
var
  i: integer;
begin
  NombreMorceauxRestants := 0;
  for i := 0 to ChildrenCount - 1 do
    if children[i] is TShape then
    begin
      (children[i] as TShape).Visible := false;
      inc(NombreMorceauxRestants);
    end;
end;

end.
