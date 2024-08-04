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
/// Signature : 444ad5cf6a56361f5d4206304460d01d07968758
/// ***************************************************************************
/// </summary>

unit Unit2;

interface

type
  TMaClasse = class(TObject)
  public
    procedure MaClasseProc;
    function MaFunc: integer; virtual;
  end;

  TMaClasse2 = class(TMaClasse)
  private
    procedure MaClasse2ProcPriv;
  public
    procedure MaClasse2Proc; overload;
    procedure MaClasse2Proc(i: integer); overload;
  end;

  TMaClasse3 = class(TMaClasse2)
  private
    FUnEntier: integer;
    procedure SetUnEntier(const Value: integer);
    function GetValeurAleatoire: integer;
  public
    function MaFunc: integer; override;
    property UnEntier: integer read FUnEntier write SetUnEntier;
    property ValeurAleatoire: integer read GetValeurAleatoire;
  end;

implementation

{ TMaClasse3 }

function TMaClasse3.GetValeurAleatoire: integer;
begin
  Result := random(1000);
end;

function TMaClasse3.MaFunc: integer;
begin
  Result := 10;
end;

procedure TMaClasse3.SetUnEntier(const Value: integer);
begin
  FUnEntier := Value;
end;

{ TMaClasse }

procedure TMaClasse.MaClasseProc;
var
  i: integer;
begin
  i := MaFunc;
end;

function TMaClasse.MaFunc: integer;
begin
  Result := 5;
end;

{ TMaClasse2 }

procedure TMaClasse2.MaClasse2Proc;
begin

end;

procedure TMaClasse2.MaClasse2Proc(i: integer);
begin

end;

procedure TMaClasse2.MaClasse2ProcPriv;
begin

end;

initialization

{$IFDEF DEBUG}
  reportmemoryleaksonshutdown := true;
{$ENDIF}

end.
