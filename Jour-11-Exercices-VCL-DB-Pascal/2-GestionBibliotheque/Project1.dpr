/// <summary>
/// ***************************************************************************
///
/// Apprendre la programmation avec Delphi
///
/// Copyright 2020-2024 Patrick Prémartin under AGPL 3.0 license.
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
/// Projets Delphi d'exemples développés pendant la formation en ligne gratuite pour apprendre à programmer en utilisant le langage Pascal dans Delphi réalisée en direct entre le 23 mars 2020 et le 5 mai 2020 durant le premier confinement quasi mondial lié à la pandémie du virus COVID-19.
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
/// Signature : a069c3b5d1163bc146170257e26bdb2459646f94
/// ***************************************************************************
/// </summary>

program Project1;

uses
  Vcl.Forms,
  fprincipale in 'fprincipale.pas' {Form1},
  uDM in 'uDM.pas' {DataModule2: TDataModule},
  flivres in 'flivres.pas' {frmLivres},
  fediteurs in 'fediteurs.pas' {frmEditeurs},
  fauteurs in 'fauteurs.pas' {frmAuteurs},
  fAuteursDUnLivre in 'fAuteursDUnLivre.pas' {frmAuteursDUnLivre};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TfrmLivres, frmLivres);
  Application.CreateForm(TfrmEditeurs, frmEditeurs);
  Application.CreateForm(TfrmAuteurs, frmAuteurs);
  Application.CreateForm(TfrmAuteursDUnLivre, frmAuteursDUnLivre);
  Application.Run;
end.
