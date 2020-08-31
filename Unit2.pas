unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, IBX.IBSQL, IBX.IBCustomDataSet, IBX.IBQuery, Unit1, Unit3;

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
    edtNome: TLabeledEdit;
    btnCadastrar: TButton;
    DBGrid1: TDBGrid;
    tqrTeste: TIBQuery;
    dsListaInimigos: TDataSource;
    edtProcura2: TEdit;
    btnProcura2: TButton;
    Button1: TButton;
    Label2: TLabel;
    btnDeletar: TButton;
    edtIDProcura: TEdit;
    DBGrid2: TDBGrid;
    dsArmaRegistro: TDataSource;
    tqrArmaInimigo: TIBQuery;
    procedure btnProcurarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnProcura2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMonstro: TfrmMonstro;

implementation

{$R *.dfm}

procedure TfrmMonstro.btnCadastrarClick(Sender: TObject);
begin
   Form3.Show;
end;

procedure TfrmMonstro.btnDeletarClick(Sender: TObject);
var
 RespostaUsuario: Integer;
begin
  RespostaUsuario := MessageDlg('Tem certeza de que quer apagar todos os registros ?', mtWarning, [mbYes, mbNo], 0);
  try
    if RespostaUsuario = 6 then
      begin
      tqrTeste.SQL.add('DELETE * FROM MONSTER');
      isqProcuraInimigo.SQL.Text := 'DELETE FROM MONSTER';
      isqProcuraInimigo.ExecQuery;
      end;
  except
    dtmInimigos.itrInimigos.Rollback;
    ShowMessage('Ops, algo deu errado!!!');
    raise
  end;
  dtmInimigos.itrInimigos.Commit;
  isqProcuraInimigo.Close;

end;

procedure TfrmMonstro.btnProcura2Click(Sender: TObject);
begin
  if tqrTeste.Active then
    tqrTeste.Close;

  tqrTeste.SQL.Clear;
  tqrTeste.SQL.Add('SELECT * FROM MONSTER');
  tqrTeste.Open;
end;

procedure TfrmMonstro.btnProcurarClick(Sender: TObject);
var
  Procura: String;
  GambiarraAutoGerador : String;
  GambiarraFinal : Integer;
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
    edtNome.Text := (isqProcuraInimigo.FieldByName('NOME').AsString);
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

  isqProcuraInimigo.SQL.Text := 'SELECT MAX(ID) FROM MONSTER';
  isqProcuraInimigo.ExecQuery;
   try
    GambiarraAutoGerador := (isqProcuraInimigo.FieldByName('MAX').AsString);
    GambiarraFinal := StrToInt(GambiarraAutoGerador) + 1;
    edtIDProcura.Text := IntToStr(GambiarraFinal);
  finally
    isqProcuraInimigo.Close;
  end;

  tqrArmaInimigo.Close;

  tqrArmaInimigo.SQL.Clear;
  tqrArmaInimigo.SQL.Add('SELECT IDARMA FROM MONSTER');
  tqrArmaInimigo.SQL.Add('WHERE NOME LIKE :ARMADOMONSTRO');
  tqrArmaInimigo.ParamByName('ARMADOMONSTRO').AsString := Procura;
  tqrArmaInimigo.Open;

  if mmoDesc.Text = '' then
    MessageDlg('Nenhum Montro com esse nome foi encontrado, tente novamente', mtError, [mbOK], 0);
end;

procedure TfrmMonstro.Button1Click(Sender: TObject);
var
  ProcuraMelhor: string;
begin
  tqrTeste.Close;

  ProcuraMelhor := '%' + UpperCase(edtProcura2.Text) + '%';
  tqrTeste.SQL.Clear;
  tqrTeste.SQL.Add('SELECT * FROM MONSTER');
  tqrTeste.SQL.Add('WHERE NOME LIKE :PROCURAMONSTRO');
  tqrTeste.ParamByName('PROCURAMONSTRO').AsString := ProcuraMelhor;
  tqrTeste.Open;
  edtProcura2.clear;
end;

end.
