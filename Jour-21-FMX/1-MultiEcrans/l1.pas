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
/// Signature : b5b7cb81f9abb4a524a38dc5b7216ed5aa41e215
/// ***************************************************************************
/// </summary>

unit l1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TForm4 = class(TForm)
    ecran1: TLayout;
    ecran2: TLayout;
    ecran3: TLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Déclarations privées }
    EcranActuel: TLayout;
    EcranVersLequelRevenirDepuisLEcran2: TLayout;
    procedure Ecran3FermeAvec(AModalResult: TModalResult);
    procedure ChangeEcran(Ancien, Nouveau: TLayout);
    procedure AfficheEcran(Nouveau: TLayout);
  public
    { Déclarations publiques }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.AfficheEcran(Nouveau: TLayout);
begin
  if assigned(EcranActuel) then
    EcranActuel.Visible := false;
  Nouveau.Visible := true;
  EcranActuel := Nouveau;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  EcranVersLequelRevenirDepuisLEcran2 := EcranActuel;
  AfficheEcran(ecran2);
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  AfficheEcran(ecran3);
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  AfficheEcran(EcranVersLequelRevenirDepuisLEcran2);
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  AfficheEcran(ecran1);
  Ecran3FermeAvec(mrYes);
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  AfficheEcran(ecran1);
  Ecran3FermeAvec(mrNo);
end;

procedure TForm4.ChangeEcran(Ancien, Nouveau: TLayout);
begin
  Ancien.Visible := false;
  Nouveau.Visible := true;
end;

procedure TForm4.Ecran3FermeAvec(AModalResult: TModalResult);
begin
  if AModalResult = mrYes then
    showmessage('yes')
  else
    showmessage('no');
end;

procedure TForm4.FormCreate(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ChildrenCount - 1 do
    if (children[i] is TLayout) then
      (children[i] as TLayout).Visible := false;
  ecran1.Visible := true;
  EcranActuel := ecran1;
end;

end.
