unit uCadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls;

type
  TfrmCadastroUsuario = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    btnConfirmar: TPanel;
    btnCancelar: TPanel;
    edtNome: TEdit;
    edtLogin: TEdit;
    edtEmail: TEdit;
    edtSenha: TEdit;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    chkAtivo: TCheckBox;
    qGrupoPermissao: TFDQuery;
    dsGrupoPermissao: TDataSource;
    qGrupoPermissaoIDPERFIL: TIntegerField;
    qGrupoPermissaoDESCRICAO: TStringField;
    cbxGrupoPermissao: TDBComboBox;
    SpeedButton2: TSpeedButton;
    qCadastraUsuario: TFDQuery;
    qAlteraUsuario: TFDQuery;
    qAlteraUsuarioUSERNAME: TStringField;
    qAlteraUsuarioNOME: TStringField;
    qAlteraUsuarioEMAIL: TStringField;
    qAlteraUsuarioPASSWORD: TStringField;
    qAlteraUsuarioATIVO: TIntegerField;
    qAlteraUsuarioIDPERFIL: TIntegerField;
    qAlteraUsuarioULTLOGIN: TSQLTimeStampField;
    qAlteraUsuarioRECCREATEDBY: TStringField;
    qAlteraUsuarioRECCREATEDON: TSQLTimeStampField;
    qAlteraUsuarioRECMODIFIEDBY: TStringField;
    qAlteraUsuarioRECMODIFIEDON: TSQLTimeStampField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    var
      acao : Integer;
      UserName : String;
  end;

var
  frmCadastroUsuario: TfrmCadastroUsuario;

implementation

{$R *.dfm}

uses uAvisos, uFuncoes, uErro, uPrincipal, uOk,
  uListaUsuario, uDM;

Var
  gTag : integer;

procedure TfrmCadastroUsuario.btnCancelarClick(Sender: TObject);
begin
Close;
frmCadastroUsuario := nil;
end;

procedure TfrmCadastroUsuario.btnConfirmarClick(Sender: TObject);
var
  erro : TfrmErro;
  aviso: TfrmAvisos;
  i, ativo : Integer;
  formPrincipal : TfrmPrincipal;
  OK : TfrmOk;
begin

if acao = 1 then //Inserir
begin

if chkAtivo.Checked = True then ativo := 1 else ativo := 0;


{ Melhorar forma de validar campos }

  for i := 0 to ComponentCount -1 do
    begin

      if (Components[i] is TEdit) then
      begin

        if (Components[i] as TEdit).Text = EmptyStr then
          begin
            aviso := TfrmAvisos.Create(Self);
            aviso.lblMensagem.Caption := 'O campo '+(Components[i] as TEdit).Hint+' é obrigatório e não pode estar vazio.';
            aviso.ShowModal;
            (Components[i] as TEdit).SetFocus;
            Abort;
          end;

      end;

    end;

  try


   with qCadastraUsuario do
   begin

     Close;
     SQL.Clear;

     SQL.Add('INSERT INTO TBUSUARIO (USERNAME, NOME, EMAIL, PASSWORD, ATIVO, IDPERFIL, RECCREATEDBY, RECCREATEDON) VALUES'+
              '(:USERNAME, :NOME, :EMAIL, :PASSWORD, :ATIVO, :IDPERFIL, :RECCREATEDBY, :RECCREATEDON)');

     ParamByName('USERNAME').Value     := edtLogin.Text;
     ParamByName('NOME').Value         := edtNome.Text;
     ParamByName('EMAIL').Value        := edtEmail.Text;
     ParamByName('PASSWORD').Value     := MD5(edtEmail.Text);
     ParamByName('ATIVO').Value        := ativo;
     ParamByName('IDPERFIL').Value     := qGrupoPermissaoIDPERFIL.AsInteger;
     ParamByName('RECCREATEDBY').Value :=  formPrincipal.lblUsuarioLogado.Caption;
     ParamByName('RECCREATEDON').Value := Now;

     ExecSQL;

     OK := TfrmOk.Create(Self);
     OK.ShowModal;

    Application.CreateForm(TfrmListaUsuario, frmListaUsuario);


     if DM.qListaUsuario.Active = True then
     begin
      DM.qListaUsuario.Close;
      DM.qListaUsuario.Open;
     end else DM.qListaUsuario.Open;

   end;
     except
      on E: Exception do
      begin
        erro := TfrmErro.Create(Self);
        erro.Memo1.Lines.Text := 'Erro ao tentar salvar Usuário. '+E.Message;
        erro.ShowModal;
      end;
  end;

  //Limpa os Edits
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TEdit) then
      (Components[i] as TEdit).Clear;
  end;
  cbxGrupoPermissao.Clear;

end else  //Altera Usuário
  Try
      with qCadastraUsuario Do
      Begin
        Close;
        SQL.Clear;
        if chkAtivo.Checked = True then ativo := 1 else ativo := 0;
        if edtSenha.Text = EmptyStr then
          begin
          SQL.Add('UPDATE TBUSUARIO SET NOME = :NOME, EMAIL = :EMAIL, ATIVO = :ATIVO, IDPERFIL = :IDPERFIL, RECMODIFIEDBY = :RECMODIFIEDBY, RECMODIFIEDON = :RECMODIFIEDON '+
                  ' WHERE USERNAME = '''+edtLogin.Text+'''');
            ParamByName('NOME').Value := edtNome.Text;
            ParamByName('EMAIL').Value := edtEmail.Text;
            ParamByName('ATIVO').Value := ativo;
            ParamByName('IDPERFIL').Value := qGrupoPermissaoIDPERFIL.AsInteger;
            ParamByName('RECMODIFIEDBY').Value :=  'teste'; //formPrincipal.lblUsuarioLogado.Caption;
            ParamByName('RECMODIFIEDON').Value := Now;

            ExecSQL;
            OK := TfrmOk.Create(Self);
            OK.ShowModal;
             if DM.qListaUsuario.Active = True then
               begin
                DM.qListaUsuario.Close;
                DM.qListaUsuario.Open;
               end else DM.qListaUsuario.Open;
          end
        else
        begin
        SQL.Add('UPDATE TBUSUARIO SET NOME = :NOME, EMAIL = :EMAIL, PASSWORD = :PASSWORD, ATIVO = :ATIVO, IDPERFIL = :IDPERFIL, RECMODIFIEDBY = :RECMODIFIEDBY, RECMODIFIEDON = :RECMODIFIEDON '+
                '  WHERE USERNAME = '''+edtLogin.Text+'''');
          ParamByName('NOME').Value := edtNome.Text;
          ParamByName('EMAIL').Value := edtEmail.Text;
          ParamByName('PASSWORD').Value := MD5(edtSenha.Text);
          ParamByName('ATIVO').Value := ativo;
          ParamByName('IDPERFIL').Value := qGrupoPermissaoIDPERFIL.AsInteger;
          ParamByName('RECMODIFIEDBY').Value :=  'teste'; //formPrincipal.lblUsuarioLogado.Caption;
          ParamByName('RECMODIFIEDON').Value := Now;

          ExecSQL;
          OK := TfrmOk.Create(Self);
          OK.ShowModal;
          if DM.qListaUsuario.Active = True then
               begin
                DM.qListaUsuario.Close;
                DM.qListaUsuario.Open;
               end else DM.qListaUsuario.Open;
        end;
      End;
     except
      on E: Exception do
      begin
        erro := TfrmErro.Create(Self);
        erro.Memo1.Lines.Text := 'Erro ao tentar salvar Usuário. '+E.Message;
        erro.ShowModal;
      end;
  End;
  Close;
end;

procedure TfrmCadastroUsuario.FormShow(Sender: TObject);
var
  erro : TfrmErro;
  ativo : Boolean;
  listaUser : TfrmListaUsuario;
begin
listaUser := TfrmListaUsuario.Create(nil);
if acao = 1 then //Inserir
begin
  try
    qGrupoPermissao.Open;
    chkAtivo.Checked := True;
  except
    on e: Exception do
    begin
      erro := TfrmErro.Create(Self);
      erro.Show;
    end;
  end;
   edtNome.SetFocus;
end else
      if acao = 2 then //Alterar
      begin
        try
        qAlteraUsuario.ParamByName('USERNAME').AsString := UserName;
        qAlteraUsuario.Open;
         if qAlteraUsuarioATIVO.AsInteger = 1 Then ativo := True else ativo := False;
          edtNome.Text := qAlteraUsuarioNOME.Value;
          edtLogin.Text := qAlteraUsuarioUSERNAME.Value;
          edtEmail.Text := qAlteraUsuarioEMAIL.Value;
          chkAtivo.Checked := ativo;
          edtLogin.Enabled := False;
          qGrupoPermissao.Open;
        finally
        listaUser.Free;
      end;
      end;


end;

procedure TfrmCadastroUsuario.SpeedButton2Click(Sender: TObject);
begin

if edtSenha.PasswordChar = '*' then
  edtSenha.PasswordChar := #0 else
  edtSenha.PasswordChar := '*'

end;

end.
