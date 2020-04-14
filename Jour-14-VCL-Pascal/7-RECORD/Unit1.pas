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
