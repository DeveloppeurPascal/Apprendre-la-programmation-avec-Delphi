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
/// Signature : 049995c3f93c74de1e88ca1685e1034e9b4e242b
/// ***************************************************************************
/// </summary>

unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, Data.DB, FireDAC.Comp.Script,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs;

type
  TDataModule2 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDTable1: TFDTable;
    FDScript1: TFDScript;
    DataSource1: TDataSource;
    FDTable1nom: TStringField;
    FDTable1prenom: TStringField;
    FDTable1pseudo: TStringField;
    FDTable1id: TFDAutoIncField;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
  private
    { Déclarations privées }
    BaseDeDonneesExistante: boolean;
  public
    { Déclarations publiques }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

uses System.IOUtils;

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  if FDConnection1.Connected then
    FDConnection1.Close;
  FDConnection1.Open;
end;

procedure TDataModule2.FDConnection1AfterConnect(Sender: TObject);
begin
  if not BaseDeDonneesExistante then
    FDScript1.ExecuteScript(FDScript1.SQLScripts[0].SQL);
  FDTable1.Open;
end;

procedure TDataModule2.FDConnection1BeforeConnect(Sender: TObject);
var
  i: integer;
  NomFichier: string;
begin
  NomFichier := tpath.Combine(tpath.GetDocumentsPath, 'MaBase.db');
  i := FDConnection1.Params.IndexOfName('Database');
  if (i < 0) then
    FDConnection1.Params.AddPair('Database', NomFichier)
  else
    FDConnection1.Params[i] := 'Database=' + NomFichier;
  BaseDeDonneesExistante := TFile.Exists(NomFichier);
end;

end.
