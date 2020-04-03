object frmPrincipale: TfrmPrincipale
  Left = 0
  Top = 0
  Caption = 'Gestion des contacts'
  ClientHeight = 356
  ClientWidth = 561
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
    Top = 315
    Width = 561
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 6
      Width = 220
      Height = 25
      DataSource = DM.dsContacts
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      TabOrder = 0
      TabStop = True
    end
    object btnAjouter: TButton
      Left = 234
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Nouveau'
      ImageIndex = 0
      Images = VirtualImageList1
      TabOrder = 1
      OnClick = btnAjouterClick
    end
    object btnModifier: TButton
      Left = 315
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Modifier'
      ImageIndex = 1
      Images = VirtualImageList1
      TabOrder = 2
      OnClick = btnModifierClick
    end
    object btnSupprimer: TButton
      Left = 396
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Supprimer'
      ImageIndex = 2
      Images = VirtualImageList1
      TabOrder = 3
      OnClick = btnSupprimerClick
    end
    object btnFermer: TButton
      Left = 477
      Top = 6
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Fermer'
      ImageIndex = 3
      Images = VirtualImageList1
      TabOrder = 4
      OnClick = btnFermerClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 561
    Height = 315
    Align = alClient
    DataSource = DM.dsContacts
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object VirtualImageList1: TVirtualImageList
    AutoFill = True
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'ajout'
        Disabled = False
        Name = 'ajout'
      end
      item
        CollectionIndex = 1
        CollectionName = 'modif'
        Disabled = False
        Name = 'modif'
      end
      item
        CollectionIndex = 2
        CollectionName = 'suppression'
        Disabled = False
        Name = 'suppression'
      end
      item
        CollectionIndex = 3
        CollectionName = 'fermer'
        Disabled = False
        Name = 'fermer'
      end>
    ImageCollection = DM.ImageCollection1
    Left = 272
    Top = 184
  end
end
