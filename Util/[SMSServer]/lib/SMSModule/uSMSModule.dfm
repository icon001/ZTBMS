object dmSMSModule: TdmSMSModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 755
  Top = 324
  Height = 224
  Width = 270
  object SMSConnection: TADOConnection
    Left = 40
    Top = 48
  end
  object ADOQuery1: TADOQuery
    Connection = SMSConnection
    Parameters = <>
    Left = 92
    Top = 47
  end
end
