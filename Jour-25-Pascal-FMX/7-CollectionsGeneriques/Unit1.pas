unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox,
  System.Generics.Collections;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure bidule;
  end;

TMesListesGeneriques < t >= class(tlist<t>)public
procedure SaveToFile;
procedure LoadFromFile;
end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

type
  TMesEntiers = tlist<integer>;
  TMesEntiersBis = TStack<byte>;
  TCleValeur = TDictionary<string, string>;
  TMesFiches = tlist<TForm>;

procedure TForm1.bidule;
begin
  showmessage('bidule');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i, valeur: integer;
  ListeEntiers: tlist<integer>;
  Liste2: TMesEntiers;
  Liste3: TMesEntiersBis;
  mondico: TCleValeur;
  ch: string;
  MesFiches: TMesFiches;
begin
  ListeEntiers := tlist<integer>.Create;
  try
    Liste2 := TMesEntiers.Create;
    try
      Liste3 := TMesEntiersBis.Create;
      try
        for i := 0 to 100 do
          ListeEntiers.Add(i);

        for valeur in ListeEntiers do
          ListBox1.Items.Add(valeur.ToString);

        for valeur in ListeEntiers do
          if (valeur mod 2 = 0) then
            Liste2.Add(valeur);

        for valeur in Liste2 do
          ListBox2.Items.Add(valeur.ToString);

        for valeur in Liste2 do
          Liste3.Push(valeur);

        while Liste3.count > 0 do
        begin
          valeur := Liste3.Pop;
          ListBox3.Items.Add(valeur.ToString);
        end;
      finally
        FreeAndNil(Liste3);
      end;
    finally
      FreeAndNil(Liste2);
    end;
  finally
    FreeAndNil(ListeEntiers);
  end;

  mondico := TCleValeur.Create;
  try
    mondico.Add('ma clé 1', 'ma valeur 1');
    for ch in mondico.Keys do
      showmessage(ch);
  finally
    FreeAndNil(mondico);
  end;

  MesFiches := TMesFiches.Create;
  try
    MesFiches.Add(Form1);
    Form1.bidule;
    // pas ok car tform : MesFiches[0].bidule;
    // ok : MesFiches[0].Close;
    if (MesFiches[0] is TForm1) then
      (MesFiches[0] as TForm1).bidule;
  finally
    FreeAndNil(MesFiches);
  end;
end;

{ TMesListesGeneriques<t> }

procedure TMesListesGeneriques<t>.LoadFromFile;
begin

end;

procedure TMesListesGeneriques<t>.SaveToFile;
begin

end;

end.
