unit cf1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, cc1, cc2, cc3;

type
  TForm5 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
    EcranActuel: TFrame;
    NumEcranActuel: integer;
    ecran1: TFrame1;
    ecran2: TFrame2;
    ecran3: TFrame3;
  public
    { Déclarations publiques }
    // procedure AfficheEcran<T: TFrame, constructor>(ecran: T);
    procedure AfficheEcran(NumEcran: integer);
    procedure RetourEcran3(AModalResult: TModalResult);
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}
// procedure TForm5.AfficheEcran<T>(ecran: T);
// begin
// if assigned(EcranActuel) then
// EcranActuel.Visible := false;
// if assigned(ecran) then
// ecran.Visible := true
// else
// begin
// ecran := T.create(Self);
// ecran.name := '';
// ecran.parent := Self;
// ecran.align := talignlayout.Contents;
// end;
// EcranActuel := ecran;
// end;

procedure TForm5.AfficheEcran(NumEcran: integer);
var
  EcranAAfficher: TFrame;
begin
  case NumEcran of
    3:
      begin
        if not assigned(ecran3) then
        begin
          ecran3 := TFrame3.create(Self);
          ecran3.name := '';
          ecran3.parent := Self;
          ecran3.align := talignlayout.Contents;
        end;
        EcranAAfficher := ecran3;
      end;
    2:
      begin
        if not assigned(ecran2) then
        begin
          ecran2 := TFrame2.create(Self);
          ecran2.name := '';
          ecran2.parent := Self;
          ecran2.align := talignlayout.Contents;
        end;
        EcranAAfficher := ecran2;
        ecran2.EcranPrecedent := NumEcranActuel;
      end;
  else // ecran 1 par défaut
    if not assigned(ecran1) then
    begin
      ecran1 := TFrame1.create(Self);
      ecran1.name := '';
      ecran1.parent := Self;
      ecran1.align := talignlayout.Contents;
    end;
    EcranAAfficher := ecran1;
  end;
  if assigned(EcranActuel) then
    EcranActuel.Visible := false;
  EcranAAfficher.Visible := true;
  EcranActuel := EcranAAfficher;
  NumEcranActuel := NumEcran;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  AfficheEcran(1);
end;

procedure TForm5.RetourEcran3(AModalResult: TModalResult);
begin
  if AModalResult = mryes then
    Showmessage('Yes')
  else
    Showmessage('No');
  AfficheEcran(1);
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.
