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
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 635
    Height = 120
    Align = alTop
    DataSource = dsListeAuteurs
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 120
    Width = 635
    Height = 179
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object MainMenu1: TMainMenu
    Left = 312
    Top = 152
    object Fichier1: TMenuItem
      Caption = '&Fichier'
      object Quitter1: TMenuItem
        Caption = '&Quitter'
        ShortCut = 16471
        OnClick = Quitter1Click
      end
    end
    object ables1: TMenuItem
      Caption = '&Tables'
      object Auteurs1: TMenuItem
        Caption = '&Auteurs'
        OnClick = Auteurs1Click
      end
      object Editeurs1: TMenuItem
        Caption = '&Editeurs'
        OnClick = Editeurs1Click
      end
      object Livres1: TMenuItem
        Caption = '&Livres'
        OnClick = Livres1Click
      end
    end
  end
  object dsListeAuteurs: TDataSource
    DataSet = DataModule2.tabAuteurs
    Left = 368
    Top = 40
  end
end
