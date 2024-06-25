object frmPortaria: TfrmPortaria
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta Registro de Entrada'
  ClientHeight = 635
  ClientWidth = 1312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 608
    Width = 1312
    Height = 27
    Panels = <>
    ExplicitTop = 599
    ExplicitWidth = 1306
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1312
    Height = 81
    Align = alTop
    TabOrder = 1
    object ComboBox1: TComboBox
      Left = 16
      Top = 24
      Width = 233
      Height = 36
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'ComboBox1'
    end
    object Edit1: TEdit
      Left = 255
      Top = 24
      Width = 433
      Height = 36
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'Edit1'
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 81
    Width = 1312
    Height = 527
    Align = alClient
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
end
