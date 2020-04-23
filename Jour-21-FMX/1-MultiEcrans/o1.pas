unit o1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Actions, FMX.ActnList;

type
  TForm6 = class(TForm)
    TabControl1: TTabControl;
    ecran1: TTabItem;
    ecran2: TTabItem;
    ecran3: TTabItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Déclarations privées }
    EcranActuel: TTabItem;
    procedure AfficheEcran(Tab: TTabItem);
  public
    { Déclarations publiques }
  end;

var
  Form6: TForm6;

implementation

{$R *.fmx}

procedure TForm6.AfficheEcran(Tab: TTabItem);
begin
  // if assigned(EcranActuel) then visible := false;
  // TabControl1.ActiveTab := Tab;
  ChangeTabAction1.Tab := Tab;
  ChangeTabAction1.Execute;
  EcranActuel := Tab;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  AfficheEcran(ecran2);
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  AfficheEcran(ecran3);
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
  AfficheEcran(ecran1);
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
  AfficheEcran(ecran2);
end;

procedure TForm6.Button5Click(Sender: TObject);
begin
  AfficheEcran(ecran1);
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  TabControl1.ActiveTab := ecran1;
  EcranActuel := ecran1;
end;

end.
