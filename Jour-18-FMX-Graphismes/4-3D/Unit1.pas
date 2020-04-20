unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors, FMX.Controls3D, FMX.MaterialSources, FMX.Objects3D,
  FMX.Viewport3D, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation,
  FMX.Layers3D, FMX.Ani;

type
  TForm1 = class(TForm)
    Viewport3D1: TViewport3D;
    Sphere1: TSphere;
    Rectangle3D1: TRectangle3D;
    TextureMaterialSource1: TTextureMaterialSource;
    Camera1: TCamera;
    TextureMaterialSource2: TTextureMaterialSource;
    Layer3D1: TLayer3D;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    FloatAnimation1: TFloatAnimation;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
ShowMessage(Edit1.Text);
end;

end.
