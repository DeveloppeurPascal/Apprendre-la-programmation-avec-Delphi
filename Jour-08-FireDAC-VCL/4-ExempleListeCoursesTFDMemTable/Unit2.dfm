object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDMemTable1: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    ResourceOptions.PersistentFileName = 'C:\Users\Patrick\Documents\Test.xml'
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 88
    Top = 56
    object FDMemTable1courses: TStringField
      FieldName = 'courses'
    end
  end
end
