object dmCardServer: TdmCardServer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 789
  Top = 345
  Height = 150
  Width = 215
  object RSERVER1: TDXServerCore
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
    OnNewConnect = RSERVER1NewConnect
    Left = 24
    Top = 8
  end
  object DXUnicastDataQueue1: TDXUnicastDataQueue
    ReleaseDate = '2003-04-15'
    ThreadPriority = tpHigher
    IgnoreOverruns = True
    ThreadStart = False
    Left = 24
    Top = 55
  end
end
