object Memo_Form: TMemo_Form
  Left = 309
  Top = 234
  Width = 493
  Height = 290
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #47700#47784
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  DesignSize = (
    485
    263)
  PixelsPerInch = 96
  TextHeight = 12
  object Button1: TButton
    Left = 376
    Top = 24
    Width = 100
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #54869#51064
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 376
    Top = 52
    Width = 100
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #52712#49548
    ModalResult = 2
    TabOrder = 2
  end
  object Memo: TMemo
    Left = 4
    Top = 8
    Width = 365
    Height = 251
    Anchors = [akLeft, akTop, akRight, akBottom]
    ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
    TabOrder = 0
    OnKeyDown = MemoKeyDown
  end
end
