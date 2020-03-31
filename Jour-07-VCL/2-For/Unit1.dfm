object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 426
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 566
    Height = 385
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 128
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 152
    ExplicitWidth = 185
    object Edit1: TEdit
      Left = 1
      Top = 1
      Width = 121
      Height = 39
      Align = alLeft
      TabOrder = 0
      Text = 'Edit1'
      ExplicitLeft = 64
      ExplicitTop = 20
      ExplicitHeight = 21
    end
    object Button1: TButton
      Left = 197
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'For downto'
      TabOrder = 1
      OnClick = Button1Click
      ExplicitLeft = 178
      ExplicitTop = 2
    end
    object Button2: TButton
      Left = 122
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'For To'
      TabOrder = 2
      OnClick = Button2Click
      ExplicitLeft = 178
      ExplicitTop = 2
    end
  end
end
