unit uErro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmErro = class(TForm)
    pnlTop: TPanel;
    pnlButton: TPanel;
    Panel4: TPanel;
    Memo1: TMemo;
    pnlOk: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure pnlOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmErro: TfrmErro;

implementation

{$R *.dfm}

procedure TfrmErro.pnlOkClick(Sender: TObject);
begin
Close;
frmErro := nil;
end;

end.
