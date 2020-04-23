unit f1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses f2, f3;

procedure TForm1.Button1Click(Sender: TObject);
begin
  form2.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if (form3.ShowModal = mrYes) then
    showmessage('Yes')
  else
    showmessage('No');
end;

end.
