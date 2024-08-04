/// <summary>
/// ***************************************************************************
///
/// Apprendre la programmation avec Delphi
///
/// Copyright 2020-2024 Patrick Pr�martin under AGPL 3.0 license.
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
/// Projets Delphi d'exemples d�velopp�s pendant la formation en ligne gratuite pour apprendre � programmer en utilisant le langage Pascal dans Delphi r�alis�e en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial li� � la pand�mie du virus COVID-19.
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
/// Signature : 247511f0c0011e770724b4e18fadb459ac69efe6
/// ***************************************************************************
/// </summary>

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
    { D�clarations priv�es }
  public
    { D�clarations publiques }
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
      // TODO : v�rifier boucle de sortie
//       while not terminated do
//       begin
//       end;
    end);
  MonThread.Start;
end;

end.
