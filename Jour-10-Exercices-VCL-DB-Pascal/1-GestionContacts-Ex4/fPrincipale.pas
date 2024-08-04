/// <summary>
/// ***************************************************************************
///
/// Apprendre la programmation avec Delphi
///
/// Copyright 2020-2024 Patrick Pr�martin under AGPL 3.0 license.
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
/// Projets Delphi d'exemples d�velopp�s pendant la formation en ligne gratuite pour apprendre � programmer en utilisant le langage Pascal dans Delphi r�alis�e en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial li� � la pand�mie du virus COVID-19.
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
/// Signature : e70ba970bac736f6397e991db52db686b80a6a18
/// ***************************************************************************
/// </summary>

unit fPrincipale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfrmPrincipale = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    btnAjouter: TButton;
    btnModifier: TButton;
    btnSupprimer: TButton;
    btnFermer: TButton;
    VirtualImageList1: TVirtualImageList;
    procedure FormShow(Sender: TObject);
    procedure btnFermerClick(Sender: TObject);
    procedure btnAjouterClick(Sender: TObject);
    procedure btnModifierClick(Sender: TObject);
    procedure btnSupprimerClick(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  frmPrincipale: TfrmPrincipale;

implementation

{$R *.dfm}

uses fAjouter, fModifier, fSupprimer;

procedure TfrmPrincipale.btnAjouterClick(Sender: TObject);
begin
  frmAjouter.ShowModal;
end;

procedure TfrmPrincipale.btnFermerClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipale.btnModifierClick(Sender: TObject);
begin
  frmModifier.ShowModal;
end;

procedure TfrmPrincipale.btnSupprimerClick(Sender: TObject);
begin
  frmSupprimer.ShowModal;
end;

procedure TfrmPrincipale.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

end.
