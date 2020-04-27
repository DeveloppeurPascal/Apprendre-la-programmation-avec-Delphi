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
