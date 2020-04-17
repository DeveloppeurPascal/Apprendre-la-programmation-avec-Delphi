unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.ListBox, FMX.Edit, FMX.Controls.Presentation, FMX.Gestures;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    ListBox1: TListBox;
    Button1: TButton;
    GestureManager1: TGestureManager;
    ListBox2: TListBox;
    Button2: TButton;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxGroupFooter1: TListBoxGroupFooter;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  ListBox1.Items.Add(Edit1.Text);
  Edit1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Item: TListBoxItem;
begin
  for var i := ListBox1.Items.Count - 1 downto 0 do
  begin
    if ListBox1.ListItems[i].IsSelected then
    begin
      Item := ListBox1.ListItems[i];
      Item.StyledSettings := Item.StyledSettings - [tstyledsetting.Style];
      Item.TextSettings.Font.Style := [TFontStyle.fsBold, TFontStyle.fsItalic];
      Item.IsSelected := false;
      ListBox1.RemoveObject(Item);
      ListBox2.AddObject(Item);
    end;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  for var i := ListBox1.Items.Count - 1 downto 0 do
  begin
    if ListBox1.ListItems[i].IsSelected then
      ListBox2.Items.Add(ListBox1.ListItems[i].Text);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ListBox1.Clear;
  ListBox2.Clear;
end;

procedure TForm1.ListBox1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = igiZoom then
  begin
    // EventInfo.Distance
  end;
end;

procedure TForm1.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  // showmessage(Item.Text);
end;

end.
