object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 394
  Width = 642
  object Sqlite_demoConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    Connected = True
    LoginPrompt = False
    Left = 149
    Top = 64
  end
  object EmployeesTable: TFDQuery
    Active = True
    Connection = Sqlite_demoConnection
    SQL.Strings = (
      'SELECT * FROM Employees')
    Left = 149
    Top = 112
  end
end
