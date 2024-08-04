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
/// Signature : a5b215e011c0580444a49fc21f1fa9f75fff5722
/// ***************************************************************************
/// </summary>

unit fJeu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageBin, cDessinPendu;

type
  TfrmJeu = class(TForm)
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
    zoneGauche: TLayout;
    zoneClient: TLayout;
    DessinPendu1: TDessinPendu;
    zonePendu: TScaledLayout;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnJouerClick(Sender: TObject);
    procedure lblMotAfficheClick(Sender: TObject);
    procedure zoneClientResize(Sender: TObject);
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
    procedure DemarreUnePartie(initialise: boolean = true);
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
  frmJeu: TfrmJeu;

implementation

{$R *.fmx}

Uses System.IOUtils;

Const
  cLettreDeRemplacement = '-';

procedure TfrmJeu.btnJouerClick(Sender: TObject);
begin
  GoJeu;
end;

procedure TfrmJeu.CliqueSurLettre(Sender: TObject);
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
          DessinPendu1.AfficheUnMembre;
          if DessinPendu1.isPartiePerdue then
            GoPerdu;
        end;
      end;
      btn.Visible := false;
    end;
  end;
end;

procedure TfrmJeu.DemarreUnePartie(initialise: boolean);
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
  if initialise then
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
  // afficher le pendu
  if initialise then
    DessinPendu1.MasqueLeDessin;
end;

procedure TfrmJeu.FermeEcrans;
begin
  ecranAccueil.Visible := false;
  ecranJeu.Visible := false;
  ecranGagne.Visible := false;
  ecranPerdu.Visible := false;
end;

procedure TfrmJeu.FormCreate(Sender: TObject);
begin
{$IFDEF DEBUG}
  // en RELEASE (pour simplifier le déploiement), je
  // charge la liste des mots directement depuis le
  // concepteur de fiches dans le TFDMemTable, donc pas
  // besoin du code suivant
  if TabMots.Active then
    TabMots.Close;
  TabMots.loadfromfile(TPath.combine(TPath.GetDocumentsPath,
    'DelphiBootCampJeuDuPendu.bin'), tfdstorageformat.sfBinary);
{$ENDIF}
  TabMots.open;
{$IFDEF DEBUG}
  lblMotAffiche.hittest := true;
{$ENDIF}
end;

procedure TfrmJeu.FormShow(Sender: TObject);
begin
  GoAccueil;
end;

procedure TfrmJeu.GoAccueil;
begin
  FermeEcrans;
  ecranAccueil.Visible := true;
end;

procedure TfrmJeu.GoGagne;
begin
  FermeEcrans;
  ecranGagne.Visible := true;
end;

procedure TfrmJeu.GoJeu;
begin
  FermeEcrans;
  DemarreUnePartie;
  ecranJeu.Visible := true;
end;

procedure TfrmJeu.GoPerdu;
begin
  FermeEcrans;
  ecranPerdu.Visible := true;
end;

procedure TfrmJeu.lblMotAfficheClick(Sender: TObject);
begin
{$IFDEF DEBUG}
  lblMotAffiche.Text := MotATrouver;
{$ENDIF}
end;

procedure TfrmJeu.SetMotAffiche(const Value: string);
begin
  FMotAffiche := Value;
  lblMotAffiche.Text := FMotAffiche;
  if not FMotAffiche.IndexOf(cLettreDeRemplacement) >= 0 then
    // GoGagne;
    DemarreUnePartie(false);
end;

procedure TfrmJeu.SetMotATrouver(const Value: string);
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

procedure TfrmJeu.SetScore(const Value: integer);
begin
  FScore := Value;
  lblScoreGagne.Text := FScore.ToString;
  lblScorePerdu.Text := FScore.ToString;
  lblScoreJeu.Text := 'Votre score : ' + FScore.ToString;
end;

procedure TfrmJeu.zoneClientResize(Sender: TObject);
begin
  zonePendu.width := zoneClient.width;
  zonePendu.height := DessinPendu1.height * zonePendu.width /
    DessinPendu1.width;
  if zonePendu.height > zoneClient.height then
  begin
    zonePendu.height := zoneClient.height;
    zonePendu.width := DessinPendu1.width * zonePendu.height /
      DessinPendu1.height;
  end;
end;

end.
