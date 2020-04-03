unit fAjouter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmAjouter = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmAjouter: TfrmAjouter;

implementation

{$R *.dfm}

procedure TfrmAjouter.BitBtn1Click(Sender: TObject);
begin
dm.tabContacts.Post;
end;

procedure TfrmAjouter.BitBtn2Click(Sender: TObject);
begin
dm.tabContacts.Cancel;
end;

procedure TfrmAjouter.FormShow(Sender: TObject);
begin
dm.tabContacts.Append;
end;

end.
