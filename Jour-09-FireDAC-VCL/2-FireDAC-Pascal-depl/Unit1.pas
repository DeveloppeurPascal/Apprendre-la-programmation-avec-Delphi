unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Sqlite_demoConnection: TFDConnection;
    CustomersTable: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    btnPrior: TButton;
    btnNext: TButton;
    btnFirst: TButton;
    btnLast: TButton;
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
    procedure InitBoutons;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnFirstClick(Sender: TObject);
begin
  CustomersTable.First;
  InitBoutons;
end;

procedure TForm1.btnLastClick(Sender: TObject);
begin
  CustomersTable.Last;
  InitBoutons;
end;

procedure TForm1.btnNextClick(Sender: TObject);
begin
  CustomersTable.Next;
  InitBoutons;
end;

procedure TForm1.btnPriorClick(Sender: TObject);
begin
  CustomersTable.Prior;
  InitBoutons;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  InitBoutons;
end;

procedure TForm1.InitBoutons;
begin
  btnPrior.Enabled := not CustomersTable.Bof;
  btnNext.Enabled := not CustomersTable.Eof;
  btnFirst.Enabled := CustomersTable.RecordCount > 1;
  btnLast.Enabled := CustomersTable.RecordCount > 1;
end;

end.
