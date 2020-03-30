object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 635
    Height = 29
    Caption = 'ToolBar1'
    Images = VirtualImageList1
    TabOrder = 0
    ExplicitLeft = 248
    ExplicitTop = 152
    ExplicitWidth = 150
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 0
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 1
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 0
      Caption = 'ToolButton3'
      ImageIndex = 2
    end
  end
  object Button1: TButton
    Left = 38
    Top = 192
    Width = 75
    Height = 22
    Caption = 'Button1'
    ImageIndex = 5
    Images = VirtualImageList1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 38
    Top = 220
    Width = 75
    Height = 22
    Caption = 'Button1'
    ImageIndex = 7
    Images = VirtualImageList1
    TabOrder = 2
  end
  object Button3: TButton
    Left = 38
    Top = 248
    Width = 75
    Height = 22
    Caption = 'Button1'
    ImageIndex = 2
    Images = VirtualImageList1
    TabOrder = 3
    OnClick = Button3Click
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 29
    Width = 635
    Height = 60
    ButtonHeight = 54
    ButtonWidth = 55
    Caption = 'ToolBar2'
    Images = VirtualImageList2
    TabOrder = 4
    object ToolButton4: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton4'
      ImageIndex = 0
    end
    object ToolButton5: TToolButton
      Left = 55
      Top = 0
      Caption = 'ToolButton5'
      ImageIndex = 1
    end
    object ToolButton6: TToolButton
      Left = 110
      Top = 0
      Caption = 'ToolButton6'
      ImageIndex = 2
    end
  end
  object VirtualImageList1: TVirtualImageList
    AutoFill = True
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'accueil'
        Disabled = False
        Name = 'accueil'
      end
      item
        CollectionIndex = 1
        CollectionName = 'activation'
        Disabled = False
        Name = 'activation'
      end
      item
        CollectionIndex = 2
        CollectionName = 'back'
        Disabled = False
        Name = 'back'
      end
      item
        CollectionIndex = 3
        CollectionName = 'historique'
        Disabled = False
        Name = 'historique'
      end
      item
        CollectionIndex = 4
        CollectionName = 'infos'
        Disabled = False
        Name = 'infos'
      end
      item
        CollectionIndex = 5
        CollectionName = 'login'
        Disabled = False
        Name = 'login'
      end
      item
        CollectionIndex = 6
        CollectionName = 'logoff'
        Disabled = False
        Name = 'logoff'
      end
      item
        CollectionIndex = 7
        CollectionName = 'messages'
        Disabled = False
        Name = 'messages'
      end
      item
        CollectionIndex = 8
        CollectionName = 'profil'
        Disabled = False
        Name = 'profil'
      end>
    ImageCollection = DataModule2.ImageCollection1
    Left = 312
    Top = 152
  end
  object VirtualImageList2: TVirtualImageList
    AutoFill = True
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'accueil'
        Disabled = False
        Name = 'accueil'
      end
      item
        CollectionIndex = 1
        CollectionName = 'activation'
        Disabled = False
        Name = 'activation'
      end
      item
        CollectionIndex = 2
        CollectionName = 'back'
        Disabled = False
        Name = 'back'
      end
      item
        CollectionIndex = 3
        CollectionName = 'historique'
        Disabled = False
        Name = 'historique'
      end
      item
        CollectionIndex = 4
        CollectionName = 'infos'
        Disabled = False
        Name = 'infos'
      end
      item
        CollectionIndex = 5
        CollectionName = 'login'
        Disabled = False
        Name = 'login'
      end
      item
        CollectionIndex = 6
        CollectionName = 'logoff'
        Disabled = False
        Name = 'logoff'
      end
      item
        CollectionIndex = 7
        CollectionName = 'messages'
        Disabled = False
        Name = 'messages'
      end
      item
        CollectionIndex = 8
        CollectionName = 'profil'
        Disabled = False
        Name = 'profil'
      end>
    ImageCollection = DataModule2.ImageCollection1
    Width = 48
    Height = 48
    Left = 416
    Top = 160
  end
end
