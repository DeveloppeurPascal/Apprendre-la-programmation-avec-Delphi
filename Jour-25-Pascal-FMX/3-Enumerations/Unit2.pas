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
  File last update : 2025-10-05T16:42:28.388+02:00
  Signature : aa5a32cc8ab973a916ff5429bc1dfa686a20f52b
  ***************************************************************************
*)

unit Unit2;

interface

type
{$SCOPEDENUMS ON}
  TCouleur = (rouge, noir, vert, bleu=50, jaune, violet, orange);
  TCouleurs = set of TCouleur;
  TCouleurPrimaire = (rouge, jaune, bleu);
  TCouleurPrimaires = set of TCouleurPrimaire;
{$SCOPEDENUMS OFF}

implementation

procedure maproc;
var
  c1, c2: TCouleur;
  c3, c4: TCouleurPrimaire;
  cs: TCouleurs;
begin
  c1 := TCouleur.bleu;
  c2 := bleu;
  c3 := TCouleurPrimaire.bleu;
  c4 := bleu;

  cs := [TCouleur.rouge, TCouleur.jaune] + c1;
  if (TCouleur.jaune in cs) then
    cs := cs - TCouleur.jaune;
end;

end.
