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
