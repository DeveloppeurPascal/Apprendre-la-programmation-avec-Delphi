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
/// Signature : ea854900989defc9b21f0a45b23547b3c045aed1
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
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses System.IOUtils;

type
  TNomPrenom = record
    nom: string[30];
    prenom: string[30];
  end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Moi, Toi: TNomPrenom;
  tab: array [1 .. 10] of TNomPrenom;
  i: integer;
  MonFichierStructure: File of TNomPrenom;
begin
  Moi.nom := 'Dujardin';
  Moi.prenom := 'Jean';
  Toi.nom := 'Giodarno';
  Toi.prenom := 'Isabelle';

  for i := 1 to 10 do
  begin
    tab[i].nom := 'nom' + i.tostring;
    tab[i].prenom := 'prenom' + i.tostring;
  end;

  Toi := Moi;

  for i := 1 to 10 do
    with tab[i] do // pas recommandé pour la relecture
    begin
      nom := 'nom' + i.tostring;
      prenom := 'prenom' + i.tostring;
    end;

  AssignFile(MonFichierStructure, tpath.Combine(tpath.GetDocumentsPath,
    'FichierStructure.dat'));
  try
    Rewrite(MonFichierStructure);
    for i := 1 to 10 do
      write(MonFichierStructure, tab[i]);
    closefile(MonFichierStructure);
  except
    // intercepte les erreurs dont les erreurs d'écriture de fichier
  end;

  AssignFile(MonFichierStructure, tpath.Combine(tpath.GetDocumentsPath,
    'FichierStructure.dat'));
{$I-}
  Reset(MonFichierStructure);
{$I+}
  i := 1;
  while (not eof(MonFichierStructure)) and (i <= 10) do
  begin
    read(MonFichierStructure, tab[i]);
    inc(i);
  end;
  closefile(MonFichierStructure);

end;

end.
