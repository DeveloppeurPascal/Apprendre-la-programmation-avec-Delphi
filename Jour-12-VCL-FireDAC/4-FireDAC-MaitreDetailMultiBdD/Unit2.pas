unit Unit2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModule2 = class(TDataModule)
    FDMemTable1: TFDMemTable;
    Sqlite_demoConnection: TFDConnection;
    EmployeesTable: TFDQuery;
    EmployeesTableEmployeeID: TFDAutoIncField;
    EmployeesTableLastName: TStringField;
    EmployeesTableFirstName: TStringField;
    EmployeesTableBirthDate: TDateTimeField;
    EmployeesTableCity: TStringField;
    FDMemTable1Ville: TStringField;
    dsMemTable: TDataSource;
    dsSQLite: TDataSource;
    procedure EmployeesTableAfterOpen(DataSet: TDataSet);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDataModule2.EmployeesTableAfterOpen(DataSet: TDataSet);
begin
if not FDMemTable1.Active then FDMemTable1.open;
  EmployeesTable.First;
  while not EmployeesTable.eof do
  begin
    FDMemTable1.insert;
    FDMemTable1.FieldByName('ville').AsString :=
      EmployeesTable.FieldByName('City').AsString;
    FDMemTable1.Post;
    EmployeesTable.next;
  end;
end;

end.
