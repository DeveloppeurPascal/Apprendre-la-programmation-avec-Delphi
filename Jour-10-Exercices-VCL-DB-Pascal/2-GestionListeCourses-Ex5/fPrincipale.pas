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
