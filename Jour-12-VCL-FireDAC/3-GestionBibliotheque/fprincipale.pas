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
/// Signature : dfdabdcdf1a13e07fa14207638876402cf556b2e
/// ***************************************************************************
/// </summary>

unit fprincipale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Vcl.Grids,
  Vcl.DBGrids, udm;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Quitter1: TMenuItem;
    ables1: TMenuItem;
    Auteurs1: TMenuItem;
    Editeurs1: TMenuItem;
    Livres1: TMenuItem;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    dsListeAuteurs: TDataSource;
    dsLivresDUnAuteur: TDataSource;
    procedure Quitter1Click(Sender: TObject);
    procedure Auteurs1Click(Sender: TObject);
    procedure Editeurs1Click(Sender: TObject);
    procedure Livres1Click(Sender: TObject);
    procedure dsListeAuteursDataChange(Sender: TObject; Field: TField);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses fauteurs, fediteurs, flivres;

procedure TForm1.Auteurs1Click(Sender: TObject);
begin
  frmAuteurs.ShowModal;
end;

procedure TForm1.dsListeAuteursDataChange(Sender: TObject; Field: TField);
begin
  if not dsListeAuteurs.DataSet.Eof then
  begin
    if DataModule2.tabLivresDUnAuteur.active then
      DataModule2.tabLivresDUnAuteur.close;
    DataModule2.tabLivresDUnAuteur.Params.ParamByName('auteur').ASInteger :=
      dsListeAuteurs.DataSet.FieldByName('id').ASInteger;
    DataModule2.tabLivresDUnAuteur.open;
  end;
end;

procedure TForm1.Editeurs1Click(Sender: TObject);
begin
  frmEditeurs.ShowModal;
end;

procedure TForm1.Livres1Click(Sender: TObject);
begin
  frmLivres.ShowModal;
end;

procedure TForm1.Quitter1Click(Sender: TObject);
begin
  close;
end;

end.
