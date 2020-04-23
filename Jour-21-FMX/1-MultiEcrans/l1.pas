unit l1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TForm4 = class(TForm)
    ecran1: TLayout;
    ecran2: TLayout;
    ecran3: TLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Déclarations privées }
    EcranActuel: TLayout;
    EcranVersLequelRevenirDepuisLEcran2: TLayout;
    procedure Ecran3FermeAvec(AModalResult: TModalResult);
    procedure ChangeEcran(Ancien, Nouveau: TLayout);
    procedure AfficheEcran(Nouveau: TLayout);
  public
    { Déclarations publiques }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.AfficheEcran(Nouveau: TLayout);
begin
  if assigned(EcranActuel) then
    EcranActuel.Visible := false;
  Nouveau.Visible := true;
  EcranActuel := Nouveau;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  EcranVersLequelRevenirDepuisLEcran2 := EcranActuel;
  AfficheEcran(ecran2);
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  AfficheEcran(ecran3);
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  AfficheEcran(EcranVersLequelRevenirDepuisLEcran2);
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  AfficheEcran(ecran1);
  Ecran3FermeAvec(mrYes);
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  AfficheEcran(ecran1);
  Ecran3FermeAvec(mrNo);
end;

procedure TForm4.ChangeEcran(Ancien, Nouveau: TLayout);
begin
  Ancien.Visible := false;
  Nouveau.Visible := true;
end;

procedure TForm4.Ecran3FermeAvec(AModalResult: TModalResult);
begin
  if AModalResult = mrYes then
    showmessage('yes')
  else
    showmessage('no');
end;

procedure TForm4.FormCreate(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ChildrenCount - 1 do
    if (children[i] is TLayout) then
      (children[i] as TLayout).Visible := false;
  ecran1.Visible := true;
  EcranActuel := ecran1;
end;

end.
