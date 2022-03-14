unit UFrmPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, ppProd, ppClass, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppVar, ppPrnabl,
  ppCache, ppDesignLayer, ppParameter;

type
  TFrmPesquisa = class(TForm)
    Panel3: TPanel;
    Panel4: TPanel;
    txtPesquisa: TEdit;
    Label1: TLabel;
    btnPesquisar: TBitBtn;
    btnImprimir: TBitBtn;
    DBGrid1: TDBGrid;
    cmbTipoPesquisa: TComboBox;
    Label2: TLabel;
    pipeRelatorio: TppBDEPipeline;
    ppRelatorio: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppLine3: TppLine;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure txtPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

{$R *.dfm}

uses
  UFrmPrincipal;

procedure TFrmPesquisa.btnImprimirClick(Sender: TObject);
begin
  if not FrmPrincipal.qryGeral.IsEmpty then
    ppRelatorio.Print
  else
    messagedlg('Nenhum registro encontrado para impressão!', mtinformation, [mbok], 0);
end;

procedure TFrmPesquisa.btnPesquisarClick(Sender: TObject);
begin
  FrmPrincipal.qryGeral.Close;
  FrmPrincipal.qryGeral.Params.Clear;
  FrmPrincipal.qryGeral.Sql.Clear;
  FrmPrincipal.qryGeral.Sql.Add('SELECT * FROM USUARIO WHERE');

  if cmbTipoPesquisa.ItemIndex = 0 then
  begin
    FrmPrincipal.qryGeral.Sql.Add('CODUSUARIO = :PESQUISA');
    FrmPrincipal.qryGeral.ParamByName('PESQUISA').AsInteger := StrtoInt(txtPesquisa.Text);
  end
  else
  begin
    FrmPrincipal.qryGeral.Sql.Add('UPPER(NOME) LIKE ' + QuotedStr('%'+trim(AnsiUpperCase(txtPesquisa.text))+'%'));
  end;

  FrmPrincipal.qryGeral.Sql.Add('ORDER BY CODUSUARIO');

  FrmPrincipal.qryGeral.Open;

  if FrmPrincipal.qryGeral.IsEmpty then
  begin
    messagedlg('Nenhum registro encontrado com as informações fornecidas!', mtinformation, [mbok], 0);
    Abort
  end;

end;

procedure TFrmPesquisa.txtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnPesquisar.Click;
end;

end.
