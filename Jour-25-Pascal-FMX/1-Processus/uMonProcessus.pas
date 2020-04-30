unit uMonProcessus;

interface

uses
  System.Classes;

type
  TMonProcessus = class(TThread)
  protected
    procedure Execute; override;
  end;

implementation

uses System.SysUtils;
{
  Important : Les m�thodes et les propri�t�s des objets des composants visuels peuvent seulement �tre
  utilis�es dans une m�thode appel�e avec Synchronize, par exemple

  Synchronize(UpdateCaption);

  et UpdateCaption pourrait ressembler �

  procedure MonProcessus.UpdateCaption;
  begin
  Form1.Caption := 'Mis � jour dans un thread';
  end;

  ou

  Synchronize(
  procedure
  begin
  Form1.Caption := 'Mis � jour dans un thread via une m�thode anonyme'
  end
  )
  );

  o� une m�thode anonyme est transmise.

  De m�me, le d�veloppeur peut appeler la m�thode Queue avec des param�tres similaires �
  ceux ci-dessus, au lieu de passer une autre classe TThread en premier param�tre, en
  pla�ant le thread appelant dans une file d'attente avec l'autre thread.

}

{ MonProcessus }

procedure TMonProcessus.Execute;
var
  i: integer;
begin
  NameThreadForDebugging('mon processus');
  i := 0;
  while (not terminated) and (i < 100) do
  begin
//    beep;
    sleep(200);
    inc(i);
  end;
end;

var
  MonProcessus: TMonProcessus;

initialization

MonProcessus := TMonProcessus.Create;
MonProcessus.FreeOnTerminate := true;
//MonProcessus.Execute;

end.
