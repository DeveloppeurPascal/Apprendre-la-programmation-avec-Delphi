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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 352
    Top = 133
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Button1: TButton
    Left = 248
    Top = 129
    Width = 75
    Height = 25
    Caption = '+1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 424
    Top = 128
    Width = 75
    Height = 25
    Caption = '-1'
    TabOrder = 1
    OnClick = Button2Click
  end
end
