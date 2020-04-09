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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 635
    Height = 299
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 56
    Top = 48
    Width = 521
    Height = 201
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDMemTable1: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'Ville'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 520
    Top = 64
    Content = {
      414442530F0087404C010000FF00010001FF02FF03040016000000460044004D
      0065006D005400610062006C006500310005000A0000005400610062006C0065
      000600000000000700000800000000000900320000000A0000FF0BFF0C04000A
      000000560069006C006C00650005000A000000560069006C006C0065000D0001
      0000000F000E0010000F00000011000112000113000114000115000116000117
      0008000000430069007400790018000F000000FEFEFF19FEFF1AFEFF1BFF1C1D
      0000000000FF1E0000080000004B69726B6C616E64FEFEFF1C1D0001000000FF
      1E0000060000004C6F6E646F6EFEFEFF1C1D0002000000FF1E00000700000052
      65646D6F6E64FEFEFF1C1D0003000000FF1E00000700000053656174746C65FE
      FEFF1C1D0004000000FF1E0000060000005461636F6D61FEFEFEFEFEFF1FFEFF
      20210005000000FF22FEFEFE0E004D0061006E0061006700650072001E005500
      7000640061007400650073005200650067006900730074007200790012005400
      610062006C0065004C006900730074000A005400610062006C00650008004E00
      61006D006500140053006F0075007200630065004E0061006D0065000A005400
      6100620049004400240045006E0066006F0072006300650043006F006E007300
      74007200610069006E00740073000C004C006F00630061006C0065001E004D00
      69006E0069006D0075006D004300610070006100630069007400790018004300
      6800650063006B004E006F0074004E0075006C006C00140043006F006C007500
      6D006E004C006900730074000C0043006F006C0075006D006E00100053006F00
      75007200630065004900440018006400740041006E0073006900530074007200
      69006E0067001000440061007400610054007900700065000800530069007A00
      65001400530065006100720063006800610062006C006500120041006C006C00
      6F0077004E0075006C006C000800420061007300650014004F0041006C006C00
      6F0077004E0075006C006C0012004F0049006E00550070006400610074006500
      10004F0049006E00570068006500720065001A004F0072006900670069006E00
      43006F006C004E0061006D006500140053006F00750072006300650053006900
      7A0065001C0043006F006E00730074007200610069006E0074004C0069007300
      7400100056006900650077004C006900730074000E0052006F0077004C006900
      73007400060052006F0077000A0052006F0077004900440010004F0072006900
      670069006E0061006C001800520065006C006100740069006F006E004C006900
      730074001C0055007000640061007400650073004A006F00750072006E006100
      6C001200530061007600650050006F0069006E0074000E004300680061006E00
      670065007300}
  end
  object Sqlite_demoConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    Connected = True
    LoginPrompt = False
    Left = 529
    Top = 135
  end
  object EmployeesTable: TFDQuery
    Connection = Sqlite_demoConnection
    SQL.Strings = (
      'SELECT * FROM Employees')
    Left = 529
    Top = 183
  end
  object FDLocalSQL1: TFDLocalSQL
    Connection = Sqlite_demoConnection
    Active = True
    DataSets = <
      item
        DataSet = FDMemTable1
        Name = 'TableEnMemoire'
      end>
    Left = 152
    Top = 128
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = Sqlite_demoConnection
    SQL.Strings = (
      'select * from TableEnMemoire')
    Left = 344
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 216
    Top = 200
  end
  object FDQuery2: TFDQuery
    Active = True
    Connection = Sqlite_demoConnection
    SQL.Strings = (
      'select '
      '  FirstName, '
      '  LastName, '
      '  City '
      'from '
      '  Employees e, '
      '  TableEnMemoire t '
      'where'
      '  e.City = t.Ville'
      'order by '
      '  t.Ville desc,'
      '  FirstName, '
      '  LastName')
    Left = 312
    Top = 152
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 336
    Top = 176
  end
end
