unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  Vcl.Dialogs, Vcl.Forms, Winapi.Windows, Winapi.Messages, Vcl.Graphics,
  Vcl.Controls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, System.Variants, IniFiles;

type
  TDM = class(TDataModule)
    fdConexao: TFDConnection;
    qListaUsuario: TFDQuery;
    dsListaUsuario: TDataSource;
    qParam: TFDQuery;
    qListaUsuarioUSERNAME: TStringField;
    qListaUsuarioNOME: TStringField;
    qListaUsuarioEMAIL: TStringField;
    qListaUsuarioATIVO: TStringField;
    qListaUsuarioULTLOGIN: TSQLTimeStampField;
    qListaUsuarioPASSWORD: TStringField;
    qEmpresa: TFDQuery;
    dsEmpresa: TDataSource;
    qEmpresaIDEMPRESA: TIntegerField;
    qEmpresaRAZAOSOCIAL: TStringField;
    qEmpresaNOMEFANTASIA: TStringField;
    qEmpresaCGC: TStringField;
    qEmpresaEMAIL: TStringField;
    qEmpresaTELEFONE: TStringField;
    qEmpresaATIVO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uErro;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
Var
  ArqIni : TMemIniFile;
  erro   : TfrmErro;
begin
 if not FileExists('sabia.ini') then
    begin
      erro := TfrmErro.Create(nil);
      erro.Memo1.Lines.Add('Erro ao ler o arquivo de configura��o. O arquivo n�o foi encontrado!');
      erro.ShowModal;
      Application.Terminate;
    end else
            Try
            begin

                ArqIni := TMemIniFile.Create('sabia.ini');
                ArqIni.ReadString('DATABASE', 'Arquivo', '');
                fdConexao.Params.DriverID            := ArqIni.ReadString('DATABASE', 'DriverID', '');
                fdConexao.Params.Values['Protocolo'] := ArqIni.ReadString('DATABASE', 'Protocolo', '');
                fdConexao.Params.Values['Server']    := ArqIni.ReadString('DATABASE', 'Server', '');
                fdConexao.Params.Values['Port']      := ArqIni.ReadString('DATABASE', 'Port', '');
                fdConexao.Params.Database            := ArqIni.ReadString('DATABASE', 'Arquivo', '');
                fdConexao.Params.UserName            := 'sysdba';
                fdConexao.Params.Password            := 'dba@SYSDBA1984';

                fdConexao.Connected := True;
                ArqIni.Free;


            end;

            except
              on E: Exception do
                begin
                  erro := TfrmErro.Create(nil);
                  erro.Memo1.Lines.Add('Erro ao conectar ao banco de dados!' + E.Message);
                  erro.ShowModal;
                end;
            End;
end;

end.
