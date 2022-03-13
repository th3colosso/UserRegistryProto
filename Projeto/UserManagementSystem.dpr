program UserManagementSystem;

uses
  Vcl.Forms,
  UFrmPrincipal in '..\Forms\UFrmPrincipal.pas' {FrmPrincipal},
  UFrmLogin in '..\Forms\UFrmLogin.pas' {FrmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
