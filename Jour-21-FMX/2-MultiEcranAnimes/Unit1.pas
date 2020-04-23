unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Ani;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    lblEcran1: TLabel;
    Rectangle2: TRectangle;
    lblEcran2: TLabel;
    Button1: TButton;
    Button2: TButton;
    DroiteVersGauche: TFloatAnimation;
    Button3: TButton;
    AnimOpacite: TFloatAnimation;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DroiteVersGaucheFinish(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure AnimOpaciteFinish(Sender: TObject);
  private
    { Déclarations privées }
    Ecran1Vers2Animation: TFloatAnimation;
    procedure AfficheEcran1;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.AfficheEcran1;
begin
  Layout1.Visible := true;
  Layout1.Align := TAlignLayout.Contents;
  Layout2.Visible := false;
end;

procedure TForm1.AnimOpaciteFinish(Sender: TObject);
begin
  AnimOpacite.Enabled := false;
  Layout2.Visible := not AnimOpacite.Inverse;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Layout2.Align := TAlignLayout.none;
  Layout2.SetBounds(Clientwidth, 0, Clientwidth, Clientheight);
  Layout2.Visible := true;
  Layout2.Opacity := 1;
  Ecran1Vers2Animation := DroiteVersGauche;
  DroiteVersGauche.Inverse := false;
  DroiteVersGauche.StartValue := Clientwidth;
  DroiteVersGauche.Enabled := true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Layout2.Align := TAlignLayout.none;
  Layout2.Opacity := 0;
  Layout2.SetBounds(0, 0, Clientwidth, Clientheight);
  Layout2.Visible := true;
  Ecran1Vers2Animation := AnimOpacite;
  AnimOpacite.Inverse := false;
  AnimOpacite.Enabled := true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  DroiteVersGauche.StartValue := Clientwidth;
  Ecran1Vers2Animation.Inverse := true;
  Ecran1Vers2Animation.Enabled := true;
end;

procedure TForm1.DroiteVersGaucheFinish(Sender: TObject);
begin
  DroiteVersGauche.Enabled := false;
  Layout2.Visible := not DroiteVersGauche.Inverse;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  AfficheEcran1;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  for var i := 0 to childrenCount - 1 do
    if children[i] is TLayout then
    begin
      var
        l: TLayout;
      l := children[i] as TLayout;
      l.SetBounds(l.Position.X, l.Position.Y, Clientwidth, Clientheight);
    end;
end;

end.
