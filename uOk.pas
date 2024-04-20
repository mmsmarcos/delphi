unit uOk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TfrmOk = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure Panel3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOk: TfrmOk;

implementation

{$R *.dfm}

procedure TfrmOk.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Close;
    frmOk := nil;
  end;

end;

procedure TfrmOk.Panel3Click(Sender: TObject);
begin
Close;
frmOk := nil;
end;

end.
