object dmKTTControl: TdmKTTControl
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 603
  Top = 271
  Height = 197
  Width = 314
  object KTTControlSERVER: TDXServerCore
    ReleaseDate = '2003-04-15'
    ListenerThreadPriority = tpNormal
    SpawnedThreadPriority = tpNormal
    ProtocolToBind = wpTCPOnly
    ServerPort = 3431
    Suspend = False
    UseSSL = False
    UseNagle = False
    UseThreadPool = True
    SocketOutputBufferSize = bsfNormal
    SocketQueueSize = 100
    ServerType = stThreadBlocking
    ThreadCacheSize = 20
    Timeout = 10000
    OnNewConnect = KTTControlSERVERNewConnect
    Left = 32
    Top = 16
  end
  object DXUnicastDataQueue1: TDXUnicastDataQueue
    ReleaseDate = '2003-04-15'
    ThreadPriority = tpHigher
    IgnoreOverruns = True
    ThreadStart = False
    Left = 40
    Top = 71
  end
  object ClientSocket: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.0.106'
      '192.168.101.3'
      '192.168.10.3')
    WsLocalAddressIndex = 0
    WsPort = 'telnet'
    WsSocksServerInfo.Port = 0
    WsTelnet = False
    AutoOpen = False
    Baud = 38400
    BufferFull = 3072
    BufferResume = 1024
    DeviceLayer = dlWinsock
    TraceAllHex = True
    TraceName = 'APRO.TRC'
    LogAllHex = True
    LogName = 'APRO.LOG'
    PromptForPort = False
    RTS = False
    TapiMode = tmOff
    UseMSRShadow = False
    OnWsConnect = ClientSocketWsConnect
    OnWsDisconnect = ClientSocketWsDisconnect
    OnWsError = ClientSocketWsError
    OnTriggerAvail = ClientSocketTriggerAvail
    Left = 87
    Top = 76
  end
  object KTTServerSendTimer: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = KTTServerSendTimerTimer
    Left = 96
    Top = 16
  end
  object PamCyleTimer: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = PamCyleTimerTimer
    Left = 152
    Top = 16
  end
  object PamSockPort: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.0.106'
      '192.168.101.3'
      '192.168.10.3')
    WsLocalAddressIndex = 0
    WsPort = 'telnet'
    WsSocksServerInfo.Port = 0
    WsTelnet = False
    AutoOpen = False
    Baud = 38400
    BufferFull = 3072
    BufferResume = 1024
    DeviceLayer = dlWinsock
    TraceAllHex = True
    TraceName = 'APRO.TRC'
    LogAllHex = True
    LogName = 'APRO.LOG'
    PromptForPort = False
    RTS = False
    TapiMode = tmOff
    UseMSRShadow = False
    OnWsConnect = PamSockPortWsConnect
    OnWsError = PamSockPortWsError
    OnTriggerAvail = PamSockPortTriggerAvail
    Left = 159
    Top = 80
  end
end
