unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script;

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
    FDScript1: TFDScript;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure tabAuteursDUnLivreCalcFields(DataSet: TDataSet);
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Déclarations privées }
    DatabaseExistante: boolean;
  public
    { Déclarations publiques }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

uses System.IOutils;

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  if FDConnection1.connected then
    FDConnection1.close;
  FDConnection1.Open;
end;

procedure TDataModule2.FDConnection1AfterConnect(Sender: TObject);
begin
  if not DatabaseExistante then
    FDScript1.ExecuteScript(FDScript1.sqlscripts[0].sql);
  tabAuteurs.Open;
  tabEditeurs.Open;
  tabLivres.Open;
end;

procedure TDataModule2.FDConnection1BeforeConnect(Sender: TObject);
var
  NomFichier: string;
begin
{$IFDEF DEBUG}
  NomFichier := TPath.Combine(TPath.Getdocumentspath,
    'DelphiBootCamp-Bibliotheque-debug.db');
{$ELSE}
  NomFichier := TPath.Combine(TPath.Getdocumentspath,
    'DelphiBootCamp-Bibliotheque.db');
{$ENDIF}
  FDConnection1.Params.Clear;
  FDConnection1.Params.ADDPair('Database', NomFichier);
  FDConnection1.Params.ADDPair('DriverID', 'SQLite');
  FDConnection1.Params.ADDPair('LockingMode', 'Normal');
  DatabaseExistante := tfile.Exists(NomFichier);
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
