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
/// Signature : eb21ba03f435de444abafd8acbb93eef372fe355
/// ***************************************************************************
/// </summary>

unit fPrincipale;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uDM,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.StdCtrls, FMX.ListView, FMX.Controls.Presentation, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.Edit;

type
  TfrmPrincipale = class(TForm)
    ToolBar1: TToolBar;
    ListView1: TListView;
    btnNouveau: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    TabControl1: TTabControl;
    tiListe: TTabItem;
    tiModification: TTabItem;
    tiAjout: TTabItem;
    ActionList1: TActionList;
    GoAjout: TChangeTabAction;
    GoModification: TChangeTabAction;
    ToolBar2: TToolBar;
    btnBackAjout: TButton;
    Label1: TLabel;
    edtArticleAjout: TEdit;
    btnEnregistrerAjout: TButton;
    GoListe: TChangeTabAction;
    ToolBar3: TToolBar;
    btnRetourModif: TButton;
    btnEnregistrerModif: TButton;
    Label2: TLabel;
    edtArticleModif: TEdit;
    LinkControlToField1: TLinkControlToField;
    btnAchatEffectue: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnEnregistrerAjoutClick(Sender: TObject);
    procedure btnEnregistrerModifClick(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnAchatEffectueClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmPrincipale: TfrmPrincipale;

implementation

{$R *.fmx}

procedure TfrmPrincipale.btnAchatEffectueClick(Sender: TObject);
begin
  dm.tabMesCourses.FieldByName('dateachat').AsString := DateTimeToStr(now);
  btnEnregistrerModifClick(Sender);
end;

procedure TfrmPrincipale.btnEnregistrerAjoutClick(Sender: TObject);
var
  articleaajouter: string;
begin
  articleaajouter := edtArticleAjout.Text.Trim;
  if articleaajouter.Length > 0 then
  begin
    dm.tabMesCourses.append;
    dm.tabMesCourses.FieldByName('libelle').AsString := articleaajouter;
    dm.tabMesCourses.Post;
    edtArticleAjout.Text := '';
  end;
  GoListe.Execute;
end;

procedure TfrmPrincipale.btnEnregistrerModifClick(Sender: TObject);
var
  articleamodifier: string;
begin
  articleamodifier := edtArticleModif.Text.Trim;
  if articleamodifier.Length > 0 then
    dm.tabMesCourses.Post
  else
    dm.tabMesCourses.cancel;
  GoListe.Execute;
end;

procedure TfrmPrincipale.FormCreate(Sender: TObject);
begin
  TabControl1.ActiveTab := tiListe;
end;

procedure TfrmPrincipale.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  dm.tabMesCourses.Edit;
  GoModification.Execute;
end;

end.
