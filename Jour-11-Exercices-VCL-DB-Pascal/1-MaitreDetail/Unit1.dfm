object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 641
  ClientWidth = 743
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
    Width = 743
    Height = 120
    Align = alTop
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 145
    Width = 743
    Height = 120
    Align = alTop
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 0
    Top = 290
    Width = 743
    Height = 120
    Align = alTop
    DataSource = DataSource3
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 120
    Width = 743
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Align = alTop
    TabOrder = 3
    ExplicitLeft = -32
    ExplicitTop = 104
  end
  object DBNavigator2: TDBNavigator
    Left = 0
    Top = 265
    Width = 743
    Height = 25
    DataSource = DataSource2
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Align = alTop
    TabOrder = 4
    ExplicitLeft = -8
    ExplicitTop = 249
  end
  object Sqlite_demoConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    Connected = True
    LoginPrompt = False
    Left = 468
    Top = 30
  end
  object CustomersTable: TFDQuery
    Active = True
    Connection = Sqlite_demoConnection
    SQL.Strings = (
      'SELECT * FROM Customers')
    Left = 332
    Top = 46
  end
  object OrdersTable: TFDQuery
    Active = True
    IndexFieldNames = 'CustomerID'
    MasterSource = DataSource1
    MasterFields = 'CustomerID'
    Connection = Sqlite_demoConnection
    SQL.Strings = (
      'SELECT * FROM Orders')
    Left = 522
    Top = 157
  end
  object OrderdetailsTable: TFDQuery
    Active = True
    IndexFieldNames = 'OrderID'
    MasterSource = DataSource2
    MasterFields = 'OrderID'
    Connection = Sqlite_demoConnection
    SQL.Strings = (
      'SELECT * FROM "Order Details"')
    Left = 591
    Top = 272
  end
  object DataSource1: TDataSource
    DataSet = CustomersTable
    Left = 128
    Top = 40
  end
  object DataSource2: TDataSource
    DataSet = OrdersTable
    Left = 392
    Top = 176
  end
  object DataSource3: TDataSource
    DataSet = OrderdetailsTable
    Left = 368
    Top = 328
  end
end
