unit uFuncoes;

interface

uses
  IdHashMessageDigest, Vcl.Forms, Vcl.Controls, Vcl.Buttons, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Graphics;

  function MD5(const Value: string): string;
  function ValidaCampos(Sender: TObject) : boolean;



implementation


uses System.SysUtils, uAvisos, uCadastroUsuario;

//Função para criptografar a senha.
function MD5(const Value: string): string;
var
  vMD5: TIdHashMessageDigest5;
begin

  vMD5 := TIdHashMessageDigest5.Create;
  try
    Result := LowerCase( vMD5.HashStringAsHex(Value));
  finally
    vMD5.Free;
  end;
end;

//Valida Campos
function ValidaCampos(Sender: TObject) : boolean;
var
  I : Integer;
begin

  for I := 0 to TForm(Sender).ComponentCount -1 do
  begin
      //TEdit
      if TForm(Sender).Components[I]is TCustomEdit then
      begin

        if TEdit(TForm(Sender).Components[I]).Text = EmptyStr then
        begin
          Application.CreateForm(TfrmAvisos, frmAvisos);
          frmAvisos.lblMensagem.Caption := TEdit(TForm(Sender).Components[I]).Hint;
          frmAvisos.ShowModal;
          Abort;
        end;

      end;

    end;

end;


{ Tfuncao }



end.
