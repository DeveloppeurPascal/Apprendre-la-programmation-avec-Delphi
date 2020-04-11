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
  object Button1: TButton
    Left = 32
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  inline MonCadre: TFrame5
    Left = 8
    Top = 8
    Width = 136
    Height = 87
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 8
    inherited Button1: TButton
      OnClick = TFrame51Button1Click
    end
    inherited Button2: TButton
      Left = 24
      Top = 49
      Width = 117
      Caption = 'mon second bouton'
      ExplicitLeft = 24
      ExplicitTop = 49
      ExplicitWidth = 117
    end
  end
end
