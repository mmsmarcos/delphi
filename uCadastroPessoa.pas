unit uCadastroPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmCadastroPessoa = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    btnConfirmar: TPanel;
    btnCancelar: TPanel;
    edtNome: TEdit;
    edtCPF: TEdit;
    edtTipo: TEdit;
    edtTipoDesc: TEdit;
    edtRG: TEdit;
    edtEmail: TEdit;
    edtResponsavel: TEdit;
    edtTelefone: TEdit;
    chkAtivo: TCheckBox;
    edtVeiculo: TEdit;
    edtVeiculoDesc: TEdit;
    SpeedButton2: TSpeedButton;
    Label9: TLabel;
    qCadastraPessoa: TFDQuery;
    Panel3: TPanel;
    procedure btnConfirmarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPessoa: TfrmCadastroPessoa;

implementation

{$R *.dfm}

uses uErro, uPrincipal, uOk, uDM, uTipoPessoa, uConsultaVeiculo;

procedure TfrmCadastroPessoa.btnCancelarClick(Sender: TObject);
begin
Close;
frmCadastroPessoa := nil;
end;

procedure TfrmCadastroPessoa.btnConfirmarClick(Sender: TObject);
Var
  erro : TfrmErro;
  formPrincipal : TfrmPrincipal;
  OK : TfrmOk;
  ativo, vAnoFab, vAnoMod, vTaraKg, vCapKg, i : Integer;
begin
if Tag = 1 then
Begin
if ((edtNome.Text = EmptyStr) or (edtTIpo.Text = EmptyStr)) then
Begin
  erro := TfrmErro.Create(Self);
  erro.Memo1.Lines.Text := 'O campo obrigatórios não preenchidos! ';
  erro.ShowModal;
End else
Begin
if chkAtivo.Checked = True then ativo := 1 else ativo := 0;
  Try
  with qCadastraPessoa do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO TBPESSOA (IDEMPRESA, IDTIPO, NOME, CPF, RG, IDVEICULO, RESPONSAVEL, EMAIL, TELEFONE, ATIVO, RECCREATEDBY, RECCREATEDON)'+
            ' VALUES (:IDEMPRESA, :IDTIPO, :NOME, :CPF, :RG, :IDVEICULO, :RESPONSAVEL, :EMAIL, :TELEFONE, :ATIVO, :RECCREATEDBY, :RECCREATEDON)');


          Begin

           ParamByName('IDEMPRESA').Value   := DM.qUserEmpresaIDEMPRESA.Value;
           ParamByName('IDTIPO').Value      := edtTipo.Text;
           ParamByName('NOME').Value        := edtNome.Text;
           ParamByName('CPF').Value         := edtCPF.Text;
           ParamByName('RG').Value          := edtRG.Text;
           ParamByName('IDVEICULO').Value   := edtVeiculo.Text;
           ParamByName('RESPONSAVEL').Value := edtResponsavel.Text;
           ParamByName('EMAIL').Value       := edtEmail.Text;
           ParamByName('TELEFONE').Value    := edtTelefone.Text;
           ParamByName('ATIVO').Value       := ativo;
           ParamByName('RECCREATEDBY').Value:= DM.qUserEmpresaUSERNAME.Value;
           ParamByName('RECCREATEDON').Value:= Now;
           ExecSQL;
           OK := TfrmOk.Create(Self);
           OK.ShowModal;
           DM.qVeiculos.Close;
           DM.qVeiculos.Open;

             //Limpa os Edits
          for i := 0 to ComponentCount -1 do
            begin
              if (Components[i] is TEdit) then
                (Components[i] as TEdit).Clear;
            end;
          End;
  End;


  except
    on E: Exception do
    begin
      erro := TfrmErro.Create(Self);
      erro.Memo1.Lines.Text := 'Erro ao salvar o Veículo. '+E.Message;
      erro.ShowModal;
    end;
  end;
End;
end else
    Begin
      //Alteração
      Try

        with qCadastraPessoa do
          begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE TBVEICULOS SET CODETD = :CODETD, TARAKG = :TARAKG, CAPACIDADEKG = :CAPACIDADEKG, IDTIPORODADO = :IDTIPORODADO, ATIVO = :ATIVO, RECMODIFIEDBY = :RECMODIFIEDBY, RECMODIFIEDON = :RECMODIFIEDON '+
                  ' WHERE IDEMPRESA = '+IntToStr(DM.qVeiculosIDEMPRESA.Value)+' AND IDVEICULO = '+IntToStr(DM.qVeiculosIDVEICULO.Value));
          end;
    except
      on E: Exception do
      begin
        erro := TfrmErro.Create(Self);
        erro.Memo1.Lines.Text := 'Erro ao salvar o Veículo. '+E.Message;
        erro.ShowModal;
      end;
    end;




    End;
end;

procedure TfrmCadastroPessoa.SpeedButton1Click(Sender: TObject);
Var
  tipoPessoa : TfrmTipoPessoa;
begin
  tipoPessoa := TfrmTipoPessoa.Create(Self);
  tipoPessoa.Show;
  tipoPessoa.Tag := 1;
end;

procedure TfrmCadastroPessoa.SpeedButton2Click(Sender: TObject);
Var
  consultaVeiculo : TfrmConsultaVeiculo;
begin
  consultaVeiculo := TfrmConsultaVeiculo.Create(Self);
  consultaVeiculo.Show;
  consultaVeiculo.Tag := 1;
end;

end.
