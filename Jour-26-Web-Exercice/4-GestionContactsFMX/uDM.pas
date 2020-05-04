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
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure Tdm.tabContactsCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('NomPrenom').AsString := DataSet.FieldByName('nom')
    .AsString + ' ' + DataSet.FieldByName('prenom').AsString;
end;

end.
