/// <summary>
/// ***************************************************************************
///
/// Apprendre la programmation avec Delphi
///
/// Copyright 2020-2024 Patrick Prémartin under AGPL 3.0 license.
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
/// Projets Delphi d'exemples développés pendant la formation en ligne gratuite pour apprendre à programmer en utilisant le langage Pascal dans Delphi réalisée en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial lié à la pandémie du virus COVID-19.
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
/// Signature : 5a3dcfba1f7470bc263347e511fcd9985fc6ecbb
/// ***************************************************************************
/// </summary>

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.Menus, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.StdActns,
  System.ImageList, FMX.ImgList, FMX.Layouts, FMX.Objects;

type
  TForm1 = class(TForm)
    ActionList1: TActionList;
    Button1: TButton;
    MenuBar1: TMenuBar;
    Button2: TButton;
    Action1: TAction;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    WindowClose1: TWindowClose;
    Button3: TButton;
    ImageList1: TImageList;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    ProgressBar1: TProgressBar;
    Action2: TAction;
    Button4: TButton;
    blocage: TLayout;
    AniIndicator1: TAniIndicator;
    Rectangle1: TRectangle;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TForm1.Action1Execute(Sender: TObject);
begin
  ShowMessage('Action1');
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
  ShowMessage(ProgressBar1.Value.ToString);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Button4.enabled := false;
  blocage.Visible := true;
  AniIndicator1.enabled := true;
  blocage.BringToFront;
  ttask.run(
    procedure
    var
      i: integer;
    begin
      try
        for i := trunc(ProgressBar1.Min) to trunc(ProgressBar1.Max) do
        begin
          tthread.Synchronize(nil,
            procedure
            begin
              ProgressBar1.Value := i;
            end);
          sleep(20);
          // raise Exception.Create('oups');
        end;
      finally
        tthread.Queue(nil,
          procedure
          begin
            Button4.enabled := true;
            blocage.Visible := false;
            AniIndicator1.enabled := false;
          end);
      end;
    end);
end;

procedure TForm1.FormCloseQuery(Sender: TObject;

var CanClose: Boolean);
begin
  CanClose := not blocage.Visible;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  blocage.Visible := false;
  AniIndicator1.enabled := false;
end;

end.
