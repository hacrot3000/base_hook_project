import ba0f3/fptr, types, vector, times, ba0f3/logger, strformat, db, sim, posix, tables
import ../../shared/shared_types
import utils, streams
import strutils, strformat, parseutils, sequtils, net, asyncdispatch, asyncnet
import redisparser except `$`

var
  countDelayOnRevival*:int = 0



proc gInit*() =
  try:
    let date = now().format(initTimeFormat("yyyyMMdd"))
    #gConfig = loadObject[MainConfig]("../etc/main.ini")
    initLogger(&"log/patching_{date}.log", lvlAll, bufSize=0)
    #initDB(gServerConf)

  except:
    quit("Init fail: " & getCurrentExceptionMsg())


proc asyncExecuteRequest*(this: CConnection, data: CByteArray) : void  {.fptr, fastcall, gcsafe.} = 0x465890

proc getItem*(key: int64, index: int64): int64  {.fptr, fastcall, gcsafe.} = 0x475890

# Some example
#
# proc NewMinuteBegin*(this: GameEventHandler, a2: stdString, a3: int64, a4: int64) {.fptr, fastcall, gcsafe.} = 0x1823748
# proc NewMonthBegin*(this: GameEventHandler) {.fptr, fastcall, gcsafe.} = 0x18237E0
# proc OnRun*(this: GameEventHandler, a2: pointer, a3: stdString, a4: int64, a5: char, a6: pointer, a7: int64) {.fptr, fastcall, gcsafe.} = 0x182331A

# proc initFDEventHandler*(vptr: ptr FDEventHandlerVTable): FDEventHandler =
#   init(addr result, unsafeAddr vptr)

# template GetSeqMapIdx2Client*(p: NetProxy): MAP_LOGIN_PLAYER = cast[MAP_LOGIN_PLAYER](p + 0x390)
# template GetAllLoginPlayer*(p: NetProxy): MAP_LOGIN_PLAYER = cast[MAP_LOGIN_PLAYER](p + 0x3c0)
# template MsgPost*(p: NetProxy): CMsgPost = cast[CMsgPost](p + 0x556A20)


func createCrcTable(): array[0..255, uint32] =
  for i in 0.uint32..255.uint32:
    var rem = i
    for j in 0..7:
      if (rem and 1) > 0'u32: rem = (rem shr 1) xor uint32(0xedb88320)
      else: rem = rem shr 1
    result[i] = rem

template updateCrc32(c: char; crc: var uint32) =
  crc = (crc shr 8) xor static(createCrcTable())[uint32(crc and
      0xff) xor uint32(ord(c))]


func crc32int*(input: string): int64 =
  var crcuint = uint32(0xFFFFFFFF)
  for c in input: updateCrc32(c, crcuint)
  crcuint = not crcuint
  #toString(crcuint, input)
  result = crcuint.int64
