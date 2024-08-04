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
/// Signature : 0ec139c614ae11d87a469ab24ea8adfc50fa9292
/// ***************************************************************************
/// </summary>

unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON, Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TDM = class(TDataModule)
    tabContacts: TFDMemTable;
    tabContactsNom: TStringField;
    tabContactsPrenom: TStringField;
    tabContactsTelephone: TStringField;
    tabContactsEmail: TStringField;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    dsContacts: TDataSource;
    ImageCollection1: TImageCollection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

Uses System.IOUtils;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  if tabContacts.Active then
    tabContacts.Close;
  tabContacts.ResourceOptions.Persistent := true;
{$IFDEF RELEASE}
  tabContacts.ResourceOptions.PersistentFileName :=
    TPath.Combine(TPath.GetDocumentsPath, 'MesContacts.json');
{$ELSE}
  tabContacts.ResourceOptions.PersistentFileName :=
    TPath.Combine(TPath.GetDocumentsPath, 'MesContacts-debug.json');
{$ENDIF}
  tabContacts.Open;
end;

end.
