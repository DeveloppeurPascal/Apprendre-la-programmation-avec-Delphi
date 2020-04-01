unit flivres;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Unit2, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.CheckLst;

type
  TfrmLivres = class(TForm)
    btnFermer: TBitBtn;
    zoneFooter: TPanel;
    gLivres: TDBGrid;
    dsLivres: TDataSource;
    Panel1: TPanel;
    DBMemo1: TDBMemo;
    DBLookupComboBox1: TDBLookupComboBox;
    dsEditeurs: TDataSource;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmLivres: TfrmLivres;

implementation

{$R *.dfm}

end.
