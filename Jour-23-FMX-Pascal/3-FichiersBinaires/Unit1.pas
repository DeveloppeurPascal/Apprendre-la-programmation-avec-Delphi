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
/// Signature : 4dd60de717d78ad45864588040ee40f0e5598ec3
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
    btnFileIntegerWrite: TButton;
    ListBox1: TListBox;
    btnFileintegerRead: TButton;
    btnFileCardinalRead: TButton;
    btnFileByteRead: TButton;
    btnFileStream: TButton;
    procedure btnFileIntegerWriteClick(Sender: TObject);
    procedure btnFileintegerReadClick(Sender: TObject);
    procedure btnFileCardinalReadClick(Sender: TObject);
    procedure btnFileByteReadClick(Sender: TObject);
    procedure btnFileStreamClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.IOUtils;

procedure TForm1.btnFileByteReadClick(Sender: TObject);
var
  nomfichier: string;
  monfichier: file of byte;
  i: integer;
  v: byte;
begin
  ListBox1.Items.Clear;
  nomfichier := tpath.combine(tpath.getdocumentspath, 'entiers.dat');
  assignfile(monfichier, nomfichier);
  reset(monfichier);
  // for i := 0 to 100 do  // peut planter si nombre d'enregistrements pas correct
  // begin
  // read(monfichier, v);
  // ListBox1.Items.Add(v.ToString);
  // end;
  i := 0;
  while not eof(monfichier) do
  begin
    read(monfichier, v);
    ListBox1.Items.Add(v.ToString);
    inc(i);
  end;
  ListBox1.Items.Insert(0, 'nb elem : ' + i.ToString);
  closefile(monfichier);
end;

procedure TForm1.btnFileCardinalReadClick(Sender: TObject);
var
  nomfichier: string;
  monfichier: file of cardinal;
  i: integer;
  v: cardinal;
begin
  ListBox1.Items.Clear;
  nomfichier := tpath.combine(tpath.getdocumentspath, 'entiers.dat');
  assignfile(monfichier, nomfichier);
  reset(monfichier);
  // for i := 0 to 100 do  // peut planter si nombre d'enregistrements pas correct
  // begin
  // read(monfichier, v);
  // ListBox1.Items.Add(v.ToString);
  // end;
  i := 0;
  while not eof(monfichier) do
  begin
    read(monfichier, v);
    ListBox1.Items.Add(v.ToString);
    inc(i);
  end;
  ListBox1.Items.Insert(0, 'nb elem : ' + i.ToString);
  closefile(monfichier);
end;

procedure TForm1.btnFileIntegerWriteClick(Sender: TObject);
var
  nomfichier: string;
  monfichier: file of integer;
  i: integer;
  v: integer;
begin
  nomfichier := tpath.combine(tpath.getdocumentspath, 'entiers.dat');
  assignfile(monfichier, nomfichier);
  rewrite(monfichier);
  for i := 0 to 80 do
  begin
    v := i - 40;
    write(monfichier, v);
  end;
  closefile(monfichier);
end;

procedure TForm1.btnFileStreamClick(Sender: TObject);
var
  s: tfilestream;
  nomfichier: string;
  vi: integer;
  vc: cardinal;
  vb: byte;
  i: integer;
begin
  nomfichier := tpath.combine(tpath.getdocumentspath, 'entiers.dat');
  i := 0;
  s := tfilestream.Create(nomfichier, fmopenread);
  try
    s.Position := 0;
    while s.Position < s.Size do
    begin
      case random(3) of
        2:
          begin
            s.Read(vi, sizeof(vi));
            ListBox1.Items.Add(vi.ToString);
          end;
        1:
          begin
            s.Read(vc, sizeof(vc));
            ListBox1.Items.Add(vi.ToString);
          end;
      else
        s.Read(vb, sizeof(vb));
        ListBox1.Items.Add(vi.ToString);
      end;
      inc(i);
    end;
  finally
    s.Free;
  end;
  ListBox1.Items.Insert(0, 'Nb elem = ' + i.ToString);
end;

procedure TForm1.btnFileintegerReadClick(Sender: TObject);
var
  nomfichier: string;
  monfichier: file of integer;
  i, v: integer;
begin
  ListBox1.Items.Clear;
  nomfichier := tpath.combine(tpath.getdocumentspath, 'entiers.dat');
  assignfile(monfichier, nomfichier);
  try
    try
      reset(monfichier);
    except
      // erreur liée au fichier
      raise exception.Create('erreur liée au fichier');
    end;
    // for i := 0 to 100 do  // peut planter si nombre d'enregistrements pas correct
    // begin
    // read(monfichier, v);
    // ListBox1.Items.Add(v.ToString);
    // end;
    i := 0;
    while not eof(monfichier) do
    begin
      read(monfichier, v);
      ListBox1.Items.Add(v.ToString);
      inc(i);
    end;
    ListBox1.Items.Insert(0, 'nb elem : ' + i.ToString);
    closefile(monfichier);
  except
    // erreur dans la procédure
  end;
end;

end.
