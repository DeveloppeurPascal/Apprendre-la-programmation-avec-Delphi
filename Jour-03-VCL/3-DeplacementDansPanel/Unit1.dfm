object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 400
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    273
    400)
  PixelsPerInch = 96
  TextHeight = 13
  object VersLeHaut: TButton
    Left = 104
    Top = 8
    Width = 75
    Height = 25
    Caption = 'VersLeHaut'
    TabOrder = 0
    OnClick = VersLeHautClick
  end
  object VersLaDroite: TButton
    Left = 185
    Top = 39
    Width = 75
    Height = 25
    Caption = 'VersLaDroite'
    TabOrder = 1
    OnClick = VersLaDroiteClick
  end
  object VersLaGauche: TButton
    Left = 23
    Top = 39
    Width = 75
    Height = 25
    Caption = 'VersLaGauche'
    TabOrder = 2
    OnClick = VersLaGaucheClick
  end
  object VersLeBas: TButton
    Left = 104
    Top = 70
    Width = 75
    Height = 25
    Caption = 'VersLeBas'
    TabOrder = 3
    OnClick = VersLeBasClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 101
    Width = 257
    Height = 290
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    ExplicitWidth = 619
    ExplicitHeight = 190
    object Label1: TLabel
      Left = 112
      Top = 136
      Width = 18
      Height = 13
      Caption = 'xXx'
    end
  end
end
