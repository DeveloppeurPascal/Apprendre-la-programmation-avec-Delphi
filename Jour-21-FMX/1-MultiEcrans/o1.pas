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
/// Signature : 8cae21ccc67e712ed07f4199c4bb0ceb80c06b1f
/// ***************************************************************************
/// </summary>

unit o1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Actions, FMX.ActnList;

type
  TForm6 = class(TForm)
    TabControl1: TTabControl;
    ecran1: TTabItem;
    ecran2: TTabItem;
    ecran3: TTabItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Déclarations privées }
    EcranActuel: TTabItem;
    procedure AfficheEcran(Tab: TTabItem);
  public
    { Déclarations publiques }
  end;

var
  Form6: TForm6;

implementation

{$R *.fmx}

procedure TForm6.AfficheEcran(Tab: TTabItem);
begin
  // if assigned(EcranActuel) then visible := false;
  // TabControl1.ActiveTab := Tab;
  ChangeTabAction1.Tab := Tab;
  ChangeTabAction1.Execute;
  EcranActuel := Tab;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  AfficheEcran(ecran2);
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  AfficheEcran(ecran3);
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
  AfficheEcran(ecran1);
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
  AfficheEcran(ecran2);
end;

procedure TForm6.Button5Click(Sender: TObject);
begin
  AfficheEcran(ecran1);
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  TabControl1.ActiveTab := ecran1;
  EcranActuel := ecran1;
end;

end.
