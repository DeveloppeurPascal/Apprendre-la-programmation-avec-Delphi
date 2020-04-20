unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, Radiant.Shapes,
  FMX.MagnifierGlass, FMX.Layouts;

type
  TForm1 = class(TForm)
    CalloutRectangle1: TCalloutRectangle;
    Circle1: TCircle;
    RadiantPentagon1: TRadiantPentagon;
    RadiantArrow1: TRadiantArrow;
    Text1: TText;
    Label1: TLabel;
    Edit1: TEdit;
    MagnifierGlass1: TMagnifierGlass;
    TrackBar1: TTrackBar;
    Layout1: TLayout;
    procedure TrackBar1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  TrackBar1.Value := MagnifierGlass1.LoupeScale;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Single);
begin
  MagnifierGlass1.Position.X := X - MagnifierGlass1.Width / 2;
  MagnifierGlass1.Position.Y := Y - MagnifierGlass1.Height / 2;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  MagnifierGlass1.LoupeScale := TrackBar1.Value;
end;

end.
