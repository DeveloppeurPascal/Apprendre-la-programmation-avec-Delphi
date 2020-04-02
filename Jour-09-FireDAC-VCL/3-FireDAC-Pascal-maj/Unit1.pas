unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    btnAjout: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    FDMemTable1id: TIntegerField;
    FDMemTable1idAsString: TStringField;
    Panel1: TPanel;
    btnModif: TButton;
    btnSupprime: TButton;
    procedure btnAjoutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnModifClick(Sender: TObject);
    procedure btnSupprimeClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnAjoutClick(Sender: TObject);
var
  i: integer;
begin
  for i := 1 to 10 do
  begin
     FDMemTable1.Insert;
    //FDMemTable1.Append;
    FDMemTable1.FieldByName('id').AsInteger := i;
    FDMemTable1.FieldByName('idAsString').AsString := i.tostring;
    // FDMemTable1.FieldByName('idAsString').AsString := intToStr(i);
    FDMemTable1.Post;
  end;
end;

procedure TForm1.btnModifClick(Sender: TObject);
begin
  FDMemTable1.Edit;
  FDMemTable1.FieldByName('idAsString').AsString :=
    (FDMemTable1.FieldByName('id').AsInteger * 5).tostring;
  FDMemTable1.Post;
end;

procedure TForm1.btnSupprimeClick(Sender: TObject);
begin
  if not FDMemTable1.Eof then
    FDMemTable1.Delete;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if not FDMemTable1.Active then
    FDMemTable1.Open;
end;

end.
