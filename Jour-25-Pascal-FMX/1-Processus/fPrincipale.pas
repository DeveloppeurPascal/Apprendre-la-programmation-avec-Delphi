unit fPrincipale;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox;

type
  TForm1 = class(TForm)
    btnThreadAnonyme: TButton;
    btnTask: TButton;
    btnParallelFor: TButton;
    btnFor: TButton;
    ListBox1: TListBox;
    ListBox2: TListBox;
    procedure btnThreadAnonymeClick(Sender: TObject);
    procedure btnTaskClick(Sender: TObject);
    procedure btnParallelForClick(Sender: TObject);
    procedure btnForClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.threading;

procedure TForm1.btnForClick(Sender: TObject);
var
  i: integer;
begin
  ListBox2.Items.add(datetimetostr(now));
  for i := 0 to 50 do
  begin
    sleep(100);
    ListBox2.Items.add(i.tostring);
  end;
  ListBox2.Items.add(datetimetostr(now));
end;

procedure TForm1.btnParallelForClick(Sender: TObject);
begin
  ListBox1.Items.add(datetimetostr(now));
  TParallel.&For(0, 50,
    procedure(i: integer)
    begin
      sleep(100);
      tthread.Queue(nil,
        procedure
        begin
          ListBox1.Items.add(i.tostring);
        end);
    end);
  ListBox1.Items.add(datetimetostr(now));
end;

procedure TForm1.btnTaskClick(Sender: TObject);
begin
  ttask.run(
    procedure
    var
      i: integer;
    begin
      for i := 1 to 10 do
      begin
        beep;
        sleep(500);
      end;
    end);
end;

procedure TForm1.btnThreadAnonymeClick(Sender: TObject);
var
  MonThread: tthread;
begin
  tthread.CreateAnonymousThread(
    procedure
    var
      i: integer;
    begin
      for i := 1 to 10 do
      begin
        beep;
        sleep(500);
      end;
    end).Start;

  MonThread := tthread.CreateAnonymousThread(
    procedure
    var
      i: integer;
    begin
      for i := 1 to 10 do
      begin
        beep;
        sleep(500);
      end;
      // TODO : vérifier boucle de sortie
//       while not terminated do
//       begin
//       end;
    end);
  MonThread.Start;
end;

end.
