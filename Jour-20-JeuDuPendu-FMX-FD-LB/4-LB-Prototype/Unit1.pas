unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.Bind.GenData, System.Rtti, FMX.Grid.Style, Data.Bind.Controls,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, FMX.Layouts,
  Fmx.Bind.Navigator, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,
  Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
    PrototypeBindSource1: TPrototypeBindSource;
    StringGrid1: TStringGrid;
    BindNavigator1: TBindNavigator;
    BindingsList1: TBindingsList;
    LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
