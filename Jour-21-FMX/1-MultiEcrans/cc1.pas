unit cc1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFrame3 = class(TFrame)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure BtnYesNoClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation

{$R *.fmx}

uses cf1;

procedure TFrame3.BtnYesNoClick(Sender: TObject);
begin
  if (Sender is TButton) and (parent is TForm5) then
    (parent as TForm5).RetourEcran3((Sender as TButton).ModalResult)
  else
    raise Exception.Create('Sortie Ecran 3 impossible');
end;

procedure TFrame3.Button1Click(Sender: TObject);
begin
  if (parent is TForm5) then
    (parent as TForm5).AfficheEcran(2)
  else
    ShowMessage('Parent non reconnu, changement d''écran non géré');
end;

end.
