unit fFXM;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts;

type
  TfrmFMX = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    PasswordEditButton1: TPasswordEditButton;
    Timer1: TTimer;
    Layout1: TLayout;
    Panel1: TPanel;
    Button2: TButton;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmFMX: TfrmFMX;

implementation

{$R *.fmx}
{$R *.iPhone.fmx IOS}
{$R *.iPad.fmx IOS}
{$R *.SSW3.fmx ANDROID}

end.
