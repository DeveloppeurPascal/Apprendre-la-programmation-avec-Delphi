unit Unit2;

interface

type
{$SCOPEDENUMS ON}
  TCouleur = (rouge, noir, vert, bleu=50, jaune, violet, orange);
  TCouleurs = set of TCouleur;
  TCouleurPrimaire = (rouge, jaune, bleu);
  TCouleurPrimaires = set of TCouleurPrimaire;
{$SCOPEDENUMS OFF}

implementation

procedure maproc;
var
  c1, c2: TCouleur;
  c3, c4: TCouleurPrimaire;
  cs: TCouleurs;
begin
  c1 := TCouleur.bleu;
  c2 := bleu;
  c3 := TCouleurPrimaire.bleu;
  c4 := bleu;

  cs := [TCouleur.rouge, TCouleur.jaune] + c1;
  if (TCouleur.jaune in cs) then
    cs := cs - TCouleur.jaune;
end;

end.
