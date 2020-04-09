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
