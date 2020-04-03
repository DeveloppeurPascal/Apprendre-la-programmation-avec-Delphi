object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object tabListeDeCourses: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 40
    object tabListeDeCoursestrucaacheter: TStringField
      DisplayWidth = 97
      FieldName = 'trucaacheter'
    end
  end
  object dsListeDeCourses: TDataSource
    DataSet = tabListeDeCourses
    Left = 152
    Top = 88
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 88
    Top = 56
  end
end
