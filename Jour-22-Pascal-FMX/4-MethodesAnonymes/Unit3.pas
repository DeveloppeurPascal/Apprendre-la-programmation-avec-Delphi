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
/// Signature : a472ceaa079beacae676ce299e4cbb4f39bb1976
/// ***************************************************************************
/// </summary>

unit Unit3;

interface

type
  TMyProc = procedure;
  TMyProc2 = procedure(AMonParametre: integer);
  TMyFunc = function: integer;

  TMaClFunc = function: integer of object;

  TMaClasse = class
    Toto: TMaClFunc;
    procedure appeltoto;
  end;

  TMAClasse2 = class
    function bidule: integer;
  end;

  TMAClasse3 = class
    function truc: integer;
  end;

  TMaProcAnonyme = reference to procedure(a: integer);

implementation

procedure maprocedure;
begin
end;

procedure maprocedure2(AMonParametre: integer);
begin
end;

function mafonction: integer;
begin
  result := random(high(integer));
end;

var
  MyProc: TMyProc;
  MyProc2: TMyProc2;

  j: integer;

  MyFunc: TMyFunc;

  mc1: TMaClasse;
  mc2: TMAClasse2;
  mc3: TMAClasse3;

  { TMaClasse }

procedure TMaClasse.appeltoto;
var
  i: integer;
begin
  if assigned(Toto) then
    i := Toto;
end;

{ TMAClasse2 }

function TMAClasse2.bidule: integer;
begin
  result := random(high(integer));
end;

{ TMAClasse3 }

function TMAClasse3.truc: integer;
begin
  result := random(high(integer));
end;

procedure maproc6456(Ap1: TMyProc; Ap2: TMyFunc);
var
  i: integer;
begin
  Ap1;
  i := Ap2;
end;

procedure maproc34654532(AParam: TMaProcAnonyme);
begin
  AParam(14);
end;

initialization

MyProc := maprocedure;
maprocedure;
MyProc;

MyFunc := mafonction;
j := mafonction;
j := MyFunc;

mc1 := TMaClasse.Create;
try
  mc2 := TMAClasse2.Create;
  try
    mc3 := TMAClasse3.Create;
    try
      mc1.Toto := mc2.bidule;
      mc1.appeltoto;
      mc1.Toto := mc3.truc;
      mc1.appeltoto;
    finally
      mc3.Free;
    end;
  finally
    mc2.Free;
  end;
finally
  mc1.Free;
end;

maproc6456(maprocedure, MyFunc);

maproc34654532(
  procedure(i: integer)
  begin
    writeln(i);
  end);

end.
