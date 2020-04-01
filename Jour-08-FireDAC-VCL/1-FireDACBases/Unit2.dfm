object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 320
  Width = 497
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Patrick\Documents\Embarcadero\Studio\Projets\B' +
        'ootcampDelphi\Jour-08-FireDAC-VCL\1-FireDACBases\mabase.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 264
    Top = 64
  end
  object tabLivres: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'livres'
    TableName = 'livres'
    Left = 328
    Top = 216
    object tabLivresgencod: TStringField
      DisplayWidth = 50
      FieldName = 'gencod'
      Origin = 'gencod'
      Size = 255
    end
    object tabLivrestitre: TStringField
      DisplayWidth = 50
      FieldName = 'titre'
      Origin = 'titre'
      Size = 255
    end
    object tabLivrescommentaire: TWideMemoField
      FieldName = 'commentaire'
      Origin = 'commentaire'
      BlobType = ftWideMemo
    end
    object tabLivrescouverture: TBlobField
      FieldName = 'couverture'
      Origin = 'couverture'
    end
    object tabLivresid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tabLivresid_editeur: TIntegerField
      FieldName = 'id_editeur'
      Origin = 'id_editeur'
    end
  end
  object tabAuteurs: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'auteurs'
    TableName = 'auteurs'
    Left = 200
    Top = 224
    object tabAuteursnom: TStringField
      DisplayLabel = 'Nom'
      DisplayWidth = 50
      FieldName = 'nom'
      Origin = 'nom'
      Size = 255
    end
    object tabAuteursprenom: TStringField
      DisplayLabel = 'Pr'#233'nom'
      DisplayWidth = 50
      FieldName = 'prenom'
      Origin = 'prenom'
      Size = 255
    end
    object tabAuteurspseudo: TStringField
      DisplayLabel = 'Nom d'#39'artiste'
      DisplayWidth = 50
      FieldName = 'pseudo'
      Origin = 'pseudo'
      Size = 255
    end
    object tabAuteursid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
  end
  object tabEditeurs: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'editeurs'
    TableName = 'editeurs'
    Left = 104
    Top = 176
    object tabEditeursraisonsociale: TStringField
      DisplayWidth = 50
      FieldName = 'raisonsociale'
      Origin = 'raisonsociale'
      Size = 255
    end
    object tabEditeursid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
  end
  object tabLivresDUnAuteur: TFDQuery
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
    Left = 80
    Top = 72
    ParamData = <
      item
        Name = 'AUTEUR'
        ParamType = ptInput
      end>
  end
end
