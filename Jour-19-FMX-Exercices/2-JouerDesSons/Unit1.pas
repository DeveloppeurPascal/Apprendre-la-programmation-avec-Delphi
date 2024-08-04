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
/// Signature : ce071dce958249b2b6a6034ebcbfb0fa53e36bd2
/// ***************************************************************************
/// </summary>

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Media;

type
  TForm1 = class(TForm)
    MediaPlayer1: TMediaPlayer;
    MediaPlayer2: TMediaPlayer;
    Switch1: TSwitch;
    Switch2: TSwitch;
    Timer1: TTimer;
    MediaPlayer3: TMediaPlayer;
    procedure Timer1Timer(Sender: TObject);
    procedure Switch2Switch(Sender: TObject);
    procedure Switch1Switch(Sender: TObject);
  private
    { Déclarations privées }
    procedure OnOffSound(Switch: TSwitch; Player: TMediaPlayer);
    procedure ControleFin(Switch: TSwitch; Player: TMediaPlayer);
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ControleFin(Switch: TSwitch; Player: TMediaPlayer);
begin
  if Assigned(Player.Media) and (Player.CurrentTime >= Player.Duration) and
    (Switch.IsChecked) then
  //  if Assigned(Player.Media) then
//      if (Player.CurrentTime >= Player.Duration) then
//        if (Switch.IsChecked) then
        begin
          Player.CurrentTime := 0;
          Player.Play;
        end;
end;

procedure TForm1.OnOffSound(Switch: TSwitch; Player: TMediaPlayer);
begin
  if Assigned(Player.Media) then
    if (Switch.IsChecked) then
    begin
      if (Player.State <> tmediastate.playing) then
        Player.Play;
    end
    else
    begin
      if (Player.State <> tmediastate.stopped) then
        Player.Stop;
    end;
end;

procedure TForm1.Switch1Switch(Sender: TObject);
begin
  OnOffSound(Switch1, MediaPlayer1);
end;

procedure TForm1.Switch2Switch(Sender: TObject);
begin
  OnOffSound(Switch2, MediaPlayer2);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ControleFin(Switch1, MediaPlayer1);
  ControleFin(Switch2, MediaPlayer2);
  ControleFin(nil, MediaPlayer3);
end;

end.
