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
/// Signature : f432bee0f81805a822a50bbe3a34cf91ea4e8a27
/// ***************************************************************************
/// </summary>

unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tdm = class(TDataModule)
    dbConnexion: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    tabMesCourses: TFDTable;
    procedure DataModuleCreate(Sender: TObject);
    procedure dbConnexionBeforeConnect(Sender: TObject);
    procedure dbConnexionAfterConnect(Sender: TObject);
  private
    { Déclarations privées }
    BaseInexistante: boolean;
  public
    { Déclarations publiques }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

uses System.ioutils;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  if not dbConnexion.Connected then
    dbConnexion.Open;
end;

procedure Tdm.dbConnexionAfterConnect(Sender: TObject);
begin
  if BaseInexistante then
  begin
    dbConnexion.ExecSQL
      ('CREATE TABLE mescourses (  libelle VARCHAR(255) NULL,  dateachat VARCHAR(14) NULL,  achete BIT NULL,  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL);');
  end;
  tabMesCourses.Open;
end;

procedure Tdm.dbConnexionBeforeConnect(Sender: TObject);
var
  nomfichier: string;
begin
  dbConnexion.Params.Clear;
  dbConnexion.Params.AddPair('DriverID', 'SQLite');
  dbConnexion.Params.AddPair('LockingMode', 'Normal');
{$IFDEF RELEASE}
  nomfichier := TPath.combine(TPath.GetDocumentsPath, 'mescourses.db');
{$ELSE}
  nomfichier := TPath.combine(TPath.GetDocumentsPath, 'mescourses-debug.db');
{$ENDIF}
  BaseInexistante := not tfile.Exists(nomfichier);
  dbConnexion.Params.AddPair('Database', nomfichier);
end;

end.
