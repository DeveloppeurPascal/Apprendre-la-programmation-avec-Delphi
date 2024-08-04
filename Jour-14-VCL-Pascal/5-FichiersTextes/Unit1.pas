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
/// Signature : 975deaff0f1fc87e22965ab7e81a0b84aba16454
/// ***************************************************************************
/// </summary>

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnSavePascal: TButton;
    btnLoadPascal: TButton;
    Panel1: TPanel;
    btnSaveMemo: TButton;
    btnLoadMemo: TButton;
    Button1: TButton;
    btnLoadTFile: TButton;
    btnSaveTFile: TButton;
    procedure btnSavePascalClick(Sender: TObject);
    procedure btnLoadPascalClick(Sender: TObject);
    procedure btnSaveMemoClick(Sender: TObject);
    procedure btnLoadMemoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnSaveTFileClick(Sender: TObject);
    procedure btnLoadTFileClick(Sender: TObject);
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

procedure TForm1.btnLoadMemoClick(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile(tpath.Combine(tpath.GetDocumentsPath,
    'MonFichierExemple.txt'));
end;

procedure TForm1.btnLoadPascalClick(Sender: TObject);
var
  MonFichierText: TextFile;
  ch: string;
begin
  Memo1.Lines.Clear;
  AssignFile(MonFichierText, tpath.Combine(tpath.GetDocumentsPath,
    'MonFichierExemple.txt'));
  Reset(MonFichierText);
  while not eof(MonFichierText) do
  begin
    readln(MonFichierText, ch);
    Memo1.Lines.Add(ch);
  end;
  CloseFile(MonFichierText);
end;

procedure TForm1.btnLoadTFileClick(Sender: TObject);
begin
  Memo1.Lines.Add(TFile.ReadAllText(tpath.Combine(tpath.GetDocumentsPath,
    'MonFichierExemple.txt')));
end;

procedure TForm1.btnSaveMemoClick(Sender: TObject);
begin
  Memo1.Lines.SaveToFile(tpath.Combine(tpath.GetDocumentsPath,
    'MonFichierExemple.txt'));
end;

procedure TForm1.btnSavePascalClick(Sender: TObject);
var
  MonFichierText: TextFile;
begin
  AssignFile(MonFichierText, tpath.Combine(tpath.GetDocumentsPath,
    'MonFichierExemple.txt'));
  Rewrite(MonFichierText); // écrase le contenu du fichier
  // Append(MonFichierText); // ajout au contenu du fichier
  for var i := 0 to Memo1.Lines.Count - 1 do
    writeln(MonFichierText, Memo1.Lines[i]);
  CloseFile(MonFichierText);
end;

procedure TForm1.btnSaveTFileClick(Sender: TObject);
begin
  TFile.WriteAllLines(tpath.Combine(tpath.GetDocumentsPath,
    'MonFichierExemple.txt'), Memo1.Lines.ToStringArray);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

end.
