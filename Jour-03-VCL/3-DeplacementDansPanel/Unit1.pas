(* C2PP
  ***************************************************************************

  Apprendre la programmation avec Delphi

  Copyright 2020-2025 Patrick Prémartin under MIT license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Projets Delphi d'exemples développés pendant la formation en ligne gratuite pour apprendre à programmer en utilisant le langage Pascal dans Delphi réalisée en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial lié à la pandémie du virus COVID-19.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://apprendre-delphi.fr

  Project site :
  https://github.com/DeveloppeurPascal/Apprendre-la-programmation-avec-Delphi

  ***************************************************************************
  File last update : 2025-10-05T16:42:28.001+02:00
  Signature : dc1e29b705decc50eec8c5b5e5687108faa80866
  ***************************************************************************
*)

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    VersLeHaut: TButton;
    VersLaDroite: TButton;
    VersLaGauche: TButton;
    VersLeBas: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    procedure VersLeHautClick(Sender: TObject);
    procedure VersLeBasClick(Sender: TObject);
    procedure VersLaGaucheClick(Sender: TObject);
    procedure VersLaDroiteClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.VersLeHautClick(Sender: TObject);
begin
  if Label1.Top >= 10 then
    Label1.Top := Label1.Top - 10;
end;

procedure TForm1.VersLaDroiteClick(Sender: TObject);
begin
  if Label1.Left + Label1.Width < Panel1.ClientWidth-10 then
    Label1.Left := Label1.Left + 10;
end;

procedure TForm1.VersLaGaucheClick(Sender: TObject);
begin
  if Label1.Left >= 10 then
    Label1.Left := Label1.Left - 10;
end;

procedure TForm1.VersLeBasClick(Sender: TObject);
begin
  if Label1.Top + Label1.Height < Panel1.ClientHeight-10 then
    Label1.Top := Label1.Top + 10;
end;

end.
