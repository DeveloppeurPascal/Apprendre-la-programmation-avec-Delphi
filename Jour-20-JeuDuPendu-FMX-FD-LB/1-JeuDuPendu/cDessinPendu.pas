unit cDessinPendu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects;

type
  TDessinPendu = class(TFrame)
    elem01: TRectangle;
    elem02: TRectangle;
    elem03: TRectangle;
    elem04: TLine;
    elem05: TCircle;
    elem06: TRectangle;
    elem07: TRectangle;
    elem10: TRectangle;
    elem11: TRectangle;
    elem09: TRectangle;
    elem08: TRectangle;
  private
    { Déclarations privées }
    NombreMorceauxRestants: integer;
  public
    { Déclarations publiques }
    procedure MasqueLeDessin;
    procedure AfficheUnMembre;
    function isPartiePerdue: boolean;
  end;

implementation

{$R *.fmx}
{ TDessinPendu }

procedure TDessinPendu.AfficheUnMembre;
var
  i: integer;
  num: integer;
  sortir: boolean;
begin
  dec(NombreMorceauxRestants);
  // version IF manuelle (pas souple en terme d'évolutions)
  if not elem01.Visible then
    elem01.Visible := true
  else if not elem02.Visible then
    elem02.Visible := true
  else if not elem03.Visible then
    elem03.Visible := true
  else if not elem04.Visible then
    elem04.Visible := true
  else if not elem05.Visible then
    elem05.Visible := true
  else if not elem06.Visible then
    elem06.Visible := true
  else if not elem07.Visible then
    elem07.Visible := true
  else if not elem08.Visible then
    elem08.Visible := true
  else if not elem09.Visible then
    elem09.Visible := true
  else if not elem10.Visible then
    elem10.Visible := true
  else if not elem11.Visible then
    elem11.Visible := true;
  // version boucle (aucune modif à faire si évolution du dessin)
  // sortir := false;
  // num := 0;
  // while (not sortir) and (num < ChildrenCount) do
  // begin
  // inc(num);
  // for i := 0 to ChildrenCount - 1 do
  // if children[i] is TShape then
  // begin
  // if ((children[i] as TShape).Tag = num) and
  // (not(children[i] as TShape).Visible) then
  // begin
  // (children[i] as TShape).Visible := true;
  // sortir := true;
  // break;
  // end;
  // end;
  // end;
end;

function TDessinPendu.isPartiePerdue: boolean;
begin
  result := NombreMorceauxRestants < 1;
end;

procedure TDessinPendu.MasqueLeDessin;
var
  i: integer;
begin
  NombreMorceauxRestants := 0;
  for i := 0 to ChildrenCount - 1 do
    if children[i] is TShape then
    begin
      (children[i] as TShape).Visible := false;
      inc(NombreMorceauxRestants);
    end;
end;

end.
