/// <summary>
/// ***************************************************************************
///
/// Apprendre la programmation avec Delphi
///
/// Copyright 2020-2024 Patrick Pr�martin under AGPL 3.0 license.
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
/// Projets Delphi d'exemples d�velopp�s pendant la formation en ligne gratuite pour apprendre � programmer en utilisant le langage Pascal dans Delphi r�alis�e en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial li� � la pand�mie du virus COVID-19.
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
/// Signature : 66cd61b6dee06229f91a1e009692be079744baa9
/// ***************************************************************************
/// </summary>

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
    { D�clarations priv�es }
  public
    { D�clarations publiques }
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
      ('Finir l''op�ration en cours avant d''acc�der aux auteurs.');
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
