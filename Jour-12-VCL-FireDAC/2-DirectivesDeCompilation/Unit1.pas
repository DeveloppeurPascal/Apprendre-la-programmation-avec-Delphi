unit Unit1;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

const
  MaConstante = 54;

var
  Form1: TForm1;

implementation

{$R *.dfm}
// ghghkhkh

(*
  dfhgfh
  gfufgghfhg
  dfgfg
*)

{
  hfgfgjf
  fgjghjghjkgh
  fhgfgjfhj
}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Showmessage('debug on');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Showmessage('debug off');
end;

{$DEFINE TEST}
{$DEFINE NOTEST}
procedure TForm1.Button3Click(Sender: TObject);
begin
{$IF Defined(DEBUG) and Defined(TEST)}
  Showmessage('debug + test');
{$ELSEIF Defined(DEBUG) and Defined(NOTEST)}
  Showmessage('debug + notest');
{$ENDIF}
{$IFDEF NOTEST}
  Showmessage('notest');
{$ENDIF}
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
{$IFDEF DEBUG}
  Button1.Visible := true;
  Button2.Visible := false;
{$ELSE}
  Button1.Visible := false;
  Button2.Visible := true;
{$ENDIF}
  // ou
{$IFDEF DEBUG}
  Button1.Visible := true;
{$ELSE}
  Button1.Visible := false;
{$ENDIF}
  Button2.Visible := not Button1.Visible;
end;

end.
