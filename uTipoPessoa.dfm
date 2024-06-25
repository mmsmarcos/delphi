object frmTipoPessoa: TfrmTipoPessoa
  Left = 0
  Top = 0
  Caption = 'Tipo de Pessoa'
  ClientHeight = 442
  ClientWidth = 628
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
    Width = 628
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 622
    object cbxItemTabela: TComboBox
      Left = 32
      Top = 32
      Width = 145
      Height = 23
      TabOrder = 0
      Text = 'cbxItemTabela'
    end
    object edtPesquisa: TEdit
      Left = 192
      Top = 32
      Width = 289
      Height = 23
      TabOrder = 1
      OnChange = edtPesquisaChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 97
    Width = 628
    Height = 345
    Align = alClient
    DataSource = DM.dsTipoPessoa
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
        FieldName = 'IDTIPO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATIVO'
        Visible = True
      end>
  end
end
