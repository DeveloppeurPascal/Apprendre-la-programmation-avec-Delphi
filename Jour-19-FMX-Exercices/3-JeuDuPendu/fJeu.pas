unit fJeu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageBin;

type
  TForm1 = class(TForm)
    ecranAccueil: TLayout;
    ecranJeu: TLayout;
    ecranGagne: TLayout;
    ecranPerdu: TLayout;
    btnJouer: TButton;
    btnRejouerGagne: TButton;
    Label1: TLabel;
    lblScoreGagne: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    lblScorePerdu: TLabel;
    Label3: TLabel;
    btnRejouerPerdu: TButton;
    TabMots: TFDMemTable;
    TabMotsMot: TStringField;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    lblScoreJeu: TLabel;
    lblMotAffiche: TLabel;
    LettresAChoisir: TFlowLayout;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnJouerClick(Sender: TObject);
    procedure lblMotAfficheClick(Sender: TObject);
  private
    { Déclarations privées }
    FScore: integer;
    FMotAffiche: string;
    FMotATrouver: string;
    procedure FermeEcrans;
    procedure GoAccueil;
    procedure GoPerdu;
    procedure GoGagne;
    procedure GoJeu;
    procedure DemarreUnePartie;
    procedure SetScore(const Value: integer);
    procedure SetMotAffiche(const Value: string);
    procedure SetMotATrouver(const Value: string);
    property Score: integer read FScore write SetScore;
    property MotAffiche: string read FMotAffiche write SetMotAffiche;
    property MotATrouver: string read FMotATrouver write SetMotATrouver;
    procedure CliqueSurLettre(Sender: TObject);
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

Uses System.IOUtils;

Const
  cLettreDeRemplacement = '-';

procedure TForm1.btnJouerClick(Sender: TObject);
begin
  GoJeu;
end;

procedure TForm1.CliqueSurLettre(Sender: TObject);
var
  btn: TButton;
  c: char;
  i: integer;
begin
  if (Sender is TButton) then
  begin
    btn := Sender as TButton;
    if btn.TagFloat = -1 then
    begin
      // récupère la lettre concernée
      c := btn.Text.Chars[0];
      // vérifie si elle est dans le motaffiche
      if MotAffiche.IndexOf(c) < 0 then
      begin
        // vérifie si elle existe dans le motatrouver
        if MotATrouver.IndexOf(c) >= 0 then
        begin
          // si ok => score + 1 et modif motaffiche
          for i := 0 to MotATrouver.Length - 1 do
            if (c = MotATrouver.Chars[i]) and (c <> MotAffiche.Chars[i]) then
            begin
              Score := Score + 1;
              MotAffiche := MotAffiche.Substring(0, i) + c +
                MotAffiche.Substring(i + 1);
            end;
        end
        else
        begin
          // si pas ok => affiche pendu
          // TODO : finir pendu
        end;
      end;
      btn.Visible := false;
    end;
  end;
end;

procedure TForm1.DemarreUnePartie;
var
  num: integer;
  i: integer;
begin
  // choisir un mot
  num := random(TabMots.RecordCount);
  TabMots.First;
  while (not TabMots.Eof) and (num > 0) do
  begin
    TabMots.Next;
    dec(num);
  end;
  if (not TabMots.Eof) then
    MotATrouver := TabMots.FieldByName('mot').AsString
  else
    MotATrouver := '**********';
  // initialiser le score
  Score := 0;
  // afficher les lettres
  LettresAChoisir.Controls.Clear;
  for i := 0 to 25 do
    with TButton.Create(self) do
    begin
      parent := LettresAChoisir;
      width := 44;
      height := 44;
      Text := chr(ord('A') + i);
      OnClick := CliqueSurLettre;
      TagFloat := -1;
    end;
  // afficher le mot
  // afficher le pendu
end;

procedure TForm1.FermeEcrans;
begin
  ecranAccueil.Visible := false;
  ecranJeu.Visible := false;
  ecranGagne.Visible := false;
  ecranPerdu.Visible := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if TabMots.Active then
    TabMots.Close;
  TabMots.loadfromfile(TPath.combine(TPath.GetDocumentsPath,
    'DelphiBootCampJeuDuPendu.bin'), tfdstorageformat.sfBinary);
  TabMots.open;
{$IFDEF DEBUG}
  lblMotAffiche.hittest := true;
{$ENDIF}
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  GoAccueil;
end;

procedure TForm1.GoAccueil;
begin
  FermeEcrans;
  ecranAccueil.Visible := true;
end;

procedure TForm1.GoGagne;
begin
  FermeEcrans;
  ecranGagne.Visible := true;
end;

procedure TForm1.GoJeu;
begin
  FermeEcrans;
  DemarreUnePartie;
  ecranJeu.Visible := true;
end;

procedure TForm1.GoPerdu;
begin
  FermeEcrans;
  ecranPerdu.Visible := true;
end;

procedure TForm1.lblMotAfficheClick(Sender: TObject);
begin
{$IFDEF DEBUG}
  lblMotAffiche.Text := MotATrouver;
{$ENDIF}
end;

procedure TForm1.SetMotAffiche(const Value: string);
begin
  FMotAffiche := Value;
  lblMotAffiche.Text := FMotAffiche;
  if not FMotAffiche.IndexOf(cLettreDeRemplacement) >= 0 then
    GoGagne;
end;

procedure TForm1.SetMotATrouver(const Value: string);
var
  i: integer;
  c: char;
  ch: string;
begin
  FMotATrouver := Value.ToUpper;
  ch := '';
  for i := 0 to FMotATrouver.Length - 1 do
  begin
    c := FMotATrouver.Chars[i];
    if CharInSet(c, ['A' .. 'Z']) then
      ch := ch + cLettreDeRemplacement
    else
      ch := ch + c;
  end;
  MotAffiche := ch;
end;

procedure TForm1.SetScore(const Value: integer);
begin
  FScore := Value;
  lblScoreGagne.Text := FScore.ToString;
  lblScorePerdu.Text := FScore.ToString;
  lblScoreJeu.Text := 'Votre score : ' + FScore.ToString;
end;

end.
