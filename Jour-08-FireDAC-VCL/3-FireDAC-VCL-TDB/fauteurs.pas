unit fauteurs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Unit2, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmAuteurs = class(TForm)
    zoneFooter: TPanel;
    btnFermer: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmAuteurs: TfrmAuteurs;

implementation

{$R *.dfm}

end.
