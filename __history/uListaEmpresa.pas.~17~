unit uListaEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmListaEmpresa = class(TForm)
    DBGrid1: TDBGrid;
    pnl_Top: TPanel;
    SpeedButton1: TSpeedButton;
    cbxItemTabela: TComboBox;
    edtPesquisa: TEdit;
    pnl_Button: TPanel;
    btnInserir: TButton;
    btnAlterar: TButton;
    btnVoltar: TButton;
    btnImprimir: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaEmpresa: TfrmListaEmpresa;

implementation

{$R *.dfm}

uses uDM, uCadastroEmpresa;



procedure TfrmListaEmpresa.btnAlterarClick(Sender: TObject);
var
  cadEmpresa : TfrmCadastroEmpresa;
begin
  cadEmpresa := TfrmCadastroEmpresa.Create(Self);
  cadEmpresa.acao := 2;
  cadEmpresa.Show;
end;

procedure TfrmListaEmpresa.btnInserirClick(Sender: TObject);
var
  cadEmpresa : TfrmCadastroEmpresa;
begin
  cadEmpresa := TfrmCadastroEmpresa.Create(Self);
  cadEmpresa.acao := 1;
  cadEmpresa.Show;
end;

procedure TfrmListaEmpresa.btnVoltarClick(Sender: TObject);
begin
Close;
frmListaEmpresa := nil;
end;

procedure TfrmListaEmpresa.DBGrid1TitleClick(Column: TColumn);
begin
  if DM.qEmpresa.IndexFieldNames = Column.FieldName then
    DM.qEmpresa.IndexFieldNames := Column.FieldName + ':D'
  else
    DM.qEmpresa.IndexFieldNames := Column.FieldName;
end;

procedure TfrmListaEmpresa.FormShow(Sender: TObject);
Var
  I : Integer;
begin
  DM.qEmpresa.Active := true;

  for I := 0 to DM.qEmpresa.FieldCount -1 do
  cbxItemTabela.Items.Add(DM.qEmpresa.Fields[i].DisplayName);

  cbxItemTabela.ItemIndex := 0;
end;

procedure TfrmListaEmpresa.SpeedButton1Click(Sender: TObject);
begin
if edtPesquisa.Text <> EmptyStr then edtPesquisa.Clear;

if DM.qEmpresa.Active = true then
  begin
    DM.qEmpresa.Close;
    DM.qEmpresa.Open;
  end else DM.qEmpresa.Open;

end;

end.
