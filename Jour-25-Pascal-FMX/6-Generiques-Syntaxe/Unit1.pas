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
  File last update : 2025-02-09T11:12:31.781+01:00
  Signature : 3897d39dc1d06416e96572847fea7b56dfc684fa
  ***************************************************************************
*)

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs;

type
  TForm1 = class(TForm)
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure bidule<t: TForm>(machin: t);
  end;

  tmaclasse<t1: TForm; t2: tedit> = class
  public
    f: t1;
    e: t2;
    procedure machin(dd: t1);
    function truc: t2;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{ TForm1 }

procedure TForm1.bidule<t>(machin: t);
begin

end;

end.
