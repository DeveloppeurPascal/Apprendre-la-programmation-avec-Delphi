unit flivres;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  udm, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.CheckLst,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmLivres = class(TForm)
    btnFermer: TBitBtn;
    zoneFooter: TPanel;
    gLivres: TDBGrid;
    dsLivres: TDataSource;
    Panel1: TPanel;
    DBMemo1: TDBMemo;
    DBLookupComboBox1: TDBLookupComboBox;
    dsEditeurs: TDataSource;
    btnModifieLaListeDesAuteurs: TButton;
    ListBox1: TListBox;
    procedure btnModifieLaListeDesAuteursClick(Sender: TObject);
    procedure dsLivresDataChange(Sender: TObject; Field: TField);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmLivres: TfrmLivres;

implementation

{$R *.dfm}

uses fAuteursDUnLivre;

procedure TfrmLivres.btnModifieLaListeDesAuteursClick(Sender: TObject);
begin
  if not(dsLivres.DataSet.State in [dsBrowse, dsEdit]) then
    raise Exception.Create
      ('Finir l''opération en cours avant d''accéder aux auteurs.');
  frmAuteursDUnLivre.ShowModal;
  dsLivresDataChange(dsLivres, nil);
end;

procedure TfrmLivres.dsLivresDataChange(Sender: TObject; Field: TField);
begin
  datamodule2.tabAuteursDUnLivre.ParamByName('livre').AsInteger :=
    dsLivres.DataSet.FieldByName('id').AsInteger;
  datamodule2.tabAuteursDUnLivre.Open;
  try
    ListBox1.Items.Clear;
    datamodule2.tabAuteursDUnLivre.First;
    while not datamodule2.tabAuteursDUnLivre.Eof do
    begin
      ListBox1.Items.Add(datamodule2.tabAuteursDUnLivre.FieldByName
        ('NomPrenomOuPseudo').AsString);
      datamodule2.tabAuteursDUnLivre.Next;
    end;
  finally
    datamodule2.tabAuteursDUnLivre.close;
  end;
end;

end.
