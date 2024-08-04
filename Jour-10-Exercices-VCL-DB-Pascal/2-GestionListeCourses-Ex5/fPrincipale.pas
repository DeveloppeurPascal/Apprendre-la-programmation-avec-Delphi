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
/// Signature : 60ff042b000e0a8b92b8c5bc69ad02ca6d0a403a
/// ***************************************************************************
/// </summary>

unit fPrincipale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, uDM, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask;

type
  TfrmPrincipale = class(TForm)
    PageControl1: TPageControl;
    tsListe: TTabSheet;
    tsAjouter: TTabSheet;
    tsModifier: TTabSheet;
    tsSupprimer: TTabSheet;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edtAjoutTrucAAcheter: TDBEdit;
    btnAjoutOk: TBitBtn;
    btnAjoutCancel: TBitBtn;
    DBNavigator1: TDBNavigator;
    btnModifOk: TBitBtn;
    edtModifTrucAAjouter: TDBEdit;
    Label2: TLabel;
    btnModifCancel: TBitBtn;
    Label3: TLabel;
    DBText1: TDBText;
    btnSuppOk: TBitBtn;
    btnSuppCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btnAjoutOkClick(Sender: TObject);
    procedure btnAjoutCancelClick(Sender: TObject);
    procedure btnSuppCancelClick(Sender: TObject);
    procedure btnSuppOkClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmPrincipale: TfrmPrincipale;

implementation

{$R *.dfm}

procedure TfrmPrincipale.btnSuppOkClick(Sender: TObject);
begin
  dm.tabListeDeCourses.Delete;
  PageControl1.ActivePage := tsListe;
end;

procedure TfrmPrincipale.btnSuppCancelClick(Sender: TObject);
begin
  PageControl1.ActivePage := tsListe;
end;

procedure TfrmPrincipale.btnAjoutCancelClick(Sender: TObject);
begin
  dm.tabListeDeCourses.Cancel;
  PageControl1.ActivePage := tsListe;
end;

procedure TfrmPrincipale.btnAjoutOkClick(Sender: TObject);
begin
  dm.tabListeDeCourses.Post;
  PageControl1.ActivePage := tsListe;
end;

procedure TfrmPrincipale.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := tsListe;
end;

procedure TfrmPrincipale.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = tsAjouter then
  begin
    if not(dm.tabListeDeCourses.State = TDataSetState.dsBrowse) then
      dm.tabListeDeCourses.Cancel;
    dm.tabListeDeCourses.Append;
  end
  else if PageControl1.ActivePage = tsModifier then
  begin
    if not(dm.tabListeDeCourses.State = TDataSetState.dsBrowse) then
      dm.tabListeDeCourses.Cancel;
    dm.tabListeDeCourses.edit;
  end
  // KO =>  else if PageControl1.ActivePage in [tsSupprimer, tsListe] then
  else if (PageControl1.ActivePage = tsSupprimer) or
    (PageControl1.ActivePage = tsListe) then
  begin
    if not(dm.tabListeDeCourses.State = TDataSetState.dsBrowse) then
      dm.tabListeDeCourses.Cancel;
  end;
end;

end.
