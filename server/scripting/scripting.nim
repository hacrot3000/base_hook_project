# import strutils, nimLUA, nimLUA/lua, tables, with
# import private/[enums, common, types, stream, dispatcher, utils]
# import shared_types
# import ba0f3/[logger, luascripting]
# import api/[globals, gameclient, binarystream]

# {.used.}
# #[
# const regs = {
#   # NetProxy
#   "GetGameClient": LUA_NetProxy_GetGameClient,
#   "GetLoginClient": LUA_NetProxy_GetLoginClient,
#   # GameClient
#   "SendBuffer": LUA_GameClient_SendBuffer,
#   "GetUserInfo": LUA_GameClient_GetUserInfo,
#   # UserInfo
#   "GetUserId": LUA_UserInfo_GetUserId,
# }
# ]#
# proc ErrFunc(ctx: pointer, err: NLError) =
#   let lineInfo = "$#:$#" % [err.source, $err.currentLine]
#   echo "Lua error ", lineinfo, " ", err.msg
#   warn "Lua error", lineinfo, msg=err.msg

# proc initLuaInstance(): LuaState =
#   result = newNimLua(true)
#   #result.bindEnum(
#   #  A_ATTRIBUTE -> "ATTRIBUTE",
#   #  C2S_MESSAGE_ID
#   #)
#   #for i in 0..<regs.len:
#   #  result.register(regs[i][0], regs[i][1])

#   #nimLuaOptions(nloDebug, true)
#   result.initGameClient()
#   result.initBinaryStream()

# proc getLuaInstance*(): LuaState =
#   var L {.global.}: LuaState
#   if L == nil:
#     L = initLuaInstance()
#   return L


# ee.on(READY) do(a: Args):
#   let L = getLuaInstance()
#   L.executeScript("scripts/main.lua", "main")

# ee.on(ON_SYSTEM_PACKET) do(a: Args):
#   let args = SysPacketArgs(a)
#   with args:
#     let stream = initBinaryReadStream(buffer, bufLen)
#     var cmd: C2S_MESSAGE_ID
#     discard stream.readInt32(addr cmd)

#     let L = getLuaInstance()
#     L.pushlightuserdata(client)
#     L.setglobal(GLOBAL_GAME_CLIENT)

#     #var pClient = cast[ptr GameClientWrapper](L.newuserdata(sizeof(GameClientWrapper)))
#     #pClient.impl = client
#     #L.setmetatable("GameClientWrapper")
#     #L.setglobal("pClient")

#     when defined(release):
#       L.executeScript("scripts/net.lua", "main", cmd.int32, stream)
#     else:
#       L.executeScriptNoCache("scripts/net.lua", "main", cmd.int32, stream)
#     free(stream)

# ee.on(ON_PACKET) do(a: Args):
#   let args = PacketArgs(a)
#   #args.client, args.kind, args.stream
#   let L = getLuaInstance()
#   L.pushlightuserdata(args.client)
#   L.setglobal(GLOBAL_GAME_CLIENT)

#   #var pClient = cast[ptr GameClientWrapper](L.newuserdata(sizeof(GameClientWrapper)))
#   #pClient.impl = args.client
#   #L.setmetatable("GameClientWrapper")
#   #L.setglobal("pClient")

#   when defined(release):
#     L.executeScript("scripts/net.lua", "main", args.kind.int32, args.stream)
#   else:
#     L.executeScriptNoCache("scripts/net.lua", "main", args.kind.int32, args.stream)