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
