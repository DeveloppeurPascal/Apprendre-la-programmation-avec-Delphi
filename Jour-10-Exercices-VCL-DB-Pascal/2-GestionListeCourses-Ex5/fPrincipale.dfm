object frmPrincipale: TfrmPrincipale
  Left = 0
  Top = 0
  Caption = 'Ma liste de courses'
  ClientHeight = 362
  ClientWidth = 629
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 629
    Height = 362
    ActivePage = tsModifier
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    OnChange = PageControl1Change
    object tsListe: TTabSheet
      Caption = 'Ma liste'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 627
      ExplicitHeight = 268
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 621
        Height = 306
        Align = alClient
        DataSource = dm.dsListeDeCourses
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 306
        Width = 621
        Height = 25
        DataSource = dm.dsListeDeCourses
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Align = alBottom
        TabOrder = 1
        ExplicitLeft = 192
        ExplicitTop = 152
        ExplicitWidth = 240
      end
    end
    object tsAjouter: TTabSheet
      Caption = 'Ajouter'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 627
      ExplicitHeight = 268
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 70
        Height = 13
        Align = alTop
        Caption = 'Quoi acheter ?'
        FocusControl = edtAjoutTrucAAcheter
      end
      object edtAjoutTrucAAcheter: TDBEdit
        Left = 0
        Top = 13
        Width = 621
        Height = 21
        Align = alTop
        DataField = 'trucaacheter'
        DataSource = dm.dsListeDeCourses
        TabOrder = 0
        ExplicitLeft = 48
        ExplicitTop = 64
        ExplicitWidth = 121
      end
      object btnAjoutOk: TBitBtn
        Left = 0
        Top = 34
        Width = 621
        Height = 25
        Align = alTop
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnAjoutOkClick
        ExplicitLeft = 296
        ExplicitTop = 176
        ExplicitWidth = 75
      end
      object btnAjoutCancel: TBitBtn
        Left = 0
        Top = 59
        Width = 621
        Height = 25
        Align = alTop
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 2
        OnClick = btnAjoutCancelClick
        ExplicitLeft = 464
        ExplicitTop = 192
        ExplicitWidth = 75
      end
    end
    object tsModifier: TTabSheet
      Caption = 'Modifier'
      ImageIndex = 2
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 621
        Height = 13
        Align = alTop
        Caption = 'Quoi acheter ?'
        FocusControl = edtModifTrucAAjouter
        ExplicitWidth = 70
      end
      object btnModifOk: TBitBtn
        Left = 0
        Top = 34
        Width = 621
        Height = 25
        Align = alTop
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnAjoutOkClick
      end
      object edtModifTrucAAjouter: TDBEdit
        Left = 0
        Top = 13
        Width = 621
        Height = 21
        Align = alTop
        DataField = 'trucaacheter'
        DataSource = dm.dsListeDeCourses
        TabOrder = 1
      end
      object btnModifCancel: TBitBtn
        Left = 0
        Top = 59
        Width = 621
        Height = 25
        Align = alTop
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 2
        OnClick = btnAjoutCancelClick
      end
    end
    object tsSupprimer: TTabSheet
      Caption = 'Supprimer'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 627
      ExplicitHeight = 268
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 92
        Height = 13
        Align = alTop
        Caption = 'Supprimer ce truc ?'
      end
      object DBText1: TDBText
        Left = 0
        Top = 13
        Width = 621
        Height = 17
        Align = alTop
        DataField = 'trucaacheter'
        DataSource = dm.dsListeDeCourses
        ExplicitLeft = 3
        ExplicitTop = 56
      end
      object btnSuppOk: TBitBtn
        Left = 0
        Top = 30
        Width = 621
        Height = 25
        Align = alTop
        Kind = bkYes
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnSuppOkClick
        ExplicitLeft = 3
        ExplicitTop = 56
      end
      object btnSuppCancel: TBitBtn
        Left = 0
        Top = 55
        Width = 621
        Height = 25
        Align = alTop
        Kind = bkNo
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnSuppCancelClick
        ExplicitLeft = 3
        ExplicitTop = 112
      end
    end
  end
end
