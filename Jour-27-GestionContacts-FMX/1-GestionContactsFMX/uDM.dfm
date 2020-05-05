object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 458
  Width = 615
  object dbContacts: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Patrick\Documents\Embarcadero\Studio\Projets\B' +
        'ootcampDelphi\Phase-2\Jour-27-GestionContacts\1-GestionContactsF' +
        'MX\base.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = dbContactsAfterConnect
    BeforeConnect = dbContactsBeforeConnect
    Left = 376
    Top = 144
  end
  object tabContacts: TFDTable
    OnCalcFields = tabContactsCalcFields
    IndexFieldNames = 'id'
    Connection = dbContacts
    UpdateOptions.UpdateTableName = 'contacts'
    TableName = 'contacts'
    Left = 400
    Top = 248
    object tabContactsid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tabContactsnom: TStringField
      FieldName = 'nom'
      Origin = 'nom'
      Size = 255
    end
    object tabContactsprenom: TStringField
      FieldName = 'prenom'
      Origin = 'prenom'
      Size = 255
    end
    object tabContactstelephone: TStringField
      FieldName = 'telephone'
      Origin = 'telephone'
      Size = 255
    end
    object tabContactsemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 255
    end
    object tabContactsurl: TStringField
      FieldName = 'url'
      Origin = 'url'
      Size = 255
    end
    object tabContactsNomPrenom: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomPrenom'
      Calculated = True
    end
  end
end
