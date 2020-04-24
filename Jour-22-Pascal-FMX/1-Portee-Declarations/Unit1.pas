unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Phys, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    Button1: TButton;
    FDManager1: TFDManager;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
    procedure MaProcPrivee;
  public
    { Déclarations publiques }
    procedure MaProcPublique;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Unit2;

procedure TForm1.Button1Click(Sender: TObject);
begin
  machin.publique;
  maproc;
  // plante car non visible
  // MaProc2;

  Label1.Text := 'Hello World';
end;

procedure TForm1.MaProcPrivee;
begin

end;

procedure TForm1.MaProcPublique;
begin

end;

end.
