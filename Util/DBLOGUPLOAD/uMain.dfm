object Form1: TForm1
  Left = 825
  Top = 98
  Width = 319
  Height = 520
  Caption = #47196#44536#52376#47532
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 0
    Top = 381
    Width = 311
    Height = 105
    Align = alBottom
    Caption = #44540#53468#45936#51060#53552'('#50629#45936#51060#53944')'
    TabOrder = 0
    Visible = False
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 24
      Height = 12
      Caption = #45216#51676
    end
    object Gauge2: TGauge
      Left = 40
      Top = 48
      Width = 241
      Height = 17
      ForeColor = clNavy
      Progress = 0
    end
    object dt_Date: TDateTimePicker
      Left = 40
      Top = 26
      Width = 97
      Height = 20
      Date = 39330.456451273150000000
      Time = 39330.456451273150000000
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
    end
    object Button3: TButton
      Left = 40
      Top = 72
      Width = 81
      Height = 25
      Caption = #44540#53468#51116#51089#50629
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 311
    Height = 169
    Align = alTop
    Caption = #47196#44536#52376#47532
    TabOrder = 1
    object Gauge1: TGauge
      Left = 24
      Top = 88
      Width = 241
      Height = 17
      ForeColor = clNavy
      Progress = 0
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 42
      Height = 12
      Caption = 'log'#54028#51068
    end
    object Button2: TButton
      Left = 32
      Top = 112
      Width = 217
      Height = 33
      Caption = #50629#47196#46300
      TabOrder = 0
      OnClick = Button2Click
    end
    object ComboBox1: TComboBox
      Left = 24
      Top = 56
      Width = 233
      Height = 20
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 1
      Text = #52636#51077#45936#51060#53552
      Items.Strings = (
        #52636#51077#45936#51060#53552
        #50508#46988#45936#51060#53552
        #44540#53468#45936#51060#53552
        #49885#49688#45936#51060#53552)
    end
    object Edit1: TEdit
      Left = 64
      Top = 24
      Width = 145
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 2
    end
    object Button1: TButton
      Left = 216
      Top = 24
      Width = 41
      Height = 17
      Caption = #52286#44592
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object Button4: TButton
    Left = 72
    Top = 424
    Width = 153
    Height = 33
    Caption = #45803#44592
    TabOrder = 2
    OnClick = Button4Click
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 169
    Width = 311
    Height = 111
    Align = alTop
    Caption = 'FoodErr'
    TabOrder = 3
    object Gauge3: TGauge
      Left = 40
      Top = 48
      Width = 241
      Height = 17
      ForeColor = clNavy
      Progress = 0
    end
    object Label3: TLabel
      Left = 16
      Top = 28
      Width = 42
      Height = 12
      Caption = 'log'#54028#51068
    end
    object Label4: TLabel
      Left = 8
      Top = 84
      Width = 48
      Height = 12
      Caption = #49885#49688#53076#46300
    end
    object Button5: TButton
      Left = 208
      Top = 72
      Width = 81
      Height = 25
      Caption = #49885#49688#50629#47196#46300
      TabOrder = 0
      OnClick = Button5Click
    end
    object ed_FoodErr: TEdit
      Left = 64
      Top = 24
      Width = 145
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
    end
    object Button6: TButton
      Left = 216
      Top = 24
      Width = 41
      Height = 17
      Caption = #52286#44592
      TabOrder = 2
      OnClick = Button6Click
    end
    object RadioButton1: TRadioButton
      Left = 112
      Top = 80
      Width = 97
      Height = 17
      Caption = #51060#48292#53944#51473#48373
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object ed_FoodCode: TEdit
      Left = 56
      Top = 80
      Width = 41
      Height = 20
      ImeName = 'Microsoft IME 2003'
      TabOrder = 4
      Text = '001'
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 280
    Width = 311
    Height = 136
    Align = alTop
    ImeName = 'Microsoft IME 2010'
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 4
    Top = 152
  end
  object ADOQuery: TADOQuery
    Parameters = <>
    Left = 176
    Top = 168
  end
  object ADOATQuery: TADOQuery
    Parameters = <>
    Left = 216
    Top = 168
  end
end
