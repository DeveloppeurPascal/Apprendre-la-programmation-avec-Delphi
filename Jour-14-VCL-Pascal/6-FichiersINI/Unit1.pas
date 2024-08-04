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
/// Signature : 2f5fc9bb89dac8194c9d401e0a2e22d60109bd59
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
    btnSaveMemo: TButton;
    btnEcritINI: TButton;
    btnLitINI: TButton;
    Panel1: TPanel;
    procedure btnSaveMemoClick(Sender: TObject);
    procedure btnEcritINIClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLitINIClick(Sender: TObject);
  private
    function getNomFichierINI: string;
    { Déclarations privées }
  public
    { Déclarations publiques }
    property NomFichierINI: string read getNomFichierINI;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses System.IOUtils, System.IniFiles;

procedure TForm1.btnEcritINIClick(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(NomFichierINI);
  try
    ini.WriteString('MaSection1', 'Cle1_1', 'Valeur1_1');
    ini.WriteString('MaSection1', 'Cle1_2', 'Valeur1_2');
    ini.WriteString('MaSection1', 'Cle1_3', 'Valeur1_3');
    ini.WriteString('MaSection2', 'Cle2_1', 'Valeur2_1');
    ini.WriteString('MaSection2', 'Cle2_2', 'Valeur2_2');
  finally
    ini.Free;
  end;
  Memo1.Lines.LoadFromFile(NomFichierINI);
end;

procedure TForm1.btnLitINIClick(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(NomFichierINI);
  try
    showmessage(ini.ReadString('MaSection1', 'Cle1_2', 'par défaut'));
    showmessage(ini.ReadString('MaSection3', 'Cle3_1', 'par défaut'));
  finally
    ini.Free;
  end;
end;

procedure TForm1.btnSaveMemoClick(Sender: TObject);
begin
  Memo1.Lines.SaveToFile(NomFichierINI);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile(NomFichierINI);
end;

function TForm1.getNomFichierINI: string;
begin
  result := tpath.Combine(tpath.GetDocumentsPath, 'MonFichierINI.ini');
end;

end.
