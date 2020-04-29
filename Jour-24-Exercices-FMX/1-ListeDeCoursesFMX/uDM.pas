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
