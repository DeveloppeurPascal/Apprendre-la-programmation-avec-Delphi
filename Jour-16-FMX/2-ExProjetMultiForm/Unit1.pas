unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    btnFiche2: TButton;
    btnFiche3: TButton;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnFiche2Click(Sender: TObject);
    procedure btnFiche3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Unit2, Unit3;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.btnFiche2Click(Sender: TObject);
begin
  form2.ShowModal;
end;

procedure TForm1.btnFiche3Click(Sender: TObject);
var
  f: tform3;
begin
  f := tform3.Create(Self);
  try
    f.Show;
  except
    f.Free;
  end;
end;

end.
