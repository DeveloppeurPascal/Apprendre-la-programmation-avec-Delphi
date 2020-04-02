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
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 635
    Height = 258
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 152
    ExplicitWidth = 185
    object btnAjout: TButton
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 70
      Height = 29
      Hint = 'ceci est un bouton d'#39'ajout'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'btnAjout'
      TabOrder = 0
      OnClick = btnAjoutClick
      ExplicitTop = 4
    end
    object btnModif: TButton
      AlignWithMargins = True
      Left = 86
      Top = 6
      Width = 70
      Height = 29
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'btnModif'
      TabOrder = 1
      OnClick = btnModifClick
    end
    object btnSupprime: TButton
      AlignWithMargins = True
      Left = 166
      Top = 6
      Width = 70
      Height = 29
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'btnSupprime'
      TabOrder = 2
      OnClick = btnSupprimeClick
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 128
    Top = 144
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 432
    Top = 152
    object FDMemTable1id: TIntegerField
      FieldName = 'id'
    end
    object FDMemTable1idAsString: TStringField
      FieldName = 'idAsString'
    end
  end
end
