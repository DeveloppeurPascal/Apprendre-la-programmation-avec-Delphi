object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 451
  Width = 595
  object dbConnexion: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Patrick\Documents\Embarcadero\Studio\Projets\B' +
        'ootcampDelphi\Phase-2\Jour-24-Exercices-FMX\1-ListeDeCoursesFMX\' +
        'mescourses.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = dbConnexionAfterConnect
    BeforeConnect = dbConnexionBeforeConnect
    Left = 304
    Top = 88
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 224
    Top = 144
  end
  object tabMesCourses: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = dbConnexion
    UpdateOptions.UpdateTableName = 'mescourses'
    TableName = 'mescourses'
    Left = 376
    Top = 160
  end
end
