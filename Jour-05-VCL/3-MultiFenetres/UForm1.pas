unit UForm1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uForm2, uForm3, Unit4;

procedure TForm1.Button1Click(Sender: TObject);
begin
  form2.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  f: tform2;
begin
  f := tform2.Create(Self);
  f.Show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if (mrClose = form2.ShowModal) then
    showmessage('mrClose');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  case form3.ShowModal of
    mrOk:
      showmessage('mrOk');
    mrCancel:
      showmessage('mrCancel');
    mrClose:
      showmessage('mrClose');
  else
    showmessage('ModalResult inconnu');
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  OuvreForm3;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.
