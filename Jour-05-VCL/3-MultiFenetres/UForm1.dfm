object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 303
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
    Width = 297
    Height = 25
    Align = alTop
    Caption = 'Form2 en Show'
    TabOrder = 0
    OnClick = Button1Click
    ExplicitLeft = 24
    ExplicitTop = 24
    ExplicitWidth = 75
  end
  object Button2: TButton
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 297
    Height = 25
    Align = alTop
    Caption = 'Nouveau Form2 en Show'
    TabOrder = 1
    OnClick = Button2Click
    ExplicitLeft = 24
    ExplicitTop = 64
    ExplicitWidth = 75
  end
  object Button3: TButton
    AlignWithMargins = True
    Left = 3
    Top = 65
    Width = 297
    Height = 25
    Align = alTop
    Caption = 'Form2 en ShowModal'
    TabOrder = 2
    OnClick = Button3Click
    ExplicitLeft = 24
    ExplicitTop = 104
    ExplicitWidth = 75
  end
  object Button4: TButton
    AlignWithMargins = True
    Left = 3
    Top = 96
    Width = 297
    Height = 25
    Align = alTop
    Caption = 'Form3 en ShowModal'
    TabOrder = 3
    OnClick = Button4Click
    ExplicitLeft = -2
    ExplicitTop = 147
  end
  object Button5: TButton
    AlignWithMargins = True
    Left = 3
    Top = 127
    Width = 297
    Height = 25
    Align = alTop
    Caption = 'Nouveau Form3 en ShowModal'
    TabOrder = 4
    OnClick = Button5Click
    ExplicitLeft = 120
    ExplicitTop = 160
    ExplicitWidth = 75
  end
end
