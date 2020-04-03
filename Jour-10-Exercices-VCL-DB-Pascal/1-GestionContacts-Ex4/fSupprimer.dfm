object frmSupprimer: TfrmSupprimer
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Suppression du contact'
  ClientHeight = 267
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    272
    267)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 21
    Height = 13
    Caption = 'Nom'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 36
    Height = 13
    Caption = 'Pr'#233'nom'
  end
  object Label3: TLabel
    Left = 16
    Top = 120
    Width = 50
    Height = 13
    Caption = 'T'#233'l'#233'phone'
  end
  object Label4: TLabel
    Left = 16
    Top = 176
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object DBText1: TDBText
    Left = 22
    Top = 27
    Width = 242
    Height = 17
    DataField = 'Nom'
    DataSource = DM.dsContacts
  end
  object DBText2: TDBText
    Left = 22
    Top = 83
    Width = 242
    Height = 17
    DataField = 'Prenom'
    DataSource = DM.dsContacts
  end
  object DBText3: TDBText
    Left = 22
    Top = 139
    Width = 242
    Height = 17
    DataField = 'Telephone'
    DataSource = DM.dsContacts
  end
  object DBText4: TDBText
    Left = 22
    Top = 195
    Width = 242
    Height = 17
    DataField = 'Email'
    DataSource = DM.dsContacts
  end
  object BitBtn1: TBitBtn
    Left = 108
    Top = 234
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkYes
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 189
    Top = 234
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkNo
    NumGlyphs = 2
    TabOrder = 1
  end
end
