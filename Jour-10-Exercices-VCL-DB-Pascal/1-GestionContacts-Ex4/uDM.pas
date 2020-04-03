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
