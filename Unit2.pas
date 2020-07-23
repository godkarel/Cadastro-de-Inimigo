unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, IBX.IBSQL;

type
  TfrmMonstro = class(TForm)
    Label1: TLabel;
    labSeach: TLabel;
    edtLevel: TLabeledEdit;
    edtDano: TLabeledEdit;
    edtCA: TLabeledEdit;
    labDesc: TLabel;
    edtSeach: TEdit;
    btnProcurar: TButton;
    isqProcuraInimigo: TIBSQL;
    mmoDesc: TMemo;
    edtNome: TEdit;
    procedure btnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMonstro: TfrmMonstro;

implementation

{$R *.dfm}

uses
  Unit1;

procedure TfrmMonstro.btnProcurarClick(Sender: TObject);
var
  Procura: String;
  ComandoMontado : String;
begin
  edtLevel.Clear;
  edtNome.Clear;
  edtCA.Clear;
  edtDano.Clear;
  mmoDesc.Clear;

  Procura := edtSeach.Text;
  isqProcuraInimigo.SQL.Text := 'SELECT DESCRICAO FROM MONSTER WHERE NOME = :DESCMONSTRO';
  isqProcuraInimigo.ParamByName('DESCMONSTRO').AsString := Procura;
  isqProcuraInimigo.ExecQuery;
  try
    mmoDesc.Lines.Text := (isqProcuraInimigo.FieldByName('DESCRICAO').AsString);
  finally
    isqProcuraInimigo.Close;
  end;

  isqProcuraInimigo.SQL.Text := 'SELECT NOME FROM MONSTER WHERE NOME = :NOMEMONSTRO';
  isqProcuraInimigo.ParamByName('NOMEMONSTRO').AsString := Procura;
  isqProcuraInimigo.ExecQuery;
  try
    edtNome.Text := (isqProcuraInimigo.FieldByName('ALVARO').AsString);
  finally
    isqProcuraInimigo.Close;
  end;

  isqProcuraInimigo.SQL.Text := 'SELECT LEVEL FROM MONSTER WHERE NOME = :LEVELMONSTRO';
  isqProcuraInimigo.ParamByName('LEVELMONSTRO').AsString := Procura;
  isqProcuraInimigo.ExecQuery;
  try
    edtLevel.Text := (isqProcuraInimigo.FieldByName('LEVEL').AsString);
  finally
    isqProcuraInimigo.Close;
  end;

  isqProcuraInimigo.SQL.Text := 'SELECT DANO FROM MONSTER WHERE NOME = :DANOMONSTRO';
  isqProcuraInimigo.ParamByName('DANOMONSTRO').AsString := Procura;
  isqProcuraInimigo.ExecQuery;
  try
    edtDano.Text := (isqProcuraInimigo.FieldByName('DANO').AsString);
  finally
    isqProcuraInimigo.Close;
  end;

  isqProcuraInimigo.SQL.Text := 'SELECT CA FROM MONSTER WHERE NOME = :CAMONSTRO';
  isqProcuraInimigo.ParamByName('CAMONSTRO').AsString := Procura;
  isqProcuraInimigo.ExecQuery;
  try
    edtCA.Text := (isqProcuraInimigo.FieldByName('CA').AsString);
  finally
    isqProcuraInimigo.Close;
  end;

  if mmoDesc.Text = '' then
    MessageDlg('Nenhum Montro com esse nome foi encontrado, tente novamente', mtError, [mbOK], 0);
end;

end.