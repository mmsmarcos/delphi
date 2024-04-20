object DM: TDM
  OnCreate = DataModuleCreate
  Height = 486
  Width = 1039
  PixelsPerInch = 120
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=C:\OneDrive\Projetos\Sistemas\Scopo\banco\SABIA.DFB'
      'User_Name=sysdba'
      'Password=dba@SYSDBA1984'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 113
  end
  object qListaUsuario: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT USERNAME, '
      '       NOME, '
      '       EMAIL, '
      
        '       CASE WHEN (ATIVO = 1) THEN '#39'Ativo'#39' ELSE '#39'Inativo'#39' END AS ' +
        'ATIVO, '
      '       ULTLOGIN,'
      '       PASSWORD '
      '  FROM TBUSUARIO')
    Left = 400
    Top = 128
    object qListaUsuarioUSERNAME: TStringField
      FieldName = 'USERNAME'
      Origin = 'USERNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object qListaUsuarioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 150
    end
    object qListaUsuarioEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 60
    end
    object qListaUsuarioATIVO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 7
    end
    object qListaUsuarioULTLOGIN: TSQLTimeStampField
      FieldName = 'ULTLOGIN'
      Origin = 'ULTLOGIN'
    end
    object qListaUsuarioPASSWORD: TStringField
      FieldName = 'PASSWORD'
      Origin = '"PASSWORD"'
      Required = True
      Size = 300
    end
  end
  object dsListaUsuario: TDataSource
    DataSet = qListaUsuario
    Left = 520
    Top = 128
  end
  object qParam: TFDQuery
    Connection = fdConexao
    Left = 80
    Top = 200
  end
  object qEmpresa: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT IDEMPRESA,'
      '       RAZAOSOCIAL,'
      '       NOMEFANTASIA,'
      '       CGC,'
      '       EMAIL,'
      '       TELEFONE,'
      
        '       CASE WHEN ATIVO = 1 THEN '#39'Ativo'#39' ELSE '#39'Inativo'#39' END ATIVO' +
        '       '
      ' FROM TBEMPRESA t'
      'WHERE ATIVO = 1')
    Left = 80
    Top = 288
    object qEmpresaIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Origin = 'IDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qEmpresaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Required = True
      Size = 200
    end
    object qEmpresaNOMEFANTASIA: TStringField
      FieldName = 'NOMEFANTASIA'
      Origin = 'NOMEFANTASIA'
      Required = True
      Size = 200
    end
    object qEmpresaCGC: TStringField
      FieldName = 'CGC'
      Origin = 'CGC'
      Required = True
      Size = 30
    end
    object qEmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object qEmpresaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 30
    end
    object qEmpresaATIVO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 7
    end
  end
  object dsEmpresa: TDataSource
    DataSet = qEmpresa
    Left = 180
    Top = 288
  end
end