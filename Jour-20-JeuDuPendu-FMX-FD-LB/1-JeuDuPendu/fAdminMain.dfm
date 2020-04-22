object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 635
    Height = 249
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 274
    Width = 635
    Height = 25
    DataSource = DataSource1
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 208
    ExplicitTop = 160
    ExplicitWidth = 240
  end
  object Button1: TButton
    Left = 0
    Top = 0
    Width = 635
    Height = 25
    Align = alTop
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
    ExplicitLeft = 288
    ExplicitTop = 160
    ExplicitWidth = 75
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 312
    Top = 152
    object FDMemTable1Mot: TStringField
      FieldName = 'Mot'
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 408
    Top = 176
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 408
    Top = 128
  end
end
