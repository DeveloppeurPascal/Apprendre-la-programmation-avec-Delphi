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
    dbContacts: TFDConnection;
    tabContacts: TFDTable;
    tabContactsid: TFDAutoIncField;
    tabContactsnom: TStringField;
    tabContactsprenom: TStringField;
    tabContactstelephone: TStringField;
    tabContactsemail: TStringField;
    tabContactsurl: TStringField;
    tabContactsNomPrenom: TStringField;
    procedure tabContactsCalcFields(DataSet: TDataSet);
    procedure dbContactsBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure dbContactsAfterConnect(Sender: TObject);
  private
    { Déclarations privées }
    BaseExistante: boolean;
  public
    { Déclarations publiques }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

uses System.IOutils;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  if not dbContacts.Connected then
    dbContacts.Open;
end;

procedure Tdm.dbContactsAfterConnect(Sender: TObject);
begin
  if not BaseExistante then
  begin
    dbContacts.ExecSQL('CREATE TABLE contacts (' +
      'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,' +
      'nom VARCHAR(255) NULL,' + 'prenom VARCHAR(255) NULL,' +
      'telephone VARCHAR(255) NULL,' + 'email VARCHAR(255) NULL,' +
      'url VARCHAR(255) NULL);');
    dbContacts.ExecSQL('CREATE UNIQUE INDEX nomprenom ON contacts' +
      '(nom,prenom,id);');
  end;
  tabContacts.Open;
end;

procedure Tdm.dbContactsBeforeConnect(Sender: TObject);
var
  NomFichierDB: string;
begin
  NomFichierDB := tpath.Combine(tpath.getdocumentspath, 'DelphiBootCamp');
  if not tdirectory.Exists(NomFichierDB) then
    tdirectory.CreateDirectory(NomFichierDB);
  dbContacts.Params.Clear;
  dbContacts.Params.addpair('DriverID', 'SQLite');
{$IFDEF RELEASE}
  NomFichierDB := tpath.Combine(NomFichierDB, 'GestionContacts.db');
  dbContacts.Params.addpair('LockingMode', 'Exclusive');
{$ELSE}
  NomFichierDB := tpath.Combine(NomFichierDB, 'GestionContacts-debug.db');
  dbContacts.Params.addpair('LockingMode', 'Normal');
{$ENDIF}
  dbContacts.Params.addpair('Database', NomFichierDB);
  BaseExistante := tfile.Exists(NomFichierDB);
end;

procedure Tdm.tabContactsCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('NomPrenom').AsString := DataSet.FieldByName('nom')
    .AsString + ' ' + DataSet.FieldByName('prenom').AsString;
end;

end.
