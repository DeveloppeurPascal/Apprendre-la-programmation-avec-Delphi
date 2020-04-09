object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 541
  Width = 851
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 264
    Top = 160
    object FDMemTable1Ville: TStringField
      FieldName = 'Ville'
    end
  end
  object Sqlite_demoConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    Connected = True
    LoginPrompt = False
    Left = 608
    Top = 224
  end
  object EmployeesTable: TFDQuery
    Active = True
    AfterOpen = EmployeesTableAfterOpen
    IndexFieldNames = 'City'
    MasterSource = dsMemTable
    MasterFields = 'Ville'
    Connection = Sqlite_demoConnection
    SQL.Strings = (
      'SELECT * FROM Employees')
    Left = 608
    Top = 272
    object EmployeesTableEmployeeID: TFDAutoIncField
      FieldName = 'EmployeeID'
      Origin = 'EmployeeID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object EmployeesTableLastName: TStringField
      FieldName = 'LastName'
      Origin = 'LastName'
      Required = True
    end
    object EmployeesTableFirstName: TStringField
      FieldName = 'FirstName'
      Origin = 'FirstName'
      Required = True
      Size = 10
    end
    object EmployeesTableBirthDate: TDateTimeField
      FieldName = 'BirthDate'
      Origin = 'BirthDate'
    end
    object EmployeesTableCity: TStringField
      FieldName = 'City'
      Origin = 'City'
      Size = 15
    end
  end
  object dsMemTable: TDataSource
    DataSet = FDMemTable1
    Left = 272
    Top = 240
  end
  object dsSQLite: TDataSource
    DataSet = EmployeesTable
    Left = 600
    Top = 352
  end
end
