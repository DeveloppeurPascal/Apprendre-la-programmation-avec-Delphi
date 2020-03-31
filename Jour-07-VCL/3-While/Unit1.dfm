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
  object SpeedButton1: TSpeedButton
    Left = 0
    Top = 25
    Width = 23
    Height = 274
    Align = alLeft
    AllowAllUp = True
    GroupIndex = 1
    ExplicitLeft = 312
    ExplicitTop = 160
    ExplicitHeight = 22
  end
  object Button1: TButton
    Left = 0
    Top = 0
    Width = 635
    Height = 25
    Align = alTop
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
    ExplicitLeft = 288
    ExplicitTop = 160
    ExplicitWidth = 75
  end
  object Memo1: TMemo
    Left = 23
    Top = 25
    Width = 612
    Height = 274
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 128
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
end
