unit Unit1;

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
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

uses FMX.DialogService;

procedure TForm1.Button1Click(Sender: TObject);
var
  ch: string;
begin
  ShowMessage('Hello World');
  ch := inputbox('titre de la fenêtre', 'message du champ de saisie',
    'valeur par défaut');
  inputbox('titre de la fenêtre', 'message du champ de saisie',
    'valeur par défaut',
    procedure(const AResult: TModalResult; const AValue: string)
    begin
      if not(AResult = mrcancel) then
        ShowMessage(AValue)
      else
        ShowMessage('cancel');
    end);
  ShowMessage(ch);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  ch: string;
begin
  tdialogService.ShowMessage('Hello World');
  tdialogService.inputquery('titre de la fenêtre',
    ['champ 1', 'champ 2', 'champ 3'], ['valeur 1', 'valeur 2', 'valeur 3'],
    procedure(const AResult: TModalResult; const AValues: array of string)
    var
      i: integer;
    begin
      if not(AResult = mrcancel) then
        for i := 0 to length(AValues) - 1 do
          tdialogService.ShowMessage(AValues[i])
      else
        tdialogService.ShowMessage('cancel');
    end);
  tdialogService.ShowMessage('coucou');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  tdialogService.ShowMessage('coucou 1');
  tdialogService.MessageDialog('mon message à afficher',
    TMsgDlgType.mtConfirmation, [tmsgdlgbtn.mbYes, tmsgdlgbtn.mbNo],
    tmsgdlgbtn.mbNo, 0,
    procedure(const AResult: TModalResult)
    begin
      if AResult = mryes then
        tdialogService.ShowMessage('yes',
          procedure(const AResult: TModalResult)
          begin
            tdialogService.ShowMessage('fin');
          end)
        // begin
        // ShowMessage('yes');
        // ShowMessage('fin');
        // end
      else
        tdialogService.ShowMessage('no');
    end);
  tdialogService.ShowMessage('coucou 2');
end;

initialization

tdialogService.PreferredMode := tdialogService.tpreferredmode.async;

end.
