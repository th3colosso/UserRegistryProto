unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, System.RegularExpressions;

type
  TFrmPrincipal = class(TForm)
    StatusBar: TStatusBar;
    conexao: TFDConnection;
    qryGeral: TFDQuery;
    dsUsuario: TDataSource;
    qryGeralCODUSUARIO: TIntegerField;
    qryGeralNOME: TStringField;
    qryGeralCPF: TStringField;
    qryGeralEMAIL: TStringField;
    qryGeralTELEFONE: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    txtCPF: TDBEdit;
    Label4: TLabel;
    txtEmail: TDBEdit;
    Label5: TLabel;
    txtTelefone: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAtualizar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnSair: TBitBtn;
    dbNavigator: TDBNavigator;
    qryGeralLOGIN: TStringField;
    qryGeralSENHA: TStringField;
    Label6: TLabel;
    txtLogin: TDBEdit;
    pnlDados: TPanel;
    txtNome: TDBEdit;
    Label7: TLabel;
    txtSenha: TDBEdit;
    btnMostraSenha: TBitBtn;
    btnEscondeSenha: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnMostraSenhaClick(Sender: TObject);
    procedure btnEscondeSenhaClick(Sender: TObject);
    procedure txtEmailExit(Sender: TObject);
    procedure txtCPFExit(Sender: TObject);
  private
    { Private declarations }
    function ValidarEmail(email: string): Boolean;
    function ValidarCpf(num: string): boolean;
  public
    { Public declarations }
    iCodUsuario : Integer;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses
  UFrmPesquisa;

function TFrmPrincipal.ValidarEmail(email: string): Boolean;
var
  RegEx: TRegEx;
begin
  RegEx := TRegex.Create('^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]*[a-zA-Z0-9]+$');
  Result := RegEx.Match(email).Success;
end;

function TFrmPrincipal.ValidarCpf(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9:integer;
d1,d2:integer;
digitado, calculado:string;
begin
  n1:= StrToInt(num[1]);
  n2:= StrToInt(num[2]);
  n3:= StrToInt(num[3]);
  n4:= StrToInt(num[4]);
  n5:= StrToInt(num[5]);
  n6:= StrToInt(num[6]);
  n7:= StrToInt(num[7]);
  n8:= StrToInt(num[8]);
  n9:= StrToInt(num[9]);
  d1:= n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
  d1:= 11-(d1 mod 11);
  if d1>=10 then d1:=0;
  d2:= d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
  d2:= 11-(d2 mod 11);
  if d2>=10 then d2:=0;
  calculado := inttostr(d1)+inttostr(d2);
  digitado := num[10]+num[11];
if calculado = digitado then
  Result := true
else
  Result := false;
end;

procedure TFrmPrincipal.btnSairClick(Sender: TObject);
begin
  if messagedlg('Deseja sair do sistema?', mtconfirmation, [mbyes, mbNo], 0) = mryes then
  begin
    qryGeral.Cancel;
    Application.Terminate;
  end
  else
    Abort;

end;

procedure TFrmPrincipal.btnAtualizarClick(Sender: TObject);
begin
  qryGeral.Refresh;
  messagedlg('Registros atualizados com sucesso!', mtInformation, [mbOk], 0);
  dbNavigator.Enabled := True;
end;

procedure TFrmPrincipal.btnCancelarClick(Sender: TObject);
begin
  qryGeral.Cancel;
  pnlDados.enabled := false;
  dbNavigator.Enabled := True;
  FormShow(nil);
end;

procedure TFrmPrincipal.btnDeletarClick(Sender: TObject);
begin
  if messagedlg('Deseja realmente exluir esse registro?', mtconfirmation, [mbyes, mbNo], 0) = mryes then
  begin
    if qryGeral.IsEmpty then
    begin
      messagedlg('Sem dados dispoíveis para exclusão!', mtwarning, [mbOk], 0);
      Abort;
    end;

    if qryGeralCODUSUARIO.AsInteger = iCodUsuario then
    begin
      messagedlg('Não é permitido excluir o próprio usuário!', mterror, [mbOk], 0);
      Abort;
    end
    else
      qryGeral.Delete;
  end
  else
    Abort;
end;

procedure TFrmPrincipal.btnEditarClick(Sender: TObject);
begin
  if messagedlg('Deseja alterar esse registro?', mtconfirmation, [mbyes, mbNo], 0) = mryes then
  begin
    if qryGeral.IsEmpty then
    begin
      messagedlg('Sem dados dispoíveis para edição!', mtwarning, [mbOk], 0);
      Abort;
    end;
    pnlDados.Enabled := True;
    qryGeral.Edit;
    dbNavigator.Enabled := false;
    btnNovo.Enabled := False;
    btnEditar.Enabled := False;
    btnDeletar.Enabled := False;
    btnAtualizar.Enabled := False;
    btnPesquisar.Enabled := False;
    btnGravar.Enabled := True;
  end
  else
    Abort;
end;

procedure TFrmPrincipal.btnEscondeSenhaClick(Sender: TObject);
begin
  txtSenha.PasswordChar := '*';
end;

procedure TFrmPrincipal.btnGravarClick(Sender: TObject);
begin

  if (length(trim(txtNome.text)) = 0) or (length(trim(txtLogin.text)) = 0) or (length(trim(txtSenha.text)) = 0)
  or (length(trim(txtCPF.text)) = 0) or (length(trim(txtTelefone.text)) = 0) or (length(trim(txtEmail.text)) = 0) then
  begin
    messagedlg('Favor preencher todos os campos do cadastro!', mtwarning, [mbOk], 0);
    Abort;
  end;

  qryGeral.Post;
  messagedlg('Registro salvo com sucesso!', mtInformation, [mbOk], 0);
  pnlDados.enabled := False;
  dbNavigator.Enabled := True;
  FormShow(nil);
end;

procedure TFrmPrincipal.btnMostraSenhaClick(Sender: TObject);
begin
  txtSenha.PasswordChar := #0;
end;

procedure TFrmPrincipal.btnNovoClick(Sender: TObject);
var prox : Integer;
begin
  qryGeral.Active := true;
  qryGeral.Last;
  prox := qryGeralCODUSUARIO.AsInteger + 1;
  qryGeral.Append;
  qryGeralCODUSUARIO.AsInteger := prox;
  pnlDados.Enabled := True;
  dbNavigator.Enabled := false;
  btnNovo.Enabled := False;
  btnEditar.Enabled := False;
  btnDeletar.Enabled := False;
  btnAtualizar.Enabled := False;
  btnPesquisar.Enabled := False;
  btnGravar.Enabled := True;
  if txtLogin.CanFocus then txtLogin.SetFocus;
  
end;

procedure TFrmPrincipal.btnPesquisarClick(Sender: TObject);
begin
  FrmPesquisa := TFrmPesquisa.Create(Self);
  FrmPesquisa.ShowModal;

  FrmPesquisa.Free;
  FrmPesquisa := nil;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryGeral.Cancel;
  Application.Terminate;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  QryGeral.Close;
  QryGeral.Sql.Clear;
  qryGeral.Params.Clear;
  QryGeral.Sql.Add('SELECT * FROM USUARIO ORDER BY CODUSUARIO');
  QryGeral.Open;
  QryGeral.First;

  btnNovo.Enabled := True;
  btnEditar.Enabled := True;
  btnDeletar.Enabled := True;
  btnGravar.Enabled := False;
  btnCancelar.Enabled := True;
  btnAtualizar.Enabled := True;
  btnPesquisar.Enabled := True;

end;
procedure TFrmPrincipal.txtCPFExit(Sender: TObject);
begin
  if (length(trim(txtCpf.text)) <> 0) and ((txtCpf.EditText = '   .   .   -  ') or (length(trim(txtCpf.text)) < 11)) then
  begin
    messagedlg('Favor digitar um cpf válido!', mtWarning, [mbOk], 0);
    txtCPF.SetFocus;
    Abort;
  end
  else if (length(trim(txtCpf.text)) = 11) and (txtCpf.EditText <> '   .   .   -  ') then
  begin
    if not(ValidarCpf(txtCPF.Text)) then
    begin
      messagedlg('Favor digitar um cpf válido!', mtWarning, [mbOk], 0);
      txtCPF.SetFocus;
      Abort;
    end;
  end;


end;

procedure TFrmPrincipal.txtEmailExit(Sender: TObject);
begin
  if not validarEmail(txtEmail.Text) and (Length(trim(txtEmail.text)) > 0) then
  begin
    messagedlg('Favor digitar um email válido!', mtWarning, [mbOk], 0);
    txtemail.SetFocus;
    Abort;
  end;
end;

end.
