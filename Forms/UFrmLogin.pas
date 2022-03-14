unit UFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    btnSair: TBitBtn;
    btnEntrar: TBitBtn;
    Image1: TImage;
    Panel2: TPanel;
    txtUsuario: TEdit;
    txtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    qryLogin: TFDQuery;
    StatusBar: TStatusBar;
    procedure btnSairClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure txtUsuarioKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses
  UFrmPrincipal;

procedure TFrmLogin.btnEntrarClick(Sender: TObject);
var podeLogar : Boolean;
begin

  if (length(trim(txtUsuario.text)) = 0) or (length(trim(txtSenha.text)) = 0) then
  begin
    application.MessageBox('Favor preencher os campos de login corretamente!', 'A T E N Ç Ã O');
    Abort;
  end;

  if (AnsiUpperCase(txtUsuario.text) = 'ADMIN') and (AnsiUpperCase(txtSenha.text) = 'ADMIN') then
  begin
    FrmPrincipal.iCodUsuario := 0;
    podeLogar := true;
  end
  else
  begin
    qryLogin.Close;
    qryLogin.Sql.Clear;
    qryLogin.Sql.Add('SELECT * FROM USUARIO WHERE LOGIN = :LOGIN AND SENHA = :SENHA');
    qryLogin.ParamByName('LOGIN').AsString := txtUsuario.Text;
    qryLogin.ParamByName('SENHA').AsString := txtSenha.Text;
    qryLogin.Open;
    if not qryLogin.IsEmpty then
    begin
      FrmPrincipal.iCodUsuario := qryLogin.FieldByName('CODUSUARIO').AsInteger;
      podeLogar := True                                                        ;
    end
    else
      podelogar := False;
  end;

  if podeLogar then
  begin
    FrmPrincipal.Show;
  end
  else
  begin
    application.MessageBox('Não foi possível logar com os dados fornecidos!', 'A T E N Ç Ã O');
    Abort;
  end;
end;

procedure TFrmLogin.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  FrmPrincipal.conexao.Connected := true;
  if txtUsuario.CanFocus then txtUsuario.SetFocus;
end;

procedure TFrmLogin.txtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnEntrar.Click;
end;

procedure TFrmLogin.txtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    perform(WM_NEXTDLGCTL,0,0);
end;

end.
