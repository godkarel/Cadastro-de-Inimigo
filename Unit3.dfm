object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 242
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 336
    Top = 8
    Width = 93
    Height = 30
    Caption = 'Descri'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 64
    Top = 45
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 64
    Top = 93
    Width = 25
    Height = 13
    Caption = 'Level'
  end
  object Label4: TLabel
    Left = 64
    Top = 141
    Width = 25
    Height = 13
    Caption = 'Dano'
  end
  object Label5: TLabel
    Left = 64
    Top = 187
    Width = 14
    Height = 13
    Caption = 'CA'
  end
  object mmoDescCadastra: TMemo
    Left = 208
    Top = 60
    Width = 361
    Height = 165
    Alignment = taCenter
    TabOrder = 0
  end
  object btnCadastraDB: TButton
    Left = 592
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 1
    OnClick = btnCadastraDBClick
  end
  object edtNomeCadastra: TEdit
    Left = 24
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtLevelCadastra: TEdit
    Left = 24
    Top = 112
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 3
  end
  object edtDanoCadastra: TEdit
    Left = 24
    Top = 160
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 4
  end
  object edtCACadastra: TEdit
    Left = 24
    Top = 208
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 5
  end
  object edtIDCadastra: TEdit
    Left = 24
    Top = 18
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 6
    Visible = False
  end
  object cmbArma1: TComboBox
    Left = 592
    Top = 119
    Width = 75
    Height = 21
    ItemIndex = 0
    TabOrder = 7
    Text = 'Nenhuma'
    Items.Strings = (
      'Nenhuma'
      'Espada'
      'Arco'
      'Machado'
      'Cajado'
      'Pistola')
  end
  object cmbArma2: TComboBox
    Left = 592
    Top = 146
    Width = 75
    Height = 21
    ItemIndex = 0
    TabOrder = 8
    Text = 'Nenhuma'
    Items.Strings = (
      'Nenhuma'
      'Espada'
      'Arco'
      'Machado'
      'Cajado'
      'Pistola')
  end
  object cmbArma3: TComboBox
    Left = 592
    Top = 173
    Width = 75
    Height = 21
    ItemIndex = 0
    TabOrder = 9
    Text = 'Nenhuma'
    Items.Strings = (
      'Nenhuma'
      'Espada'
      'Arco'
      'Machado'
      'Cajado'
      'Pistola')
  end
  object isqCadastra: TIBSQL
    Database = dtmInimigos.idbInimigos
    Transaction = dtmInimigos.itrInimigos
    Left = 592
    Top = 16
  end
end
