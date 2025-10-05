(* C2PP
  ***************************************************************************

  Apprendre la programmation avec Delphi

  Copyright 2020-2025 Patrick Prémartin under MIT license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Projets Delphi d'exemples développés pendant la formation en ligne gratuite pour apprendre à programmer en utilisant le langage Pascal dans Delphi réalisée en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial lié à la pandémie du virus COVID-19.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://apprendre-delphi.fr

  Project site :
  https://github.com/DeveloppeurPascal/Apprendre-la-programmation-avec-Delphi

  ***************************************************************************
  File last update : 2025-10-05T16:42:28.089+02:00
  Signature : 2ac2e6ff80f62ba154d45f7aaca6ca3aad52677f
  ***************************************************************************
*)

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
