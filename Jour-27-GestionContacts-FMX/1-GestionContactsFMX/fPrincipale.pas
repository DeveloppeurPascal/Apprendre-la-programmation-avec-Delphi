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
