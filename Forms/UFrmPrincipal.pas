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
  Vcl.Buttons;

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
  private
    { Private declarations }
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
end.
