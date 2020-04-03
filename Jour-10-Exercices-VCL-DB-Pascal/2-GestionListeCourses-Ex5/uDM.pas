unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageXML;

type
  Tdm = class(TDataModule)
    tabListeDeCourses: TFDMemTable;
    dsListeDeCourses: TDataSource;
    tabListeDeCoursestrucaacheter: TStringField;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

Uses System.IOutils;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  if tabListeDeCourses.Active then
    tabListeDeCourses.Close;
  tabListeDeCourses.ResourceOptions.Persistent := true;
{$IFDEF RELEASE}
  tabListeDeCourses.ResourceOptions.PersistentFileName :=
    TPath.combine(TPath.GetDocumentsPath, 'MaListeDeCourses.xml');
{$ELSE}
  tabListeDeCourses.ResourceOptions.PersistentFileName :=
    TPath.combine(TPath.GetDocumentsPath, 'MaListeDeCourses-debug.xml');
{$ENDIF}
  tabListeDeCourses.Open;
end;

end.
