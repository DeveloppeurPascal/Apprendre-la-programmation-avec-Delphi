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
  File last update : 2025-02-09T11:12:31.476+01:00
  Signature : 9a71d51048d5c4afb8958501c7eb600856ad0f97
  ***************************************************************************
*)

unit fSupprimer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TfrmSupprimer = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmSupprimer: TfrmSupprimer;

implementation

{$R *.dfm}

procedure TfrmSupprimer.BitBtn1Click(Sender: TObject);
begin
  dm.tabContacts.Delete;
end;

end.
