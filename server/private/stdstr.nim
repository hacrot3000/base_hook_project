import ba0f3/fptr
import utils

type
  Alloc_hider = object
    M_p*: pointer

  stdString* = object
    M_dataplus: Alloc_hider


# std::string
proc init(this: var stdString) {.fptr, cdecl, gcsafe.} = 0x15fc300
proc `~`*(this: var stdString) {.fptr, cdecl, gcsafe.} = 0x15fbaf0

proc c_str*(s: var stdString): cstring {.fptr, cdecl, gcsafe.} = 0x15fc880
#template c_str*(s: stdString): cstring = (addr s).c_str()

proc assign*(dst: var stdString, src: cstring) {.fptr, cdecl, gcsafe.} = 0x15fb5e0

proc assign*(a: var stdString, b: var stdString) {.fptr, cdecl.} = 0x15FB390
proc copy*(a: var stdString, b: var stdString) {.fptr, cdecl.} = 0x15FB590

proc `$`*(s: var stdString): string = $s.c_str()

#proc `~`(this: stdString) = ~(unsafeAddr this)
template assign*(a: stdString, b: cstring) = assign(unsafeAddr a, b)

proc length*(this: var stdString): int {.fptr, cdecl.} = 0x015FC670
template length*(this: stdString): int = (addr this).length()

proc initString*(s: cstring = ""): stdString {.inline, gcsafe.} =
  init(result)
  if s.len > 0:
    result.assign(s)

#proc `=destroy`*(x: var stdString) =
#  ~x