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
  Important : Les méthodes et les propriétés des objets des composants visuels peuvent seulement être
  utilisées dans une méthode appelée avec Synchronize, par exemple

  Synchronize(UpdateCaption);

  et UpdateCaption pourrait ressembler à

  procedure MonProcessus.UpdateCaption;
  begin
  Form1.Caption := 'Mis à jour dans un thread';
  end;

  ou

  Synchronize(
  procedure
  begin
  Form1.Caption := 'Mis à jour dans un thread via une méthode anonyme'
  end
  )
  );

  où une méthode anonyme est transmise.

  De même, le développeur peut appeler la méthode Queue avec des paramètres similaires à
  ceux ci-dessus, au lieu de passer une autre classe TThread en premier paramètre, en
  plaçant le thread appelant dans une file d'attente avec l'autre thread.

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
