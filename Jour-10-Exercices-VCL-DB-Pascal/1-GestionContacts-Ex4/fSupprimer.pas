unit fSupprimer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TfrmSupprimer = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmSupprimer: TfrmSupprimer;

implementation

{$R *.dfm}

procedure TfrmSupprimer.BitBtn1Click(Sender: TObject);
begin
  dm.tabContacts.Delete;
end;

end.
