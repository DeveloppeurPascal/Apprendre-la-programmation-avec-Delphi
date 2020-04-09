unit fAuteursDUnLivre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmAuteursDUnLivre = class(TForm)
    DBText1: TDBText;
    DBText2: TDBText;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    dsLivre: TDataSource;
    ListeDesAuteurs: TPanel;
    sbAuteurs: TScrollBox;
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
    procedure ClicSurCase(Sender: TObject);
  public
    { Déclarations publiques }
  end;

var
  frmAuteursDUnLivre: TfrmAuteursDUnLivre;

implementation

{$R *.dfm}

procedure TfrmAuteursDUnLivre.ClicSurCase(Sender: TObject);
var
  cb: TCheckbox;
begin
  if Sender is TCheckbox then
  begin
    cb := Sender as TCheckbox;
    if cb.Checked then // ajouter un lien
      DataModule2.FDConnection1.ExecSQL
        ('insert into lien_auteur_livre (id_livre,id_auteur) values(:l,:a)',
        [dsLivre.DataSet.FieldByName('id').AsInteger, cb.tag])
    else // retirer un lien
      DataModule2.FDConnection1.ExecSQL
        ('delete from lien_auteur_livre where id_livre=:l and id_auteur=:a',
        [dsLivre.DataSet.FieldByName('id').AsInteger, cb.tag]);
  end;
end;

procedure TfrmAuteursDUnLivre.FormShow(Sender: TObject);
var
  macase: TCheckbox;
  idlivre: integer;
  tabAuteur: TFDTable;
  i: integer;
begin
  for i := sbAuteurs.ControlCount - 1 downto 0 do
    sbAuteurs.RemoveControl(sbAuteurs.Controls[i]);
  idlivre := dsLivre.DataSet.FieldByName('id').AsInteger;
  tabAuteur := DataModule2.tabAuteurs;
  // Affichage des auteurs de la base de données
  tabAuteur.First;
  while not tabAuteur.Eof do
  begin
    macase := TCheckbox.Create(Self);
    macase.parent := sbAuteurs;
    macase.Align := altop;
    if tabAuteur.FieldByName('pseudo').AsString.Length > 0 then
      macase.Caption := tabAuteur.FieldByName('pseudo').AsString
    else
      macase.Caption := tabAuteur.FieldByName('nom').AsString + ' ' +
        tabAuteur.FieldByName('prenom').AsString;
    macase.tag := tabAuteur.FieldByName('id').AsInteger;
    // pour cet auteur, y a -t-il un lien avec le livre ?
    macase.Checked :=
      (0 < DataModule2.FDConnection1.ExecSQLScalar
      ('select count(*) from lien_auteur_livre where id_livre=:l and id_auteur=:a',
      [idlivre, macase.tag]));
    macase.OnClick := ClicSurCase;
    tabAuteur.Next;
  end;
end;

end.
