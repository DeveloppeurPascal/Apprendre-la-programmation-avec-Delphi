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
  object FDMemTable1: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'nomediteur'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'titredelivre'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 312
    Top = 152
    Content = {
      414442530F00A842D9010000FF00010001FF02FF03040016000000460044004D
      0065006D005400610062006C006500310005000A0000005400610062006C0065
      00060000000000070000080032000000090000FF0AFF0B0400140000006E006F
      006D0065006400690074006500750072000500140000006E006F006D00650064
      00690074006500750072000C00010000000E000D000F00140000001000011100
      011200011300011400011500011600140000006E006F006D0065006400690074
      00650075007200170014000000FEFF0B04001800000074006900740072006500
      640065006C006900760072006500050018000000740069007400720065006400
      65006C0069007600720065000C00020000000E000D000F001400000010000111
      0001120001130001140001150001160018000000740069007400720065006400
      65006C006900760072006500170014000000FEFEFF18FEFF19FEFF1AFF1B1C00
      000000001E001D00FF1F0000080000004579726F6C6C657301000F0000004465
      6C7068692053747564696F2037FEFEFF1B1C0001000000FF1F00000F00000050
      61636B745075626C697368696E6701001000000044656C70686920436F6F636B
      626F6F6BFEFEFEFEFEFF20FEFF21220003000000FF23FEFEFE0E004D0061006E
      0061006700650072001E00550070006400610074006500730052006500670069
      00730074007200790012005400610062006C0065004C006900730074000A0054
      00610062006C00650008004E0061006D006500140053006F0075007200630065
      004E0061006D0065000A0054006100620049004400240045006E0066006F0072
      006300650043006F006E00730074007200610069006E00740073001E004D0069
      006E0069006D0075006D00430061007000610063006900740079001800430068
      00650063006B004E006F0074004E0075006C006C00140043006F006C0075006D
      006E004C006900730074000C0043006F006C0075006D006E00100053006F0075
      007200630065004900440018006400740041006E007300690053007400720069
      006E0067001000440061007400610054007900700065000800530069007A0065
      001400530065006100720063006800610062006C006500120041006C006C006F
      0077004E0075006C006C000800420061007300650014004F0041006C006C006F
      0077004E0075006C006C0012004F0049006E0055007000640061007400650010
      004F0049006E00570068006500720065001A004F0072006900670069006E0043
      006F006C004E0061006D006500140053006F007500720063006500530069007A
      0065001C0043006F006E00730074007200610069006E0074004C006900730074
      00100056006900650077004C006900730074000E0052006F0077004C00690073
      007400060052006F0077000A0052006F0077004900440016007200730055006E
      006300680061006E006700650064001A0052006F0077005000720069006F0072
      005300740061007400650010004F0072006900670069006E0061006C00180052
      0065006C006100740069006F006E004C006900730074001C0055007000640061
      007400650073004A006F00750072006E0061006C001200530061007600650050
      006F0069006E0074000E004300680061006E00670065007300}
    object FDMemTable1nomediteur: TStringField
      FieldName = 'nomediteur'
    end
    object FDMemTable1titredelivre: TStringField
      FieldName = 'titredelivre'
    end
  end
end
