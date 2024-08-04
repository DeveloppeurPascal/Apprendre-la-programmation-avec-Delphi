/// <summary>
/// ***************************************************************************
///
/// Apprendre la programmation avec Delphi
///
/// Copyright 2020-2024 Patrick Prémartin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Projets Delphi d'exemples développés pendant la formation en ligne gratuite pour apprendre à programmer en utilisant le langage Pascal dans Delphi réalisée en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial lié à la pandémie du virus COVID-19.
///
/// ***************************************************************************
///
/// Author(s) :
///      Patrick PREMARTIN
///
/// Site :
///      https://apprendre-delphi.fr/apprendre-la-programmation-avec-delphi-2020.php
///
/// Project site :
///      https://github.com/DeveloppeurPascal/Apprendre-la-programmation-avec-Delphi
///
/// ***************************************************************************
/// File last update : 30/05/2024 20:10:12
/// Signature : 5807045af8435ad6590a09da99c30ea383b09aca
/// ***************************************************************************
/// </summary>

unit uProc;

interface

procedure MaProcToto(i: integer); overload;
procedure MaProcToto(s: string); overload;

procedure MaProcedure;
// accessible dans toute unité utilisant celle-ci en interface ou implémentation

procedure Calcule(nb: integer; var res: integer);

implementation

procedure MaProcToto(i: integer);
begin
end;

procedure MaProcToto(s: string);
begin

end;

procedure Calcule(nb: integer; var res: integer);
var
  i: integer;
begin
  res := 0;
  for i := 0 to nb do
    res := res + i;
end;

procedure MaProc2;
// accessible qu'à partir d'ici
begin
  MaProcToto(54);
  MaProcToto('fhfg5j4g5j4g6');
end;

procedure MaProcedure;
// accessible partout car déclarée avant, dans l'interface
begin
end;

procedure MaProc3;
  procedure MaProc3Proc;
  // utilisable que dans MaProc3
    procedure MaProc3ProcProc;
    // utilisable que dans MaProc3Proc
    begin
    end;

  begin
    MaProc3ProcProc;
  end;

begin
  MaProc3Proc;
end;

Procedure ExempleParametres(const ParEntreeSeule: integer;
  ParEntreeSeule2: integer; var ParEntreeSortie: integer;
  out ParSortie: integer);
begin
  // ParEntreeSeule => a la valeur de l'appelant
  // bug car const :  ParEntreeSeule := ParEntreeSeule * 2;
  // ParEntreeSeule2 => a la valeur de l'appelant et peut-être modifié localement
  ParEntreeSeule2 := ParEntreeSeule2 * 2;
  // ParEntreeSortie => a la valeur de l'appelant qui peut être modifiée dans le code local
  ParEntreeSortie := ParEntreeSortie * 2;
  // ParSortie => pas de valeur à l'entrée, modifie la valeur de l'appelant en sortie
  ParSortie := ParSortie * 2;
end;

var
  a, b, c, d: integer;

initialization

a := 1; // const
b := 2;
c := 3; // var
d := 4; // out
ExempleParametres(a, b, c, d); // 1, 2, 6, 0
writeln(a, b, c, d); // 1, 2, 6, 8
// TODO : vérifier OUT

end.
