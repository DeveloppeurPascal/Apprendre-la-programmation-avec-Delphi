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
/// Signature : 8016777f3ecf591c9b0cb735349db65ea064225d
/// ***************************************************************************
/// </summary>

unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet;

type
  TDataModule2 = class(TDataModule)
    FDConnection1: TFDConnection;
    tabLivres: TFDTable;
    tabAuteurs: TFDTable;
    tabEditeurs: TFDTable;
    tabLivresDUnAuteur: TFDQuery;
    tabEditeursraisonsociale: TStringField;
    tabEditeursid: TFDAutoIncField;
    tabAuteursnom: TStringField;
    tabAuteursprenom: TStringField;
    tabAuteurspseudo: TStringField;
    tabAuteursid: TFDAutoIncField;
    tabLivresgencod: TStringField;
    tabLivrestitre: TStringField;
    tabLivrescommentaire: TWideMemoField;
    tabLivrescouverture: TBlobField;
    tabLivresid: TFDAutoIncField;
    tabLivresid_editeur: TIntegerField;
    tabAuteursDUnLivre: TFDQuery;
    tabAuteursDUnLivreNomPrenomOuPseudo: TStringField;
    tabAuteursDUnLivrenom: TStringField;
    tabAuteursDUnLivreprenom: TStringField;
    tabAuteursDUnLivrepseudo: TStringField;
    tabAuteursDUnLivreid: TFDAutoIncField;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure tabAuteursDUnLivreCalcFields(DataSet: TDataSet);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  FDConnection1.Open;
end;

procedure TDataModule2.FDConnection1AfterConnect(Sender: TObject);
begin
  tabAuteurs.Open;
  tabEditeurs.Open;
  tabLivres.Open;
end;

procedure TDataModule2.tabAuteursDUnLivreCalcFields(DataSet: TDataSet);
begin
  if (DataSet.FieldByName('pseudo').AsString.Length > 0) then
    DataSet.FieldByName('NomPrenomOuPseudo').AsString :=
      DataSet.FieldByName('pseudo').AsString
  else
    DataSet.FieldByName('NomPrenomOuPseudo').AsString :=
      DataSet.FieldByName('nom').AsString + ' ' + DataSet.FieldByName
      ('prenom').AsString;
end;

end.
