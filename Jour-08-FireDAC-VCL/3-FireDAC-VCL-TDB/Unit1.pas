unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Unit2;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Quitter1: TMenuItem;
    ables1: TMenuItem;
    Auteurs1: TMenuItem;
    Editeurs1: TMenuItem;
    Livres1: TMenuItem;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    dsListeAuteurs: TDataSource;
    procedure Quitter1Click(Sender: TObject);
    procedure Auteurs1Click(Sender: TObject);
    procedure Editeurs1Click(Sender: TObject);
    procedure Livres1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses fauteurs, fediteurs, flivres;

procedure TForm1.Auteurs1Click(Sender: TObject);
begin
  frmAuteurs.ShowModal;
end;

procedure TForm1.Editeurs1Click(Sender: TObject);
begin
  frmEditeurs.ShowModal;
end;

procedure TForm1.Livres1Click(Sender: TObject);
begin
  frmLivres.ShowModal;
end;

procedure TForm1.Quitter1Click(Sender: TObject);
begin
  Close;
end;

end.
