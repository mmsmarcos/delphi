object frmImpressao: TfrmImpressao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'frmImpressao'
  ClientHeight = 201
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 438
    Height = 152
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitWidth = 392
    ExplicitHeight = 143
    object Label1: TLabel
      Left = 48
      Top = 24
      Width = 32
      Height = 15
      Caption = 'Status'
    end
    object Label2: TLabel
      Left = 48
      Top = 75
      Width = 58
      Height = 15
      Caption = 'Ordena'#231#227'o'
    end
    object RadioGroup1: TRadioGroup
      Left = 226
      Top = 24
      Width = 151
      Height = 97
      BiDiMode = bdLeftToRight
      Caption = 'Formato'
      ItemIndex = 2
      Items.Strings = (
        'XLSX'
        'TXT'
        'VER EM TELA / PDF')
      ParentBiDiMode = False
      ShowFrame = False
      TabOrder = 0
    end
    object cbxStatus: TComboBox
      Left = 48
      Top = 45
      Width = 145
      Height = 23
      ItemIndex = 0
      TabOrder = 1
      Text = 'TODOS'
      Items.Strings = (
        'TODOS'
        'ATIVO'
        'INATIVO')
    end
    object cxbOrdenacao: TComboBox
      Left = 48
      Top = 96
      Width = 145
      Height = 23
      TabOrder = 2
      Text = 'cxbOrdenacao'
    end
  end
  object pnlButton: TPanel
    Left = 0
    Top = 152
    Width = 438
    Height = 49
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitTop = 143
    ExplicitWidth = 392
    object btnImprimir: TPanel
      Left = 64
      Top = 12
      Width = 113
      Height = 25
      Cursor = crHandPoint
      BevelOuter = bvNone
      Caption = 'Imprimir'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = btnImprimirClick
    end
    object btnSair: TPanel
      Left = 208
      Top = 14
      Width = 121
      Height = 25
      Cursor = crHandPoint
      BevelOuter = bvNone
      Caption = 'Sair'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnSairClick
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 320
    Top = 32
  end
  object qUsuariosImpressao: TFDQuery
    Connection = DM.fdConexao
    SQL.Strings = (
      'SELECT t.USERNAME,'
      '       t.NOME,'
      '       t.EMAIL,'
      
        '       CASE WHEN (t.ATIVO = 1) THEN '#39'Ativo'#39' ELSE '#39'Inativo'#39' END A' +
        'S ATIVO,'
      '       t.ULTLOGIN'
      '  FROM TBUSUARIO t')
    Left = 344
    Top = 112
  end
  object rel_usuarios: TfrxReport
    Version = '2024.1.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45389.658302673600000000
    ReportOptions.LastChange = 45389.678775497700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 128
    Datasets = <
      item
        DataSet = rel_ds_usuarios
        DataSetName = 'ds_usuarios'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        Description = 'Relat'#243'rio de Usu'#225'rios'
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650390000000000
          Width = 718.110708360000000000
          Height = 26.456707860000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Usu'#225'rios')
          ParentFont = False
        end
        object Date: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 600.945270000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DisplayFormat.FormatStr = 'mm/dd/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 680.315400000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        Height = 30.234100000000000000
        ParentFont = False
        Top = 113.385900000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 0.002134040000000000
          Width = 90.708713100000000000
          Height = 30.231965960000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8W = (
            'LOGIN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 90.708719880000000000
          Top = 0.002134900000000000
          Width = 275.905683100000000000
          Height = 30.231965100000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'NOME')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 366.614398490000000000
          Top = 0.004100000000000000
          Width = 185.196970730000000000
          Height = 30.230000000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'E-MAIL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 551.811395410000000000
          Width = 86.929160210000000000
          Height = 30.234100000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SITUA'#199#195'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 638.740568440000000000
          Top = 0.002143350000000000
          Width = 102.047341250000000000
          Height = 30.231956650000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'DT. '#218'LT LOGIN')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = rel_ds_usuarios
        DataSetName = 'ds_usuarios'
        RowCount = 0
        object ds_usuariosUSERNAME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'USERNAME'
          DataSet = rel_ds_usuarios
          DataSetName = 'ds_usuarios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ds_usuarios."USERNAME"]')
          ParentFont = False
        end
        object ds_usuariosNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 90.708720000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'NOME'
          DataSet = rel_ds_usuarios
          DataSetName = 'ds_usuarios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ds_usuarios."NOME"]')
          ParentFont = False
        end
        object ds_usuariosEMAIL: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 366.614410000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'EMAIL'
          DataSet = rel_ds_usuarios
          DataSetName = 'ds_usuarios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ds_usuarios."EMAIL"]')
          ParentFont = False
        end
        object ds_usuariosATIVO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 551.811380000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'ATIVO'
          DataSet = rel_ds_usuarios
          DataSetName = 'ds_usuarios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[ds_usuarios."ATIVO"]')
          ParentFont = False
        end
        object ds_usuariosULTLOGIN: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'ULTLOGIN'
          DataSet = rel_ds_usuarios
          DataSetName = 'ds_usuarios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[ds_usuarios."ULTLOGIN"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Page]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110388850000000000
          Top = -0.004750000000000000
          Width = 94.488265990000000000
          Height = 18.900000000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina')
          ParentFont = False
        end
      end
    end
  end
  object rel_ds_usuarios: TfrxDBDataset
    Left = 176.000000000000000000
    Top = 80.000000000000000000
    UserName = 'ds_usuarios'
    CloseDataSource = False
    DataSet = qUsuariosImpressao
    BCDToCurrency = False
    DataSetOptions = []
    Left = 176
    Top = 80
    FieldDefs = <
      item
        FieldName = 'USERNAME'
        FieldType = fftString
        Size = 30
      end
      item
        FieldName = 'NOME'
        FieldType = fftString
        Size = 150
      end
      item
        FieldName = 'EMAIL'
        FieldType = fftString
        Size = 60
      end
      item
        FieldName = 'ATIVO'
        FieldType = fftString
      end
      item
        FieldName = 'ULTLOGIN'
      end>
  end
  object rel_usuario_pdf: TfrxPDFExport
    FileName = 'reportsSabia'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 48
    Top = 128
  end
end
