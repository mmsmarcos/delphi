object frmConsultaVeiculo: TfrmConsultaVeiculo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta Ve'#237'culos'
  ClientHeight = 476
  ClientWidth = 839
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 839
    Height = 73
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 833
    object cbxItemTabela: TComboBox
      Left = 40
      Top = 24
      Width = 145
      Height = 23
      TabOrder = 0
      Text = 'cbxItemTabela'
    end
    object edtPesquisa: TEdit
      Left = 200
      Top = 24
      Width = 257
      Height = 23
      TabOrder = 1
      OnChange = edtPesquisaChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 73
    Width = 839
    Height = 403
    Align = alClient
    DataSource = DM.dsConsultaVeiculos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'IDEMPRESA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDVEICULO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARCA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODELO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COR'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANOFAB'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANOMOD'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATIVO'
        Visible = True
      end>
  end
end
