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
/// Signature : 78fc0f102903bff257ffff34bbac1ca2b48ea6c4
/// ***************************************************************************
/// </summary>

unit cf1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, cc1, cc2, cc3;

type
  TForm5 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
    EcranActuel: TFrame;
    NumEcranActuel: integer;
    ecran1: TFrame1;
    ecran2: TFrame2;
    ecran3: TFrame3;
  public
    { Déclarations publiques }
    function AfficheEcran<T: TFrame>(var ecran: T): T; overload;
    procedure AfficheEcran(NumEcran: integer); overload;
    procedure RetourEcran3(AModalResult: TModalResult);
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

function TForm5.AfficheEcran<T>(var ecran: T): T;
begin
  if not assigned(ecran) then
  begin
    ecran := T.create(Self);
    ecran.name := '';
    ecran.parent := Self;
    ecran.align := talignlayout.Contents;
  end;
  result := ecran;
end;

procedure TForm5.AfficheEcran(NumEcran: integer);
var
  EcranAAfficher: TFrame;
begin
  case NumEcran of
    3:
      begin
        // if not assigned(ecran3) then
        // begin
        // ecran3 := TFrame3.create(Self);
        // ecran3.name := '';
        // ecran3.parent := Self;
        // ecran3.align := talignlayout.Contents;
        // end;
        // EcranAAfficher := ecran3;
        EcranAAfficher := AfficheEcran<TFrame3>(ecran3);
      end;
    2:
      begin
        // if not assigned(ecran2) then
        // begin
        // ecran2 := TFrame2.create(Self);
        // ecran2.name := '';
        // ecran2.parent := Self;
        // ecran2.align := talignlayout.Contents;
        // end;
        // EcranAAfficher := ecran2;
        EcranAAfficher := AfficheEcran<TFrame2>(ecran2);
        ecran2.EcranPrecedent := NumEcranActuel;
      end;
  else // ecran 1 par défaut
    // if not assigned(ecran1) then
    // begin
    // ecran1 := TFrame1.create(Self);
    // ecran1.name := '';
    // ecran1.parent := Self;
    // ecran1.align := talignlayout.Contents;
    // end;
    // EcranAAfficher := ecran1;
    EcranAAfficher := AfficheEcran<TFrame1>(ecran1);
  end;
  if assigned(EcranActuel) then
    EcranActuel.Visible := false;
  EcranAAfficher.Visible := true;
  EcranActuel := EcranAAfficher;
  NumEcranActuel := NumEcran;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  AfficheEcran(1);
end;

procedure TForm5.RetourEcran3(AModalResult: TModalResult);
begin
  if AModalResult = mryes then
    Showmessage('Yes')
  else
    Showmessage('No');
  AfficheEcran(1);
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.
