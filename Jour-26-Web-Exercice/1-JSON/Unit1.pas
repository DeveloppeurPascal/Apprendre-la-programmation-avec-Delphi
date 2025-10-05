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
  File last update : 2025-10-05T16:42:28.409+02:00
  Signature : 3bdfc492ba9db1df9f9ce71e764a45ff39d53304
  ***************************************************************************
*)

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.json;

procedure TForm1.Button1Click(Sender: TObject);
var
  jso: TJSONObject;
  glossary: TJSONObject;
  title: tjsonstring;
  jsv: tjsonvalue;
begin
  jso := TJSONObject.ParseJSONValue
    ('{"glossary": {"title": "example glossary","GlossDiv": {"title": "S","GlossList": {"GlossEntry": {"ID": "SGML","SortAs": "SGML","GlossTerm": "Standard Generalized Markup Language","Acronym": "SGML","Abbrev": "ISO 8879:1986","GlossSee": "markup"}}}}}')
    as TJSONObject;
  try
    Memo1.Lines.Add('----------');
    Memo1.Lines.Add(jso.tojson);
    Memo1.Lines.Add('----------');
    Memo1.Lines.Add(jso.ToString);
    Memo1.Lines.Add('----------');
    if jso.TryGetValue('glossary', jsv) then
    begin
      glossary := jsv as TJSONObject;
      if glossary.TryGetValue('title', jsv) then
      begin
        title := jsv as tjsonstring;
        Memo1.Lines.Add(title.tojson);
        Memo1.Lines.Add('----------');
        Memo1.Lines.Add(title.ToString);
        Memo1.Lines.Add('----------');
        Memo1.Lines.Add(title.Value);
        Memo1.Lines.Add('----------');
      end
      else
        Memo1.Lines.Add('Title absent');
    end
    else
      Memo1.Lines.Add('Glossary absent');
  finally
    freeandnil(jso);
  end;

  jso := TJSONObject.create;
  try
    jso.AddPair('chaine', 'ma chaine');
    jso.AddPair('nombre', tjsonnumber.create(42));
    jso.AddPair('boolean', tjsonbool.create(true));
    Memo1.Lines.Add(jso.tojson);
    Memo1.Lines.Add('----------');
  finally
    freeandnil(jso);
  end;
end;

end.
