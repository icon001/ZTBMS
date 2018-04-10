inherited DoorscheduleRegForm: TDoorscheduleRegForm
  Left = 399
  Top = 8
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #50868#50689' '#49828#52992#51572' '#44288#47532
  ClientHeight = 650
  ClientWidth = 806
  Font.Height = -12
  Font.Name = #44404#47548
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object RzGroupBox1: TRzGroupBox [0]
    Left = 208
    Top = 40
    Width = 593
    Height = 137
    Caption = #54217#51068' '#49828#52992#51572
    TabOrder = 0
    object PaintBox1: TPaintBox
      Left = 9
      Top = 56
      Width = 580
      Height = 17
      Color = 15198183
      ParentColor = False
      OnPaint = PaintBox1Paint
    end
    object Label1: TLabel
      Left = 78
      Top = 42
      Width = 51
      Height = 16
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 136
      Top = 105
      Width = 51
      Height = 16
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 197
      Top = 56
      Width = 42
      Height = 16
      Caption = '12:23'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 258
      Top = 105
      Width = 51
      Height = 16
      Caption = 'Label4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 8
      Top = 23
      Width = 30
      Height = 13
      Caption = #54217#51068
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Panel1: TPanel
      Left = 8
      Top = 74
      Width = 580
      Height = 33
      TabOrder = 0
      object Panel2: TPanel
        Tag = 1
        Left = 1
        Top = 1
        Width = 89
        Height = 31
        Hint = '1'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = Panel2DblClick
        OnDragDrop = Panel2DragDrop
        OnDragOver = Panel2DragOver
        OnResize = Panel2Resize
        object Panel3: TPanel
          Tag = 2
          Left = 84
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel6: TPanel
        Tag = 1
        Left = 210
        Top = 1
        Width = 60
        Height = 31
        Hint = '4'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDblClick = Panel2DblClick
        OnDragDrop = Panel2DragDrop
        OnDragOver = Panel2DragOver
        OnResize = Panel2Resize
        object Panel5: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel4: TPanel
        Tag = 1
        Left = 270
        Top = 1
        Width = 307
        Height = 31
        Hint = '5'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnDblClick = Panel2DblClick
        OnDragDrop = Panel2DragDrop
        OnDragOver = Panel2DragOver
        OnResize = Panel2Resize
      end
      object Panel12: TPanel
        Tag = 1
        Left = 150
        Top = 1
        Width = 60
        Height = 31
        Hint = '3'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnDblClick = Panel2DblClick
        OnDragDrop = Panel2DragDrop
        OnDragOver = Panel2DragOver
        OnResize = Panel2Resize
        object Panel13: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel14: TPanel
        Tag = 1
        Left = 90
        Top = 1
        Width = 60
        Height = 31
        Hint = '2'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnDblClick = Panel2DblClick
        OnDragDrop = Panel2DragDrop
        OnDragOver = Panel2DragOver
        OnResize = Panel2Resize
        object Panel15: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
    end
    object Panel31: TPanel
      Left = 356
      Top = 18
      Width = 57
      Height = 23
      Caption = #52488#44592#54868
      TabOrder = 1
      OnClick = Panel31Click
    end
    object Panel32: TPanel
      Tag = 1
      Left = 415
      Top = 18
      Width = 57
      Height = 23
      Caption = #44060#48169
      Color = clGreen
      DragMode = dmAutomatic
      TabOrder = 2
    end
    object Panel33: TPanel
      Tag = 1
      Left = 473
      Top = 18
      Width = 57
      Height = 23
      Caption = #50868#50689
      Color = clAqua
      DragMode = dmAutomatic
      TabOrder = 3
    end
    object Panel34: TPanel
      Tag = 1
      Left = 531
      Top = 18
      Width = 57
      Height = 23
      Caption = #54224#49604
      Color = clRed
      DragMode = dmAutomatic
      TabOrder = 4
    end
  end
  object RzGroupBox2: TRzGroupBox [1]
    Left = 208
    Top = 184
    Width = 593
    Height = 137
    Caption = ' '#48152#55092#51068' '#49828#52992#51572' '
    TabOrder = 1
    object PaintBox2: TPaintBox
      Left = 9
      Top = 59
      Width = 580
      Height = 15
      Color = 15198183
      ParentColor = False
      OnPaint = PaintBox2Paint
    end
    object Label5: TLabel
      Left = 78
      Top = 59
      Width = 51
      Height = 16
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 136
      Top = 107
      Width = 51
      Height = 16
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 197
      Top = 59
      Width = 42
      Height = 16
      Caption = '12:23'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 258
      Top = 106
      Width = 51
      Height = 16
      Caption = 'Label4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 8
      Top = 29
      Width = 45
      Height = 13
      Caption = #53664#50836#51068
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Panel7: TPanel
      Left = 8
      Top = 75
      Width = 580
      Height = 33
      TabOrder = 0
      object Panel8: TPanel
        Tag = 1
        Left = 1
        Top = 1
        Width = 89
        Height = 31
        Hint = '1'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = Panel8DblClick
        OnDragDrop = Panel8DragDrop
        OnDragOver = Panel8DragOver
        OnResize = Panel8Resize
        object Panel9: TPanel
          Tag = 2
          Left = 84
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel10: TPanel
        Tag = 1
        Left = 210
        Top = 1
        Width = 60
        Height = 31
        Hint = '4'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDblClick = Panel8DblClick
        OnDragDrop = Panel8DragDrop
        OnDragOver = Panel8DragOver
        OnResize = Panel8Resize
        object Panel11: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel16: TPanel
        Tag = 1
        Left = 270
        Top = 1
        Width = 307
        Height = 31
        Hint = '5'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnDblClick = Panel8DblClick
        OnDragDrop = Panel8DragDrop
        OnDragOver = Panel8DragOver
        OnResize = Panel8Resize
      end
      object Panel17: TPanel
        Tag = 1
        Left = 150
        Top = 1
        Width = 60
        Height = 31
        Hint = '3'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnDblClick = Panel8DblClick
        OnDragDrop = Panel8DragDrop
        OnDragOver = Panel8DragOver
        OnResize = Panel8Resize
        object Panel18: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel19: TPanel
        Tag = 1
        Left = 90
        Top = 1
        Width = 60
        Height = 31
        Hint = '2'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnDblClick = Panel8DblClick
        OnDragDrop = Panel8DragDrop
        OnDragOver = Panel8DragOver
        OnResize = Panel8Resize
        object Panel20: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
    end
    object Panel35: TPanel
      Left = 356
      Top = 24
      Width = 57
      Height = 23
      Caption = #52488#44592#54868
      TabOrder = 1
      OnClick = Panel35Click
    end
    object Panel36: TPanel
      Tag = 1
      Left = 415
      Top = 24
      Width = 57
      Height = 23
      Caption = #44060#48169
      Color = clGreen
      DragMode = dmAutomatic
      TabOrder = 2
    end
    object Panel37: TPanel
      Tag = 1
      Left = 473
      Top = 24
      Width = 57
      Height = 23
      Caption = #50868#50689
      Color = clAqua
      DragMode = dmAutomatic
      TabOrder = 3
    end
    object Panel38: TPanel
      Tag = 1
      Left = 531
      Top = 24
      Width = 57
      Height = 23
      Caption = #54224#49604
      Color = clRed
      DragMode = dmAutomatic
      TabOrder = 4
    end
  end
  object RzGroupBox3: TRzGroupBox [2]
    Left = 208
    Top = 328
    Width = 593
    Height = 137
    Caption = ' '#51068#50836#51068' '#49828#52992#51572' '
    TabOrder = 2
    object PaintBox3: TPaintBox
      Left = 9
      Top = 58
      Width = 580
      Height = 18
      Color = 15198183
      ParentColor = False
      OnPaint = PaintBox3Paint
    end
    object Label11: TLabel
      Left = 78
      Top = 57
      Width = 51
      Height = 16
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 136
      Top = 108
      Width = 51
      Height = 16
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label13: TLabel
      Left = 197
      Top = 57
      Width = 42
      Height = 16
      Caption = '12:23'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label14: TLabel
      Left = 258
      Top = 107
      Width = 51
      Height = 16
      Caption = 'Label4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label15: TLabel
      Left = 8
      Top = 29
      Width = 45
      Height = 13
      Caption = #51068#50836#51068
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Panel21: TPanel
      Left = 8
      Top = 76
      Width = 580
      Height = 33
      TabOrder = 0
      object Panel22: TPanel
        Tag = 1
        Left = 1
        Top = 1
        Width = 89
        Height = 31
        Hint = '1'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = Panel22DblClick
        OnDragDrop = Panel22DragDrop
        OnDragOver = Panel22DragOver
        OnResize = Panel22Resize
        object Panel23: TPanel
          Tag = 2
          Left = 84
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel24: TPanel
        Tag = 1
        Left = 210
        Top = 1
        Width = 60
        Height = 31
        Hint = '4'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDblClick = Panel22DblClick
        OnDragDrop = Panel22DragDrop
        OnDragOver = Panel22DragOver
        OnResize = Panel22Resize
        object Panel25: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel26: TPanel
        Tag = 1
        Left = 270
        Top = 1
        Width = 307
        Height = 31
        Hint = '5'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnDblClick = Panel22DblClick
        OnDragDrop = Panel22DragDrop
        OnDragOver = Panel22DragOver
        OnResize = Panel22Resize
      end
      object Panel27: TPanel
        Tag = 1
        Left = 150
        Top = 1
        Width = 60
        Height = 31
        Hint = '3'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnDblClick = Panel22DblClick
        OnDragDrop = Panel22DragDrop
        OnDragOver = Panel22DragOver
        OnResize = Panel22Resize
        object Panel28: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel29: TPanel
        Tag = 1
        Left = 90
        Top = 1
        Width = 60
        Height = 31
        Hint = '2'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnDblClick = Panel22DblClick
        OnDragDrop = Panel22DragDrop
        OnDragOver = Panel22DragOver
        OnResize = Panel22Resize
        object Panel30: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
    end
    object Panel39: TPanel
      Left = 356
      Top = 24
      Width = 57
      Height = 23
      Caption = #52488#44592#54868
      TabOrder = 1
      OnClick = Panel39Click
    end
    object Panel40: TPanel
      Tag = 1
      Left = 415
      Top = 24
      Width = 57
      Height = 23
      Caption = #44060#48169
      Color = clGreen
      DragMode = dmAutomatic
      TabOrder = 2
    end
    object Panel41: TPanel
      Tag = 1
      Left = 473
      Top = 24
      Width = 57
      Height = 23
      Caption = #50868#50689
      Color = clAqua
      DragMode = dmAutomatic
      TabOrder = 3
    end
    object Panel42: TPanel
      Tag = 1
      Left = 531
      Top = 24
      Width = 57
      Height = 23
      Caption = #54224#49604
      Color = clRed
      DragMode = dmAutomatic
      TabOrder = 4
    end
  end
  object RzDBRadioGroup1: TRzDBRadioGroup [3]
    Left = 208
    Top = 472
    Width = 593
    Height = 137
    Caption = ' '#55092#51068' '#49828#52992#51572
    TabOrder = 3
    object PaintBox4: TPaintBox
      Left = 9
      Top = 46
      Width = 580
      Height = 18
      Color = 15198183
      ParentColor = False
      OnPaint = PaintBox4Paint
    end
    object Label16: TLabel
      Left = 78
      Top = 45
      Width = 51
      Height = 16
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label17: TLabel
      Left = 136
      Top = 96
      Width = 51
      Height = 16
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label18: TLabel
      Left = 197
      Top = 45
      Width = 42
      Height = 16
      Caption = '12:23'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label19: TLabel
      Left = 258
      Top = 95
      Width = 60
      Height = 16
      Caption = 'Label19'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label20: TLabel
      Left = 8
      Top = 29
      Width = 30
      Height = 13
      Caption = #55092#51068
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Panel43: TPanel
      Left = 8
      Top = 64
      Width = 580
      Height = 33
      TabOrder = 0
      object Panel44: TPanel
        Tag = 1
        Left = 1
        Top = 1
        Width = 89
        Height = 31
        Hint = '1'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel45: TPanel
          Tag = 2
          Left = 84
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel46: TPanel
        Tag = 1
        Left = 210
        Top = 1
        Width = 60
        Height = 31
        Hint = '4'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel47: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel48: TPanel
        Tag = 1
        Left = 270
        Top = 1
        Width = 307
        Height = 31
        Hint = '5'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
      end
      object Panel49: TPanel
        Tag = 1
        Left = 150
        Top = 1
        Width = 60
        Height = 31
        Hint = '3'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel50: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel51: TPanel
        Tag = 1
        Left = 90
        Top = 1
        Width = 60
        Height = 31
        Hint = '2'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel52: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
    end
    object Panel53: TPanel
      Left = 356
      Top = 24
      Width = 57
      Height = 19
      Caption = #52488#44592#54868
      TabOrder = 1
      OnClick = Panel53Click
    end
    object Panel54: TPanel
      Tag = 1
      Left = 415
      Top = 24
      Width = 57
      Height = 19
      Caption = #44060#48169
      Color = clGreen
      DragMode = dmAutomatic
      TabOrder = 2
    end
    object Panel55: TPanel
      Tag = 1
      Left = 473
      Top = 24
      Width = 57
      Height = 19
      Caption = #50868#50689
      Color = clAqua
      DragMode = dmAutomatic
      TabOrder = 3
    end
    object Panel56: TPanel
      Tag = 1
      Left = 531
      Top = 24
      Width = 57
      Height = 19
      Caption = #54224#49604
      Color = clRed
      DragMode = dmAutomatic
      TabOrder = 4
    end
  end
  object RzGroupBox4: TRzGroupBox [4]
    Left = 8
    Top = 40
    Width = 193
    Height = 568
    Caption = #46321#47197#46108' '#52636#51077#47928
    TabOrder = 4
    object lbDoor: TListBox
      Left = 5
      Top = 17
      Width = 178
      Height = 534
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      ItemHeight = 12
      MultiSelect = True
      TabOrder = 0
      OnClick = lbDoorClick
    end
  end
  object btnSave: TRzBitBtn [5]
    Left = 611
    Top = 617
    Width = 87
    Height = 30
    Caption = #51201#50857
    Color = 15791348
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    TabOrder = 5
    OnClick = btnSaveClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000730E0000730E00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
      090909090909090909E8E8E881818181818181818181818181E8E809101009E3
      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
      E3E3E3E3E309101009E8E881ACAC81E3E3E3E3E3E381ACAC81E8E80910101009
      090909090910101009E8E881ACACAC818181818181ACACAC81E8E80910101010
      101010101010101009E8E881ACACACACACACACACACACACAC81E8E80910100909
      090909090909101009E8E881ACAC8181818181818181ACAC81E8E8091009D7D7
      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E8091009D709
      0909090909D7091009E8E881AC81D7818181818181D781AC81E8E8091009D7D7
      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E809E309D709
      0909090909D7090909E8E881E381D7818181818181D7818181E8E8091009D7D7
      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E80909090909
      090909090909090909E8E88181818181818181818181818181E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object btnClose: TRzBitBtn [6]
    Left = 711
    Top = 617
    Width = 87
    Height = 30
    Caption = #45803#44592
    Color = 15791348
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    TabOrder = 6
    OnClick = btnCloseClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000730B0000730B00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      EEE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8EEE8E8E8E8E8E8E8E8E8E8E8E8EEE3AC
      E3EEE8E8E8E8E8E8E8E8E8E8E8EEE8ACE3EEE8E8E8E8E8E8E8E8E8EEE3E28257
      57E2ACE3EEE8E8E8E8E8E8EEE8E2818181E2ACE8EEE8E8E8E8E8E382578282D7
      578181E2E3E8E8E8E8E8E881818181D7818181E2E8E8E8E8E8E857828989ADD7
      57797979EEE8E8E8E8E88181DEDEACD781818181EEE8E8E8E8E857898989ADD7
      57AAAAA2D7ADE8E8E8E881DEDEDEACD781DEDE81D7ACE8E8E8E857898989ADD7
      57AACEA3AD10E8E8E8E881DEDEDEACD781DEAC81AC81E8E8E8E85789825EADD7
      57ABCFE21110E8E8E8E881DE8181ACD781ACACE28181E8E8E8E8578957D7ADD7
      57ABDE101010101010E881DE56D7ACD781ACDE818181818181E857898257ADD7
      57E810101010101010E881DE8156ACD781E381818181818181E857898989ADD7
      57E882101010101010E881DEDEDEACD781E381818181818181E857898989ADD7
      57ACEE821110E8E8E8E881DEDEDEACD781ACEE818181E8E8E8E857898989ADD7
      57ABE8AB8910E8E8E8E881DEDEDEACD781ACE3ACDE81E8E8E8E857828989ADD7
      57ACE8A3E889E8E8E8E88181DEDEACD781ACE381E8DEE8E8E8E8E8DE5E8288D7
      57A2A2A2E8E8E8E8E8E8E8DE8181DED781818181E8E8E8E8E8E8E8E8E8AC8257
      57E8E8E8E8E8E8E8E8E8E8E8E8AC818181E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object btnSend: TRzBitBtn [7]
    Left = 511
    Top = 617
    Width = 87
    Height = 30
    Caption = #51204#49569
    Color = 15791348
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    TabOrder = 7
    Visible = False
    OnClick = btnSendClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000630D0000630D00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E80909E8
      E80909E8E8E8E8E8E8E8E8E8E88181E8E88181E8E8E8E8E8E8E8E8E8E8091009
      E8091009E8E8E8E8E8E8E8E8E881AC81E881AC81E8E8E8E8E8E8E8E8E8091010
      0909101009E8E8E8E8E8E8E8E881ACAC8181ACAC81E8E8E8E8E8E80909091010
      100910101009E8E8E8E8E8818181ACACAC81ACACAC81E8E8E8E8E80910101010
      10100910101009E8E8E8E881ACACACACACAC81ACACAC81E8E8E8E80910101010
      1010100910101009E8E8E881ACACACACACACAC81ACACAC81E8E8E80910101010
      101010100910101009E8E881ACACACACACACACAC81ACACAC81E8E80910101010
      1010100910101009E8E8E881ACACACACACACAC81ACACAC81E8E8E80910101010
      10100910101009E8E8E8E881ACACACACACAC81ACACAC81E8E8E8E80909091010
      100910101009E8E8E8E8E8818181ACACAC81ACACAC81E8E8E8E8E8E8E8091010
      0909101009E8E8E8E8E8E8E8E881ACAC8181ACAC81E8E8E8E8E8E8E8E8091009
      E8091009E8E8E8E8E8E8E8E8E881AC81E881AC81E8E8E8E8E8E8E8E8E80909E8
      E80909E8E8E8E8E8E8E8E8E8E88181E8E88181E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object Panel57: TPanel [8]
    Left = 0
    Top = 0
    Width = 806
    Height = 33
    Align = alTop
    Caption = #50868#50689' '#49828#52992#51572' '#44288#47532
    Color = 15387318
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object Query_Sch: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 632
    Top = 88
  end
  object Query_Door: TADOQuery
    Connection = DataModule1.ADOConnection
    Parameters = <>
    Left = 680
    Top = 88
  end
end
