/// <summary>
/// ***************************************************************************
///
/// Apprendre la programmation avec Delphi
///
/// Copyright 2020-2024 Patrick Pr�martin under AGPL 3.0 license.
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
/// Projets Delphi d'exemples d�velopp�s pendant la formation en ligne gratuite pour apprendre � programmer en utilisant le langage Pascal dans Delphi r�alis�e en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial li� � la pand�mie du virus COVID-19.
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
/// Signature : b20ec0451c63dfd9e33a7df11389bd643f132704
/// ***************************************************************************
/// </summary>

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses FMX.DialogService;

procedure TForm1.Button1Click(Sender: TObject);
var
  ch: string;
begin
  ShowMessage('Hello World');
  ch := inputbox('titre de la fen�tre', 'message du champ de saisie',
    'valeur par d�faut');
  inputbox('titre de la fen�tre', 'message du champ de saisie',
    'valeur par d�faut',
    procedure(const AResult: TModalResult; const AValue: string)
    begin
      if not(AResult = mrcancel) then
        ShowMessage(AValue)
      else
        ShowMessage('cancel');
    end);
  ShowMessage(ch);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  ch: string;
begin
  tdialogService.ShowMessage('Hello World');
  tdialogService.inputquery('titre de la fen�tre',
    ['champ 1', 'champ 2', 'champ 3'], ['valeur 1', 'valeur 2', 'valeur 3'],
    procedure(const AResult: TModalResult; const AValues: array of string)
    var
      i: integer;
    begin
      if not(AResult = mrcancel) then
        for i := 0 to length(AValues) - 1 do
          tdialogService.ShowMessage(AValues[i])
      else
        tdialogService.ShowMessage('cancel');
    end);
  tdialogService.ShowMessage('coucou');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  tdialogService.ShowMessage('coucou 1');
  tdialogService.MessageDialog('mon message � afficher',
    TMsgDlgType.mtConfirmation, [tmsgdlgbtn.mbYes, tmsgdlgbtn.mbNo],
    tmsgdlgbtn.mbNo, 0,
    procedure(const AResult: TModalResult)
    begin
      if AResult = mryes then
        tdialogService.ShowMessage('yes',
          procedure(const AResult: TModalResult)
          begin
            tdialogService.ShowMessage('fin');
          end)
        // begin
        // ShowMessage('yes');
        // ShowMessage('fin');
        // end
      else
        tdialogService.ShowMessage('no');
    end);
  tdialogService.ShowMessage('coucou 2');
end;

initialization

tdialogService.PreferredMode := tdialogService.tpreferredmode.async;

end.
