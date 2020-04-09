object frmLivres: TfrmLivres
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'frmLivres'
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
  object zoneFooter: TPanel
    Left = 0
    Top = 258
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnFermer: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Fermer'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      ModalResult = 8
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object gLivres: TDBGrid
    Left = 0
    Top = 0
    Width = 635
    Height = 152
    Align = alClient
    DataSource = dsLivres
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 152
    Width = 635
    Height = 106
    Align = alBottom
    TabOrder = 2
    object DBMemo1: TDBMemo
      Left = 8
      Top = 6
      Width = 185
      Height = 94
      DataField = 'commentaire'
      DataSource = dsLivres
      TabOrder = 0
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 199
      Top = 6
      Width = 145
      Height = 21
      DataField = 'id_editeur'
      DataSource = dsLivres
      KeyField = 'id'
      ListField = 'raisonsociale'
      ListSource = dsEditeurs
      TabOrder = 1
    end
    object btnModifieLaListeDesAuteurs: TButton
      Left = 269
      Top = 75
      Width = 75
      Height = 25
      Caption = 'Auteurs'
      TabOrder = 2
      OnClick = btnModifieLaListeDesAuteursClick
    end
  end
  object ListBox1: TListBox
    Left = 350
    Top = 158
    Width = 277
    Height = 97
    ItemHeight = 13
    TabOrder = 3
  end
  object dsLivres: TDataSource
    DataSet = DataModule2.tabLivres
    OnDataChange = dsLivresDataChange
    Left = 416
    Top = 64
  end
  object dsEditeurs: TDataSource
    DataSet = DataModule2.tabEditeurs
    Left = 216
    Top = 184
  end
end
