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
/// Signature : b1b91616110b3b8abd1c547a70cfc22f7a86dda1
/// ***************************************************************************
/// </summary>

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Ani;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    lblEcran1: TLabel;
    Rectangle2: TRectangle;
    lblEcran2: TLabel;
    Button1: TButton;
    Button2: TButton;
    DroiteVersGauche: TFloatAnimation;
    Button3: TButton;
    AnimOpacite: TFloatAnimation;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DroiteVersGaucheFinish(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure AnimOpaciteFinish(Sender: TObject);
  private
    { Déclarations privées }
    Ecran1Vers2Animation: TFloatAnimation;
    procedure AfficheEcran1;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.AfficheEcran1;
begin
  Layout1.Visible := true;
  Layout1.Align := TAlignLayout.Contents;
  Layout2.Visible := false;
end;

procedure TForm1.AnimOpaciteFinish(Sender: TObject);
begin
  AnimOpacite.Enabled := false;
  Layout2.Visible := not AnimOpacite.Inverse;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Layout2.Align := TAlignLayout.none;
  Layout2.SetBounds(Clientwidth, 0, Clientwidth, Clientheight);
  Layout2.Visible := true;
  Layout2.Opacity := 1;
  Ecran1Vers2Animation := DroiteVersGauche;
  DroiteVersGauche.Inverse := false;
  DroiteVersGauche.StartValue := Clientwidth;
  DroiteVersGauche.Enabled := true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Layout2.Align := TAlignLayout.none;
  Layout2.Opacity := 0;
  Layout2.SetBounds(0, 0, Clientwidth, Clientheight);
  Layout2.Visible := true;
  Ecran1Vers2Animation := AnimOpacite;
  AnimOpacite.Inverse := false;
  AnimOpacite.Enabled := true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  DroiteVersGauche.StartValue := Clientwidth;
  Ecran1Vers2Animation.Inverse := true;
  Ecran1Vers2Animation.Enabled := true;
end;

procedure TForm1.DroiteVersGaucheFinish(Sender: TObject);
begin
  DroiteVersGauche.Enabled := false;
  Layout2.Visible := not DroiteVersGauche.Inverse;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  AfficheEcran1;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  for var i := 0 to childrenCount - 1 do
    if children[i] is TLayout then
    begin
      var
        l: TLayout;
      l := children[i] as TLayout;
      l.SetBounds(l.Position.X, l.Position.Y, Clientwidth, Clientheight);
    end;
end;

end.
