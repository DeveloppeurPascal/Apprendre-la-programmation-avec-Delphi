unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnShowMessage: TButton;
    btnMessageDlg: TButton;
    btnInputBox: TButton;
    btnInputQuery: TButton;
    btnPromptForFilename: TButton;
    procedure btnShowMessageClick(Sender: TObject);
    procedure btnMessageDlgClick(Sender: TObject);
    procedure btnInputBoxClick(Sender: TObject);
    procedure btnInputQueryClick(Sender: TObject);
    procedure btnPromptForFilenameClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnInputBoxClick(Sender: TObject);
var
  ch: string;
begin
  ch := InputBox('titre', 'question', 'par défaut');
  showmessage(ch);
end;

procedure TForm1.btnInputQueryClick(Sender: TObject);
var
  tab: array [1 .. 3] of string;
begin
  tab[1] := 'reponse 1';
  tab[2] := 'reponse 2';
  tab[3] := 'reponse 3';
  if inputquery('titre', ['q1', 'q2', 'q3'], tab) then
    showmessage('Ok: ' + tab[1] + ' ' + tab[2] + ' ' + tab[3])
  else
    showmessage('pas ok: ' + tab[1] + ' ' + tab[2] + ' ' + tab[3]);
end;

procedure TForm1.btnMessageDlgClick(Sender: TObject);
begin
  if mrok = MessageDlg('Helo World', mtInformation, [mbOK, mbClose], 0, mbOK)
  then
    showmessage('Ok')
  else
    showmessage('pas ok');
end;

procedure TForm1.btnShowMessageClick(Sender: TObject);
begin
  showmessage('Hello World');
  ShowMessagePos('Hello World', Left + width div 2, top + Height div 2);
end;

procedure TForm1.btnPromptForFilenameClick(Sender: TObject);
var
  Nomfichier: string;
begin
  if promptforfilename(Nomfichier, 'Fichiers Pascal (*.pas)|*.pas', '.pas',
    'Titre de ma fenêtre') then
    showmessage(Nomfichier)
  else
    showmessage('cancel');
end;

end.
