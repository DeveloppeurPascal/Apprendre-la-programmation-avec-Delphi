object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Patrick\Documents\Embarcadero\Studio\Projets\B' +
        'ootcampDelphi\Jour-07-VCL\5-FireDAC\mabase.sqlite'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 328
    Top = 80
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'auteurs'
    TableName = 'auteurs'
    Left = 192
    Top = 104
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select'
      #9'livres.*'
      'from'
      #9'livres,auteurs,lien_auteur_livre'
      'where'
      #9'livres.id = lien_auteur_livre.id_livre '
      #9'and'
      #9'lien_auteur_livre.id_auteur=auteurs.id'
      #9'and '
      #9'auteurs.id=:auteur'
      'order by'
      #9'livres.titre')
    Left = 88
    Top = 96
    ParamData = <
      item
        Name = 'AUTEUR'
        ParamType = ptInput
      end>
  end
end
