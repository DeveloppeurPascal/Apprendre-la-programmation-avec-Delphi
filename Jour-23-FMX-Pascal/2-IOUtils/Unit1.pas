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
/// Signature : 0a8ba342dd34778e4a7dd27eedd97888d48f416f
/// ***************************************************************************
/// </summary>

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.ioutils;

procedure TForm1.Button1Click(Sender: TObject);
var
  ch: string;
begin
  ch := tpath.combine(tpath.GetDocumentsPath, tpath.combine('MonDossier',
    'MonSousDossier'));
  // ch := tpath.GetDocumentsPath + tpath.PathSeparator + 'MonDossier' +
  // tpath.PathSeparator + 'MonSousdossier';
  if not tdirectory.Exists(ch) then
    tdirectory.CreateDirectory(ch);
  // ForceDirectories(ch);
  ListBox1.Items.AddStrings(tdirectory.GetFiles(tpath.GetDocumentsPath,
    function(const Path: string; const SearchRec: TSearchRec): Boolean
    var
      nomfichier: string;
    begin
      nomfichier := tpath.GetFileName(SearchRec.Name);
      if (not nomfichier.StartsWith('TMS')) then
        result := true;
    end));
  ListBox1.Items.SaveToFile(tpath.combine(ch, 'liste.txt'));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  nomfichier: string;
begin
  nomfichier := tpath.combine(tpath.GetDocumentsPath,
    tpath.combine('MonDossier', tpath.combine('MonSousDossier', 'liste.txt')));
  if tfile.Exists(nomfichier) then
    tfile.Delete(nomfichier);
end;

end.
