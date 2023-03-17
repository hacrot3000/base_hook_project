# #import nimongo/bson
# #import nimongo/mongo

# import sim, redisclient, redisclient/connpool
# export redisclient, connpool
# #export sync, redis

# import types

# type RedisConfig* = object
#   hostname {.defaultValue: "127.0.0.1".}: string
#   port {.defaultValue: 6379.}: int

# var 
#   pool* {.threadvar.}: RedisPool[Redis]
#   #mPool* {.threadvar.}: Mongo

# proc initDB*(gServerConf: ServerConf) =
#   if pool != nil:
#     return
#   var cfg: RedisConfig
#   try:
#     cfg = loadObject[RedisConfig]("../etc/redis.cfg")
#   except:
#     cfg.hostname = "127.0.0.1"
#     cfg.port = 6379
#   pool = newRedisPool(2, maxConns=4, host=cfg.hostname, port=cfg.port)

#   #[

#   #Mongo connect example
#   # nim compile --gc:arc --threads:on --run test.nim
#   # 

#   #let uri = "mongodb://" & $gServerConf.m_dbAccount & ":" & $gServerConf.m_dbPassword & "@" & $gServerConf.m_dbIP & ":" & $gServerConf.m_dbport & "/" & $gServerConf.m_dbName
#   let uri = "mongodb://" & $gServerConf.m_dbIP & ":" & $gServerConf.m_dbport & "/" & $gServerConf.m_dbName

#   import nimongo/bson
#   import nimongo/mongo

#   var mConn: Mongo

#   mConn = newMongoWithURI("mongodb://10.9.1.12:27017/vietnam_server_s1")

#   let connectResult = mConn.connect()

#   if not connectResult:
#     echo "Error"
#     quit(1)

  
#   let collection = mConn["vietnam_server_s1"]["userbaseinfo"]


#   echo collection.count()

#   discard mConn.connect()


#   for document in collection.find(%*{"nUserLevel": 2}).items():
#     echo document
    
#   ]#
    
  
