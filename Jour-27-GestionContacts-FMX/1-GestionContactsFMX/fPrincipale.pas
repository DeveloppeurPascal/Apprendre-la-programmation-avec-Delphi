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
/// Signature : 2c9bd1a18a34a4650e41f180c841def723dc7616
/// ***************************************************************************
/// </summary>

unit fPrincipale;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uDM,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.ListView,
  FMX.TabControl, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  System.Actions, FMX.ActnList, FMX.Objects, FMX.Layouts, FMX.StdActns,
  FMX.PhoneDialer.Actions;

type
  TfrmPrincipale = class(TForm)
    TabControl1: TTabControl;
    tiListe: TTabItem;
    tiDetail: TTabItem;
    ListView1: TListView;
    edtNom: TEdit;
    edtURL: TEdit;
    edtEmail: TEdit;
    edtTelephone: TEdit;
    edtPrenom: TEdit;
    btnURLAffiche: TButton;
    btnEmailSend: TButton;
    btnTelephoneAppel: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ToolBar1: TToolBar;
    btnAjout: TButton;
    ToolBar2: TToolBar;
    btnRetour: TButton;
    btnSupprimer: TButton;
    btnEnregistrer: TButton;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    ActionList1: TActionList;
    GoListe: TChangeTabAction;
    GoDetail: TChangeTabAction;
    Blocage: TRectangle;
    VertScrollBox1: TVertScrollBox;
    AppelTelephonique: TPhoneCallAction;
    procedure FormShow(Sender: TObject);
    procedure btnAjoutClick(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnRetourClick(Sender: TObject);
    procedure btnSupprimerClick(Sender: TObject);
    procedure btnEnregistrerClick(Sender: TObject);
    procedure btnURLAfficheClick(Sender: TObject);
    procedure edtNomChange(Sender: TObject);
    procedure btnEmailSendClick(Sender: TObject);
    procedure btnTelephoneAppelClick(Sender: TObject);
  private
    { Déclarations privées }
    EnregistrementModifie: boolean;
    procedure BlocageEcran(actif: boolean);
    procedure BoutonsAfficher;
    procedure BoutonsMasquer;
  public
    { Déclarations publiques }
  end;

var
  frmPrincipale: TfrmPrincipale;

implementation

{$R *.fmx}

uses Data.db, FMX.dialogservice, u_urlOpen;

procedure TfrmPrincipale.BlocageEcran(actif: boolean);
begin
  Blocage.visible := actif;
  if actif then
    Blocage.bringtofront;
end;

procedure TfrmPrincipale.BoutonsAfficher;
begin
  btnSupprimer.visible := true;
  btnURLAffiche.visible := true;
  btnEmailSend.visible := true;
  btnTelephoneAppel.visible := true;
end;

procedure TfrmPrincipale.BoutonsMasquer;
begin
  btnSupprimer.visible := false;
  btnURLAffiche.visible := false;
  btnEmailSend.visible := false;
  btnTelephoneAppel.visible := false;
end;

procedure TfrmPrincipale.btnAjoutClick(Sender: TObject);
begin
  EnregistrementModifie := false;
  BoutonsMasquer;
  dm.tabContacts.Append;
  GoDetail.Execute;
end;

procedure TfrmPrincipale.btnEmailSendClick(Sender: TObject);
begin
  if not EnregistrementModifie then
    if (edtEmail.Text.Trim.Length > 0) then
      url_Open_In_Browser('mailto:' + edtEmail.Text.Trim);
end;

procedure TfrmPrincipale.btnEnregistrerClick(Sender: TObject);
begin
  if (dm.tabContacts.State in [tdatasetstate.dsedit, tdatasetstate.dsInsert])
  then
    dm.tabContacts.post;
  GoListe.Execute;
end;

procedure TfrmPrincipale.btnRetourClick(Sender: TObject);
begin
  if (dm.tabContacts.State in [tdatasetstate.dsedit, tdatasetstate.dsInsert])
  then
    dm.tabContacts.cancel;
  GoListe.Execute;
end;

procedure TfrmPrincipale.btnSupprimerClick(Sender: TObject);
begin
  BlocageEcran(true);
  try
    TDialogService.MessageDialog('Supprimer ce contact ?',
      tmsgdlgtype.mtConfirmation, [tmsgdlgbtn.mbYes, tmsgdlgbtn.mbno],
      tmsgdlgbtn.mbno, 0,
      procedure(const AModalResult: tmodalresult)
      begin
        if AModalResult = mryes then
        begin
          if (dm.tabContacts.State in [tdatasetstate.dsedit,
            tdatasetstate.dsInsert]) then
            dm.tabContacts.cancel;
          dm.tabContacts.Delete;
          GoListe.Execute;
        end;
        BlocageEcran(false);
      end);
  except
    BlocageEcran(false);
  end;
end;

procedure TfrmPrincipale.btnTelephoneAppelClick(Sender: TObject);
begin
  if not EnregistrementModifie then
    if (edtTelephone.Text.Trim.Length > 0) then
    begin
{$IF Defined(IOS) or Defined(ANDROID)}
      AppelTelephonique.TelephoneNumber := edtTelephone.Text.Trim;
      AppelTelephonique.Execute;
{$ELSE}
      url_Open_In_Browser('tel:' + edtTelephone.Text.Trim);
{$ENDIF}
    end;
end;

procedure TfrmPrincipale.btnURLAfficheClick(Sender: TObject);
begin
  if not EnregistrementModifie then
    if (edtURL.Text.Trim.Length > 0) then
      url_Open_In_Browser(edtURL.Text.Trim);
end;

procedure TfrmPrincipale.edtNomChange(Sender: TObject);
var
  edt: TEdit;
begin
  EnregistrementModifie := true;
  if Sender is TEdit then
    BoutonsMasquer;
end;

procedure TfrmPrincipale.FormShow(Sender: TObject);
begin
  BlocageEcran(false);
  TabControl1.ActiveTab := tiListe;
end;

procedure TfrmPrincipale.ListView1ItemClick(const Sender: TObject;
const AItem: TListViewItem);
begin
  EnregistrementModifie := false;
  BoutonsAfficher;
  GoDetail.Execute;
end;

initialization

TDialogService.PreferredMode := TDialogService.TPreferredMode.Async;

end.
