/// <summary>
/// ***************************************************************************
///
/// Apprendre la programmation avec Delphi
///
/// Copyright 2020-2024 Patrick Pr�martin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Projets Delphi d'exemples d�velopp�s pendant la formation en ligne gratuite pour apprendre � programmer en utilisant le langage Pascal dans Delphi r�alis�e en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial li� � la pand�mie du virus COVID-19.
///
/// ***************************************************************************
///
/// Author(s) :
///      Patrick PREMARTIN
///
/// Site :
///      https://apprendre-delphi.fr/apprendre-la-programmation-avec-delphi-2020.php
///
/// Project site :
///      https://github.com/DeveloppeurPascal/Apprendre-la-programmation-avec-Delphi
///
/// ***************************************************************************
/// File last update : 30/05/2024 20:10:12
/// Signature : ee53007ad598ecabb9a038c1bc1f856874a6159e
/// ***************************************************************************
/// </summary>

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
    { D�clarations priv�es }
  public
    { D�clarations publiques }
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
