object fmMain: TfmMain
  Left = 429
  Top = 21
  Width = 628
  Height = 673
  Caption = 'KT'#49444#51221#54532#47196#44536#47016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 0
    Width = 620
    Height = 52
    Images = ImageList1
    RowHeight = 48
    ButtonWidth = 48
    ButtonHeight = 48
    ShowButtonCaptions = True
    TextOptions = ttoCustom
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    TabOrder = 0
    ToolbarControls = (
      ToolButton_Connect
      ToolButton_Disconnect
      RzSpacer1
      ToolButton_MCU
      ToolButton_ECU
      RzSpacer2
      RzToolButton1
      btn_ComCheck)
    object ToolButton_Connect: TRzToolButton
      Left = 4
      Top = 2
      Width = 92
      Height = 48
      Action = Action_Connect
    end
    object ToolButton_Disconnect: TRzToolButton
      Left = 96
      Top = 2
      Width = 92
      Height = 48
      Action = Action_Disconnect
      Enabled = False
    end
    object RzSpacer1: TRzSpacer
      Left = 188
      Top = 2
      Width = 21
      Height = 48
      Grooved = True
    end
    object ToolButton_MCU: TRzToolButton
      Left = 209
      Top = 2
      Width = 92
      Height = 48
      Action = Action_RegMCU
    end
    object ToolButton_ECU: TRzToolButton
      Left = 301
      Top = 2
      Width = 92
      Height = 48
      Action = Action_RegECU
    end
    object RzSpacer2: TRzSpacer
      Left = 393
      Top = 2
      Width = 27
      Height = 48
      Grooved = True
    end
    object RzToolButton1: TRzToolButton
      Left = 420
      Top = 2
      Width = 92
      Height = 48
      ImageIndex = 2
      Caption = #52852#46300#46321#47197
      OnClick = RzToolButton1Click
    end
    object btn_ComCheck: TRzToolButton
      Left = 512
      Top = 2
      Width = 92
      Height = 48
      ImageIndex = 9
      Caption = #53685#49888#52404#53356
      OnClick = btn_ComCheckClick
    end
  end
  object Panel10: TPanel
    Left = 0
    Top = 52
    Width = 620
    Height = 85
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 41
      Width = 72
      Height = 12
      Caption = 'Version Info'
    end
    object Label2: TLabel
      Left = 16
      Top = 17
      Width = 36
      Height = 12
      Caption = 'MCU ID'
    end
    object lb_Version: TLabel
      Left = 104
      Top = 41
      Width = 337
      Height = 12
      AutoSize = False
      Caption = 'VERSION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 16
      Top = 65
      Width = 24
      Height = 12
      Caption = 'Time'
    end
    object lb_TimeSync: TLabel
      Left = 104
      Top = 65
      Width = 153
      Height = 12
      AutoSize = False
      Caption = 'Time Info'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Edit_DeviceID1: TRzEdit
      Left = 104
      Top = 10
      Width = 22
      Height = 26
      Text = '0'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameVisible = True
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      MaxLength = 1
      ParentFont = False
      TabOnEnter = True
      TabOrder = 0
      OnChange = Edit_DeviceID1Change
    end
    object Edit_DeviceID2: TRzEdit
      Left = 128
      Top = 10
      Width = 22
      Height = 26
      Text = '0'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameVisible = True
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      MaxLength = 1
      ParentFont = False
      TabOnEnter = True
      TabOrder = 1
      OnChange = Edit_DeviceID1Change
    end
    object Edit_DeviceID3: TRzEdit
      Left = 152
      Top = 10
      Width = 22
      Height = 26
      Text = '0'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameVisible = True
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      MaxLength = 1
      ParentFont = False
      TabOnEnter = True
      TabOrder = 2
      OnChange = Edit_DeviceID1Change
    end
    object Edit_DeviceID4: TRzEdit
      Left = 177
      Top = 10
      Width = 22
      Height = 26
      Text = '0'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameVisible = True
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      MaxLength = 1
      ParentFont = False
      TabOnEnter = True
      TabOrder = 3
      OnChange = Edit_DeviceID1Change
    end
    object Edit_DeviceID5: TRzEdit
      Left = 201
      Top = 10
      Width = 22
      Height = 26
      Text = '0'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameVisible = True
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      MaxLength = 1
      ParentFont = False
      TabOnEnter = True
      TabOrder = 4
      OnChange = Edit_DeviceID1Change
    end
    object Edit_DeviceID6: TRzEdit
      Left = 226
      Top = 10
      Width = 22
      Height = 26
      Text = '0'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameVisible = True
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      MaxLength = 1
      ParentFont = False
      TabOnEnter = True
      TabOrder = 5
      OnChange = Edit_DeviceID1Change
    end
    object Edit_DeviceID7: TRzEdit
      Left = 251
      Top = 10
      Width = 22
      Height = 26
      Text = '0'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameVisible = True
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      MaxLength = 1
      ParentFont = False
      TabOnEnter = True
      TabOrder = 6
      OnChange = Edit_DeviceID1Change
    end
    object cmb_ECU: TComboBox
      Left = 104
      Top = 13
      Width = 169
      Height = 20
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      TabOrder = 7
      OnChange = cmb_ECUChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 520
    Width = 620
    Height = 76
    Align = alBottom
    TabOrder = 2
    object btnRefresh: TRzBitBtn
      Left = 71
      Top = 15
      Width = 120
      Height = 45
      Caption = #51312#54924
      Color = 15791348
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      ParentFont = False
      TabOrder = 0
      OnClick = btnRefreshClick
      Glyph.Data = {
        36080000424D3608000000000000360400002800000020000000200000000100
        0800000000000004000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600CCFFFF0099FFFF0066FFFF0033FFFF00FFCCFF00CCCCFF0099CCFF0066CC
        FF0033CCFF0000CCFF00FF99FF00CC99FF009999FF006699FF003399FF000099
        FF00FF66FF00CC66FF009966FF006666FF003366FF000066FF00FF33FF00CC33
        FF009933FF006633FF003333FF000033FF00CC00FF009900FF006600FF003300
        FF00FFFFCC00CCFFCC0099FFCC0066FFCC0066FFCC0033FFCC0000FFCC00FFCC
        CC00CCCCCC0099CCCC0066CCCC0033CCCC0000CCCC00FF99CC00CC99CC009999
        CC006699CC003399CC000099CC00FF66CC00CC66CC009966CC006666CC003366
        CC000066CC00FF33CC00CC33CC009933CC006633CC003333CC000033CC00FF00
        CC00CC00CC009900CC006600CC003300CC000000CC00FFFF9900CCFF990099FF
        990066FF990033FF990000FF9900FFCC9900CCCC990099CC990066CC990033CC
        990000CC9900FF999900CC99990099999900669999003399990000999900FF66
        9900CC66990099669900666699003366990000669900FF339900CC3399009933
        9900663399003333990000339900FF009900CC00990099009900660099003300
        990000009900FFFF6600CCFF660099FF660066FF660033FF660000FF6600FFCC
        6600CCCC660099CC660066CC660033CC660000CC6600FF996600CC9966009999
        6600669966003399660000996600FF666600CC66660099666600666666003366
        660000666600FF336600CC33660099336600663366003333660000336600FF00
        6600CC00660099006600660066003300660000006600FFFF3300CCFF330099FF
        330066FF330033FF330000FF3300FFCC3300CCCC330099CC330066CC330033CC
        330000CC3300FF993300CC99330099993300669933003399330000993300FF66
        3300CC66330099663300666633003366330000663300FF333300CC3333009933
        3300663333003333330000333300FF003300CC00330099003300660033003300
        330000003300CCFF000099FF000066FF000033FF0000FFCC0000CCCC000099CC
        000066CC000033CC000000CC0000FF990000CC99000099990000669900003399
        000000990000FF660000CC66000099660000666600000066000033660000FF33
        0000CC33000099330000663300003333000000330000CC000000990000006600
        0000330000000000DD000000BB000000AA000000880000007700000055000000
        44000000220000DD000000BB000000AA00000088000000770000005500000044
        000000220000DDDDDD0055555500777777007777770044444400222222001111
        110077000000550000004400000022000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
        0707070707070707070707070707070000ECEC0707070707070707070707075D
        5D5D5D5D5D5D5D5D5D5D5D5D5D0000F7ED00ECEC070707070707070707070000
        005D5D5D5D5D5D5D5D5D5D0000EBF7F7EDED00ECEC07070707070707070700DB
        DE005D5D5D5D5D5D5D5D00F7EDEBF7F7EDEDEF00ECEC0707070707070700DB4E
        72DE000707070707070700F7EDEBF7F7EDEDEFED00ECEC07070707070700DB4E
        72DE000707070707070700F7EDEBF7F7EDEDEFEDED00ECEC0707070700DB4EDB
        DBDEDE0007070707070700F7EDEBF7F7EDEDEFEDEDED00ECEC07070700DB4EDB
        DBDEDE0007070707070700F7EDEBF7DDEDEDEFEDEDED00ECECEC0700DB4E0F1D
        DB4E72DE00070707070700F7EDEBAFF7EDEDEFEDEDED00EC07070700DB4E0F1D
        DB4E72DE00070707070700F7EDEBF7F7EDEDEFEDEDED0007070700DB4E0F1D1D
        00DB4E72DE000707070700F7EDEBF7FFFFEDEFEDEDED00070707001D1D1D0F00
        0700DBDEDE000707070700F7EDFFFFF7F7F7EFEDEDED0007070707001D1D1D00
        0700DB4E72DE0007070700FFFFF7F7FFFFFFEBEDEDED00070707070700000007
        070700DBDEDE00ECEC070700F7FFFFEBEBEBEBEBEDED00000707070707070707
        070700DB4E72DE00ECEC070700EBEBEBEBEBEBEBEBED00000007070707070707
        0700EB00DBDEDE0000ECEC070700EBEBEBEBEBEBEBEB00000000070707070707
        00F7ED00DB4E72DE0000ECEC070700EBEBEBEBEB000007070000070707070707
        00F7EDEB00DBDEDE00ED00ECEC070700EBEB0000070707000000070707070707
        00F7EDEB00DBDB0F1D00ED00ECEC070700000707070000000007070707070707
        00F7EDEBF7000F1D1D00EDED00ECEC0707070700000000070707070707070707
        00F7EDEBF7001D1D00EDEDED00ECEC0707000000000707070707070707070707
        00F7EDEBAFF70000EFEDEDED00FFFF0000000000000007070707070707070707
        00F7EDEBF7F7EDEDEFEDEDED000000000007070700EF00070707070707070707
        00F7EDEBF7FFFFEDEFEDEDED00000007070707070700EFEF0707070707070707
        00F7EDFFFFF7F7F7EFEDEDED00070707070707070707EFEDED07070707070707
        00FFFFF7F7FFFFFFEBEDEDED0007070707070707070707EDEBED070707070707
        0700F7FFFFEBEBEBEBEBEDED000707070707070707070707ED07070707070707
        070700EBEBEBEBEBEBEBEBED0007070707070707070707070707070707070707
        07070700EBEBEBEBEBEBEBEB0007070707070707070707070707070707070707
        0707070700EBEBEBEBEB00000707070707070707070707070707070707070707
        070707070700EBEB000007070707070707070707070707070707070707070707
        0707070707070000070707070707070707070707070707070707}
    end
    object btnReg: TRzBitBtn
      Left = 231
      Top = 15
      Width = 120
      Height = 45
      Caption = #44592#44592#46321#47197
      Color = 15791348
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      ParentFont = False
      TabOrder = 1
      OnClick = btnRegClick
      Glyph.Data = {
        36080000424D3608000000000000360400002800000020000000200000000100
        0800000000000004000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600212121000000080000001000080008001000000031000000520000006300
        000010100E00080821002121210000420000292121004221210043390800191D
        3D003939390053373400186331004E4E4A0052525200636331001A255C003C3E
        57005A5A5A0063635A002324790042537700445B9F007F0000006B3131007339
        39007B393900884242008C4A4A007B5252009C180000944A4A008C5252009452
        5200AD000000A0003900BD181800B44B22006363630063009C0063639C00945A
        5A009C5A5A009C3163009C636300CE0063009C319C00A5525200A5525A00AD52
        5200A55A5A00B15A5A00B55A6300007300001894000000AC18005285630018CE
        630000FF630063E6630073736B00737373007B7B7B007B7B8400847B7B009C9C
        3100A5636300A56B6B00416FA8003D82A7006576A100848484007B848C009C63
        9C007788B10045D2990090949A009C9C9C009498A5009C9CA5009CA0B1009CCE
        9C009CFF9C00DC803500AD6B6B00D69C6500A57B7B00AD737300BD6F6F00DE7B
        7B00AB999600D9848B00F9949400FF9C9C00A5A5A500D8C19B00FFFF9C00A5AD
        B500ADADAD00B5ADAD00B5B5B500BDADAD00CEADAD00D6A5A500E1AEAD00F7AD
        A500F7A5AD00F7ADAD00F7B5AD00F7ADB500FFADAD00FFB5AD000000BD000000
        DE003100D6004200EF009C31CE000063CE000063FF003163FF00009CCE004284
        C6004A94C600526BBD00657FC1006B8CC6007992CC00009CFF00319CFF00529C
        C600529CCE005AB5DE00639CCE007F9CCE00949CBD0086A0D2008CA7D80088A5
        DE008CADDE0094ADDE0091B2E6009C00FF00CE63FF00FF63CE00CE9CCE009CB5
        DE009CB5E7009CB5EF00E69CE600ADB5CE00B5B5C600E7B5B500EFB5B500F7B5
        B500FFB5B500FFB5BD009CBDEF00A5BDEF00ADBDDE00ADBDE700BDBDB500BDBD
        BD00BDBDC600C6BDBD00EFBDBD00F7BDBD00FFBDB500FFBDBD00FFBDC600B5C6
        DE00BDC6BD0000CECE0000CEFF0000FFFF0031CEFF0063E1E90063DAFF0031FF
        FF0063FFFF009CCECE009CFFCE009CCEFF009CFFFF00BDCEE700C6C6C600C6C6
        CE00C6CEE700CECECE00CECEEF00CECEFF00CEFFFF00D6C6C600D6CECE00D6D6
        D600D6D6DE00DEC6C600DECECE00DED6D600DEDED600DEDEDE00DEE7EF00E7D6
        D600E7DEDE00E7E7DE00E7DEE700E7E7E700E7EFEF00EFE7E700EFEFE700EFEF
        EF00F7C6C600F7EFEF00F7EFF700F7F7F700F7FFF700FFC6BD00FFC6C600FFCE
        C600FFC6CE00FFCECE00FFFFCE00FFCED600FFD6D600FFDED600FFDEDE00FFE7
        E700FFEFEF00FFF7F700FFFFF700FFFFFF00F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
        0700000000070707070707070707070707070707070707070707070707070707
        00E2E5E200000707070707070707070707070707070707070707070707070700
        6ED1E2E5004E0007070707070707070707070707070707070707070707070700
        576ED1E2006E4E00070707070707070707070707070707070707070707070700
        57576ED100E26E4E000707070707070707070707070707070707070707070707
        00575700DDD1E26E4E0007070707070707070707070707070707070707070707
        07005700E5DDD1E26E4E00070707070707070707070707070707070707070707
        070700E5E5E5DDD1E26E4E000707070707070707070707070707070707070707
        0700E5E5DDE5E5DDD1E26E4E0007070707070707070707070707070707070707
        00E5E5DDE5DDE5E5DDD1E26E4E00070707070707070707000000070707070700
        E5E5D1E2DDE5DDE5E5DDD1E26E4E0007070707070000000000000707070700E5
        E5D1E2D1E2DDE500E5E5DDD1E26E00070000000094949400000007070700E5E5
        D1E2D1E2D1E2DD000000E5DDD100000094949494C5C594000000070700E5E5D1
        E2D1E2D1E2D1E2DD0094000000949494C5C5C5C5C5C5940000000700E5E5D1E2
        D1E2D1E2D1E2D1E200BD00CEC5C5C5C5C5C5C5C5C5C5940000000700E5D1E200
        E2D16ED1E2D1E2D1E200BD0000000000CEC5C5C5C5C594000000006E6EE2D100
        00E2576ED1E2D1E2009400BD940000070087C5C5C5C500000000004E6E6EE200
        4E0057576ED1E2D100C59400BD9400000094C5C5C5000707070700294E6E006D
        574E0057576ED1E2D100C59400BD9400009494C500070707070700000000C8E2
        6D574E0057576ED1E2D100C59400BD94000094000707070707070700E5E5DDC8
        E26D574E0057576ED1E26E00C59400C194000007070707070707070700E5E5DD
        C8E26D574E0057576ED14E0000C59400C194000007070707070707070700E5E5
        DDC8E26D574E0057574E00070700000000BD94000007070707070707070700E5
        E5DDC8E26D574E004E000707070707070700BD94000007070707070707070700
        E5E5DDC8E26D574E0007070707070707070700BD940000070707070707070707
        00E5E5DDC8E26D574E0007070707070707070700BD009E000707070707070707
        0700E5E5DDC8E26D574E00070707070707070707009E9E000707070707070707
        070700E5E5DDC8E26D5700070707070707070707070000000707070707070707
        07070700E5E5DDC8E26E00070707070707070707070707070707070707070707
        0707070700E5E2E26E0007070707070707070707070707070707070707070707
        0707070707000000000707070707070707070707070707070707070707070707
        0707070707070707070707070707070707070707070707070707}
    end
    object btn_Copy: TRzBitBtn
      Left = 408
      Top = 15
      Width = 120
      Height = 45
      Caption = #44592#44592#48373#49324
      Color = 15791348
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      ParentFont = False
      TabOrder = 2
      OnClick = btn_CopyClick
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777788888888888888888777777777777
        7788888888888888888877777777777770000000000000000007777777797777
        70FBFBFBFBFBFBFBFB0777777779977770BFBFBFBFBFBFBFBF07777999999977
        70FBFBFBFBFBFBFBFB0777999999999770BFBFBFBFBFBFBFBF07799999999977
        70FBFBFBFBFBFBFBFB0779997779977770BFBFBFBFBFBFBFBF07799977797777
        70FBFBFBFBFBFBFBFB077999777777777000000000BFBFBFBF07799777777777
        70FBFBFBFB0000000007797777777777770FBFBFB07777777777777777777777
        7770000007777777777777777777777777777777777777777777778888888888
        8888888877777777777778888888888888888887777777777797000000000000
        000000777777777779970FBFBFBFBFBFBFBFB0777777977799970BFBFBFBFBFB
        FBFBF0777779977799970FBFBFBFBFBFBFBFB0777799999999970BFBFBFBFBFB
        FBFBF0777999999999770FBFBFBFBFBFBFBFB0777799999997770BFBFBFBFBFB
        FBFBF0777779977777770FBFBFBFBFBFBFBFB0777777977777770BFBFBFBFBFB
        FBFBF077777777777777000000000FBFBFBFB0777777777777770BFBFBFBF000
        0000007777777777777770BFBFBF077777777777777777777777770000007777
        7777777777777777777777777777777777777777777777777777}
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 137
    Width = 620
    Height = 383
    Align = alClient
    TabOrder = 3
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 618
      Height = 381
      ActivePage = SystemTab
      Align = alClient
      TabOrder = 0
      object ECUAddTab: TTabSheet
        Caption = 'ECU'#52628#44032
        object Group_Device: TRzCheckGroup
          Left = 3
          Top = 8
          Width = 590
          Height = 217
          Caption = #49324#50857' '#52968#53944#47204#47084' '#51648#51221
          Columns = 11
          Items.Strings = (
            '00'
            '01'
            '02'
            '03'
            '04'
            '05'
            '06'
            '07'
            '08'
            '09'
            '10')
          TabOrder = 0
          TextStyle = tsRecessed
          OnChange = Group_DeviceChange
          CheckStates = (
            0
            0
            0
            0
            0
            0
            0
            0
            0
            0
            0)
        end
        object Group_DeviceBase: TRzCheckGroup
          Left = 3
          Top = 233
          Width = 590
          Height = 40
          Columns = 11
          Items.Strings = (
            '00'
            '10'
            '20'
            '30'
            '40'
            '50'
            '60'
            '70'
            '80'
            '90'
            #51204#52404)
          StartYPos = 15
          TabOrder = 1
          OnChange = Group_DeviceBaseChange
          CheckStates = (
            0
            0
            0
            0
            0
            0
            0
            0
            0
            0
            0)
        end
        object Group_AlarmDisplay: TRzCheckGroup
          Left = 3
          Top = 280
          Width = 590
          Height = 49
          Caption = ' '#50508#46988' '#54364#49884#44592' '#51648#51221' '
          Columns = 11
          Items.Strings = (
            '01'
            '02'
            '03'
            '04')
          TabOrder = 2
          TextStyle = tsRecessed
          CheckStates = (
            0
            0
            0
            0)
        end
      end
      object NetWorkTab: TTabSheet
        Caption = #45348#53944#50893#49444#51221
        ImageIndex = 1
        object GroupBox1: TGroupBox
          Left = 3
          Top = 8
          Width = 590
          Height = 145
          Caption = #44288#51228#50672#44208#49444#51221
          TabOrder = 0
          object RzLabel9: TRzLabel
            Left = 5
            Top = 26
            Width = 54
            Height = 12
            Hint = #44288#51228#54016#50640' '#46321#47197#46108' '#48264#54840#47484' '#51077#47141#54616#49464#50836
            Caption = #49884#49828#53596' ID'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Transparent = True
            BlinkIntervalOff = 1500
          end
          object RzLabel17: TRzLabel
            Left = 5
            Top = 51
            Width = 84
            Height = 12
            Hint = #45936#53076#45908' '#51204#54868#48264#54840#47484' '#51077#47141' '#54616#49464#50836
            Caption = #45936#53076#45908#51204#54868#48264#54840
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Transparent = True
            BlinkIntervalOff = 1500
          end
          object Label79: TLabel
            Left = 5
            Top = 74
            Width = 60
            Height = 24
            Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
            Caption = #50896#44201#51228#50612#13#10#47553#49688#49888#54943#49688
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Edit_LinkusID: TRzEdit
            Left = 96
            Top = 22
            Width = 97
            Height = 20
            Hint = #44288#51228#54016#50640' '#46321#47197#46108' '#48264#54840#47484' '#51077#47141#54616#49464#50836
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            FrameHotTrack = True
            FrameVisible = True
            ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
            MaxLength = 5
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOnEnter = True
            TabOrder = 0
            OnChange = Edit_LinkusIDChange
          end
          object Edit_LinkusTel: TRzEdit
            Left = 96
            Top = 46
            Width = 97
            Height = 20
            Hint = #45936#53076#45908' '#51204#54868#48264#54840#47484' '#51077#47141' '#54616#49464#50836
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            FrameHotTrack = True
            FrameVisible = True
            ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOnEnter = True
            TabOrder = 1
            OnChange = Edit_LinkusTelChange
          end
          object Spinner_Ring: TRzSpinner
            Left = 98
            Top = 70
            Width = 60
            Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
            CheckRange = True
            Max = 50
            Min = 1
            Value = 10
            OnChange = Spinner_RingChange
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentColor = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object gb_ControlDialTime: TGroupBox
            Left = 226
            Top = 16
            Width = 151
            Height = 113
            Caption = #45936#53076#45908' Dial Time'
            TabOrder = 3
            object Label137: TLabel
              Left = 13
              Top = 24
              Width = 102
              Height = 12
              Caption = 'DTMF Dial On Time'
            end
            object Label138: TLabel
              Left = 13
              Top = 72
              Width = 108
              Height = 12
              Caption = 'DTMF Dial Off Time'
            end
            object Label139: TLabel
              Left = 64
              Top = 40
              Width = 33
              Height = 12
              Caption = 'mSec'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #44404#47548
              Font.Style = []
              ParentFont = False
            end
            object Label140: TLabel
              Left = 64
              Top = 88
              Width = 33
              Height = 12
              Caption = 'mSec'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #44404#47548
              Font.Style = []
              ParentFont = False
            end
            object cmb_ControlOnTime: TComboBox
              Left = 13
              Top = 40
              Width = 49
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ItemIndex = 2
              TabOrder = 0
              Text = '200'
              OnChange = cmb_ControlOnTimeChange
              Items.Strings = (
                '60'
                '100'
                '200'
                '300'
                '400'
                '500'
                '1000')
            end
            object cmb_ControlOffTime: TComboBox
              Left = 13
              Top = 88
              Width = 50
              Height = 20
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ItemIndex = 2
              TabOrder = 1
              Text = '200'
              OnChange = cmb_ControlOffTimeChange
              Items.Strings = (
                '60'
                '100'
                '200'
                '300'
                '400'
                '500'
                '1000')
            end
          end
        end
        object GroupBox2: TGroupBox
          Left = 3
          Top = 160
          Width = 590
          Height = 201
          Caption = 'LAN'#49444#51221
          TabOrder = 1
          object RzLabel2: TRzLabel
            Left = 5
            Top = 28
            Width = 36
            Height = 12
            Hint = #44288#51228#54016#50640' '#46321#47197#46108' '#48264#54840#47484' '#51077#47141#54616#49464#50836
            Caption = 'MCU IP'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Transparent = True
            BlinkIntervalOff = 1500
          end
          object RzLabel3: TRzLabel
            Left = 5
            Top = 48
            Width = 72
            Height = 12
            Hint = #45936#53076#45908' '#51204#54868#48264#54840#47484' '#51077#47141' '#54616#49464#50836
            Caption = #49436#48652#45367#47560#49828#53356
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Transparent = True
            BlinkIntervalOff = 1500
          end
          object Label8: TLabel
            Left = 5
            Top = 74
            Width = 60
            Height = 12
            Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
            Caption = #44172#51060#53944#50920#51060
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label9: TLabel
            Left = 5
            Top = 94
            Width = 48
            Height = 12
            Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
            Caption = #54252#53944#48264#54840
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label19: TLabel
            Left = 5
            Top = 126
            Width = 36
            Height = 12
            Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
            Caption = #49436#48260'IP'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label21: TLabel
            Left = 5
            Top = 150
            Width = 48
            Height = 12
            Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
            Caption = #49436#48260'PORT'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Edit_IP: TRzEdit
            Left = 82
            Top = 19
            Width = 103
            Height = 20
            Hint = #44288#51228#54016#50640' '#46321#47197#46108' '#48264#54840#47484' '#51077#47141#54616#49464#50836
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            FrameHotTrack = True
            FrameVisible = True
            ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOnEnter = True
            TabOrder = 0
            OnChange = Edit_IPChange
          end
          object Edit_subnet: TRzEdit
            Left = 82
            Top = 43
            Width = 103
            Height = 20
            Hint = #45936#53076#45908' '#51204#54868#48264#54840#47484' '#51077#47141' '#54616#49464#50836
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            FrameHotTrack = True
            FrameVisible = True
            ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOnEnter = True
            TabOrder = 1
            OnChange = Edit_subnetChange
          end
          object edit_Gateway: TRzEdit
            Left = 82
            Top = 67
            Width = 103
            Height = 20
            Hint = #45936#53076#45908' '#51204#54868#48264#54840#47484' '#51077#47141' '#54616#49464#50836
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            FrameHotTrack = True
            FrameVisible = True
            ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOnEnter = True
            TabOrder = 2
            OnChange = edit_GatewayChange
          end
          object edit_port: TRzEdit
            Left = 82
            Top = 91
            Width = 103
            Height = 20
            Hint = #45936#53076#45908' '#51204#54868#48264#54840#47484' '#51077#47141' '#54616#49464#50836
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            FrameHotTrack = True
            FrameVisible = True
            ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOnEnter = True
            TabOrder = 3
            OnChange = edit_portChange
          end
          object ed_server: TRzEdit
            Left = 82
            Top = 123
            Width = 103
            Height = 20
            Hint = #45936#53076#45908' '#51204#54868#48264#54840#47484' '#51077#47141' '#54616#49464#50836
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            FrameHotTrack = True
            FrameVisible = True
            ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOnEnter = True
            TabOrder = 4
            OnChange = ed_serverChange
          end
          object ed_ServerPort: TRzEdit
            Left = 82
            Top = 147
            Width = 103
            Height = 20
            Hint = #45936#53076#45908' '#51204#54868#48264#54840#47484' '#51077#47141' '#54616#49464#50836
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            FrameHotTrack = True
            FrameVisible = True
            ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOnEnter = True
            TabOrder = 5
          end
          object Rg_Mode: TRadioGroup
            Left = 224
            Top = 16
            Width = 153
            Height = 41
            Caption = 'NetworkMode'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Server'
              'Client')
            TabOrder = 6
            OnClick = Rg_ModeClick
          end
          object btnLanSett: TBitBtn
            Left = 224
            Top = 66
            Width = 105
            Height = 17
            Caption = 'LAN'#49444#51221
            TabOrder = 7
            OnClick = btnLanSettClick
          end
        end
      end
      object SystemTab: TTabSheet
        Caption = #49884#49828#53596#51221#48372
        ImageIndex = 2
        object GroupBox3: TGroupBox
          Left = 3
          Top = 8
          Width = 590
          Height = 337
          Caption = #49884#49828#53596#51221#48372' '#49444#51221
          TabOrder = 0
          object Label13: TLabel
            Left = 13
            Top = 27
            Width = 84
            Height = 12
            Caption = #51221#51204' '#44048#49884' '#50668#48512
            Transparent = True
          end
          object Label14: TLabel
            Left = 13
            Top = 52
            Width = 72
            Height = 12
            Caption = #53748#49892#51648#50672#49884#44036
            Transparent = True
          end
          object Label76: TLabel
            Left = 13
            Top = 76
            Width = 72
            Height = 12
            Caption = #51077#49892#51648#50672#49884#44036
            Transparent = True
          end
          object Label36: TLabel
            Left = 13
            Top = 99
            Width = 60
            Height = 12
            Caption = 'Door1 '#50857#46020
            Transparent = True
          end
          object Label37: TLabel
            Left = 13
            Top = 123
            Width = 60
            Height = 12
            Caption = 'Door2 '#50857#46020
            Transparent = True
          end
          object Label5: TLabel
            Left = 13
            Top = 148
            Width = 36
            Height = 12
            Caption = #50948#52824#47749
            Transparent = True
          end
          object Label15: TLabel
            Left = 171
            Top = 55
            Width = 12
            Height = 12
            Caption = #52488
            Transparent = True
          end
          object Label6: TLabel
            Left = 172
            Top = 74
            Width = 12
            Height = 12
            Caption = #52488
            Transparent = True
          end
          object RzLabel1: TRzLabel
            Left = 13
            Top = 171
            Width = 48
            Height = 12
            Hint = #45936#53076#45908' '#51204#54868#48264#54840#47484' '#51077#47141' '#54616#49464#50836
            Caption = #44397#49440#52404#53356
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Transparent = True
            BlinkIntervalOff = 1500
          end
          object Label22: TLabel
            Left = 152
            Top = 174
            Width = 42
            Height = 12
            Caption = #49884#44036' '#54980
          end
          object ComboBox_WatchPowerOff: TRzComboBox
            Left = 116
            Top = 21
            Width = 131
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 0
            OnChange = ComboBox_WatchPowerOffChange
          end
          object SpinEdit_OutDelay: TRzSpinEdit
            Left = 116
            Top = 46
            Width = 51
            Height = 20
            AllowKeyEdit = True
            Max = 999.000000000000000000
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            TabOrder = 1
            OnChange = SpinEdit_OutDelayChange
          end
          object SpinEdit_InDelay: TRzSpinEdit
            Left = 116
            Top = 70
            Width = 51
            Height = 20
            AllowKeyEdit = True
            Max = 999.000000000000000000
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            TabOrder = 2
            OnChange = SpinEdit_InDelayChange
          end
          object ComboBox_DoorType1: TRzComboBox
            Left = 116
            Top = 93
            Width = 133
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 3
            OnChange = ComboBox_DoorType1Change
          end
          object ComboBox_DoorType2: TRzComboBox
            Left = 116
            Top = 117
            Width = 133
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 4
            OnChange = ComboBox_DoorType2Change
          end
          object Edit_Locate: TRzEdit
            Left = 116
            Top = 140
            Width = 133
            Height = 20
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            TabOrder = 5
            OnChange = Edit_LocateChange
          end
          object ed_Time: TEdit
            Left = 116
            Top = 170
            Width = 33
            Height = 20
            ImeName = 'Microsoft IME 2003'
            TabOrder = 6
            Text = '00'
          end
          object BitBtn1: TBitBtn
            Left = 200
            Top = 168
            Width = 41
            Height = 25
            Caption = #49884#51089
            TabOrder = 7
            OnClick = BitBtn1Click
          end
        end
      end
      object AccessTab: TTabSheet
        Caption = #52636#51077#53685#51228
        ImageIndex = 3
        object GroupBox4: TGroupBox
          Left = 3
          Top = 8
          Width = 590
          Height = 353
          Caption = #52636#51077#53685#51228#49444#51221
          TabOrder = 0
          object Label18: TLabel
            Left = 11
            Top = 51
            Width = 78
            Height = 12
            Caption = #52852#46300' '#50868#50689#47784#46300
            Transparent = True
          end
          object Label23: TLabel
            Left = 11
            Top = 77
            Width = 90
            Height = 12
            Caption = #52636#51077#47928' '#50868#50689#47784#46300
            Transparent = True
          end
          object Label16: TLabel
            Left = 337
            Top = 110
            Width = 12
            Height = 12
            Caption = #52488
            Transparent = True
          end
          object Label11: TLabel
            Left = 337
            Top = 134
            Width = 30
            Height = 12
            Caption = #48516' '#54980
            Transparent = True
          end
          object Label46: TLabel
            Left = 201
            Top = 134
            Width = 30
            Height = 12
            Caption = #48516' '#54980
            Transparent = True
          end
          object Label12: TLabel
            Left = 201
            Top = 110
            Width = 12
            Height = 12
            Caption = #52488
            Transparent = True
          end
          object Label24: TLabel
            Left = 11
            Top = 103
            Width = 78
            Height = 12
            Caption = 'Door '#51228#50612#49884#44036
            Transparent = True
          end
          object Label42: TLabel
            Left = 11
            Top = 129
            Width = 96
            Height = 12
            Caption = #51109#49884#44036' '#50676#47548' '#44221#48372
            Transparent = True
          end
          object Label47: TLabel
            Left = 11
            Top = 155
            Width = 96
            Height = 12
            Caption = #49828#52992#51460' '#51201#50857' '#50976#47924
            Transparent = True
          end
          object Label48: TLabel
            Left = 11
            Top = 182
            Width = 84
            Height = 12
            Caption = #52636#51077#47928#49345#53468#51204#49569
            Transparent = True
          end
          object Label51: TLabel
            Left = 10
            Top = 212
            Width = 114
            Height = 12
            Caption = #51109#49884#44036#50676#47548' '#48512#51200#52636#47141
            Transparent = True
          end
          object Label54: TLabel
            Left = 10
            Top = 239
            Width = 108
            Height = 12
            Caption = #54868#51116' '#48156#49373#49884' '#47928#51228#50612
            Transparent = True
          end
          object Label53: TLabel
            Left = 10
            Top = 260
            Width = 66
            Height = 12
            Caption = #46020#50612#46973' '#53440#51077
            Transparent = True
          end
          object Label10: TLabel
            Left = 10
            Top = 280
            Width = 262
            Height = 36
            Caption = 
              #51088#46041#47928'                           : '#51068#48152#54805'('#51221#51204#49884' '#51104#44608')'#13#10#45936#46300#46973'/EM'#46973'/'#49828#53944#46972#51060#52964' : '#51068#48152#54805 +
              '('#51221#51204#49884' '#50676#47548')'#13#10#49885#45817'                              : 0x37 '#49885#45817
            Font.Charset = ANSI_CHARSET
            Font.Color = clPurple
            Font.Height = -12
            Font.Name = #44404#47548
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object RzPanel2: TRzPanel
            Left = 126
            Top = 22
            Width = 130
            Height = 25
            BorderOuter = fsButtonDown
            Caption = #52636#51077#47928'1'
            TabOrder = 0
          end
          object RzPanel4: TRzPanel
            Left = 265
            Top = 22
            Width = 130
            Height = 25
            BorderOuter = fsButtonDown
            Caption = #52636#51077#47928'2'
            TabOrder = 1
          end
          object ComboBox_CardModeType2: TRzComboBox
            Left = 265
            Top = 51
            Width = 130
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 2
            OnChange = ComboBox_CardModeType2Change
          end
          object ComboBox_CardModeType1: TRzComboBox
            Left = 126
            Top = 51
            Width = 130
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 3
            OnChange = ComboBox_CardModeType1Change
          end
          object ComboBox_DoorModeType1: TRzComboBox
            Left = 126
            Top = 77
            Width = 130
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 4
            OnChange = ComboBox_DoorModeType1Change
          end
          object ComboBox_DoorModeType2: TRzComboBox
            Left = 265
            Top = 77
            Width = 130
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 5
            OnChange = ComboBox_DoorModeType2Change
          end
          object SpinEdit_DoorOPen2: TRzSpinEdit
            Left = 265
            Top = 103
            Width = 67
            Height = 20
            AllowKeyEdit = True
            Max = 9.000000000000000000
            Value = 3.000000000000000000
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            TabOrder = 6
            OnChange = SpinEdit_DoorOPen2Change
          end
          object SpinEdit_OpenMoni2: TRzSpinEdit
            Left = 265
            Top = 129
            Width = 67
            Height = 20
            AllowKeyEdit = True
            Max = 9.000000000000000000
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            TabOrder = 7
            OnChange = SpinEdit_OpenMoni2Change
          end
          object SpinEdit_OpenMoni1: TRzSpinEdit
            Left = 126
            Top = 129
            Width = 67
            Height = 20
            AllowKeyEdit = True
            Max = 9.000000000000000000
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            TabOrder = 8
            OnChange = SpinEdit_OpenMoni1Change
          end
          object SpinEdit_DoorOPen1: TRzSpinEdit
            Left = 126
            Top = 103
            Width = 67
            Height = 20
            AllowKeyEdit = True
            Max = 9.000000000000000000
            Value = 3.000000000000000000
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            TabOrder = 9
            OnChange = SpinEdit_DoorOPen1Change
          end
          object ComboBox_UseSch1: TRzComboBox
            Left = 126
            Top = 155
            Width = 130
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 10
            OnChange = ComboBox_UseSch1Change
          end
          object ComboBox_UseSch2: TRzComboBox
            Left = 265
            Top = 155
            Width = 130
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 11
            OnChange = ComboBox_UseSch2Change
          end
          object ComboBox_SendDoorStatus2: TRzComboBox
            Left = 265
            Top = 182
            Width = 130
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 12
            OnChange = ComboBox_SendDoorStatus2Change
          end
          object ComboBox_SendDoorStatus1: TRzComboBox
            Left = 126
            Top = 182
            Width = 130
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 13
            OnChange = ComboBox_SendDoorStatus1Change
          end
          object ComboBox_AlarmLongOpen1: TRzComboBox
            Left = 126
            Top = 205
            Width = 129
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 14
            OnChange = ComboBox_AlarmLongOpen1Change
          end
          object ComboBox_AlarmLongOpen2: TRzComboBox
            Left = 265
            Top = 205
            Width = 129
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 15
            OnChange = ComboBox_AlarmLongOpen2Change
          end
          object ComboBox_ControlFire2: TRzComboBox
            Left = 265
            Top = 230
            Width = 129
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 16
            OnChange = ComboBox_ControlFire2Change
          end
          object ComboBox_ControlFire1: TRzComboBox
            Left = 126
            Top = 230
            Width = 129
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 17
            OnChange = ComboBox_ControlFire1Change
          end
          object ComboBox_LockType1: TRzComboBox
            Left = 126
            Top = 253
            Width = 129
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 18
            OnChange = ComboBox_LockType1Change
          end
          object ComboBox_LockType2: TRzComboBox
            Left = 265
            Top = 253
            Width = 129
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 19
            OnChange = ComboBox_LockType2Change
          end
        end
      end
      object CardReaderTab: TTabSheet
        Caption = #52852#46300#47532#45908
        ImageIndex = 4
        object GroupBox5: TGroupBox
          Left = 3
          Top = 8
          Width = 590
          Height = 353
          Caption = #52852#46300#47532#45908' '#49444#51221
          TabOrder = 0
          object Label20: TLabel
            Left = 16
            Top = 24
            Width = 72
            Height = 12
            Caption = #52852#46300#47532#45908#51333#47448
          end
          object cb_CardType: TRzComboBox
            Left = 108
            Top = 21
            Width = 131
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 0
            Text = '0.'#51068#48152#47532#45908'(CRO-811)'
            OnChange = cb_CardTypeChange
            Items.Strings = (
              ''
              '0.'#51068#48152#47532#45908'(CRO-811)'
              '1.'#51648#47928#47532#45908'(CRO-801)')
            ItemIndex = 1
          end
          object sgCardReader: TRzStringGrid
            Left = 14
            Top = 48
            Width = 533
            Height = 255
            DefaultColWidth = 105
            DefaultRowHeight = 27
            FixedColor = clInactiveCaptionText
            RowCount = 9
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            ScrollBars = ssNone
            TabOrder = 1
            OnColumnMoved = sgCardReaderColumnMoved
            OnDrawCell = sgCardReaderDrawCell
            OnExit = sgCardReaderExit
            OnRowMoved = sgCardReaderRowMoved
            OnSelectCell = sgCardReaderSelectCell
            FrameColor = 12164479
            FrameVisible = True
            FixedLineColor = 12164479
            LineColor = clInactiveCaption
          end
          object cbCardReader: TRzComboBox
            Left = 128
            Top = 68
            Width = 100
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 2
            OnChange = cbCardReaderChange
            OnExit = cbCardReaderExit
            Items.Strings = (
              '1111'
              '2222')
          end
        end
      end
      object ZoneTab: TTabSheet
        Caption = #44048#51648#51316
        ImageIndex = 5
        object GroupBox6: TGroupBox
          Left = 3
          Top = 8
          Width = 590
          Height = 353
          Caption = #44048#51648#51316' '#49444#51221
          TabOrder = 0
          object Label7: TLabel
            Left = 8
            Top = 327
            Width = 194
            Height = 12
            Caption = #8251' '#51648#50672#49884#44036':0 = '#49324#50857#50504#54632' / 1 = '#49324#50857
            Font.Charset = ANSI_CHARSET
            Font.Color = clPurple
            Font.Height = -12
            Font.Name = #44404#47548
            Font.Style = []
            ParentFont = False
            Transparent = True
            Visible = False
          end
          object sgPort: TRzStringGrid
            Left = 6
            Top = 24
            Width = 533
            Height = 255
            DefaultColWidth = 105
            DefaultRowHeight = 27
            FixedColor = clInactiveCaptionText
            RowCount = 9
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            ScrollBars = ssNone
            TabOrder = 0
            OnClick = sgPortClick
            OnColumnMoved = sgPortColumnMoved
            OnDrawCell = sgPortDrawCell
            OnExit = sgPortExit
            OnRowMoved = sgPortRowMoved
            OnSelectCell = sgPortSelectCell
            FrameColor = 12164479
            FrameVisible = True
            FixedLineColor = 12164479
            LineColor = clInactiveCaption
          end
          object cbPort: TRzComboBox
            Left = 80
            Top = 44
            Width = 73
            Height = 20
            Ctl3D = False
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 1
            OnChange = cbPortChange
            OnExit = cbPortExit
            Items.Strings = (
              '1111'
              '2222')
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 80
      Top = 160
      Width = 473
      Height = 49
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
  end
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 596
    Width = 620
    Height = 23
    AutoStyle = False
    BorderInner = fsNone
    BorderOuter = fsBump
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 4
    object FieldStatus_ComStatus: TRzFieldStatus
      Left = 2
      Top = 2
      Width = 153
      Height = 19
      Align = alLeft
      BlinkIntervalOff = 1500
    end
    object RzFieldStatus2: TRzFieldStatus
      Left = 155
      Top = 2
      Width = 105
      Height = 19
      Align = alLeft
      BlinkIntervalOff = 1500
    end
    object Label17: TLabel
      Left = 162
      Top = 6
      Width = 12
      Height = 12
      Caption = 'TX'
    end
    object Label25: TLabel
      Left = 214
      Top = 6
      Width = 12
      Height = 12
      Caption = 'RX'
    end
    object StatusLight_TX: TApdStatusLight
      Left = 184
      Top = 7
      Width = 22
      Height = 8
      Lit = False
      NotLitColor = clMaroon
    end
    object StatusLight_RX: TApdStatusLight
      Left = 233
      Top = 7
      Width = 22
      Height = 8
      Lit = False
      LitColor = clLime
    end
    object Status_CardEvent: TRzFieldStatus
      Left = 506
      Top = 2
      Width = 112
      Height = 19
      Align = alClient
      BlinkIntervalOff = 1500
    end
    object Status_AlarmMode: TRzGlyphStatus
      Left = 260
      Top = 2
      Width = 78
      Height = 19
      Align = alLeft
      BlinkIntervalOff = 1500
      Caption = #44221#44228#47784#46300
      ImageIndex = 3
      Images = SmallDoorList
    end
    object Status_Door1: TRzGlyphStatus
      Left = 338
      Top = 2
      Width = 84
      Height = 19
      ParentFillColor = False
      Align = alLeft
      BlinkIntervalOff = 1500
      Caption = #52636#51077#47928'1'
      ImageIndex = 0
      Images = SmallDoorList
    end
    object Status_Door2: TRzGlyphStatus
      Left = 422
      Top = 2
      Width = 84
      Height = 19
      Align = alLeft
      BlinkIntervalOff = 1500
      Caption = #52636#51077#47928'2'
      ImageIndex = 1
      Images = SmallDoorList
    end
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 192
    Top = 16
    object N2: TMenuItem
      Caption = #54028#51068
      object N3: TMenuItem
        Action = Action_FileLoad
      end
      object N4: TMenuItem
        Action = ActionFIleSave
      end
      object N18: TMenuItem
        Caption = #48708#48128#48264#54840#48320#44221
        OnClick = N18Click
      end
      object N20: TMenuItem
        Caption = #54872#44221#49444#51221
        OnClick = N20Click
      end
      object N5: TMenuItem
        Caption = #51333#47308
        OnClick = N5Click
      end
    end
    object N1: TMenuItem
      Caption = #49444#51221
      Visible = False
      object N7: TMenuItem
        Action = Action_SetComport
      end
      object MCU1: TMenuItem
        Caption = 'MCU '#52286#44592
        ImageIndex = 11
      end
      object MCU2: TMenuItem
        Action = Action_RegMCU
      end
      object ECUtjfwjd1: TMenuItem
        Action = Action_RegECU
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = #54156#50920#50612' '#45796#50868#47196#46300
      end
    end
    object N10: TMenuItem
      Caption = #47749#47161
      object MCUID1: TMenuItem
        Caption = #46321#47197
        object MENU_MCUREG: TMenuItem
          Caption = 'MCU '#51204#50857
          object MENU_REGMCUID: TMenuItem
            Caption = 'MCU ID '#46321#47197
            OnClick = MENU_REGMCUIDClick
          end
          object MENU_REGECU: TMenuItem
            Caption = 'ECU '#46321#47197
            OnClick = MENU_REGECUClick
          end
          object MENU_KTTID: TMenuItem
            Caption = #44288#51228#49884#49828#53596'ID'#46321#47197
            OnClick = MENU_KTTIDClick
          end
          object MENU_REGDECODERNO: TMenuItem
            Caption = #45936#53076#45908#48264#54840#46321#47197
            OnClick = MENU_REGDECODERNOClick
          end
          object MENU_REGDISALARM: TMenuItem
            Caption = #50508#46988#54364#49884#44592#46321#47197
            OnClick = MENU_REGDISALARMClick
          end
          object MENU_REGTELLCOUNT: TMenuItem
            Caption = #53588#52852#50868#53944#46321#47197
            OnClick = MENU_REGTELLCOUNTClick
          end
          object MENU_REGLAN: TMenuItem
            Caption = #47004#51221#48372#49444#51221
            OnClick = MENU_REGLANClick
          end
        end
        object N14: TMenuItem
          Caption = '-'
        end
        object MENU_REGSYS: TMenuItem
          Caption = #49884#49828#53596' '#51221#48372#46321#47197
          OnClick = MENU_REGSYSClick
        end
        object MENU_REGSYS2: TMenuItem
          Caption = #52636#51077#53685#51228' '#51221#48372#46321#47197
          OnClick = MENU_REGSYS2Click
        end
        object MENU_REGREADER: TMenuItem
          Caption = #52852#46300#47532#45908#46321#47197
          OnClick = MENU_REGREADERClick
        end
        object MENU_REGPORT: TMenuItem
          Caption = #54252#53944#51221#48372#46321#47197
          OnClick = MENU_REGPORTClick
        end
        object mn_Holidy: TMenuItem
          Caption = #53945#51221#51068
          OnClick = mn_HolidyClick
        end
        object N19: TMenuItem
          Caption = #49828#52992#51460#46321#47197
          OnClick = N19Click
        end
      end
      object N11: TMenuItem
        Caption = #51312#54924
        object MENU_CHECKMCU: TMenuItem
          Caption = 'MCU'#51204#50857
          object MENU_CHKMCU: TMenuItem
            Caption = 'MCU ID'#51312#54924
            OnClick = MENU_CHKMCUClick
          end
          object MENU_CHKECU: TMenuItem
            Caption = 'ECU'#51312#54924
            OnClick = MENU_CHKECUClick
          end
          object MENU_CHKDISALARM: TMenuItem
            Caption = #50508#46988#54364#49884#44592#51312#54924
            OnClick = MENU_CHKDISALARMClick
          end
          object MENU_CHKKTTID: TMenuItem
            Caption = #44288#51228#49884#49828#53596'ID'#51312#54924
            OnClick = MENU_CHKKTTIDClick
          end
          object MENU_CHKDECODERNO: TMenuItem
            Caption = #45936#53076#45908#48264#54840#51312#54924
            OnClick = MENU_CHKDECODERNOClick
          end
          object MENU_CHKTELLCOUNT: TMenuItem
            Caption = #53588#52852#50868#53944#51312#54924
            OnClick = MENU_CHKTELLCOUNTClick
          end
          object MENU_CHKLAN: TMenuItem
            Caption = #47004#51221#48372' '#51312#54924
            OnClick = MENU_CHKLANClick
          end
        end
        object N13: TMenuItem
          Caption = '-'
        end
        object MENU_CHKSYS: TMenuItem
          Caption = #49884#49828#53596' '#51221#48372#51312#54924
          OnClick = MENU_CHKSYSClick
        end
        object MENU_CHKSYS2: TMenuItem
          Caption = #52636#51077#53685#51228' '#51221#48372#51312#54924
          OnClick = MENU_CHKSYS2Click
        end
        object MENU_CHKREADER: TMenuItem
          Caption = #52852#46300#47532#45908' '#51312#54924
          OnClick = MENU_CHKREADERClick
        end
        object MENU_CHKPORT: TMenuItem
          Caption = #54252#53944#51221#48372' '#51312#54924
          OnClick = MENU_CHKPORTClick
        end
        object MENU_Version: TMenuItem
          Caption = #48260#51260#51221#48372#51312#54924
          OnClick = MENU_VersionClick
        end
      end
      object N12: TMenuItem
        Caption = #51228#50612
        object MENU_TIMESYNC: TMenuItem
          Caption = #49884#44036#46041#44592#54868
          OnClick = MENU_TIMESYNCClick
        end
        object MENU_RESET: TMenuItem
          Caption = #44592#44592#47532#49483
          OnClick = MENU_RESETClick
        end
        object MENU_CLEARREG: TMenuItem
          Caption = #47700#47784#47532#52488#44592#54868
          Visible = False
        end
        object N33: TMenuItem
          Caption = '-'
        end
        object N41: TMenuItem
          Caption = #48169#48276#47784#46300#48320#44221
          object MENU_SETARM: TMenuItem
            Caption = #44221#44228#47784#46300
            OnClick = MENU_SETARMClick
          end
          object MENU_SETDISARM: TMenuItem
            Caption = #54644#51228#47784#46300
            OnClick = MENU_SETDISARMClick
          end
        end
        object N110: TMenuItem
          Caption = #52636#51077#47928'1 '#51228#50612
          object MENU_OPENDOOR1: TMenuItem
            Caption = #47928#50676#44592
            OnClick = MENU_OPENDOOR1Click
          end
          object MENU_NMOODDOOR1: TMenuItem
            Caption = #50868#50689#47784#46300
            OnClick = MENU_NMOODDOOR1Click
          end
          object MENU_OMODEDOOR1: TMenuItem
            Caption = #44060#48169#47784#46300
            OnClick = MENU_OMODEDOOR1Click
          end
        end
        object N210: TMenuItem
          Caption = #52636#51077#47928'2 '#51228#50612
          object MENU_OPEMDOOR2: TMenuItem
            Caption = #47928#50676#44592
            OnClick = MENU_OPEMDOOR2Click
          end
          object MENU_NMODEDOOR2: TMenuItem
            Caption = #50868#50689#47784#46300
            OnClick = MENU_NMODEDOOR2Click
          end
          object MENU_OMODEDOOR2: TMenuItem
            Caption = #44060#48169#47784#46300
            OnClick = MENU_OMODEDOOR2Click
          end
        end
      end
    end
    object N15: TMenuItem
      Caption = #53685#49888#54872#44221#52404#53356
      object N16: TMenuItem
        Caption = #51204#52404#53685#49888#52404#53356
        OnClick = N16Click
      end
      object N17: TMenuItem
        Caption = #44592#44592#48324#53685#49888#52404#53356
        Visible = False
      end
    end
    object N6: TMenuItem
      Caption = #46020#50880#47568
      object About1: TMenuItem
        Caption = 'About...'
        OnClick = About1Click
      end
    end
  end
  object SmallDoorList: TImageList
    Left = 16
    Top = 152
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF000000FF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      000000800000008000000080000000800000000000000000000018A5C60018A5
      C60018A5C60018A5C60018A5C60018A5C60018A5C60018A5C60018A5C60018A5
      C60018A5C60018A5C60000000000000000000080000000800000008000000080
      0000008000000080000000800000000000000000000000000000000000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000000000000000000000000000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      000000800000008000000080000000800000000000009CDEEF0094F7FF0073DE
      F70073DEF70073DEF70073DEF7000000FF000000FF0073DEF70073DEF70073DE
      F70073DEF7004AC6E70018A5C600000000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000080
      0000008000000080000000800000008000000080000000800000008000000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      000000800000008000000080000000800000000000000000000094F7FF0073DE
      F70073DEF70073DEF70073DEF7000000FF000000FF0073DEF70073DEF70073DE
      F70073DEF70018A5C60000000000000000000080000000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      000000800000FFFFFF00FFFFFF00FFFFFF000080000000800000008000000080
      00000080000000800000008000000080000000000000000000009CDEEF0094F7
      FF0073DEF70073DEF70073DEF70073DEF70073DEF70073DEF70073DEF70073DE
      F7004AC6E70018A5C60000000000000000000080000000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000080000000800000008000000080
      00000080000000800000008000000080000000000000000000000000000094F7
      FF0073DEF70073DEF70073DEF7000000FF000000FF0073DEF70073DEF70073DE
      F70018A5C6000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000009CDE
      EF0094F7FF0073DEF70073DEF7000000FF000000FF0073DEF70073DEF7004AC6
      E70018A5C6000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      000094F7FF0073DEF70073DEF7000000FF000000FF0073DEF70073DEF70018A5
      C600000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      0000008000000080000000800000008000000000000000000000000000000000
      00009CDEEF0094F7FF0073DEF7000000FF000000FF0073DEF7004AC6E70018A5
      C600000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000000000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000080000000800000FFFFFF00FFFF
      FF00008000000080000000800000008000000000000000000000000000000000
      00000000000094F7FF0073DEF7000000FF000000FF0073DEF70018A5C6000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000FFFFFF000080000000800000FFFFFF00FFFFFF000000000000800000FFFF
      FF00008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000080000000800000FFFFFF00FFFF
      FF00008000000080000000800000008000000000000000000000000000000000
      0000000000009CDEEF0094F7FF000000FF000000FF004AC6E70018A5C6000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00008000000080000000800000008000000080000000800000008000000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000080000000800000FFFFFF00FFFF
      FF00008000000080000000800000008000000000000000000000000000000000
      0000000000000000000094F7FF0073DEF70073DEF70018A5C600000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      0000008000000080000000800000008000000000000000000000000000000000
      000000000000000000009CDEEF0094F7FF004AC6E70018A5C600000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      000000000000000000000000000094F7FF0018A5C60000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0084B58400107310001873
      18001873180018731800187B1800187B1800107B1000107B1000087B0800087B
      0800007B0000007300007BB57B00FFFFFF000000000000000000000000000000
      0000F8F8F800D1D1D100A1A1A100898989008C8C8C00ADADAD00DCDCDC00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      80000000800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0010841000218C21002994
      2900319431003194310029942900299C2900219C210018A5180018A5180010A5
      100008A5080000940000006B0000FFFFFF000000000000000000FEFEFE00D8D8
      D8006169AE000A1EB7000E24CC000E24CC00091DB2000719A2005D6184008F8F
      8F00EAEAEA000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF00188C180029942900399C
      3900399C3900399C390039A53900A5D6A500FFFFFF0021AD210018AD180010B5
      100008AD0800009C0000007B0000FFFFFF000000000000000000C4C5CE001129
      E000142EF500142EF500142EF500142EF500142EF500142EF5000E25D1001627
      A7006D6D6D00E7E7E70000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0021942100399C390042A5
      42004AA54A0042A5420042A54200FFFFFF00FFFFFF00FFFFFF0021B5210018B5
      180010AD100008A50800087B0800FFFFFF0000000000E9E9E900142EF500142E
      F500142EF500142EF500142EF500142EF500142EF500142EF500142EF500132D
      F0001627A70084848400F9F9F900000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0029942900429C42004AA5
      4A0052A552004AA54A0042A5420042AD4200FFFFFF00FFFFFF00FFFFFF0018B5
      180010AD100010A5100008840800FFFFFF00FCFCFC00223BF500142EF500142E
      F5004E62F700000000000000000000000000F0F0F000142EF500142EF500142E
      F500122AE500545DA200D0D0D000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF00319C31004AA54A0052A5
      520052A552004AA54A004AA54A0042A5420039AD3900FFFFFF00FFFFFF00FFFF
      FF0018AD180018A5180010841000FFFFFF00C4CAFC00142EF500142EF5008894
      F400000000000000000000000000000000003D51E700142EF500142EF500142E
      F500142EF5000719A20097979700000000000000000000000000000000000000
      800000008000000080000000800000008000000080000000800000FFFF000000
      8000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF00429C420052A55200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00219C210018841800FFFFFF00223BF500142EF500142EF5000000
      00000000000000000000000000001E34DB00142EF500142EF500223BF500142E
      F500142EF5000F26D60074747400000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0042A542005AAD5A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00219C2100217B2100FFFFFF00142EF500142EF5000E24CC000000
      000000000000000000001E34DB00142EF500142EF500223BF500ECECEC003E53
      F500142EF500142EF50070707000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0052A5520063AD630063AD
      63005AAD5A0052A552004AA54A00429C4200399C3900FFFFFF00FFFFFF00FFFF
      FF00299C290029942900217B2100FFFFFF00142EF500142EF5000B20BC000000
      0000000000001E34DB00142EF500142EF500223BF50000000000000000004C60
      F400142EF500142EF50086868600000000000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0052A552006BB56B006BB5
      6B005AAD5A0052A552004AA54A00429C4200FFFFFF00FFFFFF00FFFFFF002994
      29002994290029942900217B2100FFFFFF00142EF500142EF5001027DB00DFE2
      F3002038EB00142EF500142EF500223BF5000000000000000000FEFEFE00142E
      F500142EF500132DF000BCBCBC00000000000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF005AAD5A007BBD7B0073BD
      730063AD63005AAD5A0052A55200FFFFFF00FFFFFF00FFFFFF00319C3100319C
      31003194310031943100217B2100FFFFFF005D6FF800142EF500142EF500122A
      E500142EF500142EF500223BF500000000000000000000000000BBBCC900142E
      F500142EF5003546CC00EFEFEF00000000000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF006BB56B008CC68C007BBD
      7B006BB56B0063B5630063AD6300B5DEB500FFFFFF004AA54A004AA54A0042A5
      4200399C390031943100217B2100FFFFFF0000000000142EF500142EF500142E
      F500142EF500223BF500000000000000000000000000A1A8DB00142EF500142E
      F500142EF500C8C8C80000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      8000FFFF0000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0073BD73009CCE9C008CC6
      8C007BBD7B0073BD73006BB56B0063B5630063AD63005AAD5A0052AD52004AA5
      4A0042A542003194310018731800FFFFFF00000000008996F900142EF500142E
      F500142EF5000E25D100091CAC00091DB2000F26D600142EF500142EF500142E
      F500949ACC00FCFCFC0000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      8000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF00B5DEB50073BD730063B5
      63005AAD5A0052A5520052A552004AA54A004AA54A0042A54200429C4200399C
      390031943100218C21008CBD8C00FFFFFF0000000000000000007B89F900142E
      F500142EF500142EF500142EF500142EF500142EF500142EF500142EF5008E97
      E200FBFBFB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000F0F1
      FE003148F600142EF500142EF500142EF500142EF5004E62F700F1F1F1000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      C0030000000000008001000000000000C003000000000000C003000000000000
      E007000000000000E007000000000000F00F000000000000F00F000000000000
      F81F000000000000F81F000000000000FC3F000000000000FC3F000000000000
      FE7F000000000000FFFF000000000000C007C0078001FFFFC007C0070000F00F
      C007C0070000C007C007C0070000C003C007C00700008001C007C00700000701
      C007C00700000F01C007C00700001E01C007C00700001C01C007C00700001861
      C007C007000000C1C007C007000001C1C007C00700008383C007C00700008003
      C007C0070000C007C007C0078001E01F00000000000000000000000000000000
      000000000000}
  end
  object toolslist: TImageList
    BkColor = clWhite
    Left = 16
    Top = 160
    Bitmap = {
      494C010107000900040010001000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00007F7F7F007F7F7F00BFBFBF007F7F7F00000000007F7F7F00BFBFBF007F7F
      7F007F7F7F0000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F7F7F00000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000000000FFFF0000FFFF0000FFFF000000FF000000
      FF000000FF000000000000000000FFFFFF0000000000FFFFFF007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000FFFFFF00FFFFFF00000000007F7F
      7F007F7F7F007F7F7F00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF007F7F
      7F007F7F7F007F7F7F0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000800000008000000080
      0000008000000000FF000000FF0000800000008000000000FF000000FF000000
      FF00000080000080000000000000FFFFFF0000000000FFFFFF000000FF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000800000808080000000
      0000C0C0C0000000FF000000FF000000FF000000FF000000FF000000FF000000
      00000000000000800000000000000000000000000000FFFFFF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00000000007F7F
      7F007F7F7F007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000800000008000000080
      000000800000008000000000FF000000FF000000FF000000FF00008000000080
      00000080000000800000000000000000000000000000FFFFFF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000800000808080000000
      0000C0C0C00080808000008000000000FF000000FF000000FF00008000000080
      00000080000000800000000000000000000000000000FFFFFF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000800000008000000080
      000000800000008000000000FF000000FF000000FF000000FF000000FF008080
      800000800000C0C0C000000000000000000000000000FFFFFF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000800000808080000000
      0000C0C0C0000000FF000000FF000000FF00C0C0C0000000FF000000FF008080
      80000080000000800000000000000000000000000000FFFFFF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000800000C0C0C0000080
      00000000FF000000FF000000FF0000800000C0C0C000008000000000FF000000
      FF00008000000080000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF0000000000BFBF
      BF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C0C0C000C0C0C0000000
      FF000000FF000000FF00C0C0C000C0C0C000C0C0C000C0C0C0000000FF000000
      FF000000FF00C0C0C00000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F00BFBFBF00000000000000000000000000BFBFBF007F7F
      7F007F7F7F00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFCFCFCFFA3A3A3FF505050FF353535FF363636FF505050FFA1A1A1FFFBFB
      FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFABAB
      ABFF010175FF010189FF000082FF000080FF000080FF000082FF01013FFF1F1F
      1FFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000BFBFBF00BFBFBF00BFBF
      BF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFF5A5A93FF0101
      8EFF000089FF00008CFF000090FF000090FF00008BFF000086FF00007EFF0101
      82FF030303FFA0A0A0FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFFFF7A7AB0FF010191FF0000
      95FF000096FF0000A2FF0000A2FF0000A2FF00009FFF000097FF00008BFF0000
      84FF01018BFF090909FFCFCFCFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000080808000C0C0C000FFFFFF00FFFFFF00FFFFFFFF03039EFF0000A0FF2929
      ABFFFFFFFFFF0000A5FF0000AFFF0101B0FF0000ACFF4848B6FFFFFFFFFF0000
      8FFF000089FF010180FF444444FFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000FFFFFF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000080808000808080008080
      8000FFFFFF000000000000808000008080002A2AB3FF0202A5FF0000B2FFCBCB
      A5FFFFFFFFFFFFFFFFFF0000AEFF0000B6FF4B4BBDFFFFFFF8FFFFFFFFFF8282
      AEFF00009DFF020291FF020211FFE7E7E7FFFFFFFF0000800000008000000080
      000000800000C0C0C00000800000008000000080000000008000008000000080
      0000000080000080000000000000FFFFFF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C0C0C000808080000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000FFFFFF000000000000FFFF00008080000505A7FF0303B6FF0101C1FF0000
      B9FFC0C0A5FFFFFFFFFFFFFFFFFF5050D7FFFFFFF5FFFFFFFFFF6D6D8FFF0000
      B8FF0101ABFF01019AFF02026FFFB2B2B2FFFFFFFF0000800000808080000000
      0000C0C0C0008080800000800000008000000080000000000000000000000000
      00000000000000800000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000808080000000000080808000C0C0
      C000808080000000000000000000C0C0C000C0C0C0008080800080808000C0C0
      C000FFFFFF000000000000FFFF00008080000808B5FF0606C4FF0606CDFF0202
      CFFF0000BDFFDADABDFFFFFFFFFFFFFFFFFFFFFFFFFF8181A4FF0000C5FF0303
      C1FF0202B8FF0202A6FF03039FFFA6A6A6FFFFFFFF0000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000000000000000000000000000BFBFBF00000000000000
      0000BFBFBF0000000000FFFFFF0000000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C00000000000C0C0C000C0C0C0008080800080808000C0C0
      C000FFFFFF000000000000FFFF00008080000C0CC2FF0B0BD0FF0D0DDCFF0303
      D5FF0000D2FF4648C5FFFFFFFFFFFFFFFFFFFFFFF6FF0000C6FF0000C9FF0505
      CAFF0505C4FF0404B2FF0505B9FFA8A8A8FFFFFFFF0000800000808080000000
      0000C0C0C0008080800000800000008000000080000000800000008000000080
      00000080000000800000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FF000000FF
      0000FFFF000000000000FFFFFF0000000000C0C0C000FFFFFF00000000008080
      8000FFFFFF00C0C0C00000000000C0C0C000C0C0C0008080800080808000C0C0
      C000FFFFFF000000000000FFFF00008080001313CFFF1313E1FF1313ECFF0000
      E0FF3F3FCDFFFFFFF6FFFFFFFFFFFFFFF3FFFFFFFFFFFFFFFFFF0000CAFF0606
      D4FF0808CEFF0707BBFF0606B3FFBEBEBEFFFFFFFF0000800000008000000080
      0000008000000080000000800000C0C0C000C0C0C00000800000808080008080
      800000800000C0C0C000000000000000000000000000BFBFBF00000000000000
      0000BFBFBF0000000000FFFFFF0000000000FFFFFF0000000000FF00FF0000FF
      0000FF00FF0000000000FFFFFF00000000000000000080808000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000C0C0C0008080800080808000C0C0
      C000FFFFFF000000000000FFFF00008080001919D6FF1E1EF2FF1E1EFFFF4D4D
      E0FFFFFFF4FFFFFFFFFF7B7BA3FF0000D4FFCBCBABFFFFFFFFFFFFFFFFFF0000
      E4FF0D0DDAFF0C0CC2FF060690FFFAFAFAFFFFFFFF0000800000808080000000
      0000C0C0C000808080000080000000800000C0C0C00000800000808080008080
      80000080000000800000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF0000000000C0C0C00000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0C000C0C0
      C000FFFFFF000000000000808000FFFFFF003333E7FF2D2DFFFF2F2FFFFFD8D8
      B2FFFFFFFFFF696996FF0000E9FF0000E4FF0000D4FFBEBE9DFFFFFFFDFF7272
      BFFF1616E4FF1313CFFF5D5D71FFFFFFFFFFFFFFFF0000800000C0C0C0000080
      000000800000008000000080000000800000C0C0C00000800000C0C0C0000080
      0000008000000080000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
      FF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFFFF2E2EFDFF4B4BFFFF4C4C
      FBFF6B6B80FF1212FFFF0707FAFF0505F2FF0A0AFCFF1A1AF4FF5B5B8FFF2626
      FFFF2222E9FF1010D2FFF7F7F7FFFFFFFFFFFFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFF9191F9FF4646FFFF6E6E
      FFFF8080FFFF7575FFFF5555FFFF4646FFFF4E4EFFFF5757FFFF4949FFFF3838
      FFFF2020F6FFDCDCDCFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFF8B8BFBFF4E4E
      FFFF7F7FFFFFA0A0FFFFA7A7FFFF9999FFFF8282FFFF6868FFFF4B4BFFFF2727
      FFFFEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF403FFDFF6464FFFF8080FFFF7E7EFFFF6363FFFF3F3FFEFF6E6EF0FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFC1F0000CFF9FFFFF0070000
      C7F1FFFFE0030000E2030000C001000000010000C001000080010000C0010000
      80000000C001000080000000C001000080000000E003000080000000F1C70000
      80000000F1C7000080010000F1C7000080010000F0070000C7E3FFFFF80F0000
      CFF3FFFFFC1F0000FFFFFFFFFFFF0000E003FFFF0000FFFF0001FFFF0000FFFF
      0000FFFF0000FFFF0000FFFB0000FE0700017F830000000103C73F0800008001
      02008E0800008000020000080000800002000008000080000200480800008000
      02000E080000800002003F090000800102007FFB000080010200FFFF0000FFFF
      03FFFFFF0000FFFFFFFFFFFF0000FFFF00000000000000000000000000000000
      000000000000}
  end
  object Menu_ImageList: TImageList
    Height = 32
    Width = 32
    Left = 16
    Top = 128
    Bitmap = {
      494C010110001300040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000080000000A000000001002000000000000040
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000064646400646464006464640064646400646464006464
      6400646464000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021212100212121000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCBCB0098656500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006464
      64006464640064646400D4E4E400DCDCDC00DCDCDC00CCCCCC00CCCCCC006464
      6400646464006464640064646400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042424200CE63630000000000CE63630000000000212121004242
      4200525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009865
      6500FFCBCB0065323200CB989800986565006532320000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000064646400D4E4
      E400B4B4B400948C940080808000747C7C00747474007474740064646400B4B4
      B400C4C4CC006464640064646400646464006464640000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200CE636300CE636300CE63630000000000CE63630000000000212121002121
      2100424242004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098656500FFCBCB00CB98
      9800CB98980065323200FFCBCB00986565009865650098656500653232000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000064646400646464006464
      6400646464006464640064646400646464006464640064646400B4B4B4008080
      8000949494009CA4AC00ACACBC00ACACAC00B4B4B400A49CA4009C9C9C008484
      840064646400B4B4B400DCDCDC00646464006464640064646400646464006464
      6400646464006464640064646400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200CE636300FF9C
      9C00FFCECE00FFCECE00CE63630000000000CE63630000000000212121002121
      2100424242004242420052525200000000000000000000000000000000000000
      000000000000000000000000000098656500FFCBCB00CB989800CB989800CB98
      980098656500CB98980065323200FFCBCB009865650065323200986565009865
      6500653232000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000646464004C4454004C4454004C44
      54004C4454004C4454004C4454004C445400D4E4E400A49CA40084848400C0C0
      C000B4BCBC00ACACAC00A4A4B40054545400A4A4B4009CACB4009CA4AC00A49C
      A400ACACAC008080800054545400B4BCBC009C9C9C0034343400343434003434
      3400343434003434340034343400646464000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000042424200CE636300FF9C9C00FFCECE00FFCE
      CE00FFCECE00FFCECE00CE63630000000000CE63630000000000212121002121
      2100424242005252520052525200000000000000000000000000000000000000
      00000000000098656500FFCBCB00CB989800CB98980098656500CB9898009865
      6500CB9898009865650065323200FFCBCB009865650098656500986565006532
      3200986565009865650065323200000000000000000000000000000000000000
      000000000000000000000000000000000000647494007C94BC007494AC007C94
      BC007494AC007C94BC007494AC00D4E4E400A49CA400A49CA400DCDCDC00C4C4
      CC00B4BCCC00CCC4D400B4BCCC0054545C00C0C0C000ACACAC00ACACAC00ACAC
      BC00ACACBC00A4A4B4009C9C9C0054545400C0C0C00034343400646464005C64
      6C00645C8400645C84005C646C004C4454000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C3131009C3131009C3131009C3131009C3131009C3131009C3131009C31
      310000000000424242009C3131009C3131009C3131009C3131009C3131009C31
      31009C3131009C313100CE63630000000000CE63630000000000212121004242
      4200525252005252520000000000000000000000000000000000000000009865
      6500FFCBCB00CB989800CB989800CB98980098656500CB98980098656500CB98
      980098656500000000000000000065323200FFCBCB0098656500986565009865
      6500986565006532320098656500986565006532320000000000000000000000
      00000000000000000000000000000000000064749400B4BCCC007494AC007C94
      BC007494AC008CA4B4007494AC00A49CA400A49CA400ACACAC00CCC4D400C4C4
      CC00C4CCC400CCC4D400C4C4CC009CA4AC00B4BCCC00C0C0C000A4A4B400B4BC
      CC00ACACBC00A4A4B400848484008C8C940054545400DCDCDC00343434005454
      5400645C84005C646C00645C84004C4454000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C313100CE63630000000000CE63630000000000525252005252
      52005252520000000000000000000000000000000000CB989800FFCBCB00CB98
      9800CB98980098656500CB98980098656500CB98980098656500CB9898000000
      000000000000DDDDDD00DDDDDD0065323200FFCBCB0098656500986565009865
      6500986565009865650098656500653232009865650098656500653232000000
      000000000000000000000000000000000000647494007C94BC008CA4C4007C94
      BC007C94BC007C94BC00DCDCDC0080808000CCCCCC00848C9C00ACACAC00C4C4
      CC00CCC4D400B4BCBC00B4BCBC00B4BCBC00B4BCBC00B4B4BC00B4BCBC00ACAC
      AC009CA4AC00545454009CA4AC00848C9C0080808000747C7C00B4B4B4006464
      640054545400645C84005C646C004C4454000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      000000000000000000000000000000000000000000000000000073737300DEDE
      DE00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00000000009C313100CE63630000000000CE63630000000000525252000000
      00000000000000000000000000000000000000000000FFCBCB00653232009865
      650098656500CB98980098656500CB989800986565000000000000000000CCCC
      CC00DDDDDD00DDDDDD00EEEEEE00EEEEEE0065323200FFCBCB00986565009865
      6500986565009865650098656500986565009865650065323200986565009865
      650065323200000000000000000000000000647494007C94BC008CA4B4008CA4
      C4007C94BC007C94BC00A49CA400ACACAC00CCC4D400CCC4D400ACACBC00C4C4
      CC00C4CCC400CCC4D400C4C4CC00B4BCBC00CCC4D400C4BCC400B4BCBC00B4B4
      BC00ACACBC00A49CA400ACACBC00A4A4B400C0C0C0005C5C5C00C4C4CC003434
      3400646464005C646C005C646C004C4454008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800000000000C0C0
      C00000000000000000000000000000000000000000000000000073737300FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00000000000000
      000000000000ADADAD00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00ADAD
      AD00000000009C313100CE63630000000000CE63630000000000000000000000
      0000000000000000000000000000000000000000000000000000FFCBCB006532
      32006532320098656500986565000000000000000000CCCCCC00DDDDDD00EEEE
      EE00DDDDDD00EEEEEE00DDDDDD00EEEEEE00EEEEEE0065323200FFCBCB00FFCB
      CB00986565009865650098656500986565009865650098656500986565006532
      32009865650098656500653232000000000064749400B4BCCC007C94BC007C94
      BC008CA4B400DCDCDC0094949400DCDCDC00C4D4E400C4CCDC00DCDCDC00CCC4
      D400C4D4D400CCC4D400C4C4CC00B4C4CC00CCC4D400C4C4CC00B4BCBC00CCC4
      D400C0C0C000ACB4BC00ACACBC00ACACBC00ACACAC007474740084848400B4B4
      B40064646400645C84005C646C004C445400C0C0C00080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080000000000000000000C0C0C0000000
      000000000000000000000000000000000000000000000000000073737300FFFF
      FF00DEDEDE00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDE
      DE0000000000ADADAD00FFFFFF00FFFFFF00FFFFFF00DEDEDE00DEDEDE00ADAD
      AD00000000009C313100CE63630000000000CE63630000000000000000000000
      0000000000000000000000000000000000000000000000000000FFCBCB006532
      3200653232006532320000000000CCCCCC00CCCCCC00DDDDDD00EEEEEE00DDDD
      DD00EEEEEE00DDDDDD00EEEEEE00EEEEEE00EEEEEE00EEEEEE00653232006532
      3200FFCBCB00FFCBCB0098656500986565009865650098656500986565009865
      650098656500653232009865650000000000647494007C94BC0094A4BC007C94
      BC008CA4C400ACACAC009C9C9C00DCDCDC00DCDCDC00CCC4D400C4CCC400CCC4
      D400C4C4CC00C4C4CC00C4C4CC00C4CCC400B4C4CC00C0C0C000B4BCBC00B4B4
      BC00ACACBC00ACACAC00ACACAC00B4BCBC00ACACBC009494940064646400B4B4
      B40064646400645C8400645C84004C44540080808000C0C0C000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080000000000000000000C0C0C0000000
      000000808000008080000080800000808000000000000000000073737300FFFF
      FF00DEDEDE005252520052525200525252005252520052525200FFFFFF00DEDE
      DE000000000000000000525252005252520052525200FFFFFF00DEDEDE00ADAD
      AD00000000009C313100CE63630000000000CE63630000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCB
      CB00653232006532320000000000CCCCCC00DDDDDD00EEEEEE00DDDDDD00EEEE
      EE00DDDDDD00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE000000
      00006532320065323200FFCBCB00FFCBCB009865650098656500986565009865
      65009865650098656500986565000000000064749400B4BCCC0094A4BC0094A4
      BC00D4E4E40080808000B4B4BC00DCDCDC00DCDCDC00DCDCDC00D4DCE400CCC4
      D400CCD4D400CCC4D400CCD4D400C4C4CC00CCC4D400C4CCC400ACC4CC00C4C4
      CC00B4BCCC00B4BCBC00ACACBC00ACACBC00ACACBC00A49CA4006C6C6C00DCDC
      DC00646464005C646C00645C84004C4454000000000080808000C0C0C0008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000C0C0C0000000
      00000080800000808000C0C0C00000808000000000000000000073737300FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00FFFFFF00FFFF
      FF0000000000DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00ADAD
      AD00000000009C313100CE63630000000000CE63630000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCB
      CB00653232002222220000000000CCCCCC00EEEEEE00DDDDDD00EEEEEE00DDDD
      DD00EEEEEE00DDDDDD00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE000000
      0000CCCCCC00EEEEEE006532320065323200FFCBCB00FFCBCB00986565009865
      6500986565009865650098656500000000006474940094B4C40094A4BC0094A4
      BC00D4E4E40074747400ACACBC00D4E4E400D4E4E400DCDCDC00D4E4E400C4C4
      CC00C4D4D400DCDCDC00DCDCDC00C4C4CC00DCDCDC00CCC4D400C0C0C000DCDC
      DC00C4C4CC00C0C0C000B4BCCC00C4BCC400A4A4B400ACACAC006C6C6C00DCDC
      DC00646464005C5C7C005C646C004C445400000000000000000080808000C0C0
      C000C0C0C0008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000C0C0C0000000
      000000FFFF0000FFFF000000000000808000000000000000000073737300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDE
      DE00000000009C313100CE63630000000000CE63630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFCBCB006532320000000000CCCCCC00DDDDDD00EEEEEE00DDDDDD00EEEE
      EE00DDDDDD00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00FFFFFF000000
      0000CCCCCC00EEEEEE00EEEEEE00000000006532320065323200FFCBCB00FFCB
      CB009865650098656500986565000000000064749400B4BCCC00A4B4CC0094B4
      C400D4E4E400646464007C7C7C0064646400ACACAC00DCDCDC00DCDCDC00DCDC
      DC00C4D4E400C4C4CC00C4D4D40054545C00646464005C546400545454007474
      7400B4BCBC00ACC4CC00B4B4BC008484840054545400747C7C006C6C6C00DCDC
      DC0064646400645C84005C5C7C004C4454000000000000000000000000008080
      800080808000C0C0C00080808000808080000000000000000000000000000000
      000000000000000000000000000080808000C0C0C000C0C0C000000000008080
      8000000000008080800000000000C0C0C0000000000000000000C0C0C0000000
      000000FFFF0000FFFF00C0C0C000008080000000000000000000737373007373
      7300737373007373730073737300737373007373730073737300737373007373
      7300737373007373730073737300737373007373730073737300737373007373
      730052525200FFCECE00CE63630000000000CE63630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFCBCB006532320000000000DDDDDD00EEEEEE00DDDDDD00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00FFFFFF00FFFFFF00000000000000
      0000CCCCCC00EEEEEE00EEEEEE0000000000CCCCCC00EEEEEE00653232006532
      3200FFCBCB00FFCBCB00986565000000000064749400B4BCCC009CACB4009CAC
      C400D4E4E4006C6C6C00ACACAC00D4E4E400D4E4E400DCDCDC00CCDCDC00DCDC
      DC00CCDCDC00CCC4D400CCC4D4005C546400C4CCDC00CCC4D400C4CCC400C4C4
      CC00C4C4CC00B4BCBC00C4C4CC00B4BCCC00B4BCBC00ACACBC0074747400D4E4
      E4006464640064748400645C84004C4454008080800080808000808080000000
      00000000000080808000C0C0C000C0C0C000C0C0C00080808000000000000000
      0000808080000000000080808000C0C0C000C0C0C000C0C0C000000000008080
      8000000000008080800000000000C0C0C0000000000000000000C0C0C0000000
      000000FFFF0000FFFF0000000000008080000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00CE63630000000000CE63630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCBCB0000000000DDDDDD00DDDDDD00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00FFFFFF00FFFFFF000000000000000000CCCCCC00CCCC
      CC00EEEEEE00EEEEEE00EEEEEE0000000000CCCCCC00EEEEEE00EEEEEE000000
      000065323200FFCBCB00FFCBCB0000000000647494009CACB40094A4BC0094B4
      C400D4E4E40074747400A49CA400FFFFFF00FFFFFF00D4E4E400FFFFFF00D4E4
      E400D4E4E400DCDCDC00C4D4E4005C5C7400DCDCDC00DCDCDC00C4D4D400CCC4
      D400CCC4D400B4BCBC00C4CCDC00CCC4D400B4BCBC00A49CA4008C8C9400B4B4
      B40080808000645C8400645C84004C445400C0C0C000C0C0C000C0C0C000C0C0
      C000808080000000000000000000000000000000000000000000000000008080
      8000808080000000000080808000C0C0C000C0C0C000C0C0C000000000008080
      8000000000008080800000000000C0C0C0000000000000000000C0C0C0000000
      000000FFFF0000FFFF00C0C0C000008080000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00CE63630000000000CE63630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DDDDDD00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00FFFFFF00FFFFFF000000000000000000CCCCCC00CCCCCC00EEEEEE00EEEE
      EE00FFFFFF00FFFFFF000000000000000000CCCCCC00EEEEEE00EEEEEE000000
      0000FFCBCB0000000000000000000000000064749400B4BCCC0094B4C400B4BC
      BC0094B4C400ACACAC007C7C7C00D4E4E400FFFFFF00D4E4E400CCD4D400DCDC
      DC00DCDCDC00D4E4E400D4E4E40064646400C4C4CC00CCC4D400C4CCDC00CCD4
      D400CCC4D400C4CCC400B4BCCC00C0C0C000B4BCBC0094949400B4B4B4006464
      640080808000646C8C00647484004C4454000000000000000000000000000000
      00000000000080808000C0C0C000C0C0C000C0C0C000C0C0C00000000000C0C0
      C000C0C0C0000000000080808000C0C0C000C0C0C000C0C0C000000000008080
      8000000000008080800000000000C0C0C0000000000000000000C0C0C0000000
      000000FFFF0000FFFF0000000000008080000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00CE63630000000000CE63630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEEEEE00EEEEEE00EEEEEE00FFFFFF00FFFF
      FF000000000000000000CCCCCC00CCCCCC00EEEEEE00EEEEEE00FFFFFF00FFFF
      FF000000000000000000CCCCCC00CCCCCC00EEEEEE00EEEEEE00EEEEEE000000
      00000000000000000000000000000000000064749400B4BCCC00A4B4CC009CAC
      C400A4B4CC00DCDCDC0064646400C4D4D400FFFFFF00FFFFFF00DCDCDC00D4E4
      E400D4E4E400CCDCDC00DCDCDC0064646400CCD4D400CCC4D400DCDCDC00CCC4
      D400C4C4CC00C4CCC400C4C4CC00C4C4CC00C0C0C00080808000D4E4E4008080
      8000747C9400747C9C00645C84004C445400808080008080800080808000C0C0
      C000C0C0C000000000008080800000000000000000000000000000000000C0C0
      C000C0C0C0000000000080808000C0C0C000C0C0C000C0C0C000000000008080
      8000000000008080800000000000C0C0C0000000000000000000C0C0C0000000
      000000FFFF0000FFFF00C0C0C000008080000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00CE63630000000000CE63630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEEEEE00FFFFFF00FFFFFF00000000000000
      0000CCCCCC00CCCCCC00EEEEEE00EEEEEE00FFFFFF00FFFFFF00000000000000
      0000CCCCCC00CCCCCC00EEEEEE00EEEEEE00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000064749400CCDCDC00A4B4CC00B4C4
      D40094B4C400D4E4E4009C9C9C0064646400D4E4E400FFFFFF0080808000D4E4
      E400D4E4E400D4E4E400D4E4E40064646400D4E4E400C4D4D400C4CCC400DCDC
      DC00C4BCC4009CA4AC00C4CCDC00DCDCDC008C8C9400B4B4B40064646400747C
      9400747C9400747C9400647484004C445400C0C0C000C0C0C000C0C0C0000000
      000000000000000000000000000080808000C0C0C0000000000000000000C0C0
      C000C0C0C0000000000080808000C0C0C000C0C0C000C0C0C000000000008080
      8000000000008080800000000000C0C0C0000000000000000000C0C0C0000000
      000000FFFF0000FFFF0000000000008080000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFFFFF0000000000FF9C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000CCCC
      CC00EEEEEE00EEEEEE00FFFFFF00FFFFFF000000000000000000CCCCCC00CCCC
      CC00EEEEEE00EEEEEE00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000064749400B4BCCC0094B4C400C4C4
      CC00A4B4CC00B4BCBC00D4E4E400747474009C9C9C009C9C9C00D4E4E400FFFF
      FF00FFFFFF00C4D4D400D4E4E400ACACAC00D4E4E400DCDCDC00C4D4E400C4D4
      D400C4D4D40094949400ACACAC00A49CA400A49CA400CCCCCC0080808000747C
      9400748C9C00747C9C00646C8C004C4454008080800080808000000000000000
      00008080800080808000C0C0C000C0C0C0000000000000000000000000008080
      800080808000000000000000000000000000C0C0C000C0C0C000000000008080
      8000000000008080800000000000C0C0C0000000000000000000C0C0C0000000
      000000FFFF0000FFFF00C0C0C000008080000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFFFFF00FF9C9C0042424200FF9C9C00FF9C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEEE
      EE00FFFFFF00FFFFFF000000000000000000CCCCCC00CCCCCC00EEEEEE00EEEE
      EE00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000064749400B4BCCC00B4C4D400B4C4
      D400B4BCBC00A4B4CC00A4B4CC00CCCCCC00646464008C8C9400D4E4E400D4E4
      E400FFFFFF00DCDCDC00D4DCE4009CA4AC00CCDCDC00DCDCDC00CCD4D400C4C4
      CC00C4C4CC00CCC4D400A49CA400A49CA400D4E4E40064646400747C9400747C
      9400747C9400747C9400747C94004C4454000000000000000000808080008080
      8000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000000000008080
      8000000000008080800000000000C0C0C0000000000000000000C0C0C0000000
      000000FFFF0000FFFF0000000000008080000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFFFFF00FF9C
      9C004242420042424200FF9C9C00FF9C9C00FFCECE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000CCCCCC00EEEEEE00EEEEEE00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000064749400CCDCDC00C4C4CC00C4C4
      CC0094B4C400C4C4CC0094B4C40094A4BC00CCD4D4007474740064646400DCDC
      DC00FFFFFF00D4E4E400FFFFFF006C6C6C00FFFFFF00D4E4E400D4E4E400DCDC
      DC00B4B4B40080808000D4E4E400B4B4B400808080007494AC00748C9C00748C
      9C00747C9400747C9400747C94004C4454000000000080808000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000C0C0C0000000
      000000FFFF0000FFFF00C0C0C000008080000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFFFFF00FF9C9C00424242004242
      4200FF9C9C00FF9C9C00FF9C9C00FF9C9C000000000052525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEEEEE00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000064749400C4D4E400C4C4CC00B4C4
      D40094B4C400B4C4D40094A4BC00B4BCBC00A4B4CC00DCDCDC009C9C9C006C6C
      6C0080808000A49CA400ACACAC0080808000A4A4B400ACACAC00949494008C8C
      8C008C8C8C00D4E4E40080808000808080007494AC00748C9C00748C9C00747C
      9C00747C9400747C9400747C94004C445400C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000C0C0C0000000
      0000008080000080800000808000000000000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFFFFF00FF9C9C004242420042424200FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000064749400CCDCDC00B4C4D400A4B4
      CC00B4C4D400C4C4CC0094B4C40094B4C40094A4BC009CACC400D4E4E400DCDC
      DC00D4E4E4006464640074747400646464007474740080808000CCCCCC00DCDC
      DC00D4E4E400808080007494AC007494AC007494AC00748C9C00748C9C00748C
      9C00747C9400747C9400747C94004C445400C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080000000000000000000C0C0C000C0C0
      C000808080000000000000000000000000000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFFFFF00FF9C9C004242420042424200FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000064749400B4BCCC00C4C4CC00B4C4
      D400C4C4CC0094B4C400A4B4CC00A4B4CC0094B4C4009CACC4009CACB4009CAC
      B40094A4BC00DCDCDC00D4E4E400D4E4E400D4E4E400D4E4E4007C94BC007494
      AC007C84AC007494AC007494AC007C84AC007494AC00748C9C00748C9C00747C
      9C00748C9C00747C9400747C94004C4454000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFFFFF00FF9C
      9C004242420042424200FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FFCECE00CE636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000064749400CCDCDC00B4BCCC00CCDC
      DC00B4BCCC00CCDCDC00B4BCCC00B4BCCC0094B4C400B4BCCC00B4BCCC0094B4
      C400B4BCCC00B4BCCC00A4B4CC00A4B4CC00B4BCCC00A4B4CC00A4B4CC00A4B4
      CC00A4B4CC00B4BCCC00A4B4CC00A4B4CC00A4B4CC00A4B4CC00A4B4CC00A4B4
      CC00747C9C00748C9C004C445400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFFFFF00FF9C9C00424242004242
      4200FF9C9C00FF9C9C00FFCECE00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FFCE
      CE00FF9C9C000000000052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000647494007C94BC007C94BC007C94
      BC007C94BC007C94BC007C94BC007C94BC007C94BC007C94BC007C94BC007C94
      BC007C94BC007C94BC007C94BC007C94BC006474940064749400647494006474
      9400647494006474940064749400647494006474940064749400647494006474
      9400647494006474940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFFFFF00FF9C9C004242420042424200FF9C9C00FF9C
      9C00FFCECE00FF9C9C000000000052525200FF9C9C00FFCECE00FF9C9C000000
      0000525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000064749400CCDCDC00CCDC
      DC0094B4C4009CACC40094B4C40094B4C4009CACC4009CACC4009CACC4009CAC
      C4009CACC4009CACC4009CACC40064749400544C640000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFCECE00FFCE
      CE00FFFFFF00FF9C9C004242420042424200FF9C9C00FF9C9C00FFCECE00FF9C
      9C00000000005252520000000000000000000000000000000000525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000064749400CCDC
      DC0094B4C400C4C4CC0094B4C4009CACC4009CACC4009CACC4009CACC4009CAC
      C4009CACC4009CACC40064749400544C64000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF9C
      9C004242420042424200FF9C9C00FF9C9C00FFCECE00FF9C9C00000000005252
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006474
      9400CCDCDC0094B4C400C4C4CC0094B4C4009CACC4009CACC4009CACC4009CAC
      C4009CACC40064749400544C6400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200FF9C9C00FF9C9C00FFCECE00FF9C9C000000000052525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000647494006474940064749400647494006474940064749400647494006474
      940064749400544C640000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFCECE00FF9C9C0000000000525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C66B6B00C6636300CE636300B55252009C6B
      6B00B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B573730094292900943131009C3939009C4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300C66B6B00CE636300CE636300BD5A5A009C6B
      6B00A58C8C00B5848400CEADAD00DECECE00F7F7EF00FFFFF700F7F7F700EFEF
      E700E7E7E700B573730094292900943131009C393900C65A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300C66B6B00CE636300CE636300BD5A5A009C73
      7300A57B7B009C393900B5736B00C69C9C00EFE7E700F7F7F700FFF7F700F7F7
      EF00EFEFEF00BD7B7B0094292900943131009C393900C65A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300C66B6B00CE636300CE636300BD5A5A00A573
      7300A5848400943131009C424200B5737300DEDED600EFEFEF00F7F7F700FFF7
      F700F7F7F700BD7B7B0094292900943131009C393900C65A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300C66B6B00CE636300CE636300BD5A5A00A573
      7300AD8C8C0094313100943131009C4A4A00C6C6C600E7E7DE00EFEFEF00FFF7
      F700FFFFFF00C67B7B0094292900943131009C393900C65A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300C66B6B00CE636300CE636300B5525200AD7B
      7B00B58C8C00942929009429290094313100ADA5A500CECECE00E7E7DE00F7EF
      EF00FFFFFF00C684840094292900943131009C393900C65A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300C66B6B00CE636300CE636300B5525200AD7B
      7B00C6ADAD00A5636300A56363009C6363009C9C9C00B5B5B500D6D6D600EFEF
      EF00FFFFFF00C684840094292900943131009C393900BD5A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300C66B6B00CE636300CE636300BD5A5A00B573
      7300D6A5A500C69C9C00BD9C9C00BD949400AD8C8C00AD8C8C00C69C9C00D6AD
      AD00E7C6C600C6737300A5424200AD424200AD4A4A00C66363009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C0008080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000000000000000
      0000000000000000000000000000C0C0C0000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00080808000C0C0C0000000000000000000000000000000
      00000000000080808000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300C66B6B00CE636300CE636300CE636300CE63
      6300CE636300CE636300CE636300CE636300CE636300CE636300C6636300C663
      6300C6636300CE636300CE636300CE636300CE636300CE6363009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000800000008000
      0000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000000000000000
      0000000000000000000000000000C0C0C0000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000000000000000000000000000C0C0C00000000000000000000000
      000080808000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300C66B6B00BD5A5A00C6636300C66B6B00CE73
      7300CE737300CE737300CE737300CE737300CE737300CE737300CE737300CE73
      7300CE737300CE737300CE737300CE7B7B00CE6B6B00CE6363009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008080800000000000C0C0C000808080008000
      000080808000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C0000000000000000000000000000000000000000000C0C0C000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300AD4A4A00A54A4200B56B6B00C68C8C00CEAD
      AD00D6BDBD00D6BDBD00D6BDBD00D6BDBD00D6BDBD00D6BDBD00D6BDBD00D6BD
      BD00D6BDBD00D6BDBD00D6BDBD00DEC6C600CE8C8C00CE6363009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C000C0C0C000C0C0C00000000000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C0000000000000000000000000000000000000000000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300AD424200CE9C9C00F7F7EF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00EFE7E700CE8C8C00C65A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300AD424200CEA5A500FFFFFF00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700FFF7F700EFE7E700CE8C8C00BD5A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800000000000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300AD424200CEA5A500FFFFFF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7F7F700EFE7E700CE8C8C00BD5A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C0000000000000FFFF00C0C0C00000000000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300AD424200CEA5A500FFFFFF00E7E7E700CEC6
      C600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00C6C6C600E7DEDE00EFE7E700CE8C8C00BD5A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C0000000000080808000C0C0C000C0C0C000C0C0C00000000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000000000000000
      0000000000000000000000000000C0C0C0000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      00000000000000000000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300AD424200CEA5A500FFFFFF00F7EFEF00EFE7
      E700EFE7E700EFE7E700EFE7E700EFE7E700EFE7E700EFE7E700EFE7E700EFE7
      E700EFE7E700EFE7E700F7EFEF00EFE7E700CE8C8C00BD5A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000FFFF008080800000000000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000000000000000
      0000000000000000000000000000C0C0C0000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      00000000000000000000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300AD424200CEA5A500FFFFFF00EFE7E700D6CE
      CE00D6CECE00D6CECE00D6CECE00D6CECE00D6CECE00D6CECE00D6CECE00D6CE
      CE00D6CECE00CECECE00E7E7E700EFE7E700CE8C8C00BD5A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00C0C0C00000000000C0C0C000C0C0C0008080800000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300AD424200CEA5A500FFFFFF00EFEFE700E7DE
      DE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00E7DEDE00E7DEDE00EFEFEF00EFE7E700CE8C8C00BD5A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300AD424200CEA5A500FFFFFF00EFEFE700E7DE
      DE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00E7DEDE00E7DEDE00EFEFEF00EFE7E700CE8C8C00BD5A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300AD424200CEA5A500FFFFFF00E7E7E700CECE
      CE00D6CECE00D6CECE00D6CECE00D6CECE00D6CECE00D6CECE00D6CECE00D6CE
      CE00D6CECE00CECECE00E7E7E700EFE7E700CE8C8C00BD5A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5847300AD424200CEA5A500FFFFFF00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700EFE7E700CE8C8C00C65A5A009C4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD424200CE9C9C00C6CECE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C68C8C00B5525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C1C1C1006A6A
      6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A0095959500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099C19900038203000287
      0200028702000287020002870200028B0200206C200066666600E1E1E1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFCFA003C9A3C0000E5000000F5
      000000F5000000F5000000F8000000FD000001A4010054665400ABACAB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDEBDD0001A4010000F8000000F8
      000000F8000000F8000000FD000000FD000000D900002F6A2F0088888800F9F9
      F90000000000000000000000000000000000000000000000000000000000F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FB
      FF00F0FBFF00F0FBFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A1A1
      A10086868600A5A5A500C6C6C600D9D9D900E9E9E900F5F5F500000000000000
      00000000000000000000000000000000000090C2900000C6000000F8000000F1
      000000F5000000F5000000F8000000FD000000F500001781170064686400DDDD
      DD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073849C0000428C000042
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B9B9B9009595
      95007D7D7D00757575006E6D6E006A6A6A0075757500868686009A9A9A00B1B1
      B100C9C9C900E9E9E900FAFCFA0000000000339B330000E9000000F1000000F1
      000000F1000000F5000000F5000000F8000000FD000000B400004E684E00B5B2
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0FBFF00F0FBFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000214A9400214A94000000000000000000426B8C001884BD001073
      B5000000000000000000214A9400104284000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B2B500D9D9
      D900D1D1D100C6C6C600B9B9B900A5A5A5009292920082828200757575007171
      71006A6A6A006A6A6A00717171007D8B7D0009A0090000F1000000ED000000F1
      000000E9000000D2000000F8000000F5000000FD000000D90000347134007D7D
      7D000000000000000000000000000000000000000000C0602000C0400000C040
      2000C0604000C0604000C0604000C0604000C0606000C0606000C0402000C040
      2000C0402000C040200080402000806040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000118FCA00118FCA00118FCA0040B6E0002AABE0001698CA00118F
      CA000B8FCA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000029639C002173AD001873AD00214A940029528400297BB50039B5E70029A5
      D600295A8C00294A7B00005294000863A500426B8C0000000000000000000000
      0000000000000000000000000000000000000000000000000000B1B1B100E5E5
      E500E1E1E100DDDDDD00E1E1E100DDDDDD00D9D9D900D5D5D500CDCDCD00C0BF
      BE00ABACAB009A9A9A0091889100517D510000CA000000ED000000E9000000ED
      000000D9000000A0000000F1000000F5000000F5000000F100000F8F0F006666
      6600E4E2E00000000000000000000000000000000000C0400000C0402000C060
      4000C0604000C0606000C0606000C0806000C0806000C0604000C0806000C060
      2000C0606000C0604000C0604000C04020004040200040604000408020000060
      20004080200040A0200040A0200040A0200040A0200000802000006020000060
      2000406040000000000000000000F0FBFF000000000000000000000000000000
      0000000000000B8FCA0098D4F400A1FFFF0084FFFF007BF4FF0073EAFF0060E0
      F40050CAF40038B6E0002AA1D4001698CA00118FCA000B8FCA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000029639C004AADDE0042B5E7002184BD000863A5002994CE0039B5E70031AD
      DE00086BAD000863A5001094C6001094CE004A94A50000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00E5E5
      E500DDDDDD00DDDDDD00DDDDDD00DDDDDD00D9D9D900D9D9D900DADCDE00D9D9
      D900D9D9D900DDDDDD00D1D1D10037A2370000D9000000E9000000E9000000ED
      000004BD04001187110000E2000000F5000000F1000000FD000000B40000586A
      58009A9A9A00F5F4F300000000000000000000000000C0402000C0604000C060
      4000C0606000C0806000C0806000C0806000C0806000C0602000F0CAA600C080
      6000C0606000C0606000C0606000C06040008060200040C0400040C0600040A0
      400040A0200040C0600040C0600040C0400040C0400040C0400040A0200040A0
      2000008000000000000000000000F0FBFF000000000000000000000000000000
      000000000000068FCA0048ABE000C0FFFF0073F4FF007BF4FF007BF4FF007BF4
      FF007BF4FF007BF4FF0073F4FF0073EAFF0058D4F40040C0EA0031B6E0001CA1
      D400118FCA000B8FCA000B8FCA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005AADD60052B5E70052C6F7004AB5EF0039ADE70039B5E70039B5E70031AD
      DE0029A5D60018A5D60018A5D60018A5D6003194B50073737B00000000000000
      00000000000000000000000000000000000000000000F1F1F100B6B6B600E5E5
      E500E1E1E100E1E1E100E1E1E100E1E1E100DDDDDD00D9D9D900D9D9D900D9D9
      D900D9D9D900DDD9DD00B7C6B70004AE040000E5000000E5000000E5000000ED
      000024B2240076A6760000CA000000F1000000F1000000F5000000DE00004279
      420069676900D5D5D500000000000000000000000000C0602000C0604000C060
      6000C0806000C0806000C0806000C0806000C0604000F0CAA600F0CAA600F0CA
      A600C0604000C0806000C0606000C0604000C060200040C0600040C0600080A0
      600080C0600040C0600080C0600040C0600040C0600040C0400040C0400040A0
      200000A020000000000000000000F0FBFF000000000000000000000000000000
      000000000000118FCA002AA1D400ABEAF40084FFFF007BF4FF007BF4FF007BF4
      FF007BF4FF0073F4FF0073F4FF0073F4FF007BF4FF007BF4FF0073EAFF0073EA
      FF006AE0FF0048CAEA001C98D400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002152
      940000428C00298CC6004ABDEF004ABDEF0042BDEF0042B5E70039B5E70031AD
      DE0029A5DE0021A5DE0018A5D6001094C600214A940000428C00526384000000
      00000000000000000000000000000000000000000000E9E9E900C1C1C100EAE8
      E700DCDEE100C9C9C900C1C3C500CBCDD000D2D5D800DADDE000DCDEE100DADD
      E000DADCDE00E3DDE40077B5770000C1000000E5000000E2000000E5000000DE
      000056B45600ACBFAC000AB60A0000ED000000ED000000F1000000F100001F97
      1F00636E6300DADCDE00000000000000000000000000C0806000C0604000C060
      6000C0806000C0806000C0A08000C0806000C0806000F0CAA600F0CAA600F0CA
      A600C0604000C0806000C0806000C0606000C060200080C0600040A04000C0DC
      C0000000000040A0400080E0800080C0600080C0600040C0600040C0400040C0
      400040A020000000000000000000000000000000000000000000000000000000
      0000000000001698CA0040B6E0007BCAEA00A1FFFF0073F4FF007BF4FF007BF4
      FF007BF4FF0073F4FF0073F4FF0073EAFF0073EAFF0073EAFF0073EAFF0073EA
      FF0073EAFF006AE0FF0040C0EA00118FCA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000214A
      9400217BB50042ADE70052C6F7004ABDEF004ABDEF0063BDE70073ADBD004A84
      9C001873A500108CC6001094CE001094C600007BB500006BA500216394000000
      00000000000000000000000000000000000000000000DDDDDD00C9C9C900E9E9
      E900DADCDE00B6B6B600B5856B00CBA27400C2A38200B5A08C00B4A49900B9AF
      A700BCB8B500CBC4CC0029A6290000D9000000DE000000DE000000E5000000C6
      000089BD8900D8D1D80027AA270000E9000000ED000000ED000000F1000000BC
      00004E6E4E00B1B1B10000000000000000000000000000000000C0604000C060
      6000C0806000C0806000C0A06000C0602000F0CAA600F0CAA600F0CAA600F0CA
      A600C0804000C0806000C0806000C06040008080400080E0800040A040000000
      000000000000C0DCC00040A0400080E0800080C0600080C0600040C0600040C0
      4000408020000000000000000000000000000000000000000000000000000000
      0000000000001698CA0060E0F40048B6E000B6F4FF0073F4FF007BF4FF007BF4
      FF007BF4FF0073F4FF0073F4FF0073EAFF0073EAFF0073EAFF0073EAFF0073EA
      FF0073EAFF0060E0F40058D4F40023ABD4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000042A5
      DE005AC6FF0052C6F70052C6F7004ABDEF005AC6EF00BDD6DE00A5A5A5006B6B
      6B00214A6B00006BAD00007BB500008CC600089CCE000894CE00218CB5000000
      00000000000000000000000000000000000000000000D5D5D500D5D5D500E9E9
      E900D9D9D900C3C4C600C7794F00FDAA4A00FDAA4A00FF9E4000F8944200ED8D
      4400E58349008C6C3C0003AA030000DE000000DE000000DE000000E2000006B9
      0600B3C6B300E7D9E70056B0560000D9000000E9000000ED000000F1000000D9
      0000327E3200757575000000000000000000000000000000000000000000C060
      4000C0606000C0806000C0602000F0CAA600C0808000C0808000F0CAA600F0CA
      A600C0804000C0A08000C0806000C040200080C0800080E0800040A060000000
      0000000000000000000080C0800080C0600080E0800080C0600040C0600040A0
      40008080600000000000F0FBFF00000000000000000000000000000000000000
      0000000000001698CA007BEAF40038C0E000ABE0F40084FFFF007BF4FF007BF4
      FF007BF4FF0073F4FF0073F4FF0073EAFF0073EAFF0073EAFF0073EAFF0073EA
      FF0073EAFF0058D4F40058D4FF0048CAEA000B8FCA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006BC6
      E70052C6EF0052C6EF004ABDEF004ABDEF006BC6EF00DEDEDE00A5A5A5006B6B
      6B00295A7300108CC6001094C6000894CE00089CCE00109CCE0063ADBD000000
      00000000000000000000000000000000000000000000C9C9C900DDDDDD00E9E9
      E900D5D5D500C9CCCE00D29A8100E48D3A00FFB45600FFA34A00FF9B4100FF97
      3C00FA742C005B5F030000CA000000D9000000D9000000DE000000D900002AB1
      2A00C4CBC400DDD6DD0099C1990000C1000000ED000000E9000000ED000000E9
      000009A0090066666600D8D7D600000000000000000000000000F0FBFF000000
      0000C0604000C040200040204000000080000000800000008000002060008060
      6000C0604000C06040008060200080C0600080E0800080E0800080A060000000
      00000000000000000000F0FBFF0040A0400080C0600080E0800040C060004080
      400000000000F0FBFF0000000000000000000000000000000000000000000000
      0000000000001698CA0084EAFF0048D4EA0073C0EA00ABFFFF0073F4FF007BF4
      FF007BF4FF0073F4FF0073F4FF0073EAFF0073EAFF0073EAFF0073EAFF0073EA
      FF0073EAFF0058D4F40058D4F40073EAFF001698CA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000218C
      3900188C420039A5B5004ABDEF004ABDEF006BC6EF00DEDEDE00A5A5A5006B6B
      6B00316B7B0018A5D60018A5D600189CCE00189CCE00189CCE00A5C6BD000000
      00000000000000000000000000000000000000000000C1C1C100EAE8E700E9E9
      E900D1D1D100CDCFD100F0DED900C2663500F8A14300FFAD4B00FFA54600F890
      3A00BB5A270032981A0000D2000000D9000000D9000000D9000000D40000419A
      4100A79EA700A9A5A9009FA59F0008B1080000E9000000E9000000E9000000F1
      000000C100004C724C00A5A5A5000000000000000000F0FBFF00000000000000
      0000000000000000000000000000002080000020A0000020A0000020A0000020
      800040204000806060008080600040A0400080E0800080E0A00080A06000C0DC
      C00080A0A0004080A00080A0A000A4A0A00040A0400040A04000408040000000
      0000F0FBFF000000000000000000000000000000000000000000000000000000
      0000000000001698CA007BEAF40073F4FF0031ABD400C0F4FF008FFFFF007BF4
      FF0073F4FF0073F4FF0073F4FF0073EAFF0073EAFF0073EAFF0073EAFF0073EA
      FF0073EAFF0058D4F40003600600066A0B0031B6E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063A55A00428C31000000000000000000000000000894
      0800088C10001884840042ADE7004ABDEF006BC6EF00DEDEDE00A5A5A5006B6B
      6B00316B7B0021A5DE0018A5D600188CBD00A5C6BD0000000000000000000000
      00000000000000000000000000000000000000000000C1C1C100E9E9E900EEEE
      EE00CDCDCD00CDCFD10000000000DAC4C000756D7A007490A6009E857500C769
      4300C1BC9C0007BB0C0000D4000000D4000000D4000000D9000000C6000089BD
      8900D3C9D300BDBDBD00B5B2B5003AAD3A0000D9000000E5000000E9000000E9
      000000DE00002A872A0082828200F5F4F300F0FBFF0000000000000000000000
      00000000000000000000002060000040A0000040A0000040A0000040A0000040
      A0000020800040406000000000000000000040A0600040A04000408040000080
      C0000080C0004080C0000080C0000080C0000060800040604000000000000000
      0000F0FBFF000000000000000000000000000000000000000000000000000000
      0000000000001698CA007BEAF40084FFFF0040CAEA0048ABE000ABE0F400ABEA
      F400B6F4FF00B6F4FF00ABFFFF0084F4FF006AEAFF0073EAFF0073EAFF0073EA
      FF0073EAFF000358030023AB480031CA6000066A0B000B8FCA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063A55A00399C3100088C1000007B00005A8421003994290039CE
      520031CE4A0031AD9C0042B5DE0042B5DE0063C6D600D6D6D6009C9C9C006363
      6300426B7B0039ADD60029A5D60029A5D6000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00E9E9E900EEEE
      EE00C9C9C900D8D7D600F6FAFE0073A8DA00418BD200478ED300367DC600A7C2
      EA0096E0970000BC000000D2000000D2000000D4000000D900000EB80E00C9D7
      C900E1E1E100DDDDDD00E9DFE9007BBF7B0000CA000000E5000000E5000000E5
      000000E9000012A21200616A6100D8D7D600C0DCC00000000000000000000000
      000000000000002060000040A0000040C0000040C0000040C0000040C0000040
      C0000040A0000020600000000000000000000000000080A0C0000080C00040A0
      E00040A0E00040A0E00040A0E00040A0E0004080E00000608000000000000000
      0000F0FBFF000000000000000000000000000000000000000000000000000000
      0000000000001698CA0084EAFF007BFFFF007BF4FF0048CAEA0038C0E00040B6
      E00048B6E00048B6E00058B6E000ABE0F400A1F4FF006AEAFF0073EAFF0073EA
      FF00005000001C98380040E0730040E0730023AB400003580600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000299C29004ACE5A004ADE6B0021B53100088C100018AD290039CE
      520029C6420018A5390018A55A0021AD5A0042B54200C6B59C00736B63005252
      52008C7363009CCED60042A5C6009CC6C6000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900C1C1C100EEEEEE00EEEE
      EE00C6C6C600E4E2E000C0D8EF00448ACE0063A1DC005B99D5004F92D1005991
      D70025B32F0000CA000000D2000000D2000000D2000000D200001DA91D00A9A5
      A900AAAAAA00B5B2B500C8C0C800A8CBA80009C2090000E2000000E2000000E5
      000000E9000000C600004B764B00AAAAAA000000000000000000000000000000
      0000000000000060C0000060C0000060C0000060C0000060C0000060C0000060
      C0000060C000002080004060600000000000000000004080C00040A0E00040A0
      E00040A0E00040A0E00040A0E00040A0E00040A0E0004080E000406060000000
      000000000000F0FBFF0000000000000000000000000000000000000000000000
      0000000000001698CA0084EAFF007BFFFF007BF4FF0084FFFF007BFFFF007BF4
      FF0073EAFF006AEAFF0048CAEA002AA1D40098D4F400B6F4FF007BF4FF000358
      03001698310040EA7B0038D46A0031CA500011981C0011982300035803000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B9C4A0063D66B0052EF7B004ADE6B0031CE4A0039D65A0039CE
      520031CE4A0021BD310018AD290018B5290031B531008CA55A007B735A006B63
      5200B59C7B000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1F1F100C1C3C500F0EFED00EEEE
      EE00C6C6C600EAE8E70094BCE3005EA0DC0070ACE30066A4DE00609CDF003B8F
      A80000B1040000CD000000CD000000CD000000D2000000C6000065BA6500C2BC
      C200B6B6B600ADADAD00B6B6B600D4D9D40023B8230000DE000000E2000000E2
      000000E9000000D900002C8D2C00828282000000000000000000402020004020
      2000002040004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0000040A000404060000000000080A0C0004080E00040A0E00040A0
      E00040A0E00040A0E00040A0E00040A0E00040A0E00040A0E0000080C0000000
      000000000000F0FBFF0000000000000000000000000000000000000000000000
      0000000000001698CA0084EAFF007BFFFF007BF4FF007BF4FF007BF4FF007BF4
      FF007BF4FF007BF4FF007BF4FF0060E0F4002AABE00060C0E000035803001198
      1C001C98380023AB40002AC0500023B6400016AB310011981C0011981C000058
      0300000000000000000000000000000000000000000000000000000000000000
      000084BD7B00318C180031A531004ADE6B004AE7730042DE6B0039D65A0039CE
      520031CE4A0029C6420021BD310018B5290018A5180021941800317B21006B84
      4200000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EEEEEE00C9C9C900F5F4F300EEEE
      EE00C1C3C500F0EFED0091BAE2006DAAE5007AB4EA0070ACE3006BA2EA00309D
      7E0000B8000000C1000000C1000000C1000000C6000000B80000A9D0A900EBE3
      EB00E1E1E100DDDDDD00DDDDDD00E9DFE90055C0550000CA000000D2000000D2
      000000D2000000D2000023B82300D1D1D1000000000040202000402020004020
      2000000000004060C0004080E0004080E0004080E0004080E0004080E0004080
      E0004060E0000060C000404060000000000080A0A00040A0E00040A0E00040A0
      E00040A0E00040A0E00040A0E00040A0E00040A0E00040A0E00040A0E0004060
      600000000000F0FBFF0000000000000000000000000000000000000000000000
      0000000000001698CA0084F4FF007BFFFF007BF4FF007BF4FF007BF4FF007BF4
      FF007BF4FF0073F4FF0073F4FF007BF4FF0073EAFF0040CAEA00035803000358
      030003580300035806001CAB31001CAB31000358030003580300035803000358
      0300000000000000000000000000000000000000000000000000000000000000
      000039A5390021B5310039CE52004AE773004AE773004ADE6B0073D6840073B5
      8400429C4A001894210010A5180010A5180010A51800089C0800008C00005294
      2900000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E9E9E900D1D1D100F5F5F500EEEE
      EE00BDBDBD00FBF9F7009DC0E30066A4E20088C0F3007AB4EA0066A4E200529D
      B5008ED6910074B9720086CC860086CC86005FA75F00629B62009A9D9A00A9A5
      A900A5A5A500ABACAB00B1B1B100BDBDBD00C4D6C40086CC860072B272004986
      490091D6910096DD9600B1E6B100000000000000000040202000404040004040
      4000402020004060C0004080E0004080E00040A0E00040A0E00040A0E0004080
      E0004080E0000060C00040406000000000004080C00040A0E00040A0E00040A0
      E00040A0E00040A0E00040A0E00040A0E00040A0E00040A0E00040A0E0000060
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000001698CA008FF4FF007BFFFF007BF4FF007BF4FF007BF4FF007BF4
      FF007BF4FF0073F4FF0073F4FF0073F4FF0073EAFF007BF4FF0073EAFF0060EA
      FF006AEAFF00035803001198230011AB23000358030000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000094E7A5005AEF840052EF840052EF7B004AE7730063E77B00CED6CE009CA5
      9C006B736B001873180000840000008C00000894080008A51000089C080052A5
      2900000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E1E1E100D9D9D900F5F5F500EEEE
      EE00BDBDBD00FFFCF900DDE9F5005B99D50072B0E9006DAAE500498ECE00B8CF
      EE00FFF9FF00CABFC900F4E9F400F4E9F400E7DCE700DDD6DD00D1D1D100C6C6
      C600C6C6C600BDBDBD00B1B1B100BDBDBD00DDDDDD00EBE3EB00BEB1BE006E6D
      6E00000000000000000000000000000000000000000040202000404040004040
      400040404000004060004080E00040A0E00040A0E00040A0E00040A0E00040A0
      E00040A0E0000060C000404060000000000040A0C00040C0E00040C0E00040C0
      E00040C0E00040C0E00040C0E00040C0E00040C0E00040A0E00040A0E0004060
      A000000000000000000000000000000000000000000000000000000000000000
      0000000000001698CA00A1F4FF007BFFFF007BF4FF007BF4FF007BF4FF007BF4
      FF007BF4FF0084EAFF0084EAFF0084EAFF0084EAFF0084EAFF0084EAFF0084EA
      FF0084F4FF00035806000B981600069811000358030000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000094E7A5006BF794005AEF840052EF7B004ADE6B009CEFAD00D6D6D600A5A5
      A5006B6B6B00217B290008940800089C080008A5100010A5180018A5180073C6
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDDDDD00E1E1E100F5F5F500F1F1
      F100B9B9B9000000000000000000CEDFF00080ADDB007CACDA00B8D1EA000000
      0000E9E9E900BDBDBD00EEEEEE00E1E1E100D1D1D100D5D5D500D9D9D900D8D7
      D600DDDDDD00DDDDDD00DDDDDD00E1E1E100DDDDDD00E1E1E100ABACAB007D7D
      7D00000000000000000000000000000000000000000040202000404040004040
      40004040400040202000002060000040A0000060C0004060E0004080E00040A0
      E00040A0E0000060A000408080000000000040A0C00040C0E00040C0E00040C0
      E00040C0E00040C0E00040C0E00040C0E00040C0E00040C0E00040A0E0000080
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000B8FCA0060C0E000A1FFFF007BFFFF007BFFFF007BF4FF007BF4
      FF006AEAFF001C98D4001C98D40023A1D4002AA1D4002AA1D40031ABD40031AB
      D40040ABE000036A06000698110003840B000358030000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042D66300109C18004ADE6B004ADE6B009CEFAD00D6D6D600A5A5
      A5006B6B6B00399C420021BD310018B5290018A518004AA52900B5C67B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8D7D600E5E5E500F9F9F900E9E9
      E900ADADAD00E5E5E500F1F1F100F8F6F300F5F4F300F5F5F500FFFCF900F9F9
      F900E1E1E100BDBDBD00F5F4F300D5D5D500A1A1A1009D9D9D00A1A1A100A1A1
      A100A1A1A100A5A5A500A5A5A500D5D5D500E1E1E100E4E2E0009D9D9D008C8C
      8C00000000000000000000000000000000000000000040404000404040004040
      40004040400040606000806060004040400000204000002060000020A0000040
      A0000020600000000000000000000000000040A0C00040C0E00040C0E00040A0
      E00040A0E00040C0E00040C0E00040C0E00040C0E00040C0E00040A0E0000080
      A000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000118FCA006ACAEA007BE0F4007BE0F40084EAFF008FF4
      FF0040C0E000068FCA0000000000000000000000000000000000000000000000
      00000358030003840B0006981100036A06000358030000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000042D6630039D65A004ADE6B009CEFAD00D6D6D600A5A5
      A5006B6B6B00399C420021B5310018B5290018A5180073AD4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1D1D100EEEEEE00F9F9F900F1F1
      F100CDCDCD00C6C6C600BDBDBD00B9B9B900B9B9B900C0BFBE00C1C1C100C1C1
      C100B7B8B900D1D1D100F1F1F100E9E9E900E9E9E900DDDDDD00DDDDDD00D9D9
      D900D1D1D100C9C9C900CDCDCD00DDDDDD00E1E1E100DDDDDD00959595009D9D
      9D000000000000000000000000000000000000000000C0DCC000402020004040
      4000406060008060600080808000A4A0A000A4A0A00080808000404040004040
      4000402020004040400000000000F0FBFF0080C0E0000080C0000080A0004080
      C00040A0C0004080C0004080C0004080C0004080C0004080C0004080A0000060
      800000000000F0FBFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000B8FCA00118FCA00118FCA001698CA001698
      CA00118FCA00000000000000000000000000000000000000000000000000036A
      060003840B00038F0B0003730600035803000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008CF7AD005AE77B004ADE6B00ADEFB500CECECE008C8C
      8C00636363005A944A0052BD4A0021B5290063C6630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CDCFD100F1F1F100F9F9F900F5F5
      F500FAFCFA00F9F9F900FAFCFA00F9F9F900F5F5F500EEEEEE00EEEEEE00E9E9
      E900E4E2E000EEEEEE00E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9
      E900E9E9E900E9E9E900EAE8E700E1E1E100E5E5E500D9D9D9008C8C8C00ABAC
      AB00000000000000000000000000000000000000000000000000000000004020
      200080606000808080008080800080808000A4A0A000A4A0A000808080004040
      40000000000000000000F0FBFF0000000000F0FBFF000080A00040A0C00040A0
      E00040A0E00080C0E00080C0E00080C0E00040A0C00040A0C0000080A0004080
      800000000000F0FBFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000358030003580300066A0B00037B0B00037B
      0B00037B0B000360060003580300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008CF7AD0042D66300E7EFDE00B5A58C00736B
      6300525252008CB54A0021B529007BCE7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CDCDCD00F9F9F900F9F9F900F9F9
      F900F5F5F500F5F5F500F5F5F500F5F4F300F5F4F300F1F1F100F1F1F100F1F1
      F100F1F1F100F5F4F300F1F1F100F1F1F100F1F1F100EEEEEE00EEEEEE00EEEE
      EE00E9E9E900E9E9E900E9E9E900E9E9E900EAE8E700D8D7D60086868600BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000402020008060600080808000A4A0A0008080800080808000404040004040
      400000000000F0FBFF0000000000000000000000000080A0C0004080C00080A0
      E00080C0E00080C0E00080C0E00080C0E00080A0E00040A0C0000080A0000000
      0000F0FBFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000358030003580600035803000358
      0300035803000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEAD84008473
      63005A5A5A00C6BDB50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1D1D10000000000FAFCFA00F9F9
      F900F9F9F900F9F9F900F5F5F500F5F5F500F5F5F500F5F4F300F1F1F100F1F1
      F100F1F1F100C9C9C900C0BFBE00C6C6C600C3C4C600C1C1C100C1C1C100C9C9
      C900CDCDCD00CDCDCD00C9C9C900C9C9C900CDCFD100C6C6C600B6B6B600EEEE
      EE00000000000000000000000000000000000000000000000000000000000000
      0000F0FBFF00808080004040400040606000406060004060600000000000F0FB
      FF00F0FBFF00000000000000000000000000000000000000000040A0C00040A0
      C00080C0E00080C0E00080C0E00080C0E00040A0E0004080A00000000000F0FB
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1D1D10000000000FAFCFA00F9F9
      F900FAFCFA00F9F9F900F5F5F500F5F5F500F5F5F500F5F5F500F5F4F300F5F5
      F500EEEEEE009D9D9D00B9B9B90000000000F5F5F500EEEEEE00EEEEEE00EEEE
      EE00F1F1F100EAE8E700DADCDE00DDDDDD00DDDDDD00DDDDDD00F1F1F1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000080A0
      C00040A0C00040A0C00040A0C0004080C00040A0C000C0DCC000F0FBFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1D1D100FAFCFA00000000000000
      0000FAFCFA00F9F9F900F9F9F900F9F9F900F5F5F500F5F5F500F5F5F500F9F9
      F900E1E1E10092929200F5F5F500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E5E500D9D9D900F9F9F900FAFC
      FA00FAFCFA00000000000000000000000000000000000000000000000000EEEE
      EE00ADADAD00E5E5E50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E1E1E100D1D1D100CDCD
      CD00CDCFD100D1D1D100D1D1D100D1D1D100CDCFD100CDCDCD00CDCDCD00CDCF
      D100F1F1F1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00636363006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00636363006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006B7373006B7373006B73730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD7B7B00B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B8484005A8484006BA5B5004252
      5200737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B8484005A8484006BA5B5004252
      5200737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B7373008C736300BD8C5200A5632100734A2900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD7B7B00EFDEC600F7E7C600F7DEBD00F7DE
      B500F7D6B500F7D6AD00F7D6A500EFCE9C00EFCE9C00EFCE9400EFCE9400EFCE
      9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400B58C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B6B0084E7FF007BDEFF004A7B
      8C005A5A5A008C8C8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B6B0084E7FF007BDEFF004A7B
      8C005A5A5A008C8C8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B635A009C846300EFA56300D67B2100A55A2900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD7B7B00EFDEC600F7E7CE00F7DEC600F7DE
      BD00F7D6B500F7D6AD00F7D6AD00EFCEA500EFCE9C00EFCE9C00EFCE9400EFCE
      9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400B58C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C8C8C005A5A5A007B7B7B00000000000000
      0000000000000000000000000000000000007B7B7B0063B5DE0063C6FF004A9C
      C600424242007373730084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C8C8C005A5A5A007B7B7B00000000000000
      0000000000000000000000000000000000007B7B7B0063B5DE0063C6FF004A9C
      C600424242007373730084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B635A009C846300EFA55A00D6731800A55A2900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD7B7B00F7DECE00F7E7CE00F7DEC600F7DE
      C600F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCEA500EFCE9C00EFCE9C00EFCE
      9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400B58C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000637373005A8C8C005A8C8C004A4A4A00949494000000
      00000000000000000000000000000000000094949400426B840042A5DE00298C
      C600424A4A007B5A5A0094636300735A5A007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000637373005A8C8C005A8C8C004A4A4A00949494000000
      00000000000000000000000000000000000094949400426B840042A5DE00298C
      C600424A4A007B5A5A0094636300735A5A007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005A5252005A5252005A5252005A5252000000
      0000000000006B635A009C846300EF9C5200D6731800945A2900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD7B7B00F7E7CE00F7E7D600F7E7CE00F7DE
      C600F7DEBD00F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCEA500EFCE9C00EFCE
      9C00EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400B58C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006BADBD0084E7FF0073C6DE00393939006B6B6B000000
      000000000000000000000000000094949400736B6B00314242001884B500107B
      AD004A6B84009C636300BD7B7B008C6363006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006BADBD0084E7FF0073C6DE00393939006B6B6B000000
      000000000000000000000000000094949400736B6B00314242001884B500107B
      AD004A6B84009C636300BD7B7B008C6363006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400A594A5009C9C9C00A5A5A500848484005A52
      520000000000736B6300A58C7300E7944A00D67318008C523100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD7B7B00F7E7D600F7EFDE00F7E7D600F7E7
      CE00F7DEC600F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCEA500EFCE
      9C00EFCE9C00EFCE9400EFCE9400EFCE9400EFCE9400B58C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005284940063C6FF0063C6FF0039424A00525252007B7B
      7B00848484007B6B6B00846363009C6B6B00CE8484004239390052A5BD0073DE
      FF006B94A5009C636300D6848400BD7B7B00635252008C8C8C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005284940063C6FF0063C6FF0039424A00525252007B7B
      7B00848484007B6B6B00846363009C6B6B00CE8484004239390052A5BD0073DE
      FF006B94A5009C636300D6848400BD7B7B00635252008C8C8C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600B5B5B500BDBDBD00BDBDBD00B5B5B500A5A5
      A5005A525200736B6300A58C7300E7944200D67318008C523100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD847B00F7E7DE00F7EFDE00F7E7D600F7E7
      CE00F7E7CE00F7DEC600F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCE
      A500EFCE9C00EFCE9C00EFCE9400EFCE9400EFCE9400B58C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000637B840042A5DE0042A5DE00315A730052424200845A
      5A009C636300C67B7B00E78C8C00E78C8C00E78C8C007B525200639CA50084E7
      FF007BB5C6009C636300E78C8C00CE8484007B5A5A006B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000637B840042A5DE0042A5DE00315A730052424200845A
      5A009C636300C67B7B00E78C8C00E78C8C00E78C8C007B525200639CA50084E7
      FF007BB5C6009C636300E78C8C000021B5000031DE006B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400848484008484840084848400BDADBD00C6C6C600BDBD
      BD00BDBDBD00736B6300CE9C6B00DE8C3900D67318008C5A39005A5252005A52
      52005A5252005A5252005A5252005A5252005A52520063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD847B00F7EFE700F7EFE700292921005A52
      42005A5242005A5242005A5242005A524200F7DEBD00F7D6B500F7D6AD00F7D6
      AD00EFCEA500EFCE9C00EFCE9C00EFCE9400EFCE9400B58C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000635A5A0018739C00107BAD00296B8C00634A4A009C63
      6300AD737300DE8C8C00DE8C8C00DE8C8C00DE8C8C00A56B6B005273730094F7
      FF007BC6CE00A56B6B00DE8C8C00DE8C8C00A56B6B00635A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000635A5A0018739C00107BAD00296B8C000021B5000021
      B500AD737300DE8C8C00DE8C8C00DE8C8C00DE8C8C00A56B6B005273730094F7
      FF007BC6CE00A56B6B000021B5000031DE00A56B6B00635A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300BDBDBD00BDBD
      BD00A5A5A500736B6300CE9C6B00DE8C3900D673210084523900948C84009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C00949494008C7B8C005A5252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B58C7B00F7EFE700FFF7EF0018181800DECE
      CE008494EF000842FF00394AAD00524A4200F7DEBD00F7DEBD00F7D6B500F7D6
      AD00F7D6AD00EFCEA500EFCE9C00EFCE9C00EFCE9400B58C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5737300A56B6B003973840063CEF70073CEF7004A4A4A009C63
      6300AD737300D6848400D6848400D6848400D6848400D68484004A525200B5E7
      E700B5E7E700A56B6B00D6848400D6848400B5737300735A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5737300A56B6B003973840063CEF70073CEF7005273FF000031
      DE000021B500D6848400D6848400D6848400D6848400D68484004A525200B5E7
      E700B5E7E7000021B5000031DE00D6848400B5737300735A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300B5B5B500C6C6
      C600ADADAD00736B6300CE9C6300DE8C3900D6732100734A3900A59C9400B5B5
      B500ADADAD00B5B5B500ADADAD00B5B5B500ADADAD00A594A5005A5252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B58C8400F7EFEF00FFF7EF00292929007384
      D6004263F700A5ADE7001039E7004A424A00F7DEC600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6AD00EFCEA500EFCE9C00EFCE9400B58C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD7B7B00CE848400735A5A007BDEF70084E7FF00527B84009463
      6300AD737300CE848400CE848400CE848400CE848400CE8484006B525200D694
      9400DE9C9C00B5737300CE848400CE8C8C00BD84840084636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD7B7B00CE848400735A5A007BDEF70084E7FF005273FF000031
      DE000031DE000021B500CE848400CE848400CE848400CE8484006B525200D694
      94000021B5000031DE00CE848400CE8C8C00BD84840084636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00636363006363630063636300C6C6C600C6C6C600BDBD
      BD00BDBDBD007B736300DEA56B00DE843100D6732100734A3900848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD8C8400F7F7F700FFFFF700181818009494
      B500C6C6CE00DECECE004A63CE00214AD600F7DECE00F7DEC600F7DEC600F7DE
      BD00F7D6B500F7D6AD00F7D6AD00EFCEA500EFCE9C00B58C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD737300BD7B7B00AD73730063949C0094F7FF0084D6DE007352
      5200B5737300BD7B7B00BD7B7B00BD7B7B00BD7B7B00BD7B7B00AD737300CE84
      8400CE949400D6A5A500D6A5A500CE9C9C00C68C8C007B636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD737300BD7B7B00AD73730063949C0094F7FF0084D6DE005273
      FF005273FF000031DE000021B500BD7B7B00BD7B7B00BD7B7B000021B5000021
      B5000031DE00D6A5A500D6A5A500CE9C9C00C68C8C007B636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00D6D6D600DEDEDE00DEDEDE00C6C6C600C6C6C600A5A5
      A5005A5252007B6B5A00D6A57300DE842900DE732900734A4200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD948400F7F7F700FFFFFF00424242004242
      4200424242004242390042424A001842D600738CEF0084848400F7DEC600F7DE
      BD00F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCEA500B58C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A56B6B00B5737300B57373006B5A5A00A5DEDE00B5E7E7006B5A
      5A00AD737300B5737300B5737300BD7B7B00CE8C8C00D6A5A500E7B5B500E7B5
      B500E7ADAD00DEADAD00DEA5A500D6A5A500BD8C8C007B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A56B6B00B5737300B57373006B5A5A00A5DEDE00B5E7E7006B5A
      5A00AD7373005273FF000031DE000021B500CE8C8C000021B5000031DE000031
      DE00E7ADAD00DEADAD00DEA5A500D6A5A500BD8C8C007B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00A5A5A500B5B5B500B5B5B500A5A5A5008484
      84000000000063635A00D6A57300D67B2100DE7331007B5A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6948400F7F7F700FFFFFF00F7F7F700F7EF
      EF00F7EFE700F7EFE700F7E7DE00DED6D600426BF7004A6BEF009CA5DE00F7DE
      C600F7DEBD00F7DEBD00F7D6B500F7D6AD00EFCEA500B58C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C6B6B00AD737300AD7373009C6B6B009C737300CE8C8C00946B
      6B00B57B7B00CE949400E7ADAD00F7C6C600F7C6C600EFBDBD00E7A5A500D68C
      8C00D67B7B00E79C9C00DEADAD00DEA5A500B57B7B008C848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C6B6B00AD737300AD7373009C6B6B009C737300CE8C8C00946B
      6B00B57B7B00CE9494005273FF000031E7000031E7000031E7000031DE00D68C
      8C00D67B7B00E79C9C00DEADAD00DEA5A500B57B7B008C848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C009C9C9C0084848400848484000000
      0000000000007B736B00F7BD7B00D67B2100CE73310084635A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C69C8400F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7EF00F7EFE700F7EFE700F7E7DE0094A5EF00637BEF00F7E7
      CE00F7DEC600F7DEBD00F7DEBD00F7D6B500F7D6AD00B58C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD7373009C6B6B00A56B6B00A56B6B00B5848400CE9C9C00EFC6
      C600FFD6D600FFCECE00F7C6C600E7ADAD00D6949400DE9C9C00E7ADAD00F7C6
      C600F7C6C600EFB5B500E7ADAD00D6A5A500946B6B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD7373009C6B6B00A56B6B00A56B6B00B5848400CE9C9C00EFC6
      C600FFD6D600FFCECE00F7C6C6000031E7000031E7000021B500E7ADAD00F7C6
      C600F7C6C600EFB5B500E7ADAD00D6A5A500946B6B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B635200F7BD7B00D6731800CE733900846B6300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C69C8400F7F7F700FFFFFF00848484008484
      840084848400848484008484840084848400F7EFE700F7EFDE00F7E7D600F7E7
      CE00F7E7CE00F7DEC600F7DEBD00F7DEBD00DEC6A5009C847B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B57B7B00A57B7B00D6BDBD00F7DEDE00FFEFEF00FFE7E700EFCE
      CE00DEB5B500D6A5A500DEB5B500EFC6C600FFDEDE00FFD6D600EFBDBD00DE9C
      9C00E7949400EFB5B500E7B5B500BD848400A594940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B57B7B00A57B7B00D6BDBD00F7DEDE00FFEFEF00FFE7E700EFCE
      CE00DEB5B500D6A5A5000021B5000031EF000031E7000031EF000021B500DE9C
      9C00E7949400EFB5B500E7B5B500BD848400A594940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063524200A57B5A007B5A4200A5634200846B6300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CE9C8C00FFF7F700FFFFFF00080808008C8C
      8C00ADB5B500848CAD005A637B0042424200F7EFE700F7EFE700F7EFDE00F7E7
      D600F7E7CE00F7E7CE00EFD6BD00CEBDAD00B5AD94009C847B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C67B7B00A57B7B00F7EFEF00FFF7F700FFEFEF00FFFFFF00F7E7
      E700F7E7E700FFEFEF00FFE7E700EFC6C600DEA5A500E7ADAD00EFBDBD00F7CE
      CE00F7C6C600EFBDBD00CE9C9C009C8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C67B7B00A57B7B00F7EFEF00FFF7F700FFEFEF00FFFFFF00F7E7
      E700F7E7E7000021B5000031EF000031E700DEA5A500E7ADAD000031F7000021
      B500F7C6C600EFBDBD00CE9C9C009C8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A525200A5A5A500ADADAD006B6B6B005A525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEA58C00FFF7F700FFFFFF0018181800EFEF
      EF00CED6F700295AFF00526BBD005A5A5A00F7F7EF00F7EFE700F7EFE700F7EF
      DE00F7EFDE00E7DECE00CEBDAD00BDB5A500B5AD9C009C847B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5737300BD9C9C00FFFFFF00FFF7F700FFF7F700FFF7
      F700FFE7E700E7C6C600E7C6C600F7DEDE00FFE7E700FFD6D600FFCECE00F7C6
      C600F7C6C600C6949400A58C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5737300BD9C9C00FFFFFF00FFF7F700FFF7F700FFF7
      F7000021B5000031EF000031F700F7DEDE00FFE7E700FFD6D600FFCECE000031
      FF000021B500C6949400A58C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C004A636B000000
      0000000000005A525200848484006B6B6B005A5252005A525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6A58C00FFF7F700FFFFFF00292929007B94
      DE003163FF00849CFF001039E7004A4A5200FFF7F700FFF7EF00FFF7E700EFDE
      D600B5847300AD847300AD7B7300AD7B7300AD7B7300AD847300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B56B6B00B58C8C00F7E7E700FFF7F700FFEF
      EF00FFFFFF00FFF7F700FFE7E700FFDEDE00FFD6D600FFCECE00FFCECE00E7AD
      AD00A57B7B00B5A5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B56B6B00B58C8C00F7E7E700FFF7F7000021
      B5000031F7000031FF00FFE7E700FFDEDE00FFD6D600FFCECE00FFCECE00E7AD
      AD000031F7000031F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C00F7F7F700BDADAD00AD8C
      8C005A5252005A525200A5A5A500B5B5B500B5B5B5005A525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEAD8C00FFF7F700FFFFFF00181818009CA5
      C600CED6EF00FFFFFF004A6BE700314AC600FFFFF700FFF7F700FFF7EF00E7CE
      C600B5847300E7B58400E7AD6B00EFA55200EFA53900B5848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDA5A5009C737300BD9C9C00E7D6
      D600FFEFEF00FFEFEF00FFE7E700F7DEDE00E7BDBD00C6949400B58C8C008C7B
      7B00736B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDA5A5009C7373000021B5000031
      F7000031F700FFEFEF00FFE7E700F7DEDE00E7BDBD00C6949400B58C8C008C7B
      7B00736B6B00000000000031F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000527B8400D6D6D600DEDEDE0063636300AD9C
      9C00847B7B005A52520094949400BDBDBD00C6C6C600C6C6C6005A5252000000
      000000000000000000005A5252006B7373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEAD8C00FFF7F700FFFFFF00292929004242
      42004242420042424200313952001039E7009CB5FF00FFFFFF00FFFFF700E7CE
      C600B5847300EFC68C00F7BD6B00FFB55200B584840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDA5A500C6AD
      AD00BD9C9C00AD848400B58C8C00BDA5A500BDA5A500B5ADAD00FFFFFF009C9C
      9C006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000021B5000031F7000031
      F700BD9C9C00AD848400B58C8C00BDA5A500BDA5A500B5ADAD00FFFFFF009C9C
      9C006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000063636300BDBDBD00BDBDBD0063636300BDBD
      BD009C9C9C006B6B6B0084848400B5B5B500BDBDBD00C6C6C600B5B5B5005A52
      52005A5252005A5252005A5252006B7373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEAD8C00FFF7F700FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00CED6EF003163FF006B8CFF00C6CEFF00E7D6
      CE00B5847300EFC68C00F7BD6B00B58484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00FFFFFF009C9C
      9C00636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005273FF000031F7000000
      000000000000000000000000000000000000000000009C9C9C00FFFFFF009C9C
      9C00636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000527B8400B5B5B500B5B5B50063636300F7F7
      F700A5A5A5006B6B6B0094949400A5A5A500ADADAD00B5B5B500C6C6C600C6C6
      C600BDBDBD00B5B5B5009C9C9C006B7373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEAD8C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFFF006B8CFF00426BFF00E7D6
      D600B5847300EFC68C00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00FFFFFF009C9C
      9C00737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00FFFFFF009C9C
      9C00737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000063636300B5B5B500636363009C9C9C008C8C
      8C006B6B6B00A5A5A500DEDEDE00CECECE00CECECE00BDBDBD00BDBDBD00ADAD
      AD00949C9C006B7373006B737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEAD8C00E7CEBD00EFD6BD00EFD6BD00EFCE
      C600E7CEBD00E7CEBD00E7CEBD00E7CEBD00DEC6BD00DEC6BD00DEC6BD00CEAD
      A500B5847300B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500FFFFFF009C9C
      9C00737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500FFFFFF009C9C
      9C00737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630063636300847B7B00BDBD
      BD00847B7B0084848400848484008484840084848400848484007B7B7B007373
      73005A6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEA58400D6A58400D6A58400D6A58400D6A5
      8400D69C7B00CE9C7B00CE947B00C6947B00C6947B00C68C7B00BD8C7300B584
      7300B58484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000A00000000100010000000000000A00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFF9FFFFFFFC07FFFFFFFFFFFFFFFC1F
      FFE07FFFFFE001FFFFFFFFFFFFFFF007FF801FFFFFC0007FFFFFFFFFFFFFC003
      FE0007FF80000001FFFFFFFFFFFF0001F80001FF00000000FFFFFFFFFFFC0001
      E000007F00000000FFFFFFFFF00000038000001F00000000FFFFFFCFC0000007
      00000007000000007FFFFF87C000001F00000001000000003FFFE007C000003F
      80000000000000001FFFC041C000003F800000000000000007FF8040C000003F
      C00000000000000083FF00408000003FC000000000000000C0FE00408000003F
      E00000000000000000002A408000003FE00000000000000000002A408000003F
      F00000000000000000002A408000003FF80000010000000000002A408000003F
      FC0000070000000004002A408000003FFC00000F0000000010402A408000003F
      FC00003F0000000000812A408000003FFCC000FF00000000827EAA408000003F
      FFC003FF0000000009FF40408000003FFFCC0FFF0000000027FF8041800000FF
      FFFC3FFF000000001FFFC047800000FFFFFCFFFF000000003FFFFF6F800001FF
      FFFFFFFF00000001FFFFFF9F800001FFFFFFFFFF00000003FFFFFFFF800007FF
      FFFFFFFF80007FFFFFFFFFFF80031FFFFFFFFFFFC000FFFFFFFFFFFF800FFFFF
      FFFFFFFFE001FFFFFFFFFFFF803FFFFFFFFFFFFFF003FFFFFFFFFFFFE0FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FE00003FFFFFFFFFFFFFFFFFFFFFFFFFFC00001FFFFFFFFFFFFFFFFFFFFFFFFF
      FC00001FFFFFFFFFFFFFFFFFFFFFFFFFFC00001FFFFFFFFFFFFFFFFFFFFFF9FF
      FC00001FFFFC7FFFFF8001FFFFFFF9FFFC00001FFFFA1FFFFF8001FFFFFFFEFF
      FC00001FFFF607FFFF80F9FFFFF27EFFFC00001FFFEE01FFFF80F9FFFFE8B8FF
      FC00001FFFDE01FFFF8001FFFFF751FFFC00001FFFBE81FFFF8001FFFFC7B9FF
      FC00001FFF7C21FFFF80F9FFFFF7C7FFFC00001FFF7C09FFFF80F9FFFFD3FFFF
      FC00001FFF7601FFFF8001FFFFA1FFFFFC00001FFF6483FFFF80F9FFFF40FFFF
      FC00001FFF6427FFFF80F9FFFF7CFFFFFC00001FFFF10FFFFF8001FFFF7CFFFF
      FC00001FFFE44FFFFF8001FFFF00FFFFFC00001FFFE51FFFFF8001FFFFC1FFFF
      FC00001FFFFF7FFFFFFFFFFFFF81FFFFFC00001FFFFFFFFFFFFFFFFFFFFFFFFF
      FC00001FFFFFFFFFFFFFFFFFFFFFFFFFFE00003FFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC03FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF801FFFFFFFFFFFFFFFFFFFFFFFFFFFFF001FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000FE003FFFFFFFFFFFFFFFFFFFFE03F000FFFFFFFFFFFFFFFFF
      FFFF8FFFC001000FFFFFFFF9FFFFFFFFFFF98CFFC000000F8000FFFFF807FFFF
      FFF0007FC000000780000006F8003FFFFFF0007FC000000380000006F80001FF
      FFF0003F8000000380000006F80001FFFFE0001F8000000380000807F80000FF
      FFE0001F80000003C0001807F80000FFFFE0001F80000003E0001C05F800007F
      FFE0001F80000001D0001C0BF800007FFFE0001F80000001B0000017F800007F
      FCE0007F8200000040030037F800003FF80000FF8000000000038037F800003F
      F80000FF000000008001801BF800001FF80007FF000000008001001BF800000F
      F0000FFF000000008001000BF800000FF0000FFF000000018001000FF800007F
      F0000FFF0000000F8001000FF800007FF0000FFF0610000F8001000FF800007F
      F8001FFF0000000F8003000FFC03F07FFC003FFF0000000F8002000BFE07E0FF
      FC007FFF0000000FE005000BFFFE01FFFE00FFFF0000000FF00B8017FFFF07FF
      FFC3FFFF4000000FF027C02FFFFFFFFFFFFFFFFF4001001FFFFFE01FFFFFFFFF
      FFFFFFFF3001FFFFFFFFFFFFFFFFFFFFFFFFFFFF07E3FFFFFFFFFFFFFFFFFFFF
      FFFFFFFF8007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF8FFFFFFC7FFFFE00003F
      FFFF07FFFFFF07FFFFF83FFFFE00003FFFFF03FFFFFF03FFFFF83FFFFE00003F
      FE3F00FFFE3F00FFFFF83FFFFE00003FFC1F007FFC1F007FFE183FFFFE00003F
      FC1E007FFC1E007FFC083FFFFE00003FFC00003FFC00003FF8003FFFFE00003F
      FC00003FFC00003FF800003FFE00003FFC00003FFC00003FFF80001FFE00003F
      F800003FF800003FFF80001FFE00003FF800003FF800003FF800003FFE00003F
      F800003FF800003FF8003FFFFE00003FF800003FF800003FFC083FFFFE00003F
      F800003FF800003FFE183FFFFE00003FF800007FF800007FFFF83FFFFE00003F
      F800007FF800007FFFF83FFFFE00003FF80000FFF80000FFFFF83FFFFE00003F
      FC0001FFFC0001FFFF983FFFFE00003FFE0003FFFE0003FFFF003FFFFE00003F
      FF0007FFFF0005FFFE001CFFFE00007FFFC007FFFF8007FFFE0000FFFE0000FF
      FFFF87FFFF9F87FFFE0000FFFE0001FFFFFF87FFFFFF87FFFE0001FFFE0003FF
      FFFF87FFFFFF87FFFF0007FFFE0007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 12
    Top = 99
    object Action_RegMCU: TAction
      Caption = 'MCU '#49444#51221
      ImageIndex = 0
      OnExecute = Action_RegMCUExecute
    end
    object Action_RegECU: TAction
      Caption = 'ECU '#49444#51221
      ImageIndex = 3
      OnExecute = Action_RegECUExecute
    end
    object Action_Connect: TAction
      Caption = #53685#49888#50672#44208
      ImageIndex = 11
      OnExecute = Action_ConnectExecute
    end
    object Action_Disconnect: TAction
      Caption = #53685#49888#45130#44592
      ImageIndex = 12
      OnExecute = Action_DisconnectExecute
    end
    object Action_FileLoad: TAction
      Caption = #54028#51068' '#51069#44592
      OnExecute = Action_FileLoadExecute
    end
    object ActionFIleSave: TAction
      Caption = #54028#51068' '#51200#51109
      OnExecute = ActionFIleSaveExecute
    end
    object Action_SetComport: TAction
      Caption = #53685#49888#54252#53944' '#49444#51221
    end
  end
  object TB_DEVICE: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'DEVICE_ID'
        DataType = ftString
        Size = 7
        DefaultValue = '0000000'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ECU_ID'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SYSTEM_ID'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Linkus_Tel'
        DataType = ftString
        Size = 12
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Ring_Cnt'
        DataType = ftString
        Size = 2
        DefaultValue = '9'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_IP'
        DataType = ftString
        Size = 24
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_SUBNET'
        DataType = ftString
        Size = 24
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_GATE'
        DataType = ftString
        Size = 24
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_PORT'
        DataType = ftString
        Size = 5
        DefaultValue = '3000'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Server_IP'
        DataType = ftString
        Size = 26
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'WATCH_POWER'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OUT_DELAY'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IN_DELAY'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_TYPE1'
        DataType = ftString
        Size = 2
        DefaultValue = '2'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_TYPE2'
        DataType = ftString
        Size = 2
        DefaultValue = '2'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LOCATE'
        DataType = ftString
        Size = 50
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARD_TYPE1'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARD_TYPE2'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOORMODE_TYPE1'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOORMODE_TYPE2'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_OPEN1'
        DataType = ftString
        Size = 2
        DefaultValue = '3'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_OPEN2'
        DataType = ftString
        Size = 2
        DefaultValue = '3'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OPEN_MONI1'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OPEN_MONI2'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'USE_SCH1'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'USE_SCH2'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_STATUS1'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_STATUS2'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM_LONG1'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM_LONG2'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CONTROL_FIRE1'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CONTROL_FIRE2'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LOCK_TYPE1'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LOCK_TYPE2'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER1_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER1_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER1_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER2_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER2_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER2_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER3_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER3_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER3_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER4_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER4_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER4_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER5_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER5_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER5_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER6_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER6_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER6_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER7_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER7_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER7_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER8_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER8_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER8_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT1_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = '0.'#48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT1_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT1_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT1_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT2_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = '0.'#48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT2_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT2_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT2_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT3_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = '0.'#48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT3_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT3_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT3_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT4_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = '0.'#48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT4_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT4_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT4_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT5_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = '0.'#48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT5_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT5_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT5_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT6_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = '0.'#48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT6_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT6_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT6_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT7_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = '0.'#48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT7_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT7_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT7_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT8_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = '3.'#48708#49345
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT8_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT8_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT8_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Mode'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADER_TYPE'
        DataType = ftString
        Size = 1
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER1_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER2_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER3_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER4_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER5_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER6_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER7_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER8_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DialTimeOn'
        DataType = ftString
        Size = 10
        DefaultValue = '200'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DialTimeOff'
        DataType = ftString
        Size = 10
        DefaultValue = '200'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_DEVICEDBISA1'
        Fields = 'ECU_ID'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_DEVICE'
    StoreDefs = True
    Left = 17
    Top = 192
  end
  object TB_CARD: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'CARDNO'
        DataType = ftString
        Size = 10
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PERMIT'
        DataType = ftString
        Size = 1
        DefaultValue = 'Y'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR1'
        DataType = ftString
        Size = 1
        DefaultValue = 'Y'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR2'
        DataType = ftString
        Size = 1
        DefaultValue = 'Y'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM'
        DataType = ftString
        Size = 1
        DefaultValue = 'Y'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'VALIDDATE'
        DataType = ftString
        Size = 6
        DefaultValue = '000000'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDPERMIT'
        DataType = ftString
        Size = 1
        DefaultValue = '2'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TIMEPATTERN'
        DataType = ftString
        Size = 1
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RCVACK'
        DataType = ftString
        Size = 1
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_CARDDBISA1'
        Fields = 'CARDNO'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_CARD'
    StoreDefs = True
    Left = 17
    Top = 224
  end
  object CommPort: TApdComPort
    Baud = 38400
    TraceName = 'zReg.TRC'
    TraceAllHex = True
    LogName = 'zRegT.LOG'
    OnPortClose = CommPortPortClose
    OnPortOpen = CommPortPortOpen
    OnTriggerAvail = CommPortTriggerAvail
    Left = 17
    Top = 256
  end
  object Timer_ENQ: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer_ENQTimer
    Left = 17
    Top = 288
  end
  object ApdSLController: TApdSLController
    ComPort = CommPort
    Lights.TXDLight = StatusLight_TX
    Lights.RXDLight = StatusLight_RX
    Left = 49
    Top = 256
  end
  object SendTimer: TTimer
    Enabled = False
    Interval = 300
    OnTimer = SendTimerTimer
    Left = 41
    Top = 287
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'TXT'
    Left = 12
    Top = 324
  end
  object SaveDialog1: TSaveDialog
    Left = 36
    Top = 324
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 64
    Top = 168
    Bitmap = {
      494C01010D000E00040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000008000000001002000000000000000
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00636363006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B8484005A8484006BA5B5004252
      5200737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B6B0084E7FF007BDEFF004A7B
      8C005A5A5A008C8C8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C8C8C005A5A5A007B7B7B00000000000000
      0000000000000000000000000000000000007B7B7B0063B5DE0063C6FF004A9C
      C600424242007373730084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000637373005A8C8C005A8C8C004A4A4A00949494000000
      00000000000000000000000000000000000094949400426B840042A5DE00298C
      C600424A4A007B5A5A0094636300735A5A007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006BADBD0084E7FF0073C6DE00393939006B6B6B000000
      000000000000000000000000000094949400736B6B00314242001884B500107B
      AD004A6B84009C636300BD7B7B008C6363006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005284940063C6FF0063C6FF0039424A00525252007B7B
      7B00848484007B6B6B00846363009C6B6B00CE8484004239390052A5BD0073DE
      FF006B94A5009C636300D6848400BD7B7B00635252008C8C8C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000637B840042A5DE0042A5DE00315A730052424200845A
      5A009C636300C67B7B00E78C8C00E78C8C00E78C8C007B525200639CA50084E7
      FF007BB5C6009C636300E78C8C000021B5000031DE006B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000635A5A0018739C00107BAD00296B8C000021B5000021
      B500AD737300DE8C8C00DE8C8C00DE8C8C00DE8C8C00A56B6B005273730094F7
      FF007BC6CE00A56B6B000021B5000031DE00A56B6B00635A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5737300A56B6B003973840063CEF70073CEF7005273FF000031
      DE000021B500D6848400D6848400D6848400D6848400D68484004A525200B5E7
      E700B5E7E7000021B5000031DE00D6848400B5737300735A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD7B7B00CE848400735A5A007BDEF70084E7FF005273FF000031
      DE000031DE000021B500CE848400CE848400CE848400CE8484006B525200D694
      94000021B5000031DE00CE848400CE8C8C00BD84840084636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD737300BD7B7B00AD73730063949C0094F7FF0084D6DE005273
      FF005273FF000031DE000021B500BD7B7B00BD7B7B00BD7B7B000021B5000021
      B5000031DE00D6A5A500D6A5A500CE9C9C00C68C8C007B636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A56B6B00B5737300B57373006B5A5A00A5DEDE00B5E7E7006B5A
      5A00AD7373005273FF000031DE000021B500CE8C8C000021B5000031DE000031
      DE00E7ADAD00DEADAD00DEA5A500D6A5A500BD8C8C007B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C6B6B00AD737300AD7373009C6B6B009C737300CE8C8C00946B
      6B00B57B7B00CE9494005273FF000031E7000031E7000031E7000031DE00D68C
      8C00D67B7B00E79C9C00DEADAD00DEA5A500B57B7B008C848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD7373009C6B6B00A56B6B00A56B6B00B5848400CE9C9C00EFC6
      C600FFD6D600FFCECE00F7C6C6000031E7000031E7000021B500E7ADAD00F7C6
      C600F7C6C600EFB5B500E7ADAD00D6A5A500946B6B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B57B7B00A57B7B00D6BDBD00F7DEDE00FFEFEF00FFE7E700EFCE
      CE00DEB5B500D6A5A5000021B5000031EF000031E7000031EF000021B500DE9C
      9C00E7949400EFB5B500E7B5B500BD848400A594940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C67B7B00A57B7B00F7EFEF00FFF7F700FFEFEF00FFFFFF00F7E7
      E700F7E7E7000021B5000031EF000031E700DEA5A500E7ADAD000031F7000021
      B500F7C6C600EFBDBD00CE9C9C009C8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5737300BD9C9C00FFFFFF00FFF7F700FFF7F700FFF7
      F7000021B5000031EF000031F700F7DEDE00FFE7E700FFD6D600FFCECE000031
      FF000021B500C6949400A58C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B56B6B00B58C8C00F7E7E700FFF7F7000021
      B5000031F7000031FF00FFE7E700FFDEDE00FFD6D600FFCECE00FFCECE00E7AD
      AD000031F7000031F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDA5A5009C7373000021B5000031
      F7000031F700FFEFEF00FFE7E700F7DEDE00E7BDBD00C6949400B58C8C008C7B
      7B00736B6B00000000000031F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000021B5000031F7000031
      F700BD9C9C00AD848400B58C8C00BDA5A500BDA5A500B5ADAD00FFFFFF009C9C
      9C006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005273FF000031F7000000
      000000000000000000000000000000000000000000009C9C9C00FFFFFF009C9C
      9C00636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00FFFFFF009C9C
      9C00737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500FFFFFF009C9C
      9C00737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002222
      2200222222002222220022222200222222002222220022222200222222002222
      2200222222002222220022222200222222000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C00080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF660000000000002222
      2200DDDDDD00A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0
      A000A4A0A000A4A0A000A4A0A000222222000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000039393D0031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CCFFFF0099FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FF660000FF660000FF6600002222
      2200DDDDDD0033FFCC00A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0
      A0000000000000000000A4A0A000222222000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094B5DE00182D3A000008140026271D001018
      2200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000099FFFF0066FFFF0000000000000000000000
      0000000000000000000000000000FF660000FF660000FF660000FF6600002222
      2200DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
      DD00DDDDDD00DDDDDD00DDDDDD00222222000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094B5DE0026487D00000C5700091C390000043A003131
      31002C2D2D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066FFFF0066FFFF000000
      0000000000000000000000000000FF660000FF660000FF660000FF6600002222
      2200222222002222220022222200222222002222220022222200222222002222
      2200222222002222220022222200222222000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094B5DE005F8DB90008226300101822000F130B0000043A001018
      2200252929001018220000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00636363006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000033FF
      FF0033FFFF0033FFFF0000000000000000000000000000000000FF660000FF66
      0000FF660000FF66000022222200DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
      DD00222222000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009CADB50094B5DE0008226300101822008E918E00B5BDB50039393D000004
      3A00000814003131310031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B8484005A8484006BA5B5004252
      5200737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C00080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000033FFFF0033FFFF0033FFFF000000000000000000FF660000FF6600002222
      2200222222002222220022222200222222002222220022222200222222002222
      2200222222002222220022222200222222000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005E63
      630094B5DE0026487D00000C57008C8C8C00DED6D600D2D6D200C6C6C6003736
      32000000140000043A003131310026271D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B6B0084E7FF007BDEFF004A7B
      8C005A5A5A008C8C8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000033FF
      FF0033FFFF0033FFFF000000000000000000FF660000FF660000FF6600002222
      2200DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
      DD00DDDDDD00DDDDDD00DDDDDD00222222000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000094B5
      DE003C5D7F00182D3A0042464200CEC6C600DED6D600D2D6D200D2CECE00B5BD
      B50058574F000008140000043A00313131003131310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C8C8C005A5A5A007B7B7B00000000000000
      0000000000000000000000000000000000007B7B7B0063B5DE0063C6FF004A9C
      C600424242007373730084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000808080008080
      8000808080008080800000000000000000000000000000000000808080008080
      8000808080008080800080808000FF000000FF000000C0C0C000C0C0C000FFFF
      FF00FFFFFF00FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000033FFFF0033FFFF0033FF
      FF0033FFFF000000000000000000FF660000FF660000FF660000FF6600002222
      2200A4A0A00000000000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC
      0000FFFFFF00FFCC0000DDDDDD00222222000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094B5DE005F8D
      B90008226300182D3A00D2CECE00DED6D600D2D6D200BDC6BD00B5B5B500B5BD
      B500B5B5B5005E63630000081400101822003131310010182200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000637373005A8C8C005A8C8C004A4A4A00949494000000
      00000000000000000000000000000000000094949400426B840042A5DE00298C
      C600424A4A007B5A5A0094636300735A5A007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000808080008080
      8000000000000000000000000000808080008080800080808000808080008080
      800080808000FF000000FF000000C0C0C000000000000000000000000000C0C0
      C000FFFFFF00FF00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000033FFFF0033FFFF0033FFFF0033FF
      FF0000000000000000000000000000000000FF660000FF660000FF6600002222
      2200A4A0A00000000000FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFF
      FF00FFCC0000FFFFFF00DDDDDD00222222000000000000000000000000000000
      000000000000000000000000000000000000000000009CADB50094B5DE002648
      7D00091C39009C9C9C00DEE7DE00DED6D600D2CECE00ADB5AD004B5250005857
      4F0058574F006A6E63004A48460000081400000814002C2D2D00313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006BADBD0084E7FF0073C6DE00393939006B6B6B000000
      000000000000000000000000000094949400736B6B00314242001884B500107B
      AD004A6B84009C636300BD7B7B008C6363006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C00080808000808080000000
      000000000000808080008080800080808000808080008080800080808000FF00
      0000FF000000C0C0C0000000000000000000000000000000000000000000C0C0
      C000FFFFFF00FF00000000000000000000000000000000000000000000000000
      0000000000000000000033FFFF0033FFFF0033FFFF0033FFFF0000FFFF0033FF
      FF0000FFFF0033FFFF0000FFFF00000000000000000000000000FF6600002222
      2200A4A0A00000000000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC
      0000FFFFFF00FFCC0000DDDDDD00222222000000000000000000000000000000
      0000000000000000000000000000000000005E63630094B5DE0026487D00182D
      3A005E636300DEDEDE00DEE7DE00DED6D600DED6D600D2D6D2003A73A900A5AD
      A500A5ADA500777469004246420026271D000008140000001400313131002627
      1D00000000000000000000000000000000000000000000000000000000000000
      000000000000000000005284940063C6FF0063C6FF0039424A00525252007B7B
      7B00848484007B6B6B00846363009C6B6B00CE8484004239390052A5BD0073DE
      FF006B94A5009C636300D6848400BD7B7B00635252008C8C8C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C0008080800080808000000000000000
      0000808080008080800080808000808080008080800080808000FF000000C0C0
      C000C0C0C000000000000000000000000000000000000000000000000000FFFF
      FF00FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000033FFFF0033FFFF0033FFFF0000FF
      FF0033FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000002222
      2200A4A0A00000000000FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFF
      FF00FFCC0000FFFFFF00DDDDDD00222222000000000000000000000000000000
      00000000000000000000000000000000000094B5DE0065739600082263004B52
      5000DADED600CACEC6008E9C8C00CEC6C600DADED600D2D6D2007F85C3004B52
      5000BDBDBD00BDBDBD00BDBDB5009C9C94006F76770000081400000014002C2D
      2D00313131000000000000000000000000000000000000000000000000000000
      00000000000000000000637B840042A5DE0042A5DE00315A730052424200845A
      5A009C636300C67B7B00E78C8C00E78C8C00E78C8C007B525200639CA50084E7
      FF007BB5C6009C636300E78C8C00CE8484007B5A5A006B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C0008080800000000000000000008080
      80008080800080808000808080008080800080808000FF000000FF000000C0C0
      C000000000000000000000000000000000000000000000000000C0C0C000FFFF
      FF00FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF66000000000000000000000000000000FFFF0033FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF002222
      2200A4A0A00000000000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC
      0000FFFFFF00FFCC0000DDDDDD00222222000000000000000000000000000000
      000000000000000000000000000094B5DE009CBDDE00292E7300182D3A00BDBD
      BD00DEE7DE008E918E00ADADAD00A5A5A500B5B5B500D2CECE0089B7DB002C49
      5A009CA59C00BDC6BD00BDC6BD00B9B1A400ADA5A5007F948600101822000008
      140039393D0026271D0000000000000000000000000000000000000000000000
      00000000000000000000635A5A0018739C00107BAD00296B8C00634A4A009C63
      6300AD737300DE8C8C00DE8C8C00DE8C8C00DE8C8C00A56B6B005273730094F7
      FF007BC6CE00A56B6B00DE8C8C00DE8C8C00A56B6B00635A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0008080
      800080808000808080008080800080808000FF000000FF000000C0C0C0000000
      00000000000000000000000000000000000000000000C0C0C000FFFFFF00FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF660000FF660000FF660000FF66000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000CCFF0000FFFF0000CCFF002222
      2200A4A0A0000000000000000000000000000000000000000000000000000000
      00000000000000000000DDDDDD00222222000000000000000000000000000000
      000000000000000000009CADB50094B5DE0026487D00091C3900969A9C00EFEF
      EF00DADED6009C9C94009C9C9C00A5ADA5009C9C9400B5B5AD00ADCED6005F8D
      B90058574F00BDC6BD00BDC6BD00B5B5B500A59C9C009C9C9C008C8C8C002627
      1D00000814002529290037363200000000000000000000000000000000000000
      000000000000A5737300A56B6B003973840063CEF70073CEF7004A4A4A009C63
      6300AD737300D6848400D6848400D6848400D6848400D68484004A525200B5E7
      E700B5E7E700A56B6B00D6848400D6848400B5737300735A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0008080
      8000808080008080800080808000FF000000FF000000C0C0C000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF660000FF660000FF660000FF660000FF660000FF660000FF6600000000
      0000000000000000000000FFFF0000CCFF0000FFFF0000CCFF0000CCFF002222
      2200A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0
      A000A4A0A000A4A0A000DDDDDD00222222000000000000000000000000000000
      0000000000005E63630094B5DE00657396000F2D710065739600EBEFE700DEDE
      DE00BDC6BD00DADED600ADA5AD00ADA5AD00A5A5A500A59C9C00BDC6CE0076D3
      E6002C495A00B5BDB500BDBDBD00BDB5B500ADADAD00ADA5A5009C9C9C009C98
      8C002C2D2D000008140042464200000000000000000000000000000000000000
      000000000000BD7B7B00CE848400735A5A007BDEF70084E7FF00527B84009463
      6300AD737300CE848400CE848400CE848400CE848400CE8484006B525200D694
      9400DE9C9C00B5737300CE848400CE8C8C00BD84840084636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C0008080
      80008080800080808000FF000000FF000000C0C0C00000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FF0000000000
      000000000000000000000000000000000000000000000000000000000000FF66
      0000FF660000FF660000FF660000FF660000FF660000FF660000FF660000FF66
      000000000000000000000000000000CCFF0000CCFF0000CCFF0000CCFF002222
      2200222222002222220022222200222222002222220022222200222222002222
      2200222222002222220022222200222222000000000000000000000000000000
      00000000000094B5DE0094B5DE000F2D71002C495A00DED6D600EFEFEF00B5B5
      B5009C9C9400BDB5B500DED6D600BDBDBD00A5A5A5008C8C8C00ADADAD0076D3
      E6003C5D7F009C9C9C00BDB5B500BDB5B500BDB5B500ADA5A5009C9C9C009C9C
      9C004B52500000043A004B525000000000000000000000000000000000000000
      000000000000AD737300BD7B7B00AD73730063949C0094F7FF0084D6DE007352
      5200B5737300BD7B7B00BD7B7B00BD7B7B00BD7B7B00BD7B7B00AD737300CE84
      8400CE949400D6A5A500D6A5A500CE9C9C00C68C8C007B636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000808080008080
      800080808000FF000000FF000000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000C0C0C000FFFFFF00FF000000000000000000
      0000000000000000000000000000000000000000000022222200222222002222
      2200222222002222220022222200222222002222220022222200222222002222
      22002222220022222200000000000000000000CCFF0000CCFF0000CCFF0000CC
      FF0000CCFF0000CCFF000000000000000000FF660000FF660000FF660000FF66
      0000FF660000FF660000FF660000000000000000000000000000000000000000
      000094B5DE00778D990026487D00292E7300C6C6BD00EFEFEF00BDBDBD00969A
      9C00D2CECE009C988C009C9C9400ADB5AD00C6C6C600B5B5AD0082887400ADB5
      B500388CBD005E636300BDB5B500BDB5B500ADADAD00ADADAD009C9C9C006F76
      770000043A004246420000000000000000000000000000000000000000000000
      000000000000A56B6B00B5737300B57373006B5A5A00A5DEDE00B5E7E7006B5A
      5A00AD737300B5737300B5737300BD7B7B00CE8C8C00D6A5A500E7B5B500E7B5
      B500E7ADAD00DEADAD00DEA5A500D6A5A500BD8C8C007B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000808080008080
      8000FF000000FF000000FF000000FF000000C0C0C00000000000000000000000
      0000000000000000000000000000FFFFFF00FF00000000000000000000000000
      0000000000000000000000000000000000000000000022222200DDDDDD00A4A0
      A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0
      A000A4A0A000222222000000000000CCFF0000CCFF0000CCFF0000CCFF0000CC
      FF0000CCFF000000000000000000FF660000FF660000FF660000FF660000FF66
      0000FF660000FF66000000000000000000000000000000000000000000009CAD
      B50094B5DE004F85BF000F2D71008E918E00EFEFEF00C6C6C6009CA59C00D2CE
      CE00A5A5A500C6BDBD008E918E00ADA5AD009C9C9400C6C6BD00BDB5B500A59C
      9C0052CEDE00182D3A00ADA5A500ADADAD00ADA5AD00A5A5A5007F948600091C
      390039393D000000000000000000000000000000000000000000000000000000
      0000000000009C6B6B00AD737300AD7373009C6B6B009C737300CE8C8C00946B
      6B00B57B7B00CE949400E7ADAD00F7C6C600F7C6C600EFBDBD00E7A5A500D68C
      8C00D67B7B00E79C9C00DEADAD00DEA5A500B57B7B008C848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C00080808000FF00
      0000FF000000C0C0C000C0C0C000FF000000FF000000C0C0C000000000000000
      00000000000000000000FFFFFF00FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000022222200DDDDDD0033FF
      CC00A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000000000000000
      0000A4A0A0002222220000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CC
      FF0000CCFF0000CCFF00000000000000000000000000FF660000FF660000FF66
      0000FF66000000000000000000000000000000000000000000005E63630094B5
      DE008A9FBA000F2D71005E636300E2E7EB00EBEFE700ADADAD00A5ADA500BDBD
      BD00BDBDBD00969A9C00BDC6BD00ADADAD00828874008C8C8C00BDBDBD00B5B5
      B5009CC6DE0026487D0077746900ADADAD00ADA5AD008E918E00182D3A002529
      2900000000000000000000000000000000000000000000000000000000000000
      000000000000AD7373009C6B6B00A56B6B00A56B6B00B5848400CE9C9C00EFC6
      C600FFD6D600FFCECE00F7C6C600E7ADAD00D6949400DE9C9C00E7ADAD00F7C6
      C600F7C6C600EFB5B500E7ADAD00D6A5A500946B6B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000FF000000FF00
      0000C0C0C0000000000000000000C0C0C000FF000000FF000000C0C0C0000000
      000000000000FFFFFF00FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000022222200DDDDDD00DDDD
      DD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
      DD00DDDDDD002222220000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CC
      FF0000CCFF0000CCFF0000CCFF0000CCFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094B5DE009CAD
      B50026487D002C495A00EFEFEF00EFEFEF00B5B5B500B5B5B500CACEC600B5B5
      B500BDBDBD00C6C6BD00A5A5A5009C9C9400ADA5A500B5B5AD009C9C9C00C6BD
      BD00ADCED6005AADC6004A484600ADA5AD009C9C9C00182D3A00182D3A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B57B7B00A57B7B00D6BDBD00F7DEDE00FFEFEF00FFE7E700EFCE
      CE00DEB5B500D6A5A500DEB5B500EFC6C600FFDEDE00FFD6D600EFBDBD00DE9C
      9C00E7949400EFB5B500E7B5B500BD848400A594940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FF000000FF000000C0C0
      C00000000000000000000000000000000000C0C0C000FF000000FF000000C0C0
      C000FFFFFF00FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000022222200222222002222
      2200222222002222220022222200222222002222220022222200222222002222
      2200222222002222220000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CC
      FF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF000000
      0000000000000000000000000000000000000000000094B5DE00E2E7EB006573
      960026487D00BDC6C600F7F7EF00A5ADA500CEC6C600E2E7E200BDBDBD00C6C6
      C600A5A5A500BDBDBD00DEE7DE00BDBDBD009C9C9C00ADA5A500B5B5AD00C6C6
      BD00C6C6BD0076D3E6003C5D7F009C9C9C002C495A00091C3900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C67B7B00A57B7B00F7EFEF00FFF7F700FFEFEF00FFFFFF00F7E7
      E700F7E7E700FFEFEF00FFE7E700EFC6C600DEA5A500E7ADAD00EFBDBD00F7CE
      CE00F7C6C600EFBDBD00CE9C9C009C8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000FF000000C0C0C000C0C0
      C0000000000000000000000000000000000000000000C0C0C000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000022222200DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00222222000000
      000000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CC
      FF0000CCFF0000CCFF000099FF000099FF0000CCFF000099FF0000CCFF000099
      FF0000CCFF000099FF0000000000000000009CADB50094B5DE005F8DB9000F2D
      7100ADB5B500F7F7F700F7F7EF00BDBDBD00C6C6BD00BDB5B500EBEFE700DED6
      D600D2CECE00C6C6BD00BDC6BD00D2CECE00C6BDBD00A5A59C00D2CECE00CACE
      C600C6C6BD00B5DEE7003C5D7F0039393D00091C390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5737300BD9C9C00FFFFFF00FFF7F700FFF7F700FFF7
      F700FFE7E700E7C6C600E7C6C600F7DEDE00FFE7E700FFD6D600FFCECE00F7C6
      C600F7C6C600C6949400A58C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000FF000000C0C0C000C0C0C0000000
      00000000000000000000000000000000000000000000C0C0C000FFFFFF00FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000022222200222222002222
      2200222222002222220022222200222222002222220022222200222222002222
      2200222222002222220000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CC
      FF0000CCFF000099FF0000CCFF0000CCFF000099FF000099FF000099FF000099
      FF000099FF000099FF00000000000000000094B5DE006573960026487D003C5D
      7F00EFEFEF00F9FFF900EFEFEF00DADED600EBEFE700E2E7EB00EFEFEF00EBEF
      E700DADED600B5B5B500B5B5AD00BDBDBD00C6C6C600D2D6D200D2D6D200D2CE
      CE00BDC6BD00BDBDBD005AADC600101822000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B56B6B00B58C8C00F7E7E700FFF7F700FFEF
      EF00FFFFFF00FFF7F700FFE7E700FFDEDE00FFD6D600FFCECE00FFCECE00E7AD
      AD00A57B7B00B5A5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000FF000000C0C0C000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FF0000000000
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000022222200DDDDDD00DDDD
      DD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
      DD00DDDDDD00222222000000000000CCFF0000CCFF0000CCFF0000CCFF0000CC
      FF000099FF0000CCFF000099FF000099FF000099FF000099FF000099FF000099
      FF0000000000000000000000000000000000000000005F8DB90026487D002648
      7D0026487D009CADB500ADA5A500252929007F948600EFEFEF00EFEFEF00EBEF
      E700F3E0C200DEE7DE00DED6D600BDBDBD00D2D6D200DED6D600DED6D600D2CE
      CE00BDBDBD00969A9C004F85BF00182D3A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDA5A5009C737300BD9C9C00E7D6
      D600FFEFEF00FFEFEF00FFE7E700F7DEDE00E7BDBD00C6949400B58C8C008C7B
      7B00736B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000C0C0C00000000000000000000000
      000000000000000000000000000000000000FFFFFF00FF000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000022222200A4A0A0000000
      0000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC
      0000DDDDDD0022222200000000000000000000CCFF0000CCFF0000CCFF000099
      FF0000CCFF000099FF000099FF000099FF000099FF000099FF00000000000000
      0000000000000000000000000000000000000000000000000000000000003360
      9800292E73003360980058574F00312A190026271D004A484600A5A5A500DEDE
      DE00DEE7DE00DEE7DE00DEDEDE00DED6D600DED6D600DED6D600D2D6D200C6C6
      C600969A9C00091C39003C5D7F003A73A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDA5A500C6AD
      AD00BD9C9C00AD848400B58C8C00BDA5A500BDA5A500B5ADAD00FFFFFF009C9C
      9C006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000C0C0C00000000000000000000000
      000000000000C0C0C000C0C0C000FFFFFF00FF00000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000022222200A4A0A0000000
      0000FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFF
      FF00DDDDDD0022222200FF6600000000000000000000000000000099FF0000CC
      FF000099FF000099FF000099FF000099FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003C5D7F008C8C8C0031313100312A1900312A1900312A19003939
      3D00BDBDBD00DEE7DE00A5A5A500CEC6C600DED6D600D2CECE00D2CECE00B9B1
      A400182D3A004B5250002C495A0052CEDE003C5D7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00FFFFFF009C9C
      9C00636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000C0C0C000C0C0C00000000000000000000000
      0000C0C0C000FFFFFF00FFFFFF00FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000022222200A4A0A0000000
      0000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC
      0000DDDDDD0022222200FF660000FF660000FF66000000000000000000000099
      FF000099FF000099FF000099FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009CADB500828874004246420037363200312A1900312A
      190026271D005E636300ADB5AD00B5B5AD00BDC6BD00D2D6D200BDBDBD002C49
      5A00182D3A00000000000000000052CEDE003C5D7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00FFFFFF009C9C
      9C00737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FFFFFF00C0C0C000C0C0C000C0C0C000FFFF
      FF00FFFFFF00FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000022222200A4A0A0000000
      0000FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFF
      FF00DDDDDD002222220000000000FF660000FF660000FF660000000000000000
      00000099FF000099FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000969A9C008E9C8C0058574F0058574F00424642003131
      3100312A1900312A190031313100BDBDB500E1CEB700D2D6D2003C5D7F003939
      3D000000000000000000000000008A9FBA00388CBD004B525000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500FFFFFF009C9C
      9C00737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000022222200A4A0A0000000
      0000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC0000FFFFFF00FFCC
      0000DDDDDD00222222000000000000000000FF660000FF660000FF6600000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000969A9C006A6E63007F94860058574F0058574F004B52
      50002C2D2D00252929002C495A00CACEC600D2CECE006F767700182D3A005857
      4F000000000000000000000000000000000058574F0026271D0026271D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000022222200A4A0A0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DDDDDD0022222200000000000000000000000000FF660000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006F767700BDC6BD0077746900000000005E63
      63003C5D7F000F2D710008226300082263006F767700091C390058574F000000
      0000000000000000000000000000000000006A6E630039393D002C2D2D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000022222200A4A0A000A4A0
      A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0
      A000DDDDDD002222220000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000969A9C0058574F0000000000000000000000
      0000000000005E636300657396002C495A00182D3A0039393D00000000000000
      000000000000000000000000000000000000091C39000F2D7100000814000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000022222200222222002222
      2200222222002222220022222200222222002222220022222200222222002222
      2200222222002222220000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003C5D7F0058574F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000080000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000800080008000800080008000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000800000008000000080000000
      8000000080000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      8000800080008000800080008000800080008000800080008000800080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808000008080000080800000808000008080
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000080000000FF00000080000000FF00000080000000
      FF00000080000000800000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000080000000
      8000000080000000800000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800000000000C0C0C000C0C0C000C0C0C00000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800080008000
      800080008000FF00FF0080008000FF00FF0080008000FF00FF00800080008000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080800000FFFF000080800000FFFF000080800000FFFF
      0000808000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000080000000FF000000FF000000FF000000
      80000000FF000000800000008000000000000000000000000000000000000000
      000000000000000000000000000000000000000080000000FF00000080000000
      80000000800000008000000080000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000808080000000
      0000000000000000000000000000808080008080800080808000808080008080
      80008080800000000000C0C0C000C0C0C000C0C0C00000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800080008000
      8000FF00FF0080008000FF00FF0080008000FF00FF0080008000FF00FF008000
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000FFFF000080800000FFFF000080800000FFFF00008080
      0000FFFF00008080000000000000000000000000000000000000000000000000
      00000000000000000000000080000000FF0000FFFF000000FF000000FF000000
      FF00000080000000FF0000008000000000000000000000000000000000000000
      0000000000000000000000000000000080000000FF00000080000000FF000000
      FF000000FF0000008000000080000000800000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000808080000000
      0000C0C0C000C0C0C00000000000808080008080800080808000808080008080
      80008080800000000000C0C0C000C0C0C000C0C0C00000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000C0C0C000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C0008080800000000000000000000000
      000000000000000000000000000000000000000000000000000080008000FF00
      FF0080008000FF00FF0080008000FF00FF0080008000FF00FF0080008000FF00
      FF00800080000000000000000000000000000000000000000000000000000000
      000080800000FFFF000080800000FFFF000080800000FFFF000080800000FFFF
      000080800000FFFF000000000000000000000000000000000000000000000000
      000000000000000000000000FF0000FFFF000000FF0000FFFF000000FF000000
      FF000000FF00000080000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000FF00000080000000FF000000FF000000
      FF000000FF000000FF00000080000000800000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000808080000000
      0000C0C0C000C0C0C00000000000808080008080800080808000808080008080
      80008080800000000000C0C0C000C0C0C000C0C0C00000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000C0C0C000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C0008080800000000000000000000000
      0000000000000000000000000000000000000000000080008000800080008000
      8000FF00FF0080008000FF00FF0080008000FF00FF0080008000800080008000
      8000000000000000000000000000000000000000000000000000000000000000
      00008080000080800000FFFF000080800000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF000080800000FFFF0000000000000000000000000000000000000000
      00000000000000000000000000000000FF0000FFFF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000FFFF000000FF000000
      FF000000FF000000FF000000FF000000800000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000808080000000
      0000C0C0C000C0C0C00000000000808080008080800080808000808080008080
      80008080800000000000C0C0C000C0C0C000C0C0C00000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000C0C0C000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C0008080800000000000000000000000
      000000000000000000000000000000000000000000008000800080008000FF00
      FF0080008000FF00FF0080008000FF00FF00FF00FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080800000FFFF000080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF008000000000800000008000000080000000800000008000000000
      00000000000000000000000000000000FF0000FFFF000000FF0000FFFF000000
      FF000000FF000000FF00000080000000800000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000808080000000
      0000C0C0C000C0C0C00000000000808080008080800080808000808080008080
      80008080800000000000C0C0C000C0C0C000C0C0C00000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000C0C0C000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C0008080800000000000000000000000
      0000000000000000000000000000000000000000000080008000FF00FF008000
      8000FF00FF0080008000FF00FF00FF00FF00FF00FF0000000000C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF008080800080808000000000008080
      00008080000080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FFFF0000FF00000080000000008000000080000000800000008000000080
      0000000000000000000080000000FFFF00000000FF0000FFFF000000FF000000
      FF000000FF000000FF00000080000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000808080000000
      0000000000000000000000000000808080008080800080808000808080008080
      80008080800000000000C0C0C000C0C0C000C0C0C00000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008000800080008000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080800000FFFF000080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FFFF000080000000800000000080000000000000008000000080
      00000080000080000000FFFF0000FF000000FF0000000000FF000000FF000000
      FF000000FF0000008000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800000000000C0C0C000C0C0C000C0C0C00000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080008000FF00FF008000
      8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FF00FF00FFFF
      FF00FF00FF000000000000000000000000000000000000000000000000000000
      000080800000808000008080000000000000FFFF0000FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      000000000000FF000000FFFF0000800000008000000000800000000000000080
      000000800000FF000000FF000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080008000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FF00FF00FFFFFF00FF00
      FF00800080000000000000000000000000000000000000000000000000000000
      0000808000000000000000000000C0C0C00000000000FFFF0000FFFF0000FFFF
      FF00FFFFFF00FFFFFF0080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008000000000
      00000080000000000000FF000000FFFF00008000000000000000008000000000
      0000008000000080000000800000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000C0C0C000C0C0
      C000000000008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800080008000
      8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000FFFFFF0000000000FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      0000000000000000000000000000FF000000FF00000000000000000000000080
      0000000000000080000000800000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000C0C0C000C0C0
      C000000000008080800000000000000000000000000000000000000000000000
      000000000000C0C0C0000000000000000000000000000000000000000000C0C0
      C000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      8000FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FF00FF00FFFFFF008000
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      FF00FFFF0000FFFFFF0000000000000000000000000000000000000000000000
      0000000080000000800000008000000080000000000000000000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008000000000000000800000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000C0C0C000C0C0
      C000000000008080800000000000000000000000000000000000000000000000
      000000000000C0C0C0000000000000000000000000000000000000000000C0C0
      C000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080008000FF00FF00FF00FF00FF00FF00FF00FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000FFFFFF0000000000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      80000000FF000000800000008000000080000000800080000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000080000000800000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000C0C0C000C0C0
      C000000000008080800000000000000000000000000000000000000000000000
      000000000000C0C0C0000000000000000000000000000000000000000000C0C0
      C000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      FF00000080000000FF00000080000000800080000000FF000000000000000000
      000000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000008000000000000000800000000000000000000000000000000000008000
      80008000800080008000800080000000000000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000C0C0C000C0C0
      C000000000008080800000000000000000000000000000000000000000000000
      000000000000C0C0C0000000000000000000000000000000000000000000C0C0
      C000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF0000008000FF000000FFFF0000FF0000000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000000000000000
      0000000000000080000000000000000000000000000000000000800080008000
      8000FF00FF0080008000800080008000800000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C0000000000000000000008000000080000000800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF0000FFFF000000FF000000FF000000FF000000FF0000008000000000000000
      000000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      000000800000000000000000000000000000000000000000000080008000FF00
      FF0080008000FF00FF00800080008000800000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000800000008000000080000000800000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF0000FF
      FF000000FF0000FFFF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000800000000000000000000000000000000000000000000000FF00FF008000
      0000FF000000FF00FF00FF00FF008000800000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800000000000008000000000000000800000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000FFFF000000FF000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FFFF0000800000000000000000000000000000000000000080000000FFFF
      0000FF000000FF00FF00FF00FF008000800000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C000C0C0C00080808000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000080000000000000008000000000
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FFFF000080000000000080000000800080000000FF000000FF00
      0000FF00FF00FF00FF00800080000000000000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      0000000000000000000000000000008000000000000000800000000000000080
      0000000000000080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000008000FF000000FF0000000000FF000000800000008000800000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008000000000
      0000008000000000000000800000000000000080000000000000000000000000
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080008000FFFF000080000000800080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000000FF00000080000000FF00000080000000FF0000008000000080000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000000000000080
      0000000000000080000000000000000000000000000000000000000000000000
      0000000000000080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      8000FF00FF00FF00000080000000800080008000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000080000000FF00000080000000FF00000080000000FF00000080000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000000
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      FF0080008000FF00FF0080008000800080008000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000000FF0000FFFF000000FF000000FF000000FF0000008000000080000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000000000000080
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000080000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      FF00FF00FF0000FFFF00FF00FF00800080008000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000FFFF000000FF0000FFFF000000FF000000FF000000FF00000080000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008000000000
      000000000000000000000000000000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      FF0000FFFF00FF00FF0000FFFF00FF00FF008000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF0000FFFF000000FF000000FF000000FF0000008000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C0000000
      0000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008000000080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF0000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C0000000
      0000C0C0C0000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      000000000000000000000000000000000000FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000999999009999
      9900999999009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000009999990099999900999999009999
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF99990066333300000000009999
      9900999999009999990099999900999999000000000000000000000000000000
      000000000000000000006666CC000000AA000000000099999900999999009999
      990099999900000000000000000000000000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      00000000FF000000000000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF999900FF999900FF99990066333300663333000000
      0000999999009999990099999900999999009999990099999900000000000000
      00006666CC006666CC006666CC000000AA000000990000000000999999009999
      990099999900999999000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF00000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      00000000FF000000000000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF999900FF999900FF999900FF999900FF99990066333300663333006633
      33000000000099999900999999009999990000000000000000006666CC006666
      CC006666CC006666CC006666CC000000AA000000AA0000009900000000009999
      990099999900999999009999990000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FFFF0000FFFF0000FF00000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF00000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000FF999900FF99
      9900FF999900FF999900FF999900FF999900FF99990066333300663333006633
      3300663333000000000000000000000000006666CC006666CC006666CC006666
      CC006666CC006666CC006666CC000000AA000000AA00000099000000AA000000
      000099999900999999009999990099999900C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000FF000000FF000000FF
      000000FF000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000FF
      000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FFFF
      00000000000000000000FFFF0000000000000000000000000000000000000000
      00000000FF000000000000008000000080000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000800000008000000000000000
      80000000000000000000000000000000000000000000FF999900FF999900FF99
      9900FF999900FF999900FF999900FF999900FF99990066333300663333006633
      33006633330066333300000000006666CC006666CC006666CC006666CC006666
      CC006666CC006666CC006666CC000000AA000000AA000000AA00000099000000
      AA0000000000999999009999990099999900C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      00000000000000000000FFFF0000FFFF0000FFFF000000000000000000000000
      000000000000FFFF000000000000000000000000000000000000FFFF00000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      00000000FF000000000000008000000080000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000800000008000000080000000
      80000000000000000000000000000000000000000000FF999900FF999900FF99
      9900FF999900FF999900FF999900FF999900FF99990044444400993333006633
      33006633330066333300000000006666CC006666CC006666CC006666CC006666
      CC006666CC006666CC006666CC000000AA000000AA00000099000000AA000000
      AA0000009900000000009999990099999900C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000000080000000FF00000080000000
      FF00000080000000FF00000080000000FF00000080000000FF00000080000000
      FF00000080000000FF00000080000000FF00000080000000FF00000080000000
      FF00000080000000FF00000080000000FF00000080000000FF00000080000000
      FF00000080000000FF00000080000000FF0000000000FF999900FF999900FF99
      9900FF999900FF999900FF999900FF999900FF99990044444400993333006633
      3300663333003300000000000000333399006666CC006666CC006666CC006666
      CC006666CC006666CC006666CC000000AA000000AA00000099000000AA000000
      AA0000009900000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF999900FF999900FF99
      9900FF999900FF999900FF999900FF999900FF99990044444400993333006633
      330066333300330000000000000033339900333399006666CC006666CC006666
      CC006666CC006666CC006666CC000000AA000000AA00000099000000AA000000
      AA0000009900000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000080800000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000808000008080000080800000000000FF999900FF999900FF99
      9900FF999900FF999900FF999900FF999900FF99990044444400993333006633
      33003300000033000000000000003333990033339900333399006666CC006666
      CC006666CC006666CC006666CC000000AA000000AA00000099000000AA000000
      AA0000009900000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000C0C0C000C0C0C000C0C0C0000000
      00000000FF0000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000FF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FF999900FF999900FF99
      9900FF999900FF999900FF999900FFFFFF00FFFFFF0066333300663333006633
      3300550000003300000000000000333399000000000000000000333399006666
      CC006666CC00FFFFFF00FFFFFF000000AA000000AA00000099000000AA000000
      AA0000009900000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF00000000000000FFFF00C0C0C000C0C0C0000000
      00000000FF000000000000FFFF0000FFFF00C0C0C000C0C0C000C0C0C00000FF
      FF0000FFFF0000FFFF00C0C0C000C0C0C000C0C0C00000FFFF0000FFFF0000FF
      FF00C0C0C000000000000000FF000000000000FFFF0000FFFF0000FFFF00C0C0
      C000C0C0C000C0C0C00000FFFF0000FFFF0000000000FF999900FF999900FF99
      9900FF999900FFFFFF00FFFFFF00FFCCCC00FFCCCC00FFCCCC00663333006633
      33003300000055000000000000000000000000CCFF000099FF00000000009999
      FF009999FF006666CC009999FF009999FF000000AA00000099000000AA000000
      AA0000009900000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000C0C0C000C0C0C000C0C0C0000000
      00000000FF0000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000FF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FF999900FF999900FFFF
      FF00FFFFFF00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00DDDDDD006600
      0000330000000000000000CCFF0000CCFF0000CCFF000099FF000099FF000000
      00006666CC006666CC006666CC009999FF009999FF000000AA00000099000000
      AA000000AA00220000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000008080800080808000808080000000
      00000000FF000000000080808000808080000000000000008000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000000000000000FF00000000008080800080808000000000000000
      80000000000080808000808080008080800000000000FFFFFF00FFFFFF00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00DDDDDD00FFCCCC00000000000000
      000000CCFF0000CCFF0000CCFF0000CCFF0000CCFF000099FF000099FF000099
      FF00000000006666CC006666CC006666CC009999FF009999FF000000AA000000
      99000000AA00000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      80000000000000000000000000000000000000000000FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00DDDDDD00FFCCCC00000000000000000000CCFF0000CC
      FF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF000099FF000099FF000099
      FF000099FF00000000006666CC006666CC006666CC006666CC006666CC000000
      AA0000009900000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      8000000000000000000000000000000000000000000000000000FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00DDDDDD002200000000CCFF0000CCFF0000CC
      FF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF000099FF000099FF000099
      FF000099FF000099FF00000000006666CC006666CC006666CC006666CC006666
      CC0000009900000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      800000000000000000000000000000000000000000000000000000000000FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC000000000000CCFF0000CCFF0000CC
      FF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF000099FF000099FF000099
      FF000099FF000099FF000099FF00000000006666CC006666CC006666CC000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000FFCCCC00FFCCCC00FFCCCC00FFCCCC000000000000CCFF0000CCFF0000CC
      FF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF000099FF000099FF000099
      FF000099FF000099FF000099FF00000000006666CC0000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCCCC00FFCCCC00FFCCCC000000000000CCFF0000CCFF0000CC
      FF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF000099FF000099FF000099
      FF000099FF000099FF000099FF00000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCCCC00000000000000000000CCFF0000CCFF0000CC
      FF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF000099FF000099FF000099
      FF000099FF000099FF000099FF00000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000CCFF0000CCFF0000CC
      FF0000CCFF0000CCFF0000CCFF00FFFFFF00FFFFFF000099FF000099FF000099
      FF000099FF000099FF000099FF00000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      00000000FF000000000000008000000000000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000800000000000000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000CCFF0000CCFF0000CC
      FF0000CCFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF000099FF000099
      FF000099FF000099FF000099FF00000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      000000000000000000000000FF00000080000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000008000000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000CCFF0000CCFF00FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000099
      FF000099FF000099FF000099FF00000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF00000000000000000000000000000000000000FF
      FF000080800000000000000000000000FF000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF000080800000000000000000000000FF00000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000099FF000099FF000099FF00000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000099FF000099FF00000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF00000080808000FF0000008080800080808000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000000000000000000000FF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000099FF00000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF00000080808000808080008080800080808000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF00000080808000808080008080800080808000FF0000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF00000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000808080008080800080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF00000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000808080008080800080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000808080008080800080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000800000000100010000000000000800000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFF8FFF000000000000000000000000
      FFFF07FF000000000000000000000000FFFF03FF000000000000000000000000
      FE3F00FF000000000000000000000000FC1F007F000000000000000000000000
      FC1E007F000000000000000000000000FC00003F000000000000000000000000
      FC00003F000000000000000000000000FC00003F000000000000000000000000
      F800003F000000000000000000000000F800003F000000000000000000000000
      F800003F000000000000000000000000F800003F000000000000000000000000
      F800003F000000000000000000000000F800007F000000000000000000000000
      F800007F000000000000000000000000F80000FF000000000000000000000000
      FC0001FF000000000000000000000000FE0003FF000000000000000000000000
      FF0005FF000000000000000000000000FF8007FF000000000000000000000000
      FF9F87FF000000000000000000000000FFFF87FF000000000000000000000000
      FFFF87FF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFFCFFFA000FFFFFFFFFFFFFFFF
      FC00001FE1FF0000FFFF1FFFFFFFFFFFFE00003FF03E0000FFFE0FFFFFFFFFFF
      FF00007FF80C0000FFFC07FFFFFFFFFFFFF01FFFFE000000FFF803FFFFFF8FFF
      FFE03FFFFF000007FFF001FFFFFF07FFFFC07FFFFFC00000FFE000FFFFFF03FF
      FF80C007FF000000FFE0007FFE3F00FFFF000003FE000000FFC0003FFC1F007F
      FE0000E3F8000000FF80001FFC1E007FFC0003E3F0000000FF00000FFC00003F
      FC0007E7F8000000FF000007FC00003FFC000FC7F8000000FE000003FC00003F
      FE001F8FF0000000FC000001F800003FFF803F1FE0000000F8000001F800003F
      FF007F1FC0000000F8000001F800003FFF007E3F80000000F0000003F800003F
      FF007E7F80000001E0000007F800003FFE003CFF80000003C000000FF800007F
      FE0619FF80000007C000001FF800007FFE0F03FF800000018000003FF80000FF
      FC0F87FFF00000000000007FFC0001FFFC1F87FF80000000000000FFFE0003FF
      FC3F107F80000001800000FFFF0007FFFC7F383F80000007E00000FFFFC007FF
      FC787C3F8000001FF800007FFFFF87FFFC70FE3F8000007FFC00067FFFFF87FF
      FC01FFFF800000FFFC000E3FFFFF87FFFC07FFFF800201FFFC000F1FFFFFFFFF
      FE1FFFFF800313FFFE201F1FFFFFFFFFFFFFFFFF8003BFFFFE783F1FFFFFFFFF
      FFFFFFFF8003FFFFFFFE7FFFFFFFFFFFE0000001FFFFFFFFF87FFFFFFF07FFFF
      C0000000FFFFFFFFE01FFE0FFE03FFFFC0000000FFFFFFFFC00FF807FC01FF83
      80000000FFFFFFFF8007F003FC01FF0100000000803FF8038007E001FC01FE00
      00000000803FF8030003E001FC01FE0000000000803FF8030003C000FE03FE00
      00000000803FF80300000000FF001E0000000000803FF80300000000FFE00C01
      000000008003800300000000FFF0400300000000800380030003C000FFE820FF
      00000000800380038003E000FFD451FF00000000800000038007E001FFEE69FF
      0000000080000003C007E001F0DFF5FF0000000080000003E00FF003E03DF9FF
      0000000080000003F807E10FC03AF5E10000000080000003FFC403FFC0157BC0
      00000000C0000007FFC003FFC03AF7C000000000C0000007FFE007FFC03DF7C0
      00000000C0000007FFC0ABFFE07FE3C000000000F803803FFF8153FFF0FFF001
      00000000F803803FFF82A9FFF9FFF01F00000000F803803FFF1575FFF0FFE01F
      00000000F803803FFF2BF9FFE07FE01F00000000FC07C07FFF17FDFFE07FE01F
      00000000FC07C07FFF2FA9FFE07FE01F00000000FC07C07FFF9F53FFE07FF03F
      00000000FC07C07FFF8F83FFF0FFF87F00000000FFFFFFFFFFCF57FFFFFFFFFF
      00000001FFFFFFFFFFE78FFFFFFFFFFF00000003FFFFFFFFFFF83FFFFFFFFFFF
      80000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE000001F80000000E3FFF8FF
      FF01FC0FE000001F80000000E1FFF87FFC00F0070000001F80000000E1FFF87F
      F00000030000001F80000000E1FFF87FC00000010000001F80000000E0BFF82F
      000000000000001F80000000E01FF807000000000000001F80000000E01FF807
      000000000000001F8402402000000000000000030000001F870660E000000000
      000000030000001F87FE7FE000000000000000030000001F87FE7FE000000000
      000000030000001F85F66FA000000000000000030000001F875E7AE000000000
      000000030000001F85F66FA000000000000000030000001F875E7AE0E31FF8C7
      000000030000001F85F66FA0E31FF8C7800000030000001F875E7AE0E31FF8C7
      C00000070000001F85F66FA0E31FF8C7E000001F0000001F875E7AE0E31FF8C7
      F000007F0000001F85F66FA0E31FF8C7F80000FF0000001F875E7AE0E11FF847
      FD0000FF0000001F85F66FA0E01FF807FF0000FF0000001F875E7AE0E01FF807
      FF0000FF0000001F85F66FA0E41FF907FF0000FF0000001F875E7AE0FE1FFF87
      FF0000FF0000001F87FC3FE0FF1FFFC7FF8000FF0000003F87F81FE0FF1FFFC7
      FFC001FF0000007F81E00780FF1FFFC7FFE007FF000000FF80000000FF3FFFCF
      FFF01FFF000001FF80000000FFFFFFFFFFF87FFF000003FF80000000FFFFFFFF
      FFFDFFFF000007FF80000000FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
