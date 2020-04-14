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
