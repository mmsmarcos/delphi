unit uListagemVeiculos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmListagemVeiculos = class(TForm)
    pnl_Button: TPanel;
    btnInserir: TButton;
    btnAlterar: TButton;
    btnVoltar: TButton;
    btnImprimir: TButton;
    DBGrid1: TDBGrid;
    pnl_Top: TPanel;
    SpeedButton1: TSpeedButton;
    cbxItemTabela: TComboBox;
    edtPesquisa: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagemVeiculos: TfrmListagemVeiculos;

implementation

{$R *.dfm}

uses uDM, uOk, uErro, uCadastroVeiculos, uPrincipal;

procedure TfrmListagemVeiculos.btnAlterarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroVeiculos, frmCadastroVeiculos);
  frmCadastroVeiculos.ShowModal;
  frmCadastroVeiculos.Tag := 2; //Alterar
end;

procedure TfrmListagemVeiculos.btnInserirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroVeiculos, frmCadastroVeiculos);
  frmCadastroVeiculos.Tag := 1; //Incluir
  frmCadastroVeiculos.ShowModal;

end;

procedure TfrmListagemVeiculos.btnVoltarClick(Sender: TObject);
begin
Close;
frmListagemVeiculos := nil;
end;

procedure TfrmListagemVeiculos.DBGrid1TitleClick(Column: TColumn);
begin
  if DM.qVeiculos.IndexFieldNames = Column.FieldName then
    DM.qVeiculos.IndexFieldNames := Column.FieldName + ':D'
  else
    DM.qVeiculos.IndexFieldNames := Column.FieldName;
end;

procedure TfrmListagemVeiculos.edtPesquisaChange(Sender: TObject);
var
  erro : TfrmErro;
begin
try
  with DM.qVeiculos do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT t.IDEMPRESA, t.IDVEICULO, t.CODETD, t3.NOME ESTADO, t.PLACA, t.CERTIFICADO, t.MARCA, t.MODELO, '+
            '       t.COR, t.ANOFAB,t.ANOMOD, t.RNTC, t.RENAVAN, t.TARAKG, t.CAPACIDADEKG,  t.IDTIPORODADO, t2.DESCRICAO DESC_RODADO, t.ATIVO '+
            ' FROM TBVEICULOS t LEFT OUTER JOIN TBTIPORODADO t2 ON t.IDEMPRESA = t2.IDEMPRESA AND t.IDTIPORODADO = t2.IDRODADO '+
            '                   LEFT OUTER JOIN TBESTADOS t3    ON t.CODETD = t3.CODETD  '+
            'WHERE t.IDEMPRESA = '+frmPrincipal.IDEMPRESA.Caption+' AND '+cbxItemTabela.Text+' LIKE ''%'+edtPesquisa.Text+'%''');
    Open;
  end;

  except
    on E: Exception do
    begin
    erro := TfrmErro.Create(Self);
    erro.Memo1.Lines.Text := 'Erro ao consultar os dados de Usuário: '+E.Message;
    erro.ShowModal;
    end;
end;
end;

procedure TfrmListagemVeiculos.FormShow(Sender: TObject);
Var
  I : Integer;
begin

  DM.qVeiculos.Active := true;

  for I := 0 to DM.qVeiculos.FieldCount -1 do
  cbxItemTabela.Items.Add(DM.qVeiculos.Fields[i].DisplayName);
  cbxItemTabela.ItemIndex := 0;

end;

procedure TfrmListagemVeiculos.SpeedButton1Click(Sender: TObject);
begin
if edtPesquisa.Text <> EmptyStr then edtPesquisa.Clear;

if DM.qVeiculos.Active = true then
  begin
    DM.qVeiculos.Close;
    DM.qVeiculos.Open;
  end else DM.qVeiculos.Open;
end;

end.
