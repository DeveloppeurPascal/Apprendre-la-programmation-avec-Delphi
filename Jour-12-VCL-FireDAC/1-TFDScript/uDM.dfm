object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 369
  Width = 456
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Patrick\Documents\dbtest.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConnection1AfterConnect
    BeforeConnect = FDConnection1BeforeConnect
    Left = 56
    Top = 72
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'auteurs'
    TableName = 'auteurs'
    Left = 96
    Top = 176
    object FDTable1nom: TStringField
      DisplayWidth = 34
      FieldName = 'nom'
      Origin = 'nom'
      Size = 255
    end
    object FDTable1prenom: TStringField
      DisplayWidth = 50
      FieldName = 'prenom'
      Origin = 'prenom'
      Size = 255
    end
    object FDTable1pseudo: TStringField
      DisplayWidth = 50
      FieldName = 'pseudo'
      Origin = 'pseudo'
      Size = 255
    end
    object FDTable1id: TFDAutoIncField
      DisplayWidth = 10
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
  end
  object FDScript1: TFDScript
    SQLScripts = <
      item
        Name = 'CreationDeLaBase'
        SQL.Strings = (
          'CREATE TABLE editeurs ('
          '  raisonsociale VARCHAR(255) NULL,'
          '  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL'
          ');'
          ''
          'CREATE TABLE lien_auteur_livre ('
          '  id_auteur INTEGER NOT NULL,'
          '  id_livre INTEGER NOT NULL'
          ');'
          ''
          'CREATE TABLE livres ('
          '  gencod VARCHAR(255) NULL,'
          '  titre VARCHAR(255) NULL,'
          '  commentaire TEXT NULL,'
          '  couverture BLOB NULL,'
          '  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
          '  id_editeur INTEGER NULL'
          ');'
          ''
          'CREATE TABLE auteurs ('
          '  nom VARCHAR(255) NULL,'
          '  prenom VARCHAR(255) NULL,'
          '  pseudo VARCHAR(255) NULL,'
          '  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL'
          ');'
          ''
          'CREATE UNIQUE INDEX livre_auteur ON lien_auteur_livre'
          '  (id_livre,id_auteur);')
      end>
    Connection = FDConnection1
    Params = <>
    Macros = <>
    FetchOptions.AssignedValues = [evItems, evAutoClose, evAutoFetchAll]
    FetchOptions.AutoClose = False
    FetchOptions.Items = [fiBlobs, fiDetails]
    ResourceOptions.AssignedValues = [rvMacroCreate, rvMacroExpand, rvDirectExecute, rvPersistent]
    ResourceOptions.MacroCreate = False
    ResourceOptions.DirectExecute = True
    Left = 232
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 280
    Top = 72
  end
end
