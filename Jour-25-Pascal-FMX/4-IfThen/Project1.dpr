(* C2PP
  ***************************************************************************

  Apprendre la programmation avec Delphi

  Copyright 2020-2025 Patrick Prémartin under AGPL 3.0 license.

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
  https://apprendre-delphi.fr/apprendre-la-programmation-avec-delphi-2020.php

  Project site :
  https://github.com/DeveloppeurPascal/Apprendre-la-programmation-avec-Delphi

  ***************************************************************************
  File last update : 2025-02-09T11:12:31.771+01:00
  Signature : 3db77b9ac6a777c0e429beade938b172ec65352f
  ***************************************************************************
*)

program Project1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.math;

var
  ch: string;
  i: integer;

begin
  try
    if random(10) = 5 then
      ch := '5'
    else
      ch := 'autre';
    // équivalent à
    ch := ifthen(random(10) = 5, '5', 'autre');

    if random(10) = 5 then
      i := 5
    else
      i := 0;
    // équivalent à
    i := ifthen(random(10) = 5, 5, 0);

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
