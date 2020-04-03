object frmAjouter: TfrmAjouter
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Ajout d'#39'un contact'
  ClientHeight = 267
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
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
    Caption = '&Nom'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 36
    Height = 13
    Caption = '&Pr'#233'nom'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 16
    Top = 120
    Width = 50
    Height = 13
    Caption = '&T'#233'l'#233'phone'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 16
    Top = 176
    Width = 24
    Height = 13
    Caption = '&Email'
    FocusControl = DBEdit4
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 27
    Width = 242
    Height = 21
    DataField = 'Nom'
    DataSource = DM.dsContacts
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 83
    Width = 242
    Height = 21
    DataField = 'Prenom'
    DataSource = DM.dsContacts
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 16
    Top = 139
    Width = 242
    Height = 21
    DataField = 'Telephone'
    DataSource = DM.dsContacts
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 16
    Top = 195
    Width = 242
    Height = 21
    DataField = 'Email'
    DataSource = DM.dsContacts
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 88
    Top = 234
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtn1Click
    ExplicitLeft = 310
    ExplicitTop = 282
  end
  object BitBtn2: TBitBtn
    Left = 169
    Top = 234
    Width = 98
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Abandonner'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    ModalResult = 3
    NumGlyphs = 2
    TabOrder = 5
    OnClick = BitBtn2Click
    ExplicitLeft = 391
    ExplicitTop = 282
  end
end
