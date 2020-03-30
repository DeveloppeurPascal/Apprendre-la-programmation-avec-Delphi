object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Form2'
  ClientHeight = 150
  ClientWidth = 176
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
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 170
    Height = 25
    Align = alTop
    Caption = 'Fermer (onClic)'
    TabOrder = 0
    OnClick = Button1Click
    ExplicitLeft = 56
    ExplicitTop = 80
    ExplicitWidth = 75
  end
  object Button2: TButton
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 170
    Height = 25
    Align = alTop
    Caption = 'Fermer (ModalResult)'
    ModalResult = 8
    TabOrder = 1
    ExplicitLeft = 64
    ExplicitTop = 88
    ExplicitWidth = 75
  end
end
