unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, AdvPreviewMenu, AdvPreviewMenuStylers, AdvShapeButton,
  AdvGlowButton, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, jpeg, ExtCtrls, AdvAppStyler, Menus, AdvMenus,
  AdvMenuStylers;

type
  TForm1 = class(TForm)
    apAdminManger: TAdvToolBarPager;
    ApBasicAdmin: TAdvPage;
    AdvToolBar8: TAdvToolBar;
    ApManager: TAdvPage;
    AdvToolBar1: TAdvToolBar;
    AdvToolBar4: TAdvToolBar;
    AdvGlowButton3: TAdvGlowButton;
    AdvGlowButton4: TAdvGlowButton;
    ApEtc: TAdvPage;
    AdvToolBar5: TAdvToolBar;
    btn_fmConfigSetting: TAdvGlowButton;
    btn_Upgrade: TAdvGlowButton;
    btn_RemoteControl: TAdvGlowButton;
    ImageList2: TImageList;
    ImageList3: TImageList;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    StartMenu: TAdvPreviewMenu;
    AdvPreviewMenuOfficeStyler2: TAdvPreviewMenuOfficeStyler;
    AdvShapeButton1: TAdvShapeButton;
    Image1: TImage;
    sb_Status: TAdvOfficeStatusBar;
    AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    ImageList1: TImageList;
    pm_device: TAdvPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    AdvGlowButton6: TAdvGlowButton;
    AdvToolBar2: TAdvToolBar;
    AdvGlowButton7: TAdvGlowButton;
    AdvGlowButton9: TAdvGlowButton;
    AdvGlowButton10: TAdvGlowButton;
    AdvToolBar7: TAdvToolBar;
    AdvGlowButton11: TAdvGlowButton;
    AdvGlowMenuButton3: TAdvGlowMenuButton;
    AdvGlowMenuButton4: TAdvGlowMenuButton;
    AdvGlowButton14: TAdvGlowButton;
    AdvGlowButton12: TAdvGlowButton;
    ApReport: TAdvPage;
    AdvGlowButton1: TAdvGlowButton;
    pm_Employee: TAdvPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    AdvGlowButton2: TAdvGlowButton;
    pm_CardGrade: TAdvPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    AdvGlowButton5: TAdvGlowButton;
    pm_GroupGrade: TAdvPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    AdvToolBar3: TAdvToolBar;
    AdvToolBar9: TAdvToolBar;
    AdvGlowButton8: TAdvGlowButton;
    AdvGlowButton13: TAdvGlowButton;
    AdvToolBar10: TAdvToolBar;
    AdvGlowButton17: TAdvGlowButton;
    AdvGlowButton18: TAdvGlowButton;
    AdvGlowButton19: TAdvGlowButton;
    AdvToolBar11: TAdvToolBar;
    AdvGlowButton20: TAdvGlowButton;
    AdvGlowButton22: TAdvGlowButton;
    AdvGlowButton23: TAdvGlowButton;
    AdvGlowButton15: TAdvGlowButton;
    pm_systemReport: TAdvPopupMenu;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    AdvGlowButton16: TAdvGlowButton;
    pm_AtReport: TAdvPopupMenu;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    N14: TMenuItem;
    AdvGlowButton21: TAdvGlowButton;
    pm_deviceReport: TAdvPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    apAdmin: TAdvPage;
    AdvToolBar6: TAdvToolBar;
    AdvGlowButton25: TAdvGlowButton;
    pm_Admin: TAdvPopupMenu;
    N15: TMenuItem;
    N16: TMenuItem;
    AdvGlowButton24: TAdvGlowButton;
    AdvGlowButton26: TAdvGlowButton;
    AdvGlowButton40: TAdvGlowButton;
    AdvGlowButton27: TAdvGlowButton;
    AdvQuickAccessToolBar1: TAdvQuickAccessToolBar;
    AdvPreviewMenuOfficeStyler1: TAdvPreviewMenuOfficeStyler;
    AdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    pm_AccessCode: TAdvPopupMenu;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    ap_AlarmCode: TAdvPopupMenu;
    MenuItem14: TMenuItem;
    MenuItem17: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    MenuImageList32: TImageList;
    MenuImageList48: TImageList;
    MenuImageList16: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
