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
/// Signature : fd664d0d4ab2cabb48f0d45a344749007aad7b6d
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
    btnShowMessage: TButton;
    btnMessageDlg: TButton;
    btnInputBox: TButton;
    btnInputQuery: TButton;
    btnPromptForFilename: TButton;
    procedure btnShowMessageClick(Sender: TObject);
    procedure btnMessageDlgClick(Sender: TObject);
    procedure btnInputBoxClick(Sender: TObject);
    procedure btnInputQueryClick(Sender: TObject);
    procedure btnPromptForFilenameClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnInputBoxClick(Sender: TObject);
var
  ch: string;
begin
  ch := InputBox('titre', 'question', 'par défaut');
  showmessage(ch);
end;

procedure TForm1.btnInputQueryClick(Sender: TObject);
var
  tab: array [1 .. 3] of string;
begin
  tab[1] := 'reponse 1';
  tab[2] := 'reponse 2';
  tab[3] := 'reponse 3';
  if inputquery('titre', ['q1', 'q2', 'q3'], tab) then
    showmessage('Ok: ' + tab[1] + ' ' + tab[2] + ' ' + tab[3])
  else
    showmessage('pas ok: ' + tab[1] + ' ' + tab[2] + ' ' + tab[3]);
end;

procedure TForm1.btnMessageDlgClick(Sender: TObject);
begin
  if mrok = MessageDlg('Helo World', mtInformation, [mbOK, mbClose], 0, mbOK)
  then
    showmessage('Ok')
  else
    showmessage('pas ok');
end;

procedure TForm1.btnShowMessageClick(Sender: TObject);
begin
  showmessage('Hello World');
  ShowMessagePos('Hello World', Left + width div 2, top + Height div 2);
end;

procedure TForm1.btnPromptForFilenameClick(Sender: TObject);
var
  Nomfichier: string;
begin
  if promptforfilename(Nomfichier, 'Fichiers Pascal (*.pas)|*.pas', '.pas',
    'Titre de ma fenêtre') then
    showmessage(Nomfichier)
  else
    showmessage('cancel');
end;

end.
