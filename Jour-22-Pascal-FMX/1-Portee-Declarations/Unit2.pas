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
/// Signature : 32e2f156c7075fffc485fe08c004465468992fdb
/// ***************************************************************************
/// </summary>

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
