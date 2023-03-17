import ba0f3/fptr, strutils, xmltree, redisclient

converter intToUint32*(i: int): uint32 = i.uint32
converter intToUint16*(i: int): uint16 = i.uint16
converter intToUint8*(i: int): uint8 = i.uint8

proc memset*(p: pointer, value: cint, size: int32): pointer {.importc: "memset", header: "<string.h>", discardable.}


#proc c_str(str: pointer): cstring {.fptr.} = 0x15FC880
#proc c_len(str: pointer): int32 {.fptr.} = 0x15fc670


template free*[T](p: T) =
  ~p
  dealloc(p)

template freeShared*[T](p: T) =
  ~p
  deallocShared(p)


proc isNan*(x: float): bool {.importc: "isnan", header: "<math.h>".}