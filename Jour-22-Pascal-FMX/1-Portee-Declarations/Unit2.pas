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
  File last update : 2025-10-05T16:42:28.364+02:00
  Signature : bc0e0ac663e230d63a25411dbfdc2c17e2a99c12
  ***************************************************************************
*)

unit Unit2;

interface

type
  Tmachin = class
  private
    FMaValeur: integer;
    procedure privee;
  public
    FBidule: boolean;
    procedure publique;
  end;

procedure MaProc;

var
  Machin: Tmachin;

implementation

procedure MaProc;
begin
  Machin.FMaValeur := 1;
  Machin.privee;
  Machin.publique;
  Machin.FBidule := false;
end;

procedure MaProc2;
begin
  Machin.FBidule := true;
end;

{ Tmachin }

procedure Tmachin.privee;
begin
  FMaValeur := 10;
  FBidule := false;
end;

procedure Tmachin.publique;
begin
  FMaValeur := 5;
  FBidule := false;
end;

initialization

Machin := Tmachin.Create;
MaProc2;

finalization

if assigned(Machin) then
  Machin.Free;

end.
