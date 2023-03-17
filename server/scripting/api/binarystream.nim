# import nimLUA
# import private/[enums, common, types, stream, dispatcher]

# proc LUA_BinaryReadStream_IsEmpty(L: LuaState): cint {.cdecl.} =
#   let argc = L.gettop()
#   if argc != 1:
#     return 0
#   var stream = cast[BinaryReadStream](L.touserdata(1))
#   if stream != nil:
#     L.pushboolean(stream.IsEmpty().int32)
#     return 1
#   return 0

# proc LUA_BinaryReadStream_IsEnd(L: LuaState): cint {.cdecl.} =
#   let argc = L.gettop()
#   if argc != 1:
#     return 0
#   var stream = cast[BinaryReadStream](L.touserdata(1))
#   if stream != nil:
#     L.pushboolean(stream.IsEnd().int32)
#     return 1
#   return 0

# proc LUA_BinaryReadStream_ReadString(L: LuaState): cint {.cdecl.} =
#   let argc = L.gettop()
#   if argc != 1:
#     return 0

#   var stream = cast[BinaryReadStream](L.touserdata(1))
#   if stream != nil:
#     var
#       value = newString(high(int16))
#       actualLen: int32
#     discard stream.readString(value.cstring, value.len.int32, addr actualLen)
#     value.setLen(actualLen)
#     discard L.pushstring(value)
#     return 1
#   return 0

# proc LUA_BinaryReadStream_ReadInt64(L: LuaState): cint {.cdecl.} =
#   let argc = L.gettop()
#   if argc != 1:
#     return 0

#   var stream = cast[BinaryReadStream](L.touserdata(1))
#   if stream != nil:
#     var value: int64
#     discard stream.readInt64(addr value)
#     L.pushinteger(value)
#     return 1
#   return 0

# proc LUA_BinaryReadStream_ReadInt32(L: LuaState): cint {.cdecl.} =
#   let argc = L.gettop()
#   if argc != 1:
#     return 0

#   var stream = cast[BinaryReadStream](L.touserdata(1))
#   if stream != nil:
#     var value: int32
#     discard stream.readInt32(addr value)
#     L.pushinteger(value)
#     return 1
#   return 0

# proc LUA_BinaryReadStream_ReadInt16(L: LuaState): cint {.cdecl.} =
#   let argc = L.gettop()
#   if argc != 1:
#     return 0

#   var stream = cast[BinaryReadStream](L.touserdata(1))
#   if stream != nil:
#     var value: int16
#     discard stream.readInt16(addr value)
#     L.pushinteger(value)
#     return 1
#   return 0

# proc LUA_BinaryReadStream_ReadInt8(L: LuaState): cint {.cdecl.} =
#   let argc = L.gettop()
#   if argc != 1:
#     return 0

#   var stream = cast[BinaryReadStream](L.touserdata(1))
#   if stream != nil:
#     var value: int8
#     discard stream.readInt8(addr value)
#     L.pushinteger(value)
#     return 1
#   return 0

# proc LUA_BinaryReadStream_ReadChar(L: LuaState): cint {.cdecl.} =
#   let argc = L.gettop()
#   if argc != 1:
#     return 0

#   echo L.gettype(1)

#   var stream = cast[BinaryReadStream](L.touserdata(1))
#   if stream != nil:
#     var value: char
#     discard stream.readChar(addr value)
#     discard L.pushstring($value)
#     return 1
#   return 0

# type
#   BinaryReadStreamWrapper = object
#     impl: BinaryReadStream

# proc GetReadStream(s: BinaryReadStream): BinaryReadStreamWrapper =
#   result.impl = s

# proc IsEnd(s: BinaryReadStreamWrapper): bool =
#   result = s.impl.IsEnd()

# proc IsEmpty(s: BinaryReadStreamWrapper): bool =
#   result = s.impl.IsEmpty()

# proc ReadString(s: BinaryReadStreamWrapper): string =
#   result = newString(high(int16))
#   var actualLen: int32
#   discard s.impl.readString(result.cstring, result.len.int32, addr actualLen)
#   result.setLen(actualLen)

# proc ReadInt64(s: BinaryReadStreamWrapper): int64 =
#   discard s.impl.readInt64(addr result)

# proc ReadInt32(s: BinaryReadStreamWrapper): int64 =
#   discard s.impl.readInt32(addr result)

# proc ReadInt16(s: BinaryReadStreamWrapper): int64 =
#   discard s.impl.readInt16(addr result)

# proc ReadInt8(s: BinaryReadStreamWrapper): int64 =
#   discard s.impl.readInt8(addr result)

# proc ReadChar(s: BinaryReadStreamWrapper): char =
#   discard s.impl.readChar(addr result)

# const regs = {
#   # BinaryReadStream
#   "IsEmpty": LUA_BinaryReadStream_IsEmpty,
#   "IsEnd": LUA_BinaryReadStream_IsEnd,
#   "ReadString": LUA_BinaryReadStream_ReadString,
#   "ReadInt64": LUA_BinaryReadStream_ReadInt64,
#   "ReadInt32": LUA_BinaryReadStream_ReadInt32,
#   "ReadInt16": LUA_BinaryReadStream_ReadInt16,
#   "ReadInt8": LUA_BinaryReadStream_ReadInt8,
#   "ReadChar": LUA_BinaryReadStream_ReadChar,
# }

# proc initBinaryStream*(L: LuaState) =
#   #for i in 0..<regs.len:
#   #  L.register(regs[i][0], regs[i][1])

#   L.bindObject(BinaryReadStreamWrapper):
#     IsEmpty
#     IsEnd
#     ReadString
#     ReadInt64
#     ReadInt32
#     ReadInt16
#     ReadInt8
#     ReadChar

#   L.bindFunction(GetReadStream)
