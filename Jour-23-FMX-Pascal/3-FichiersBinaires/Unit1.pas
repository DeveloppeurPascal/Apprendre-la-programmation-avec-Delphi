unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox;

type
  TForm1 = class(TForm)
    btnFileIntegerWrite: TButton;
    ListBox1: TListBox;
    btnFileintegerRead: TButton;
    btnFileCardinalRead: TButton;
    btnFileByteRead: TButton;
    btnFileStream: TButton;
    procedure btnFileIntegerWriteClick(Sender: TObject);
    procedure btnFileintegerReadClick(Sender: TObject);
    procedure btnFileCardinalReadClick(Sender: TObject);
    procedure btnFileByteReadClick(Sender: TObject);
    procedure btnFileStreamClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.IOUtils;

procedure TForm1.btnFileByteReadClick(Sender: TObject);
var
  nomfichier: string;
  monfichier: file of byte;
  i: integer;
  v: byte;
begin
  ListBox1.Items.Clear;
  nomfichier := tpath.combine(tpath.getdocumentspath, 'entiers.dat');
  assignfile(monfichier, nomfichier);
  reset(monfichier);
  // for i := 0 to 100 do  // peut planter si nombre d'enregistrements pas correct
  // begin
  // read(monfichier, v);
  // ListBox1.Items.Add(v.ToString);
  // end;
  i := 0;
  while not eof(monfichier) do
  begin
    read(monfichier, v);
    ListBox1.Items.Add(v.ToString);
    inc(i);
  end;
  ListBox1.Items.Insert(0, 'nb elem : ' + i.ToString);
  closefile(monfichier);
end;

procedure TForm1.btnFileCardinalReadClick(Sender: TObject);
var
  nomfichier: string;
  monfichier: file of cardinal;
  i: integer;
  v: cardinal;
begin
  ListBox1.Items.Clear;
  nomfichier := tpath.combine(tpath.getdocumentspath, 'entiers.dat');
  assignfile(monfichier, nomfichier);
  reset(monfichier);
  // for i := 0 to 100 do  // peut planter si nombre d'enregistrements pas correct
  // begin
  // read(monfichier, v);
  // ListBox1.Items.Add(v.ToString);
  // end;
  i := 0;
  while not eof(monfichier) do
  begin
    read(monfichier, v);
    ListBox1.Items.Add(v.ToString);
    inc(i);
  end;
  ListBox1.Items.Insert(0, 'nb elem : ' + i.ToString);
  closefile(monfichier);
end;

procedure TForm1.btnFileIntegerWriteClick(Sender: TObject);
var
  nomfichier: string;
  monfichier: file of integer;
  i: integer;
  v: integer;
begin
  nomfichier := tpath.combine(tpath.getdocumentspath, 'entiers.dat');
  assignfile(monfichier, nomfichier);
  rewrite(monfichier);
  for i := 0 to 80 do
  begin
    v := i - 40;
    write(monfichier, v);
  end;
  closefile(monfichier);
end;

procedure TForm1.btnFileStreamClick(Sender: TObject);
var
  s: tfilestream;
  nomfichier: string;
  vi: integer;
  vc: cardinal;
  vb: byte;
  i: integer;
begin
  nomfichier := tpath.combine(tpath.getdocumentspath, 'entiers.dat');
  i := 0;
  s := tfilestream.Create(nomfichier, fmopenread);
  try
    s.Position := 0;
    while s.Position < s.Size do
    begin
      case random(3) of
        2:
          begin
            s.Read(vi, sizeof(vi));
            ListBox1.Items.Add(vi.ToString);
          end;
        1:
          begin
            s.Read(vc, sizeof(vc));
            ListBox1.Items.Add(vi.ToString);
          end;
      else
        s.Read(vb, sizeof(vb));
        ListBox1.Items.Add(vi.ToString);
      end;
      inc(i);
    end;
  finally
    s.Free;
  end;
  ListBox1.Items.Insert(0, 'Nb elem = ' + i.ToString);
end;

procedure TForm1.btnFileintegerReadClick(Sender: TObject);
var
  nomfichier: string;
  monfichier: file of integer;
  i, v: integer;
begin
  ListBox1.Items.Clear;
  nomfichier := tpath.combine(tpath.getdocumentspath, 'entiers.dat');
  assignfile(monfichier, nomfichier);
  try
    try
      reset(monfichier);
    except
      // erreur liée au fichier
      raise exception.Create('erreur liée au fichier');
    end;
    // for i := 0 to 100 do  // peut planter si nombre d'enregistrements pas correct
    // begin
    // read(monfichier, v);
    // ListBox1.Items.Add(v.ToString);
    // end;
    i := 0;
    while not eof(monfichier) do
    begin
      read(monfichier, v);
      ListBox1.Items.Add(v.ToString);
      inc(i);
    end;
    ListBox1.Items.Insert(0, 'nb elem : ' + i.ToString);
    closefile(monfichier);
  except
    // erreur dans la procédure
  end;
end;

end.
