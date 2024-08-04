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
/// Signature : 14f8862f482a81c7f6be4982ef579458c9ecb768
/// ***************************************************************************
/// </summary>

unit fAdminMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,
  Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    FDMemTable1Mot: TStringField;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

Uses System.IOUtils, System.Types;

procedure TForm2.Button1Click(Sender: TObject);
var
  tab: TStringDynArray;
  i: integer;
begin
  // tab := tfile.ReadAllLines('C:\Users\Patrick\Documents\Embarcadero\Studio\Projets\BootcampDelphi\Jour-19-FMX-Exercices\3-JeuDuPendu\liste-de-mots-en-francais.txt');
  tab := tfile.ReadAllLines('..\..\liste-de-mots-en-francais.txt');
  for i := 0 to length(tab) - 1 do
    if (tab[i].Length >= 6) and (tab[i].Length <= 10) then
    begin
      FDMemTable1.Insert;
      FDMemTable1.Fieldbyname('mot').AsString := tab[i];
      FDMemTable1.Post;
    end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FDMemTable1.Active then
    FDMemTable1.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  if FDMemTable1.Active then
    FDMemTable1.Close;
  FDMemTable1.ResourceOptions.Persistent := true;
  FDMemTable1.ResourceOptions.PersistentFileName :=
    TPath.combine(TPath.GetDocumentsPath, 'DelphiBootCampJeuDuPendu.bin');
  FDMemTable1.open;
end;

end.
