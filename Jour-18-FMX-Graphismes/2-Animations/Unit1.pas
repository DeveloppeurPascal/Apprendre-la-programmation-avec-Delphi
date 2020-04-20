unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    Rectangle1: TRectangle;
    BitmapListAnimation1: TBitmapListAnimation;
    procedure FloatAnimation1Process(Sender: TObject);
    procedure FloatAnimation2Process(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FloatAnimation1Process(Sender: TObject);
begin
  Label1.Position.Y := Label1.Position.X;
end;

procedure TForm1.FloatAnimation2Process(Sender: TObject);
begin
Button1.Scale.Y := Button1.Scale.X;
end;

end.
