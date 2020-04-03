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
    { Déclarations privées }
  public
    { Déclarations publiques }
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
