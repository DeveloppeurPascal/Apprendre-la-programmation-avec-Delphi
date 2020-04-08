object frmAuteursDUnLivre: TfrmAuteursDUnLivre
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Mise '#224' jour des auteurs d'#39'un livre'
  ClientHeight = 298
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 603
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 152
    ExplicitWidth = 185
    object DBText1: TDBText
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 65
      Height = 31
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Alignment = taCenter
      DataField = 'gencod'
      DataSource = dsLivre
      ExplicitLeft = 120
      ExplicitTop = 24
      ExplicitHeight = 17
    end
    object DBText2: TDBText
      AlignWithMargins = True
      Left = 80
      Top = 5
      Width = 518
      Height = 31
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      Alignment = taCenter
      DataField = 'titre'
      DataSource = dsLivre
      ExplicitLeft = 120
      ExplicitTop = 24
      ExplicitWidth = 65
      ExplicitHeight = 17
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 257
    Width = 603
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 40
    ExplicitTop = 24
    ExplicitWidth = 185
    DesignSize = (
      603
      41)
    object BitBtn1: TBitBtn
      Left = 518
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
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
      ExplicitLeft = 560
    end
  end
  object ListeDesAuteurs: TPanel
    Left = 0
    Top = 41
    Width = 603
    Height = 216
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    ExplicitLeft = 216
    ExplicitTop = 144
    ExplicitWidth = 185
    ExplicitHeight = 41
    object sbAuteurs: TScrollBox
      Left = 2
      Top = 2
      Width = 599
      Height = 212
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 208
      ExplicitTop = 88
      ExplicitWidth = 185
      ExplicitHeight = 41
    end
  end
  object dsLivre: TDataSource
    DataSet = DataModule2.tabLivres
    Left = 288
  end
end
