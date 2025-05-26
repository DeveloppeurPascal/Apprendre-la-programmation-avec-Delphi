(* C2PP
  ***************************************************************************

  Apprendre la programmation avec Delphi

  Copyright 2020-2025 Patrick Prémartin under AGPL 3.0 license.

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
  https://apprendre-delphi.fr/apprendre-la-programmation-avec-delphi-2020.php

  Project site :
  https://github.com/DeveloppeurPascal/Apprendre-la-programmation-avec-Delphi

  ***************************************************************************
  File last update : 2025-02-09T11:12:31.518+01:00
  Signature : 5096984d45cc0aa1a5ef09cd693b437492738118
  ***************************************************************************
*)

unit About;

interface

uses WinApi.Windows, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

end.
 
