import ba0f3/fptr, types, shared_types, utils

type
  Iterator*[T] = object
    M_current*: ptr T


# # UserBase Vector
# proc init(this: Vector[UserBase]) {.fptr, fastcall, gcsafe.} = 0x16DF5AE
# proc `[]`*(this: Vector[UserBase], idx: int): ptr UserBase {.fptr, fastcall, gcsafe.} = 0x1799520
# proc size*(this: Vector[UserBase]): int {.fptr, fastcall, gcsafe.} = 0x16E3390
# proc push_back*(this: Vector[UserBase], userBase: ptr UserBase) {.fptr, fastcall, gcsafe.} = 0x16DF6F4
# proc `~`*(this: Vector[UserBase]) {.fptr, fastcall, gcsafe.} = 0x16DF5C8
# proc clear*(this: Vector[UserBase]) {.fptr, fastcall, gcsafe.} = 0x1A5D5A4

# # USER_INFO_VALUE Cector
# proc init(this: Vector[USER_INFO_VALUE]) {.fptr, fastcall, gcsafe.} = 0x19B3C76
# #proc `[]`*(this: Vector[UserBase], idx: int): USER_INFO_VALUE {.fptr, fastcall, gcsafe.} =
# proc size*(this: Vector[USER_INFO_VALUE]): int {.fptr, fastcall, gcsafe.} = 0x19B4648
# proc push_back*(this: Vector[USER_INFO_VALUE], userInfoValue: ptr USER_INFO_VALUE) {.fptr, fastcall, gcsafe.} = 0x19B41F4
# proc `~`*(this: Vector[USER_INFO_VALUE]) {.fptr, fastcall, gcsafe.} = 0x19B3C90


# # AwardInfo
# proc init(this: Vector[Award]) {.fptr, fastcall, gcsafe.} = 0x16DD0F2
# proc size*(this: Vector[Award]): int {.fptr, fastcall, gcsafe.} = 0x16DFC5C
# proc push_back*(this: Vector[Award], userInfoValue: ptr Award) {.fptr, fastcall, gcsafe.} = 0x16DF45E
# proc `~`*(this: Vector[Award]) {.fptr, fastcall, gcsafe.} = 0x16DD10C

# # Struct_MailAttachment
# proc init(this: Vector[Struct_MailAttachment]) {.fptr, fastcall, gcsafe.} = 0x162D274
# proc size*(this: Vector[Struct_MailAttachment]): int {.fptr, fastcall, gcsafe.} = 0x1630316
# proc push_back*(this: Vector[Struct_MailAttachment], mailAttachment: ptr Struct_MailAttachment) {.fptr, fastcall, gcsafe.} = 0x162E22C
# proc `~`*(this: Vector[Struct_MailAttachment]) {.fptr, fastcall, gcsafe.} = 0x162D28E


# # ItemBase

# # ItemRecord
# proc init(this: Vector[ItemRecord]) {.fptr, fastcall, gcsafe.} = 0x17B38C0
# proc `~`*(this: Vector[ItemRecord]) {.fptr, fastcall, gcsafe.} = 0x17B38DA
# proc size*(this: Vector[ItemRecord]): int {.fptr, fastcall, gcsafe.} = 0x17B7F02
# proc push_back*(this: Vector[ItemRecord], itemRecord: ptr ItemRecord): int {.fptr, fastcall, gcsafe.} = 0x17B3948
# proc `[]`*(this: Vector[ItemRecord], idx: int): ptr ItemRecord {.fptr, fastcall, gcsafe.} = 0x1A5F1D6


# # int32
# proc init(this: Vector[int32]) {.fptr, fastcall.} = 0x1605BC8
# proc `~`*(this: Vector[int32]) {.fptr, fastcall,.} = 0x1605BE2
# proc size*(this: Vector[int32]): int {.fptr, fastcall.} = 0x16067F8
# proc push_back*(this: var VectorObj[int32], x: var int32): int {.fptr, fastcall, gcsafe.} = 0x1605C50
# proc `[]`*(this: Vector[int32], idx: int): ptr int32 {.fptr, fastcall.} = 0x1605C86

# proc erase*(this: ptr VectorObj[int32], it: Iterator[int32]): Iterator[int32] {.fptr, fastcall.} = 0x18DED04
# proc clear*(this: var VectorObj[int32]) {.fptr, fastcall.} = 0x161B914


# # SuitAttribute
# #proc size*(this: ptr VectorObj[SuitAttribute]): int {.fptr, fastcall.} = 0x2750BF0

# # TargetResPacket
# proc `[]`*(this: var VectorObj[TargetResPacket], idx: int): var TargetResPacket {.fptr, fastcall.} = 0x1914AAE
# proc size*(this: var VectorObj[TargetResPacket]): int {.fptr, fastcall.} = 0x1914A74
# proc push_back*(this: var VectorObj[TargetResPacket], x: var TargetResPacket): int {.fptr, fastcall, gcsafe.} = 0x1914AD8

# common
proc first*[T](this: VectorObj[T]): Iterator[T] =
  result.M_current = this.M_impl.M_start

proc last*[T](this: VectorObj[T]): Iterator[T] =
  result.M_current = this.M_impl.M_finish

proc `++`*[T](this: var Iterator[T]): Iterator[T] {.discardable.} =
  #when this.hasCustomPragma(incompleteStruct):
  #   {.error: "Incomplete struct is not supported".}
  this.M_current = this.M_current + sizeof(T)
  result = this

proc len*[T](this: VectorObj[T]): int32 =
  if this.M_impl.M_finish == nil and this.M_impl.M_start == nil:
    result = 0
  else:
    result = int32((this.M_impl.M_finish - this.M_impl.M_start)/sizeof(T))

proc `==`*[T](this: Iterator[T], x: var Iterator[T]): bool = this.M_current == x.M_current

iterator items*[T](v: VectorObj[T]): ptr T =
  let last = v.last()
  var it = v.first()
  while it != last:
    yield it.M_current
    ++it

# proc initVector*[T](): Vector[T] =
#   result = cast[Vector[T]](alloc0(sizeof(VectorObj[T])))
#   init(result)
