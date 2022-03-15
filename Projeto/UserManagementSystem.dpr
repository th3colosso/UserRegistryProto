program UserManagementSystem;

uses
  Vcl.Forms,
  UFrmPrincipal in '..\Forms\UFrmPrincipal.pas' {FrmPrincipal},
  UFrmLogin in '..\Forms\UFrmLogin.pas' {FrmLogin},
  UFrmPesquisa in '..\Forms\UFrmPesquisa.pas' {FrmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '';
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
