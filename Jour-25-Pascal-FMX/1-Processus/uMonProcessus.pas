/// <summary>
/// ***************************************************************************
///
/// Apprendre la programmation avec Delphi
///
/// Copyright 2020-2024 Patrick Pr�martin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Projets Delphi d'exemples d�velopp�s pendant la formation en ligne gratuite pour apprendre � programmer en utilisant le langage Pascal dans Delphi r�alis�e en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial li� � la pand�mie du virus COVID-19.
///
/// ***************************************************************************
///
/// Author(s) :
///      Patrick PREMARTIN
///
/// Site :
///      https://apprendre-delphi.fr/apprendre-la-programmation-avec-delphi-2020.php
///
/// Project site :
///      https://github.com/DeveloppeurPascal/Apprendre-la-programmation-avec-Delphi
///
/// ***************************************************************************
/// File last update : 30/05/2024 20:10:12
/// Signature : 8abe53d628602179709560a8e1c679e426ddc003
/// ***************************************************************************
/// </summary>

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
