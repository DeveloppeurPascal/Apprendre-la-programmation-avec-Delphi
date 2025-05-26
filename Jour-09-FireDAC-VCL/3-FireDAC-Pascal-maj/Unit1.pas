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
  File last update : 2025-02-09T11:12:31.470+01:00
  Signature : cda1aaee78b6b0db314203e6dff1751280184b39
  ***************************************************************************
*)

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    btnAjout: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    FDMemTable1id: TIntegerField;
    FDMemTable1idAsString: TStringField;
    Panel1: TPanel;
    btnModif: TButton;
    btnSupprime: TButton;
    procedure btnAjoutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnModifClick(Sender: TObject);
    procedure btnSupprimeClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnAjoutClick(Sender: TObject);
var
  i: integer;
begin
  for i := 1 to 10 do
  begin
     FDMemTable1.Insert;
    //FDMemTable1.Append;
    FDMemTable1.FieldByName('id').AsInteger := i;
    FDMemTable1.FieldByName('idAsString').AsString := i.tostring;
    // FDMemTable1.FieldByName('idAsString').AsString := intToStr(i);
    FDMemTable1.Post;
  end;
end;

procedure TForm1.btnModifClick(Sender: TObject);
begin
  FDMemTable1.Edit;
  FDMemTable1.FieldByName('idAsString').AsString :=
    (FDMemTable1.FieldByName('id').AsInteger * 5).tostring;
  FDMemTable1.Post;
end;

procedure TForm1.btnSupprimeClick(Sender: TObject);
begin
  if not FDMemTable1.Eof then
    FDMemTable1.Delete;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if not FDMemTable1.Active then
    FDMemTable1.Open;
end;

end.
