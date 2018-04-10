unit uwinzet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomStatusBar, LMDStatusBar, LMDCustomGroupBox, LMDGroupBox,
  LMDButtonControl, LMDCustomCheckBox, LMDCheckBox, LMDBaseEdit,
  LMDCustomEdit, LMDEdit, StdCtrls, LMDCustomParentPanel,
  LMDCustomPanelFill, LMDCustomHeaderPanel, LMDHeaderPanel, LMDRadioButton,
  ImgList, LMDCustomButton, LMDButton, LMDCustomMaskEdit,
  LMDCustomExtCombo, LMDCustomListComboBox, LMDListComboBox;

type
  TForm_wiznet = class(TForm)
    LMDStatusBar1: TLMDStatusBar;
    LMDHeaderPanel1: TLMDHeaderPanel;
    LMDHeaderPanel2: TLMDHeaderPanel;
    ListBox1: TListBox;
    Label1: TLabel;
    Edit_Version: TLMDEdit;
    Label2: TLabel;
    Edit_Mac: TLMDEdit;
    Checkbox_Debugmode: TLMDCheckBox;
    Checkbox_DHCP: TLMDCheckBox;
    LMDGroupBox1: TLMDGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit_LocalIP: TLMDEdit;
    Edit_Sunnet: TLMDEdit;
    Edit_Gateway: TLMDEdit;
    Edit_LocalPort: TLMDEdit;
    LMDGroupBox2: TLMDGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit_Time: TLMDEdit;
    Edit_Size: TLMDEdit;
    Edit_Char: TLMDEdit;
    Edit_Idle: TLMDEdit;
    LMDGroupBox3: TLMDGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    LMDGroupBox4: TLMDGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Edit_ServerIp: TLMDEdit;
    Edit_Serverport: TLMDEdit;
    RadioModeClient: TLMDRadioButton;
    RadioModeServer: TLMDRadioButton;
    RadioModeMixed: TLMDRadioButton;
    Checkbox_Client: TLMDCheckBox;
    btnReadWiznet: TLMDButton;
    btnWriteWiznet: TLMDButton;
    LMDButton2: TLMDButton;
    LMDButton3: TLMDButton;
    ImageList1: TImageList;
    Checkbox_DirectIP: TLMDCheckBox;
    Edit_DirectIP: TLMDEdit;
    ComboBox_Boad: TLMDListComboBox;
    ComboBox_Databit: TLMDListComboBox;
    ComboBox_Parity: TLMDListComboBox;
    ComboBox_Stopbit: TLMDListComboBox;
    Label17: TLabel;
    ComboBox_Flow: TLMDListComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_wiznet: TForm_wiznet;

implementation

{$R *.dfm}

end.
