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
  object btnShowMessage: TButton
    Left = 56
    Top = 32
    Width = 75
    Height = 25
    Caption = 'btnShowMessage'
    TabOrder = 0
    OnClick = btnShowMessageClick
  end
  object btnMessageDlg: TButton
    Left = 216
    Top = 32
    Width = 75
    Height = 25
    Caption = 'btnMessageDlg'
    TabOrder = 1
    OnClick = btnMessageDlgClick
  end
  object btnInputBox: TButton
    Left = 56
    Top = 112
    Width = 75
    Height = 25
    Caption = 'btnInputBox'
    TabOrder = 2
    OnClick = btnInputBoxClick
  end
  object btnInputQuery: TButton
    Left = 216
    Top = 112
    Width = 75
    Height = 25
    Caption = 'btnInputQuery'
    TabOrder = 3
    OnClick = btnInputQueryClick
  end
  object btnPromptForFilename: TButton
    Left = 56
    Top = 176
    Width = 75
    Height = 25
    Caption = 'btnPromptForFilename'
    TabOrder = 4
    OnClick = btnPromptForFilenameClick
  end
end
