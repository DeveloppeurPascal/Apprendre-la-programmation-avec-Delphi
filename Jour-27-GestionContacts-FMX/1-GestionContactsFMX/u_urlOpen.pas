(* C2PP
  ***************************************************************************

  Apprendre la programmation avec Delphi

  Copyright 2020-2025 Patrick Prémartin under MIT license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Projets Delphi d'exemples développés pendant la formation en ligne gratuite pour apprendre à programmer en utilisant le langage Pascal dans Delphi réalisée en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial lié à la pandémie du virus COVID-19.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://apprendre-delphi.fr

  Project site :
  https://github.com/DeveloppeurPascal/Apprendre-la-programmation-avec-Delphi

  ***************************************************************************
  File last update : 2025-10-05T16:42:28.425+02:00
  Signature : a963592aa315d291db4b5c767bac8571fc7f2a06
  ***************************************************************************
*)

unit u_urlOpen;

interface

/// <summary>Launch URL website on the default browser</summary>
/// <param name="URL">Absolute address of the website to open in the web browser</param>
procedure url_Open_In_Browser(URL: string);

implementation

uses
 System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
{$IF Defined(IOS)}
macapi.helpers, iOSapi.Foundation, FMX.Helpers.iOS;
{$ELSEIF Defined(ANDROID)}
 Androidapi.JNI.GraphicsContentViewText,
 Androidapi.Helpers;
{$ELSEIF Defined(MACOS)}
  Posix.Stdlib;
{$ELSEIF Defined(MSWINDOWS)}
 Winapi.ShellAPI, Winapi.Windows;
{$ENDIF}

procedure url_Open_In_Browser(URL: string);
{$IF Defined(ANDROID)}
var
 Intent: JIntent;
{$ENDIF}
begin
{$IF Defined(ANDROID)}
 Intent := TJIntent.Create;
 Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
 Intent.setData(StrToJURI(URL));
 // SharedActivity.startActivity(Intent);
 tandroidhelper.Activity.startActivity(Intent);
{$ELSEIF Defined(MSWINDOWS)}
 ShellExecute(0, 'OPEN', PWideChar(URL), nil, nil, SW_SHOWNORMAL);
{$ELSEIF Defined(IOS)}
 SharedApplication.OpenURL(StrToNSUrl(Url));
{$ELSEIF Defined(MACOS)}
  _system(PAnsiChar('open ' + AnsiString(URL)));
{$ENDIF}
end;

end.
