unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Button2: TButton;
    Layout2: TLayout;
    procedure Button1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage(Edit1.Text);
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
ShowMessage('Hello World');
end;

end.
