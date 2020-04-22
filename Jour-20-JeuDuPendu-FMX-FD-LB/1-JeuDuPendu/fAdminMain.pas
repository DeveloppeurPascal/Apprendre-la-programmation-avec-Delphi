unit fAdminMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,
  Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    FDMemTable1Mot: TStringField;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

Uses System.IOUtils, System.Types;

procedure TForm2.Button1Click(Sender: TObject);
var
  tab: TStringDynArray;
  i: integer;
begin
  // tab := tfile.ReadAllLines('C:\Users\Patrick\Documents\Embarcadero\Studio\Projets\BootcampDelphi\Jour-19-FMX-Exercices\3-JeuDuPendu\liste-de-mots-en-francais.txt');
  tab := tfile.ReadAllLines('..\..\liste-de-mots-en-francais.txt');
  for i := 0 to length(tab) - 1 do
    if (tab[i].Length >= 6) and (tab[i].Length <= 10) then
    begin
      FDMemTable1.Insert;
      FDMemTable1.Fieldbyname('mot').AsString := tab[i];
      FDMemTable1.Post;
    end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FDMemTable1.Active then
    FDMemTable1.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  if FDMemTable1.Active then
    FDMemTable1.Close;
  FDMemTable1.ResourceOptions.Persistent := true;
  FDMemTable1.ResourceOptions.PersistentFileName :=
    TPath.combine(TPath.GetDocumentsPath, 'DelphiBootCampJeuDuPendu.bin');
  FDMemTable1.open;
end;

end.
