unit uMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMovimentacao = class(TForm)
    pnl_Top: TPanel;
    pnl_Client: TPanel;
    pnl_Button: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovimentacao: TfrmMovimentacao;

implementation

{$R *.dfm}

procedure TfrmMovimentacao.Button1Click(Sender: TObject);
begin
frmMovimentacao.Close;
frmMovimentacao:= nil;
end;

end.
