/// <summary>
/// ***************************************************************************
///
/// Apprendre la programmation avec Delphi
///
/// Copyright 2020-2024 Patrick Prémartin under AGPL 3.0 license.
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
/// Projets Delphi d'exemples développés pendant la formation en ligne gratuite pour apprendre à programmer en utilisant le langage Pascal dans Delphi réalisée en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial lié à la pandémie du virus COVID-19.
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
/// Signature : 02fd1ccc3de43e0abe5c985840ef2704500526a7
/// ***************************************************************************
/// </summary>

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

const
  MaConstante = 54;

var
  Form1: TForm1;

implementation

{$R *.dfm}
// ghghkhkh

(*
  dfhgfh
  gfufgghfhg
  dfgfg
*)

{
  hfgfgjf
  fgjghjghjkgh
  fhgfgjfhj
}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Showmessage('debug on');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Showmessage('debug off');
end;

{$DEFINE TEST}
{$DEFINE NOTEST}
procedure TForm1.Button3Click(Sender: TObject);
begin
{$IF Defined(DEBUG) and Defined(TEST)}
  Showmessage('debug + test');
{$ELSEIF Defined(DEBUG) and Defined(NOTEST)}
  Showmessage('debug + notest');
{$ENDIF}
{$IFDEF NOTEST}
  Showmessage('notest');
{$ENDIF}
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
{$IFDEF DEBUG}
  Button1.Visible := true;
  Button2.Visible := false;
{$ELSE}
  Button1.Visible := false;
  Button2.Visible := true;
{$ENDIF}
  // ou
{$IFDEF DEBUG}
  Button1.Visible := true;
{$ELSE}
  Button1.Visible := false;
{$ENDIF}
  Button2.Visible := not Button1.Visible;
end;

end.
