unit fediteurs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  udm, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  TfrmEditeurs = class(TForm)
    zoneFooter: TPanel;
    btnFermer: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBMemo1: TDBMemo;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmEditeurs: TfrmEditeurs;

implementation

{$R *.dfm}

end.
