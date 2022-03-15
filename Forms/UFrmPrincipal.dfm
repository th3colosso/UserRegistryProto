object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'UMS - User Management System'
  ClientHeight = 360
  ClientWidth = 688
  Color = clBtnFace
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 341
    Width = 688
    Height = 19
    Hint = 'Inicia um novo cadastro'
    AutoHint = True
    Color = clActiveCaption
    Panels = <
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 500
      end
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = 'Vers'#227'o 1.0.0.0'
        Width = 20
      end>
    ParentShowHint = False
    ShowHint = True
    ExplicitWidth = 594
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 65
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 594
    object btnNovo: TBitBtn
      Left = 16
      Top = 14
      Width = 75
      Height = 40
      Hint = 'Inicar novo cadastro'
      Caption = '&Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnEditar: TBitBtn
      Left = 97
      Top = 14
      Width = 75
      Height = 40
      Hint = 'Editar cadastro atual'
      Caption = '&Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnDeletar: TBitBtn
      Left = 178
      Top = 14
      Width = 75
      Height = 40
      Hint = 'Deletar cadastro atual'
      Caption = '&Deletar'
      TabOrder = 2
      OnClick = btnDeletarClick
    end
    object btnGravar: TBitBtn
      Left = 259
      Top = 14
      Width = 75
      Height = 40
      Hint = 'Gravar dados'
      Caption = '&Gravar'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object btnCancelar: TBitBtn
      Left = 340
      Top = 14
      Width = 75
      Height = 40
      Hint = 'Cancelar altera'#231#245'es n'#227'o salvas'
      Caption = '&Cancelar'
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    object btnAtualizar: TBitBtn
      Left = 421
      Top = 14
      Width = 75
      Height = 40
      Hint = 'Sincronizar dados'
      Caption = 'Atualizar'
      TabOrder = 5
      OnClick = btnAtualizarClick
    end
    object btnPesquisar: TBitBtn
      Left = 502
      Top = 14
      Width = 75
      Height = 40
      Hint = 'Pesquisa de usu'#225'rios'
      Caption = '&Pesquisar'
      TabOrder = 6
      OnClick = btnPesquisarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 299
    Width = 688
    Height = 42
    Align = alBottom
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 594
    object btnSair: TBitBtn
      Left = 518
      Top = 5
      Width = 50
      Height = 35
      Hint = 'Cancelar altera'#231#245'es n'#227'o salvas e fechar programa'
      Caption = '&Sair'
      TabOrder = 0
      OnClick = btnSairClick
    end
    object dbNavigator: TDBNavigator
      Left = 178
      Top = 11
      Width = 224
      Height = 25
      DataSource = dsUsuario
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object pnlDados: TPanel
    Left = 0
    Top = 65
    Width = 688
    Height = 234
    Align = alClient
    Enabled = False
    TabOrder = 3
    ExplicitWidth = 594
    object Label1: TLabel
      Left = 44
      Top = 14
      Width = 13
      Height = 13
      Caption = 'ID'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 44
      Top = 103
      Width = 31
      Height = 13
      Caption = 'NOME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 44
      Top = 143
      Width = 20
      Height = 13
      Caption = 'CPF'
      FocusControl = txtCPF
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 44
      Top = 183
      Width = 35
      Height = 13
      Caption = 'EMAIL'
      FocusControl = txtEmail
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 220
      Top = 143
      Width = 52
      Height = 13
      Caption = 'TELEFONE'
      FocusControl = txtTelefone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 44
      Top = 60
      Width = 34
      Height = 13
      Caption = 'LOGIN'
      FocusControl = txtLogin
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 304
      Top = 60
      Width = 36
      Height = 13
      Caption = 'SENHA'
      FocusControl = txtSenha
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 44
      Top = 30
      Width = 69
      Height = 21
      TabStop = False
      DataField = 'CODUSUARIO'
      DataSource = dsUsuario
      ReadOnly = True
      TabOrder = 0
    end
    object txtLogin: TDBEdit
      Left = 44
      Top = 76
      Width = 240
      Height = 21
      DataField = 'LOGIN'
      DataSource = dsUsuario
      TabOrder = 1
    end
    object txtCPF: TDBEdit
      Left = 44
      Top = 159
      Width = 147
      Height = 21
      DataField = 'CPF'
      DataSource = dsUsuario
      TabOrder = 4
    end
    object txtEmail: TDBEdit
      Left = 44
      Top = 199
      Width = 500
      Height = 21
      DataField = 'EMAIL'
      DataSource = dsUsuario
      TabOrder = 6
    end
    object txtTelefone: TDBEdit
      Left = 220
      Top = 159
      Width = 199
      Height = 21
      DataField = 'TELEFONE'
      DataSource = dsUsuario
      TabOrder = 5
    end
    object txtNome: TDBEdit
      Left = 44
      Top = 118
      Width = 500
      Height = 21
      DataField = 'NOME'
      DataSource = dsUsuario
      TabOrder = 3
    end
    object txtSenha: TDBEdit
      Left = 304
      Top = 76
      Width = 177
      Height = 21
      DataField = 'SENHA'
      DataSource = dsUsuario
      PasswordChar = '*'
      TabOrder = 2
    end
    object btnMostraSenha: TBitBtn
      Left = 487
      Top = 74
      Width = 26
      Height = 25
      Hint = 'Mostra Senha'
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000C40E0000C40E00000000000000000000B8B9B6B8B9B6
        B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9
        B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B60000B8B9B6B8B9B6B8B9B6B8B9B6B8B9
        B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B60000B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        0000B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B0B2AFA4A5A3A4A5A3
        B0B2AFB8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B60000B8B9B6B8B9B6
        B8B9B6B8B9B6B2B4B18587844848470000000000000000000000004848478587
        84B2B4B1B8B9B6B8B9B6B8B9B6B8B9B60000B8B9B6B8B9B6B8B9B69C9D9B3839
        380000006566648B8C8A9A9C999A9C998B8C8A6566640000003839389C9D9BB8
        B9B6B8B9B6B8B9B60000B8B9B6B8B9B6939592141414555655A7A9A6B3B5B27C
        7D7B40403F40403F7C7D7BB3B5B2A7A9A6555655141414939592B8B9B6B8B9B6
        0000B8B9B6A4A6A31C1C1C676867B4B6B3B8B9B66667651F1F1F777876777876
        1F1F1F666765B8B9B6B4B6B36768671C1C1CA4A6A3B8B9B60000B7B9B6545554
        40403FB2B3B0B8B9B6A6A8A5000000929391B8B9B6B8B9B6929391000000A6A8
        A5B8B9B6B2B3B040403F545554B7B9B60000ADAFAC0F0F0F7E7F7DB8B9B6B8B9
        B69A9B99000000A8AAA7B8B9B6B8B9B6A8AAA70000009A9B99B8B9B6B8B9B67E
        7F7D0F0F0FADAFAC0000B8B9B66C6D6C242424A9AAA7B8B9B6ACAEAB1414147D
        7E7CB7B9B6B7B9B67D7E7C141414ACAEABB8B9B6A9AAA72424246C6D6CB8B9B6
        0000B8B9B6AFB0AE3B3C3B494948A9ABA8B8B9B68183800000004A4B4A4A4B4A
        000000818380B8B9B6A9ABA84949483B3C3BAFB0AEB8B9B60000B8B9B6B8B9B6
        A6A7A43A3A393132318E8F8DB4B5B2999B98717270717270999B98B4B5B28E8F
        8D3132313A3A39A6A7A4B8B9B6B8B9B60000B8B9B6B8B9B6B8B9B6ADAEAC6364
        62000000343534696A697D7E7C7D7E7C696A69343534000000636462ADAEACB8
        B9B6B8B9B6B8B9B60000B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6A1A2A076777550
        514F21222121222150514F767775A1A2A0B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        0000B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B60000B8B9B6B8B9B6
        B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9
        B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B60000B8B9B6B8B9B6B8B9B6B8B9B6B8B9
        B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B60000}
      TabOrder = 7
      TabStop = False
      OnClick = btnMostraSenhaClick
    end
    object btnEscondeSenha: TBitBtn
      Left = 518
      Top = 74
      Width = 26
      Height = 25
      Hint = 'Esconde Senha'
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000C40E0000C40E00000000000000000000B8B9B6B8B9B6
        B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9
        B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B60000B8B9B6B8B9B6B8B9B6B8B9B6B8B9
        B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B5B6B3B8
        B9B6B8B9B6B8B9B60000B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B1B3B0555655888987B8B9B6B8B9B6
        0000B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B0B2AFA4A5A3A5A7A4
        B0B1AEB8B9B6B1B3B05556552A2B2AA1A2A0B8B9B6B8B9B60000B8B9B6B8B9B6
        B8B9B6B8B9B6B2B4B18587844848470000000000000000000000004D4E4D4D4E
        4D2A2B2AA0A29FB8B9B6B8B9B6B8B9B60000B8B9B6B8B9B6B8B9B69C9D9B3839
        380000006566648B8C8A9A9C999A9C998283810F0F0F2A2B2AA0A29FB8B9B6B8
        B9B6B8B9B6B8B9B60000B8B9B6B8B9B6939592141414555655A7A9A6B3B5B27C
        7D7B40403F40403F4546452A2B2AA0A29FB7B8B5747573989997B8B9B6B8B9B6
        0000B8B9B6A4A6A31C1C1C676867B4B6B3B8B9B66667651F1F1F6B6C6A141414
        2A2B2AA0A29FB8B9B6B5B7B4676866242424A4A6A3B8B9B60000B7B9B6545554
        40403FB2B3B0B8B9B6A6A8A5000000898A885556552A2B2AA0A29FB7B8B5B0B2
        AFB8B9B6B4B5B24546455D5E5CB8B9B60000ADAEAC0F0F0F7F807EB8B9B6B8B9
        B69A9B990000004142412A2B2AA0A29FB7B8B57374729A9C99B8B9B6B8B9B67E
        807D0F0F0FAEAFAC0000B8B9B66C6D6B262626AAACA9B8B9B6A6A8A50000002A
        2B2AA0A29FB8B9B67D7E7C141414ACAEABB8B9B6A9AAA72424246C6D6CB8B9B6
        0000B8B9B6AEB0AD3C3D3C454645A4A5A35556552A2B2AA0A19FB7B8B5737472
        000000818380B8B9B6A9ABA84949483B3C3BAFB0AEB8B9B60000B8B9B6B8B9B6
        A6A7A43A3A390000002A2B2AA0A19FB8B9B6979896717270999B98B4B5B28E8F
        8D3132313A3A39A6A7A4B8B9B6B8B9B60000B8B9B6B8B9B6B1B3B05354532A2B
        2AA0A19FB7B8B58486837F817E7D7E7C696A69343534000000636462ADAEACB8
        B9B6B8B9B6B8B9B60000B8B9B6B1B3B05556552A2B2AA0A19FB8B9B69A9B9950
        514F24242421222150514F767775A1A2A0B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        0000B8B9B6A9ABA8464746A0A19FB8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B60000B8B9B6B8B9B6
        B6B7B4B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9
        B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B60000B8B9B6B8B9B6B8B9B6B8B9B6B8B9
        B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B60000}
      TabOrder = 8
      TabStop = False
      OnClick = btnEscondeSenhaClick
    end
  end
  object conexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\matth\Documents\Embarcadero\Studio\Projects\Te' +
        'stePraticoCartSys\Exe\Banco\DB_UserManagementSystem.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    Left = 640
    Top = 64
  end
  object qryGeral: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from usuario order by codusuario')
    Left = 640
    Top = 120
    object qryGeralCODUSUARIO: TIntegerField
      FieldName = 'CODUSUARIO'
      Origin = 'CODUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGeralNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qryGeralCPF: TStringField
      DisplayWidth = 15
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      EditMask = '###.###.###\-##;1;_'
      Size = 15
    end
    object qryGeralEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 100
    end
    object qryGeralTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      EditMask = '!\(##\)#####-####;1;_'
      Size = 15
    end
    object qryGeralLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 30
    end
    object qryGeralSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 15
    end
  end
  object dsUsuario: TDataSource
    DataSet = qryGeral
    Left = 640
    Top = 168
  end
end
