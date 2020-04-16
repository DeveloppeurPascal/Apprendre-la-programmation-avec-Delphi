unit fVCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmVCL = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Panel1: TPanel;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmVCL: TfrmVCL;

implementation

{$R *.dfm}

end.
