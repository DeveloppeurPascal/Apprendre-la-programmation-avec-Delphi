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
/// Signature : 942f53c987bf946dd15c36682837fd7ed3d190d5
/// ***************************************************************************
/// </summary>

unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Unit5;

type
  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    CadreDeGauche: TFrame5;
    CadreDeDroite: TFrame5;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  showmessage(CadreDeGauche.Label1.Caption);
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  showmessage(CadreDeDroite.Label1.Caption);
end;

end.
