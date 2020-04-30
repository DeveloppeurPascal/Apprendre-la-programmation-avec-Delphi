unit cc3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFrame1 = class(TFrame)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation

{$R *.fmx}

uses cf1;

procedure TFrame1.Button1Click(Sender: TObject);
begin
  form5.AfficheEcran(2);
end;

procedure TFrame1.Button2Click(Sender: TObject);
begin
  form5.AfficheEcran(3);
end;

end.
