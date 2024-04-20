unit uCadastroEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmCadastroEmpresa = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    btnConfirmar: TPanel;
    btnCancelar: TPanel;
    edtRazaoSocial: TEdit;
    edtCnpj: TEdit;
    edtNomeFantasia: TEdit;
    edtEmail: TEdit;
    chkAtivo: TCheckBox;
    edtTelefone: TEdit;
    qEmpresa: TFDQuery;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private

  public
    var
      acao : Integer;
  end;

var
  frmCadastroEmpresa: TfrmCadastroEmpresa;

implementation

{$R *.dfm}

uses uFuncoes, uErro, uDM, uOk;

procedure TfrmCadastroEmpresa.btnCancelarClick(Sender: TObject);
begin
Close;
frmCadastroEmpresa := nil;
end;

procedure TfrmCadastroEmpresa.btnConfirmarClick(Sender: TObject);
Var
  erro  : TfrmErro;
  ativo : Integer;
  OK    : TfrmOk;
begin
  if acao = 1 then //Inserir
    begin
      Try
        with qEmpresa do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO TBEMPRESA (RAZAOSOCIAL, NOMEFANTASIA, CGC, EMAIL, TELEFONE, ATIVO) '+
                  ' VALUES (:RAZAOSOCIAL, :NOMEFANTASIA, :CGC, :EMAIL, :TELEFONE, :ATIVO)         ');
          ParamByName('RAZAOSOCIAL').Value  := edtRazaoSocial.Text;
          ParamByName('NOMEFANTASIA').Value := edtNomeFantasia.Text;
          ParamByName('CGC').Value          := edtCnpj.Text;
          ParamByName('EMAIL').Value        := edtEMAIL.Text;
          ParamByName('TELEFONE').Value     := edtTelefone.Text;
          if chkAtivo.Checked = True then ativo := 1 else ativo := 0;
          ParamByName('ATIVO').Value        := ativo;
          ExecSQL;

          OK := TfrmOk.Create(Self);
          OK.ShowModal;
          Close;

          if DM.qEmpresa.Active = true then
            begin
              DM.qEmpresa.Close;
              DM.qEmpresa.Open;
            end else DM.qEmpresa.Open;

        End;

        except on e: Exception do
            begin
              erro := TfrmErro.Create(Self);
              erro.Memo1.Lines.Text := 'Erro ao tentar salvar Empresa. '+E.Message;
              erro.ShowModal;
            end;


      End
    end else //Alterar
          Begin

          End;

end;

procedure TfrmCadastroEmpresa.FormShow(Sender: TObject);
Var
  ativo : Boolean;
  erro  : TfrmErro;
begin
  if acao = 2 then
    Begin
      Try
       if DM.qEmpresaATIVO.AsInteger = 1 Then ativo := True else ativo := False;
       edtRazaoSocial.Text  := DM.qEmpresaRAZAOSOCIAL.Value;
       edtNomeFantasia.Text := DM.qEmpresaNOMEFANTASIA.Value;
       edtCnpj.Text         := DM.qEmpresaCGC.Value;
       edtEmail.Text        := DM.qEmpresaEMAIL.Value;
       chkAtivo.Checked     := ativo;

      except on E: Exception do
        begin
        erro := TfrmErro.Create(Self);
        erro.Memo1.Lines.Text := 'Erro ao carregar os dados. '+E.Message;
        erro.ShowModal;
      end;
    End;
    End Else chkAtivo.Checked := True;
end;
end.
